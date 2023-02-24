import * as ScrollArea from '@radix-ui/react-scroll-area';
import React, {
  ComponentProps,
  ReactElement,
  useEffect,
  useRef,
  useState,
} from 'react';
import { Box } from '../Box';
import { Input } from '../Input';
import { keyframes, styled } from '../stitches.config';

const getItemColorSchemeVariants = (colorScheme?: string) => {
  return {
    $$bgList: colorScheme ? `$colors-${colorScheme}4` : '$colors-primary4',
  };
};

const slideUpAndFade = keyframes({
  '0%': { opacity: 0, transform: 'translateY(2px)' },
  '100%': { opacity: 1, transform: 'translateY(0)' },
});

const StyledListBoxWrapper = styled(Box, {
  position: 'relative',
  display: 'inline-block',
});

const StyledListBox = styled(Box, {
  position: 'absolute',
  top: 'calc(100% + .3rem)',
  width: '100%',
  borderRadius: '$1',
  background: '$gray1',
  animationDuration: '400ms',
  animationTimingFunction: 'cubic-bezier(0.16, 1, 0.3, 1)',
  willChange: 'transform, opacity',
  border: '1px solid $gray10',

  '&[data-state="open"]': {
    animationName: slideUpAndFade,
  },
});

const StyledListBoxItem = styled(Box, {
  cursor: 'pointer',
  overflow: 'hidden',
  whiteSpace: 'nowrap',
  textOverflow: 'ellipsis',
  borderRadius: '$1',
  py: '$1',
  px: '$2',
  color: '$gray12',
  boxSizing: 'border-box',
  variants: {
    hovered: {
      true: {
        background: '$$bgList',
        fontWeight: '600',
      },
    },
  },
});

const SCROLLBAR_WIDTH = 4;

const StyledScrollAreaRoot = styled(ScrollArea.Root, {
  height: 'auto',
  overflow: 'hidden',
  variants: {
    scrollable: {
      true: {
        height: '200px',
      },
    },
  },
});

const StyledScrollAreaViewport = styled(ScrollArea.Viewport, {
  width: '100%',
  height: '100%',
  borderRadius: 'inherit',
});

const StyledScrollAreaScrollbar = styled(ScrollArea.Scrollbar, {
  display: 'flex',
  userSelect: 'none',
  touchAction: 'none',
  background: '$grayA4',
  padding: 2,
  transition: 'background 160ms ease-out',
  '&:hover': { background: '$grayA4' },
  '&[data-orientation="vertical"]': { width: SCROLLBAR_WIDTH },
});

