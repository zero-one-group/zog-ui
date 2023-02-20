import { CloseCircleFilled, DownOutlined } from '@ant-design/icons';
import * as Popover from '@radix-ui/react-popover';
import { keyframes } from '@stitches/react';
import {
  ComponentProps,
  MouseEvent,
  useEffect,
  useMemo,
  useState,
} from 'react';
import { styled } from '../stitches.config';
import CascaderColumn from './CascaderColumn';

const getColorSchemeVariants = (colorScheme?: string) => {
  return {
    $$bgCascaderActive: colorScheme
      ? `$colors-${colorScheme}4`
      : '$colors-primary4',
    $$borderCascaderFocused: colorScheme
      ? `$colors-${colorScheme}9`
      : '$colors-primary9',
  };
};

const slideUpAndFade = keyframes({
  '0%': { opacity: 0, transform: 'translateY(2px)' },
  '100%': { opacity: 1, transform: 'translateY(0)' },
});

const slideDownAndFade = keyframes({
  '0%': { opacity: 0, transform: 'translateY(-2px)' },
  '100%': { opacity: 1, transform: 'translateY(0)' },
});

const StyledCascader = styled('div', {
  display: 'inline-grid',
  gridTemplateColumns: 'auto 1fr',
  minWidth: '100px',
  position: 'relative',
  '&:hover': {
    cursor: 'pointer',
    '.cascader-selector': {
      borderColor: '$$borderCascaderFocused',
    },
  },
  variants: {
    focused: {
      true: {
        '.cascader-selector': {
          borderColor: '$$borderCascaderFocused',
        },
      },
    },
  },
});

const StyledCascaderInput = styled('input', {
  margin: 0,
  padding: 0,
  border: 'none',
  outline: 'none',
  appearance: 'none',
  height: '31px',
  background: 'transparent',
  width: 'calc(100% - 11px)',
  overflow: 'hidden',
  whiteSpace: 'nowrap',
  textOverflow: 'ellipsis',
  pointerEvents: 'none',
});

const StyledTrigger = styled('div', {
  width: 0,
  height: '100%',
});

const StyledCascaderDropdown = styled(Popover.Content, {
  minHeight: 'auto',
  background: '#FFFF',
  br: '$2',
  boxShadow:
    '0 6px 16px 0 rgb(0 0 0 / 8%), 0 3px 6px -4px rgb(0 0 0 / 12%), 0 9px 28px 8px rgb(0 0 0 / 5%);',
  animationDuration: '400ms',
  animationTimingFunction: 'cubic-bezier(0.16, 1, 0.3, 1)',
  willChange: 'transform, opacity',
  '&[data-state="open"]': {
    '&[data-side="top"]': { animationName: slideDownAndFade },
    '&[data-side="bottom"]': { animationName: slideUpAndFade },
  },
  '&:focus': {
    outline: 0,
  },
});

const StyledCascaderSelector = styled('div', {
  width: '100%',
  height: '32px',
  padding: '0 11px',
  border: '1px solid $grayA8',
  borderRadius: '$2',
  cursor: 'pointer',
  backgroundColor: 'white',
  boxSizing: 'border-box',
});

const StyledCascaderMenus = styled('div', {
  display: 'flex',
  alignItems: 'flex-start',
});

const StyledIcons = styled('div', {
  fontSize: '12px',
  display: 'flex',
  alignItems: 'center',
  position: 'absolute',
  right: '0',
  top: '50%',
  insetInlineEnd: '11px',
  transform: 'translateY(-50%)',
  color: '$gray8',
});

export type CascaderOption = {
  value: string;
  label: string;
  disabled?: boolean;
  children?: CascaderOption[];
};

export interface CascaderProps extends ComponentProps<typeof StyledCascader> {
  options: CascaderOption[];
  defaultValue?: string[];
  colorScheme?: string;
  trigger?: 'click' | 'hover';
  changeOnSelect?: boolean;
  displayRender?: (labels: string[]) => string;
}

export const Cascader = ({
  colorScheme,
  options,
  defaultValue,
  trigger = 'click',
  css,
  changeOnSelect = false,
  displayRender,
  ...props
}: CascaderProps) => {
  const [activeValues, setActiveValues] = useState<string[]>(
    defaultValue || []
  );

  const [value, setValue] = useState('');

  const [open, setOpen] = useState(false);

  const columns = useMemo(() => {
    const columnList = [{ options }];
    let currentOption = options;
    activeValues.forEach((active) => {
      const currentCell = currentOption.find(
        (option) => option.value === active
      );

      const childrenOption = currentCell?.children;

      if (childrenOption?.length) {
        currentOption = childrenOption;
        columnList.push({ options: currentOption });
      }
    });

    return columnList;
  }, [options, activeValues]);

  const getActiveLabels = (path: string[]) => {
    if (path && path.length > 0) {
      return path.map(
        (value, index) =>
          columns[index].options.find((option) => option.value === value)?.label
      );
    }
    return [];
  };

  const handleRenderLabel = (labels: string[]) => {
    if (labels.length > 0) {
      if (typeof displayRender === 'function') {
        return displayRender(labels);
      }
      return labels.join(' / ');
    }
    return '';
  };

  const handleInputChange = (path: string[]) => {
    setValue(handleRenderLabel(getActiveLabels(path) as string[]));
  };

  useEffect(() => {
    if (defaultValue && defaultValue.length > 0) {
      setValue(handleRenderLabel(getActiveLabels(defaultValue) as string[]));
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const handleChangeCell = (path: string[], isLeaf: boolean) => {
    setActiveValues(path);
    if (changeOnSelect) {
      handleInputChange(path);
    } else if (isLeaf) {
      handleInputChange(path);
    }
    isLeaf && setOpen(false);
  };

  const handleClear = (e: MouseEvent<HTMLDivElement>) => {
    e.stopPropagation();
    setValue('');
    setActiveValues([]);
  };

  return (
    <StyledCascader
      css={{
        ...getColorSchemeVariants(colorScheme),
        ...css,
      }}
      title={value}
      focused={open}
      {...props}
    >
      <Popover.Root open={open}>
        <Popover.Trigger asChild>
          <StyledTrigger />
        </Popover.Trigger>
        <Popover.Portal>
          <StyledCascaderDropdown
            align="start"
            sideOffset={5}
            onInteractOutside={() => setOpen(false)}
            css={{
              ...getColorSchemeVariants(colorScheme),
            }}
          >
            <StyledCascaderMenus>
              {columns.map((column, index) => (
                <CascaderColumn
                  key={index}
                  handleChangeCell={handleChangeCell}
                  parentPath={activeValues.slice(0, index)}
                  active={activeValues[index]}
                  options={column.options}
                  trigger={trigger}
                />
              ))}
            </StyledCascaderMenus>
          </StyledCascaderDropdown>
        </Popover.Portal>
      </Popover.Root>
      <StyledCascaderSelector
        onClick={() => setOpen(true)}
        className="cascader-selector"
      >
        <StyledCascaderInput
          value={value}
          readOnly
          placeholder="Please Select"
        />
      </StyledCascaderSelector>
      {value ? (
        <StyledIcons onClick={handleClear}>
          <CloseCircleFilled />
        </StyledIcons>
      ) : (
        <StyledIcons>
          <DownOutlined />
        </StyledIcons>
      )}
    </StyledCascader>
  );
};

export default Cascader;
