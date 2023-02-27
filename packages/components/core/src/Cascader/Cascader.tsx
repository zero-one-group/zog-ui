import {
  CloseCircleFilled,
  CloseOutlined,
  DownOutlined,
} from '@ant-design/icons';
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
  position: 'relative',
  width: '100%',
  padding: '0 11px',
  border: '1px solid $grayA8',
  borderRadius: '$2',
  cursor: 'pointer',
  backgroundColor: '$gray1',
  boxSizing: 'border-box',
  variants: {
    size: {
      sm: {
        minHeight: 'calc(20px + $1)',
      },
      md: {
        minHeight: 'calc(28px + $1)',
      },
      lg: {
        minHeight: 'calc(36px + $1)',
      },
    },
  },
  defaultVariants: {
    size: 'md',
  },
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

const StyledSelectedItems = styled('div', {
  minWidth: '150px',
  height: 'calc(100% - $1)',
  display: 'flex',
  flexWrap: 'wrap',
  padding: '$1 0',
  gap: '$1',
  background: 'transparent',
});

const StyledPlaceholder = styled('span', {
  width: 'calc(100% - 11px)',
  position: 'absolute',
  top: '50%',
  transform: 'translateY(-50%)',
  fontFamily: '$untitled',
  fontSize: '13px',
  color: '$gray10',
  whiteSpace: 'nowrap',
  textOverflow: 'ellipsis',
  overflow: 'hidden',
});

const StyledSelectedMultipleItem = styled('span', {
  display: 'inline-grid',
  gridTemplateColumns: 'auto auto',
  borderRadius: '2px',
  padding: '0 5px 0 8px',
  border: '1px solid $gray4',
  background: '$gray3',
  height: '24px',
  gap: '4px',
  alignItems: 'center',
  whiteSpace: 'nowrap',
  color: '$gray12',
});

const StyledBtnRemove = styled('span', {
  height: '100%',
  display: 'inline-flex',
  alignItems: 'center',
  fontSize: '10px',
  color: '$gray9',
  cursor: 'pointer',
  '&:hover': {
    color: '$gray12',
  },
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

  const handleOnChangeCallback = (
    path: CascaderValue[] | CascaderValue[][]
  ) => {
    if (typeof onValueChange !== 'function') return;
    onValueChange(path);
  };

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

  const getLabelsFromPath = (path: CascaderValue[]) => {
    const labels: string[] = [];
    let currentOption = options;
    path.forEach((active) => {
      const currentCell = currentOption.find(
        (option) => option.value === active
      );

      if (currentCell) {
        labels.push(currentCell.label);
      }

      const childrenOption = currentCell?.children;

      if (childrenOption?.length) {
        currentOption = childrenOption;
      }
    });
    return labels;
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

  const updateSetSelected = (
    set: Set<CascaderValue>,
    value: CascaderValue,
    isSelected: CheckedState
  ) => {
    if (!isSelected) {
      set.add(value);
    } else {
      set.delete(value);
    }
  };

  const updateNewSelectedValue = (
    prev: CascaderValue[][],
    next: CascaderValue[],
    isSelected: CheckedState
  ) => {
    if (!isSelected) {
      handleSelectMultipleValues(next);
      return [...prev, next];
    } else {
      handleDeleteMultipleValues(next);
      return prev.filter((val) => JSON.stringify(val) !== JSON.stringify(next));
    }
  };

  const handleSelectMultipleValues = (path: CascaderValue[]) => {
    setMultipleValues((prev) => {
      const newValues = [...prev, path];
      return newValues;
    });
  };

  const handleDeleteMultipleValues = (path: CascaderValue[]) => {
    setMultipleValues((prev) => {
      const newValues = prev.filter(
        (val) => JSON.stringify(val) !== JSON.stringify(path)
      );

      return newValues;
    });
  };

  const findRootFromPath = (path: CascaderValue[]) => {
    let currentOption = options;
    let root: CascaderOption | undefined;
    path.forEach((active) => {
      const currentCell = currentOption.find(
        (option) => option.value === active
      );
      root = currentCell;
      const childrenOption = currentCell?.children;

      if (childrenOption?.length) {
        currentOption = childrenOption;
      }
    });

    return root;
  };

  const handleSelect = (
    value: CascaderValue,
    isSelected: CheckedState,
    path: CascaderValue[]
  ) => {
    const root = findRootFromPath(path);
    if (root) {
      const selected = new Set(selectedValues);
      let newValue = [...multipleValue];

      checkAndUpdateSelectedValues(path, root, ({ option, newPath }) => {
        updateSetSelected(selected, option.value, isSelected);
        newValue = updateNewSelectedValue(newValue, newPath, isSelected);
        conductValueCheck(selected);
      });

      updateSetSelected(selected, value, isSelected);
      if (!root.children) {
        newValue = updateNewSelectedValue(newValue, path, isSelected);
      }
      conductValueCheck(selected);
      handleOnChangeCallback(newValue);
    }
  };

  const checkAndUpdateSelectedValues = (
    parentPath: CascaderValue[],
    root: CascaderOption,
    callback: (args: {
      option: CascaderOption;
      newPath: CascaderValue[];
    }) => void
  ) => {
    if (root.children) {
      root.children.forEach((option) => {
        const currentPath = [...parentPath, option.value];
        callback({ option, newPath: currentPath });
        checkAndUpdateSelectedValues(currentPath, option, callback);
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

  const renderMultipleItems = multipleValue.map((path, idx) => {
    const values = getLabelsFromPath(path);
    const childValue = path[path.length - 1];
    const childLabel = values[values.length - 1];
    const key = `${childValue}-${idx}`;
    return (
      <StyledSelectedMultipleItem key={key}>
        <span>{childLabel}</span>
        <StyledBtnRemove
          onClick={(e) => {
            e.stopPropagation();
            handleSelect(childValue, true, path);
          }}
        >
          <CloseOutlined />
        </StyledBtnRemove>
      </StyledSelectedMultipleItem>
    );
  });

  const handleClear = (e: MouseEvent<HTMLDivElement>) => {
    e.stopPropagation();
    setValue('');
    setActiveValues([]);
    setMultipleValues([]);
    setIndeterminateValues(new Set());
    setSelectedValues(new Set());
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
        {!value && selectedValues.size === 0 ? (
          <StyledPlaceholder>Please Select</StyledPlaceholder>
        ) : null}

        {!multiple ? (
          <StyledCascaderInput value={value} readOnly />
        ) : (
          <StyledSelectedItems>{renderMultipleItems}</StyledSelectedItems>
        )}
      </StyledCascaderSelector>
      {value || selectedValues.size !== 0 ? (
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
