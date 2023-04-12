import {
  CloseCircleFilled,
  CloseOutlined,
  DownOutlined,
} from '@ant-design/icons';
import * as Popover from '@radix-ui/react-popover';
import clsx from 'clsx';
import isEqual from 'lodash.isequal';
import {
  ComponentProps,
  Fragment,
  ReactElement,
  useCallback,
  useEffect,
  useMemo,
  useRef,
  useState,
} from 'react';
import { useFormDisabledContext, useFormItemContext } from '../Form';
import { Space } from '../Space';
import {
  StyledArrow,
  StyledBtnRemove,
  StyledClear,
  StyledInput,
  StyledInputMultiple,
  StyledOptionItem,
  StyledPlaceholder,
  StyledScrollAreaRoot,
  StyledScrollAreaScrollbar,
  StyledScrollAreaThumb,
  StyledScrollAreaViewport,
  StyledSelect,
  StyledSelected,
  StyledSelectedItems,
  StyledSelectedMultipleItem,
  StyledSelectedSingleItem,
  StyledTrigger,
  StyledWrapper,
} from './Select.style';

const getColorSchemeVariants = (colorScheme?: string) => {
  return {
    $$primaryColor: colorScheme
      ? `$colors-${colorScheme}9`
      : '$colors-primary9',
    $$hightlightColor: colorScheme
      ? `$colors-${colorScheme}4`
      : '$colors-primary4',
  };
};

type SelectedItem = {
  value: string;
  label?: string;
};

export type RenderOptionArgs = {
  option: SelectedItem;
  index: number;
  onSelect?: (option: SelectedItem) => void;
  selected?: boolean;
};

export type SelectProps = {
  options?: SelectedItem[];
  css?: ComponentProps<typeof StyledWrapper>['css'];
  placeholder?: string;
  searchable?: boolean;
  disabled?: boolean;
  allowClear?: boolean;
  itemsToShow?: number;
  colorScheme?: string;
  size?: ComponentProps<typeof StyledSelect>['size'];
  multiple?: boolean;
  fullWidth?: boolean;
  value?: SelectedItem | SelectedItem[];
  onChange?: (value?: SelectedItem | SelectedItem[]) => void;
  className?: string;
  dropdownClassName?: string;
  /**
   * Custom option render
   */
  renderOption?: (args: RenderOptionArgs) => ReactElement;
};

