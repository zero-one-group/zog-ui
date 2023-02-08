import { useState, ComponentProps, useRef, useEffect, useMemo } from 'react';
import * as Popover from '@radix-ui/react-popover';
import * as ScrollArea from '@radix-ui/react-scroll-area';
// import { Box } from '../Box';
import { Space } from '../Space';
import { DownOutlined, CloseCircleFilled } from '@ant-design/icons';
import { styled } from '../stitches.config';

const Box = styled('div', {
  fontFamily: '$untitled',
  boxSizing: 'border-box',
});

const StyledWrapper = styled('div', {
  display: 'inline-grid',
  gridTemplateColumns: 'auto 1fr',
  minWidth: '100px',
  position: 'relative',
  $$primaryColor: '$colors-primary9',
  '&:hover': {
    '.select': {
      borderColor: '$$primaryColor',
    },
  },
  variants: {
    hasItem: {
      true: {
        '&:hover': {
          '& .clear-btn': {
            opacity: 1,
          },
        },
      },
    },
  },
});

const StyledSelect = styled('div', {
  display: 'inline-grid',
  gridTemplateColumns: '1fr auto',
  alignItems: 'center',
  borderRadius: '2px',
  border: '1px solid #D9D9D9',
  padding: '0 12px',
  background: 'white',
  cursor: 'pointer',
  fontSize: '14px',
  '&:hover': {
    borderColor: '$$primaryColor',
  },
  variants: {
    focused: {
      true: {
        borderColor: '$$primaryColor',
      },
    },
    searchable: {
      true: {
        cursor: 'text',
      },
    },
  },
});

const StyledArrow = styled(Box, {
  fontSize: '12px',
  display: 'flex',
  alignItems: 'center',
  paddingInlineStart: '6px',
  color: '$blackA9',
});
const StyledClear = styled(Box, {
  fontSize: '12px',
  marginInlineEnd: '12px',
  position: 'absolute',
  top: '50%',
  transform: 'translateY(-50%)',
  right: '0',
  cursor: 'pointer',
  background: 'white',
  color: '$blackA9',
  opacity: 0,
  ':hover': {
    color: '$blackA11',
  },
});

const StyledTrigger = styled('div', {
  width: 0,
  height: '100%',
});

const StyledSelectionItem = styled('span', {
  userSelect: 'none',
  whiteSpace: 'nowrap',
  variants: {
    isOnInput: {
      true: {
        visibility: 'hidden',
      },
    },
  },
});
const StyledPlaceholder = styled('span', {
  color: '$blackA11',
  whiteSpace: 'nowrap',
  pointerEvents: 'none',
  display: 'block',
  variants: {
    hide: {
      true: {
        display: 'none',
      },
    },
  },
});
const StyledInput = styled('input', {
  position: 'absolute',
  top: 0,
  inset: 0,
  bottom: 0,
  margin: 0,
  padding: 0,
  outline: 0,
  border: 0,
  background: 'transparent',
  fontSize: '14px',
  fontFamily: '$untitled',
});

const StyledSelectedItems = styled(Space, {
  height: '32px',
  alignItems: 'center',
  position: 'relative',
});

const SCROLLBAR_WIDTH = 4;

const StyledScrollAreaRoot = styled(ScrollArea.Root, {
  minWidth: '100px',
  overflow: 'hidden',
  fontSize: '14px',
  outline: 'none',
  background: 'white',
  boxShadow:
    '0px 3px 6px -4px rgba(0, 0, 0, 0.12), 0px 6px 16px rgba(0, 0, 0, 0.08), 0px 9px 28px 8px rgba(0, 0, 0, 0.05)',
  borderRadius: '4px',
});

const StyledScrollAreaViewport = styled(ScrollArea.Viewport, {
  minHeight: '30px',
  padding: '4px 0',
  width: '100%',
  height: '100%',
  $$hightlightColor: '$colors-primary4',
});

const StyledScrollAreaScrollbar = styled(ScrollArea.Scrollbar, {
  display: 'flex',
  userSelect: 'none',
  touchAction: 'none',
  background: '$grayA4',
  padding: '0px 2px',
  transition: 'background 160ms ease-out',
  '&:hover': { background: '$grayA4' },
  '&[data-orientation="vertical"]': { width: SCROLLBAR_WIDTH },
});

const StyledScrollAreaThumb = styled(ScrollArea.Thumb, {
  flex: 1,
  background: '$gray9',
  borderRadius: SCROLLBAR_WIDTH,
  position: 'relative',
  '&::before': {
    content: '""',
    position: 'absolute',
    top: '50%',
    left: '50%',
    transform: 'translate(-50%, -50%)',
    width: '100%',
    height: '100%',
    minWidth: 44,
    minHeight: 44,
  },
});

