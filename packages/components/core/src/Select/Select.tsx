import { useState, ComponentProps, useRef } from 'react';
import * as Popover from '@radix-ui/react-popover';
import * as ScrollArea from '@radix-ui/react-scroll-area';
import { Box } from '../Box';
import { Space } from '../Space';
import { DownOutlined, CloseCircleFilled } from '@ant-design/icons';
import { styled } from '../stitches.config';

const StyledWrapper = styled('div', {
  display: 'inline-grid',
  gridTemplateColumns: 'auto 1fr',
  minWidth: '100px',
  position: 'relative',
  '&:hover': {
    '.select': {
      borderColor: '$primary9',
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
  // $$primaryColor: '$primary9',
  '&:hover': {
    borderColor: '$primary9',
  },
  variants: {
    focused: {
      true: {
        borderColor: '$primary9',
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
  whiteSpace: 'nowrap',
});
const StyledPlaceholder = styled('span', {
  display: 'none',
  color: '$blackA11',
  whiteSpace: 'nowrap',
  variants: {
    show: {
      true: {
        display: 'block',
      },
    },
  },
});

const StyledSelectedItems = styled(Space, {
  height: '32px',
  alignItems: 'center',
});

const SCROLLBAR_WIDTH = 4;

const StyledScrollAreaRoot = styled(ScrollArea.Root, {
  height: '200px',
  width: '100px',
  overflow: 'hidden',
  maxHeight: '200px',
  padding: '4px 0',
  fontSize: '14px',
  outline: 'none',
  background: 'white',
  boxShadow:
    '0px 3px 6px -4px rgba(0, 0, 0, 0.12), 0px 6px 16px rgba(0, 0, 0, 0.08), 0px 9px 28px 8px rgba(0, 0, 0, 0.05)',
  borderRadius: '4px',
});

const StyledScrollAreaViewport = styled(ScrollArea.Viewport, {
  width: '100%',
  height: '100%',
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
        background: '$primary4',
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
}

export const Select = ({
  options = [],
  css,
  placeholder = 'Select...',
  ...props
}: SelectProps) => {
  const [open, setOpen] = useState(false);
  const [selectedItem, setSelectedItem] = useState<ISelectedItem | null>(null);
  const [selectedItems, setSelectedItems] = useState<ISelectedItem[] | null>(
    null
  );
  const wrapperRef = useRef<HTMLDivElement>(null);

  const onSelect = (option: ISelectedItem) => {
    setSelectedItems([option]);
    setSelectedItem(option);
    setOpen(false);
  };

  const onClear = () => {
    setSelectedItems(null);
    setSelectedItem(null);
  };

  const getInputWidth = () =>
    wrapperRef.current?.getBoundingClientRect().width ?? 100;

  return (
    <StyledWrapper
      hasItem={selectedItems?.length > 0}
      css={css}
      ref={wrapperRef}
    >
      <Popover.Root open={open} onOpenChange={setOpen}>
        <Popover.Trigger asChild>
          <StyledTrigger />
        </Popover.Trigger>
        <Popover.Portal>
          <Popover.Content align="start" asChild>
            <StyledScrollAreaRoot css={{ minWidth: getInputWidth() }}>
              <StyledScrollAreaViewport>
                {options.map((option, idx) => (
                  <StyledOptionItem
                    onClick={() => onSelect(option)}
                    selected={selectedItem?.value === option.value}
                  >
                    {option.label}
                  </StyledOptionItem>
                ))}
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
      >
        <StyledSelectedItems>
          <StyledPlaceholder show={selectedItem === null}>
            {placeholder}
          </StyledPlaceholder>
          {selectedItems?.length > 0
            ? selectedItems.map((it) => (
                <StyledSelectionItem data-value={it.value}>
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