export const Select = ({
  options = [],
  css,
  placeholder = 'Select...',
  searchable,
  itemsToShow = 10,
  multiple,
  allowClear = true,
  size: propSize,
  value: propValue,
  onChange: propOnChange,
  disabled: propDisabled,
  colorScheme,
  className,
  dropdownClassName,
  renderOption,
  fullWidth,
}: SelectProps) => {
  const [open, setOpen] = useState(false);

  const [selectedItems, setSelectedItems] = useState<SelectedItem[]>([]);
  const [selectedSingleItem, setSelectedSingleItem] = useState<
    SelectedItem | undefined
  >(undefined);

  const [input, setInput] = useState<string>('');
  const [filteredOptions, setFilteredOptions] = useState(() => options);
  const [multipleInputFocus, setMultipleInputFocus] = useState(false);
  // used when trigger onchange props
  const wrapperRef = useRef<HTMLDivElement>(null);
  const inputRef = useRef<HTMLInputElement>(null);
  const inputMultipleRef = useRef<HTMLSpanElement>(null);
  // to prevent effect when propOnChange changed
  const staticOnChangeFromProp = useRef(propOnChange);

  const formItem = useFormItemContext();
  const size = propSize ?? formItem.size;

  const disabledForm = useFormDisabledContext();
  const disabled = propDisabled || disabledForm;

  const setState = (option?: SelectedItem) => {
    if (typeof propOnChange === 'function' && propValue !== undefined) {
      if (multiple) {
        if (!option) {
          propOnChange([]);
          return;
        }
        const prevValues = (propValue as SelectedItem[]) ?? [];
        if (prevValues.find((it) => it.value === option.value)) {
          // remove it / deselect
          propOnChange(prevValues.filter((it) => it.value !== option.value));
        } else {
          propOnChange([...prevValues, option]);
        }
      } else {
        propOnChange(option);
      }
    } else {
      if (multiple) {
        if (!option) {
          setSelectedItems([]);
          return;
        }
        if (selectedItems.find((it) => it.value === option.value)) {
          setSelectedItems((prev) =>
            prev.filter((it) => it.value !== option.value)
          );
        } else {
          setSelectedItems((prev) => Array.from(new Set([...prev, option])));
        }
      } else {
        // handle when Select has onChange but does not have value
        if (typeof propOnChange === 'function') {
          propOnChange(option);
        }
        setSelectedSingleItem(option);
      }
    }
  };

  const clearInput = () => {
    if (searchable) {
      setInput('');
    }
    if (multiple && inputMultipleRef.current) {
      inputMultipleRef.current.innerText = '';
    }
  };

  const resetFilteredOptions = () => {
    setFilteredOptions(options);
  };

  const deSelect = (opt: SelectedItem) => {
    setSelectedItems((prev) => prev.filter((it) => it.value !== opt.value));
  };

  const onSelect = (option: SelectedItem) => {
    setState(option);
    if (!multiple) {
      setOpen(false);
    }
    clearInput();
    resetFilteredOptions();
  };

  const onClearAll = () => {
    setState();
    clearInput();
    resetFilteredOptions();
  };

  const inputWidth = useMemo(() => {
    return wrapperRef.current?.getBoundingClientRect().width ?? 100;
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [open]);

  const focusInput = useCallback(() => {
    if (inputRef.current && !multiple) {
      inputRef.current.focus();
    }
    if (inputMultipleRef.current && multiple) {
      inputMultipleRef.current.focus();
    }
  }, [multiple]);

  const filterOptions = (inputValue: string) => {
    const toLowerNoSpace = (text: string) =>
      text.toLowerCase().replace(/\s+/g, '');
    const lowerInput = toLowerNoSpace(inputValue);
    if (lowerInput.length > 0) {
      const filtered = options.filter((it) => {
        return toLowerNoSpace(it.label || '').includes(lowerInput);
      });
      setFilteredOptions(filtered);
    } else {
      resetFilteredOptions();
    }
  };

  const onChangeInput: React.ChangeEventHandler<HTMLInputElement> = (e) => {
    const inputVal = e.target.value;
    setInput(inputVal);
    filterOptions(inputVal);
  };
  const onChangeInputMultiple: React.ChangeEventHandler<HTMLSpanElement> = (
    e
  ) => {
    const inputVal = e.currentTarget.innerText;
    setInput(inputVal);
    filterOptions(inputVal);
  };

  useEffect(() => {
    if (open) {
      focusInput();
    }
  }, [focusInput, open]);

  useEffect(() => {
    if (typeof propValue !== undefined) {
      if (propValue instanceof Array) {
        setSelectedItems(propValue);
      } else {
        setSelectedSingleItem(propValue);
      }
    }
  }, [propValue]);

  useEffect(() => {
    if (multiple && typeof staticOnChangeFromProp.current === 'function') {
      staticOnChangeFromProp.current(selectedItems);
    }
  }, [selectedItems, multiple]);

  // to prevent inifinite render
  const prevOptions = useRef(options);
  useEffect(() => {
    if (!isEqual(options, prevOptions.current)) {
      setFilteredOptions(options);
      prevOptions.current = options;
    }
  }, [options, prevOptions]);

  const hasSelectedItem =
    selectedItems.length > 0 || selectedSingleItem !== undefined;
  const inputExist = input.length > 0;
  const dropdownHeight =
    (itemsToShow > filteredOptions.length
      ? filteredOptions.length
      : itemsToShow) * 26;

  return (
    <StyledWrapper
      hasItem={hasSelectedItem}
      css={{ ...css, ...getColorSchemeVariants(colorScheme) }}
      ref={wrapperRef}
      disabled={disabled}
      className={clsx('select-wrapper', className)}
      fullWidth={fullWidth}
    >
      <Popover.Root open={open}>
        <Popover.Trigger asChild>
          <StyledTrigger />
        </Popover.Trigger>
        <Popover.Portal>
          <Popover.Content
            align="start"
            asChild
            onInteractOutside={() => setOpen(false)}
            onOpenAutoFocus={(e) => e.preventDefault()}
            className={clsx('dropdown-select', dropdownClassName)}
          >
            <StyledScrollAreaRoot
              className="scroll-area"
              css={{ minWidth: inputWidth }}
            >
              <StyledScrollAreaViewport
                css={{
                  height: dropdownHeight,
                  ...getColorSchemeVariants(colorScheme),
                }}
                className="options-wrapper"
              >
                {filteredOptions.length > 0 ? (
                  filteredOptions.map((option, index) => {
                    const selected =
                      selectedSingleItem?.value === option.value ||
                      selectedItems.find((it) => it.value === option.value) !==
                        undefined;
                    if (renderOption) {
                      return (
                        <Fragment key={index}>
                          {renderOption({
                            option,
                            index,
                            selected,
                            onSelect: () => onSelect(option),
                          })}
                        </Fragment>
                      );
                    }
                    return (
                      <StyledOptionItem
                        onClick={() => onSelect(option)}
                        selected={selected}
                        key={index}
                        className={clsx('option', { selected })}
                      >
                        {option.label}
                      </StyledOptionItem>
                    );
                  })
                ) : (
                  <center>Empty</center>
                )}
              </StyledScrollAreaViewport>
              <StyledScrollAreaScrollbar
                className="scroll-indicator"
                orientation="vertical"
              >
                <StyledScrollAreaThumb className="thumb" />
              </StyledScrollAreaScrollbar>
            </StyledScrollAreaRoot>
          </Popover.Content>
        </Popover.Portal>
      </Popover.Root>
      <StyledSelect
        className="select"
        onClick={() => setOpen((prev) => !prev)}
        focused={open}
        searchable={searchable}
        disabled={disabled}
        size={size}
        isInvalid={formItem.isInvalid}
        isWarning={formItem.isWarning && !formItem.isInvalid}
      >
        <StyledSelected className="input-item-wrapper">
          {searchable && !multiple ? (
            <StyledInput
              value={input}
              onChange={onChangeInput}
              ref={inputRef}
              size={size}
              disabled={disabled}
              className="single-select-input"
            />
          ) : null}
          <StyledPlaceholder
            hide={hasSelectedItem || inputExist || multipleInputFocus}
            size={size}
            className="placeholder"
          >
            {placeholder}
          </StyledPlaceholder>
          {selectedSingleItem ? (
            <StyledSelectedSingleItem
              data-value={selectedSingleItem?.value}
              isOnInput={inputExist}
              className="selected-label"
            >
              {selectedSingleItem?.label}
            </StyledSelectedSingleItem>
          ) : null}
          {multiple ? (
            <StyledSelectedItems size={size} className="selected-items">
              {selectedItems.map((option, index) => (
                <StyledSelectedMultipleItem
                  data-value={option.value}
                  size={size}
                  key={index}
                  className="selected-item"
                >
                  <span>{option.label}</span>
                  {!disabled ? (
                    <StyledBtnRemove
                      onClick={(e) => {
                        e.stopPropagation();
                        deSelect(option);
                      }}
                      className="btn-remove"
                    >
                      <CloseOutlined />
                    </StyledBtnRemove>
                  ) : (
                    <span />
                  )}
                </StyledSelectedMultipleItem>
              ))}
              {multiple && searchable ? (
                <Space
                  css={{
                    display: 'inline-flex',
                    height: '24px',
                    padding: '3px 0',
                  }}
                  className="multiple-select-input-wrapper"
                >
                  <StyledInputMultiple
                    placeholder={placeholder}
                    contentEditable={!disabled}
                    onInput={onChangeInputMultiple}
                    onBlur={() => setMultipleInputFocus(false)}
                    onFocus={() => setMultipleInputFocus(true)}
                    // cause this is span element, need to prevent enter
                    onKeyDown={(e) => {
                      if (e.key === 'Enter') {
                        e.preventDefault();
                      }
                    }}
                    ref={inputMultipleRef}
                    size={size}
                    className="multiple-select-input"
                  />
                </Space>
              ) : null}
            </StyledSelectedItems>
          ) : null}
        </StyledSelected>
        <StyledArrow className="input-suffix">
          <DownOutlined />
          {allowClear && !disabled ? (
            <StyledClear
              className="clear-btn"
              onClick={(e) => {
                e.stopPropagation();
                onClearAll();
              }}
            >
              <CloseCircleFilled />
            </StyledClear>
          ) : null}
        </StyledArrow>
      </StyledSelect>
    </StyledWrapper>
  );
};

export default Select;