const StyledScrollAreaThumb = styled(ScrollArea.Thumb, {
  flex: 1,
  background: '$blue6',
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

export type AutoCompleteItem = string;

export interface AutoCompleteProps extends ComponentProps<typeof Input> {
  options?: AutoCompleteItem[];
  itemsToShow?: number;
  colorScheme?: string;
}

export type AutoCompleteComponent = (props: AutoCompleteProps) => ReactElement;

export type WrapWithScrollAreaProps = {
  shouldListScroll: boolean;
  children: React.ReactNode;
};

export const AutoComplete: AutoCompleteComponent = ({
  itemsToShow = 10,
  colorScheme,
  value,
  options,
  onFocus,
  onClick,
  onKeyDown,
  onChange,
  ...props
}) => {
  const inputRef = useRef<HTMLInputElement>(null);
  const listBoxRef = useRef<HTMLDivElement>(null);
  const listItemsRef = useRef<(HTMLDivElement | null)[]>([]);

  const [listBoxOpened, setListBoxOpened] = useState<boolean>(false);
  const [hovered, setHovered] = useState<number>(-1);
  const [_value, setValue] = useState<string>(value ? (value as string) : '');

  const filteredData = options
    ? options.filter((option) =>
        option.toLowerCase().trim().includes(_value.toLowerCase().trim())
      )
    : [];

  const shouldListBoxOpened = listBoxOpened && filteredData.length > 0;

  useEffect(() => {
    if (typeof value === 'string') {
      setValue(value);
    }
  }, [value]);

  useEffect(() => {
    const handleOutsideClick = (event: MouseEvent) => {
      if (inputRef.current && listBoxRef.current) {
        if (
          !inputRef.current.contains(event.target as Node) &&
          !inputRef.current.contains(listBoxRef.current)
        ) {
          setListBoxOpened(false);
        }
      }
    };
    window.addEventListener('click', handleOutsideClick);
    return () => {
      window.removeEventListener('click', handleOutsideClick);
    };
  }, [inputRef, listBoxRef]);

  const handleNext = () => {
    setHovered((current) =>
      current < filteredData.length - 1 ? current + 1 : current
    );
  };

  const handlePrevious = () => {
    setHovered((current) => (current > 0 ? current - 1 : current));
  };

  const handleInputFocus = (event: React.FocusEvent<HTMLInputElement>) => {
    typeof onFocus === 'function' && onFocus(event);

    setListBoxOpened(true);
  };

  const handleInputClick = (
    event: React.MouseEvent<HTMLInputElement, MouseEvent>
  ) => {
    typeof onClick === 'function' && onClick(event);

    setListBoxOpened(true);
  };

  const handleKeyDown = (event: React.KeyboardEvent<HTMLInputElement>) => {
    typeof onKeyDown === 'function' && onKeyDown(event);

    switch (event.key) {
      case 'ArrowUp': {
        event.preventDefault();
        handlePrevious();
        listItemsRef.current[hovered]?.scrollIntoView(false);
        break;
      }

      case 'ArrowDown': {
        event.preventDefault();
        handleNext();
        listItemsRef.current[hovered]?.scrollIntoView(true);
        break;
      }

      case 'Enter': {
        if (shouldListBoxOpened && filteredData[hovered]) {
          event.preventDefault();
          setListBoxOpened(false);
          setValue(filteredData[hovered]);
        }
        break;
      }

      case 'Escape': {
        event.preventDefault();
        setListBoxOpened(false);
      }
    }
  };

  const handleChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    if (!shouldListBoxOpened) {
      setListBoxOpened(true);
    }

    if (typeof value === 'string') {
      typeof onChange === 'function' && onChange(event);
    } else {
      setValue(event.target.value);
      setHovered(-1);
    }
  };

  const handleHovered = (
    event: React.MouseEvent<HTMLDivElement>,
    index: number
  ) => {
    setHovered(index);
  };

  const handleItemClick = (
    event: React.MouseEvent<HTMLDivElement>,
    value: AutoCompleteItem
  ) => {
    setValue(value);
    setListBoxOpened(false);
  };

  const shouldListScroll = filteredData.length > itemsToShow;

  return (
    <StyledListBoxWrapper role="combobox">
      <Input
        ref={inputRef}
        type="text"
        autoComplete="off"
        autoCorrect="off"
        value={_value}
        onChange={handleChange}
        onFocus={handleInputFocus}
        onClick={handleInputClick}
        onKeyDown={handleKeyDown}
        aria-autocomplete="list"
        aria-expanded={shouldListBoxOpened}
        {...props}
      />
      {shouldListBoxOpened ? (
        <StyledListBox data-state="open" role="list" ref={listBoxRef}>
          <StyledScrollAreaRoot scrollable={shouldListScroll}>
            <StyledScrollAreaViewport>
              {filteredData.map((option, idx) => (
                <StyledListBoxItem
                  css={{
                    ...getItemColorSchemeVariants(colorScheme),
                  }}
                  ref={(el: HTMLDivElement) => (listItemsRef.current[idx] = el)}
                  role="listitem"
                  key={`${option}-${idx}`}
                  onClick={(e: React.MouseEvent<HTMLDivElement>) =>
                    handleItemClick(e, option)
                  }
                  onMouseEnter={(e: React.MouseEvent<HTMLDivElement>) =>
                    handleHovered(e, idx)
                  }
                  hovered={idx === hovered}
                >
                  {option}
                </StyledListBoxItem>
              ))}
            </StyledScrollAreaViewport>
            <StyledScrollAreaScrollbar orientation="vertical">
              <StyledScrollAreaThumb />
            </StyledScrollAreaScrollbar>
          </StyledScrollAreaRoot>
        </StyledListBox>
      ) : null}
    </StyledListBoxWrapper>
  );
};

export default AutoComplete;
