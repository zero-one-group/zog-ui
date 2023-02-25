import { CloseCircleFilled, DownOutlined } from '@ant-design/icons';
import { CheckedState } from '@radix-ui/react-checkbox';
import * as Popover from '@radix-ui/react-popover';
import { keyframes } from '@stitches/react';
import {
  ComponentProps,
  MouseEvent,
  useCallback,
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
  color: '$gray12',
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
  backgroundColor: '$gray1',
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

export type CascaderValue = string | number;

export type CascaderOption = {
  value: CascaderValue;
  label: string;
  disabled?: boolean;
  children?: CascaderOption[];
};

export type CascaderProps = {
  options: CascaderOption[];
  defaultValue?: string[];
  colorScheme?: string;
  trigger?: 'click' | 'hover';
  changeOnSelect?: boolean;
  displayRender?: (labels: string[]) => string;
  multiple?: boolean;
  onValueChange: (value: CascaderValue[] | CascaderValue[][]) => void;
} & ComponentProps<typeof StyledCascader>;

export const Cascader = ({
  colorScheme,
  options,
  defaultValue,
  trigger = 'click',
  changeOnSelect = false,
  displayRender,
  multiple = false,
  css,
  onValueChange,
  ...props
}: CascaderProps) => {
  const [activeValues, setActiveValues] = useState<CascaderValue[]>(
    defaultValue || []
  );

  const [value, setValue] = useState('');
  const [multipleValue, setMultipleValues] = useState<CascaderValue[][]>([]);

  const [open, setOpen] = useState(false);

  const [selectedValues, setSelectedValues] = useState<Set<CascaderValue>>(
    new Set()
  );
  const [indeterminateValues, setIndeterminateValues] = useState<
    Set<CascaderValue>
  >(new Set());

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

  const getActiveLabels = (path: CascaderValue[]) => {
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

  const handleInputChange = (path: CascaderValue[]) => {
    setValue(handleRenderLabel(getActiveLabels(path) as string[]));
    if (!multiple) {
      handleOnChangeCallback(path);
    }
  };

  const handleOnChangeCallback = (
    path: CascaderValue[] | CascaderValue[][]
  ) => {
    if (typeof onValueChange !== 'function') return;
    onValueChange(path);
  };

  useEffect(() => {
    if (defaultValue && defaultValue.length > 0) {
      setValue(handleRenderLabel(getActiveLabels(defaultValue) as string[]));
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const handleChangeCell = (path: CascaderValue[], isLeaf: boolean) => {
    setActiveValues(path);
    if ((changeOnSelect || isLeaf) && !multiple) {
      handleInputChange(path);
    }
    isLeaf && !multiple && setOpen(false);
  };

  const handleSelect = (
    value: CascaderValue,
    option: CascaderOption,
    isSelected: CheckedState,
    path: CascaderValue[]
  ) => {
    if (typeof isSelected === 'boolean' && isSelected) {
      deselectAllChildren(option, value, path);
    } else {
      selectAllChildren(option, value, path);
    }
  };

  const traverseCascader = (
    parentPath: CascaderValue[],
    root: CascaderOption,
    callback: (option: CascaderOption, path: CascaderValue[]) => void
  ) => {
    if (root.children) {
      root.children.forEach((option) => {
        const currentPath = [...parentPath, option.value];
        callback(option, currentPath);
        traverseCascader(currentPath, option, callback);
      });
    }
  };

  const checkAllSelected = useCallback(
    (option: CascaderOption, selected: Set<CascaderValue>) => {
      return option.children
        ? option.children.every((value) => selected.has(value.value))
        : false;
    },
    []
  );

  const checkSomeSelected = useCallback(
    (
      option: CascaderOption,
      indeterminate: Set<CascaderValue>,
      selected: Set<CascaderValue>
    ) => {
      if (option.children) {
        const isChildrenHasSelected = option.children.some(
          (value) => selected.has(value.value) || indeterminate.has(value.value)
        );
        return isChildrenHasSelected;
      }

      return false;
    },
    []
  );

  const handleValueCheck = useCallback(
    (
      indeterminate: Set<CascaderValue>,
      selected: Set<CascaderValue>,
      option: CascaderOption
    ) => {
      const { value } = option;
      const newIndeterminate = new Set(indeterminate);
      const newSelected = new Set(selected);
      const isSomeSelected = checkSomeSelected(option, indeterminate, selected);
      const isAllSelected = checkAllSelected(option, selected);

      if (isSomeSelected && !isAllSelected) {
        newIndeterminate.add(value);
        newSelected.delete(value);
      } else {
        newIndeterminate.delete(value);
      }

      if (isAllSelected) {
        newSelected.add(value);
        newIndeterminate.delete(value);
      }

      return [newIndeterminate, newSelected] as const;
    },
    [checkAllSelected, checkSomeSelected]
  );

  const traverseAndHandleValue = useCallback(
    (
      root: CascaderOption,
      indeterminate: Set<CascaderValue>,
      selected: Set<CascaderValue>
    ) => {
      let newIndeterminate = new Set(indeterminate);
      let newSelected = new Set(selected);
      if (root.children) {
        root.children.forEach((option) => {
          [newIndeterminate, newSelected] = handleValueCheck(
            newIndeterminate,
            newSelected,
            option
          );

          return traverseAndHandleValue(option, newIndeterminate, newSelected);
        });
      }
      return [newIndeterminate, newSelected] as const;
    },
    [handleValueCheck]
  );

  const conductValueCheck = useCallback(
    (selectedVal: Set<CascaderValue>) => {
      let indeterminate = new Set(indeterminateValues);
      let selected = new Set(selectedVal);
      options.forEach((option) => {
        const [newIndeterminate, newSelected] = traverseAndHandleValue(
          option,
          indeterminate,
          selected
        );
        [indeterminate, selected] = handleValueCheck(
          newIndeterminate,
          newSelected,
          option
        );
      });
      setIndeterminateValues(new Set(indeterminate));
      setSelectedValues(new Set(selected));
    },
    [handleValueCheck, indeterminateValues, options, traverseAndHandleValue]
  );

  const handleSelectMultipleValues = (path: CascaderValue[]) => {
    setMultipleValues((prev) => {
      const newValues = [...prev, path];
      return newValues;
    });
  };

  const selectAllChildren = (
    root: CascaderOption,
    currentValue: CascaderValue,
    path: CascaderValue[]
  ) => {
    const selected = new Set(selectedValues);
    let newValue = [...multipleValue];
    traverseCascader(path, root, (option, path) => {
      selected.add(option.value);
      newValue = [...newValue, path];
      handleSelectMultipleValues(path);
      conductValueCheck(selected);
    });
    selected.add(currentValue);
    if (!root.children) {
      handleSelectMultipleValues(path);
      newValue = [...newValue, path];
    }
    handleOnChangeCallback(newValue);
    conductValueCheck(selected);
  };

  const handleDeleteMultipleValues = (path: CascaderValue[]) => {
    setMultipleValues((prev) => {
      const newValues = prev.filter(
        (val) => JSON.stringify(val) !== JSON.stringify(path)
      );

      return newValues;
    });
  };

  const deselectAllChildren = (
    root: CascaderOption,
    currentValue: CascaderValue,
    path: CascaderValue[]
  ) => {
    const selected = new Set(selectedValues);
    let newValue = [...multipleValue];
    traverseCascader(path, root, (option, path) => {
      selected.delete(option.value);
      newValue = newValue.filter(
        (val) => JSON.stringify(val) !== JSON.stringify(path)
      );
      handleDeleteMultipleValues(path);
      conductValueCheck(selected);
    });
    if (!root.children) {
      handleDeleteMultipleValues(path);
      newValue = newValue.filter(
        (val) => JSON.stringify(val) !== JSON.stringify(path)
      );
    }
    selected.delete(currentValue);
    handleOnChangeCallback(newValue);
    conductValueCheck(selected);
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
                  handleSelectCell={handleSelect}
                  parentPath={activeValues.slice(0, index)}
                  active={activeValues[index]}
                  options={column.options}
                  trigger={trigger}
                  multiple={multiple}
                  colorScheme={colorScheme}
                  selectedValues={selectedValues}
                  indeterminateValues={indeterminateValues}
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