const StyledOptionItem = styled(Box, {
  padding: '5px 12px',
  cursor: 'pointer',
  '&:hover': {
    background: '#F5F5F5',
  },
  variants: {
    selected: {
      true: {
        background: '$$hightlightColor',
      },
    },
  },
});

type ISelectedItem = {
  value: string;
  label?: string;
};

/* eslint-disable-next-line */
export interface SelectProps {
  options?: ISelectedItem[];
  css?: ComponentProps<typeof StyledWrapper>['css'];
  placeholder?: string;
  searchable?: boolean;
  itemsToShow?: number;
}

export const Select = ({
  options = [],
  css,
  placeholder = 'Select...',
  searchable = false,
  itemsToShow = 10,
  ...props
}: SelectProps) => {
  const [open, setOpen] = useState(false);
  const [selectedItems, setSelectedItems] = useState<ISelectedItem[] | null>(
    null
  );
  const [input, setInput] = useState<string | undefined>();
  const [localOptions, setLocalOptions] = useState(() => options);
  const wrapperRef = useRef<HTMLDivElement>(null);
  const inputRef = useRef<HTMLInputElement>(null);

  const clearInput = () => {
    if (searchable) {
      setInput('');
    }
  };

  const resetLocalOptions = () => {
    setLocalOptions(options);
  };

  const onSelect = (option: ISelectedItem) => {
    setSelectedItems([option]);
    setOpen(false);
    clearInput();
    resetLocalOptions();
  };

  const onClear = () => {
    setSelectedItems(null);
    clearInput();
    resetLocalOptions();
  };

  const inputWidth = useMemo(() => {
    return wrapperRef.current?.getBoundingClientRect().width ?? 100;
  }, [open]);

  const focusInput = () => {
    if (inputRef.current) {
      inputRef.current.focus();
    }
  };

  const filterOptions = (inputValue: string) => {
    const lowerInput = inputValue.toLowerCase();
    if (lowerInput.length > 0) {
      setLocalOptions((prev) =>
        prev.filter((it) => {
          return (it.label || '').toLowerCase().includes(lowerInput);
        })
      );
    } else {
      resetLocalOptions();
    }
  };

  const onChangeInput: React.ChangeEventHandler<HTMLInputElement> = (e) => {
    const inputVal = e.target.value;
    setInput(inputVal);
    filterOptions(inputVal);
  };

  useEffect(() => {
    if (open) {
      focusInput();
    }
  }, [open]);

  const hasItem = !!(selectedItems && selectedItems.length > 0);
  const selectedItem = hasItem ? selectedItems[0] : null;
  const inputExist = !!(input && input.length > 0);
  const dropdownHeight =
    (itemsToShow > localOptions.length ? localOptions.length : itemsToShow) *
    26;

  return (
    <StyledWrapper hasItem={hasItem} css={css} ref={wrapperRef}>
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
          >
            <StyledScrollAreaRoot css={{ minWidth: inputWidth }}>
              <StyledScrollAreaViewport css={{ height: dropdownHeight }}>
                {localOptions.length > 0 ? (
                  localOptions.map((option, idx) => (
                    <StyledOptionItem
                      onClick={() => onSelect(option)}
                      selected={selectedItem?.value === option.value}
                    >
                      {option.label}
                    </StyledOptionItem>
                  ))
                ) : (
                  <center>Empty</center>
                )}
              </StyledScrollAreaViewport>
              <StyledScrollAreaScrollbar orientation="vertical">
                <StyledScrollAreaThumb />
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
      >
        <StyledSelectedItems>
          {searchable ? (
            <StyledInput
              value={input}
              onChange={onChangeInput}
              ref={inputRef}
            />
          ) : null}
          <StyledPlaceholder hide={selectedItem !== null || inputExist}>
            {placeholder}
          </StyledPlaceholder>
          {hasItem
            ? selectedItems.map((it) => (
                <StyledSelectionItem
                  data-value={it.value}
                  isOnInput={inputExist}
                >
                  {it.label}
                </StyledSelectionItem>
              ))
            : null}
        </StyledSelectedItems>
        <StyledArrow>
          <DownOutlined />
        </StyledArrow>
      </StyledSelect>
      <StyledClear className="clear-btn" onClick={() => onClear()}>
        <CloseCircleFilled />
      </StyledClear>
    </StyledWrapper>
  );
};

export default Select;
