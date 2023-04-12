import * as ScrollArea from '@radix-ui/react-scroll-area';
import { Box } from '../Box';
import { Input } from '../Input';
import { Space } from '../Space';
import { styled } from '../stitches.config';

export const StyledWrapper = styled('div', {
  display: 'inline-grid',
  gridTemplateColumns: 'auto 1fr',
  minWidth: 200,
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
    disabled: {
      true: {
        cursor: 'not-allowed',
      },
    },
    fullWidth: {
      true: {
        width: '100%',
      },
    },
  },
});

export const StyledSelect = styled('div', {
  display: 'inline-grid',
  gridTemplateColumns: '1fr auto',
  alignItems: 'center',
  borderRadius: '2px',
  border: '1px solid $inputDefaultBorder',
  boxSizing: 'border-box',
  padding: '0 12px',
  background: 'transparent',
  cursor: 'pointer',
  fontSize: '14px',
  transition:
    'min-height .1s ease-in-out, font-size .1s ease-in-out, border .1s ease-in-out',
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
    disabled: {
      true: {
        pointerEvents: 'none',
        '*': {
          pointerEvents: 'none',
        },
        borderColor: '$inputDefaultBorder !important',
        background: '$gray3',
      },
    },
    size: {
      sm: {
        minHeight: '24px',
      },
      md: {
        minHeight: '32px',
      },
      lg: {
        minHeight: '40px',
      },
    },
    isInvalid: {
      true: {
        borderColor: '$inputError !important',
      },
    },
    isWarning: {
      true: {
        borderColor: '$inputWarning !important',
      },
    },
  },
  defaultVariants: {
    size: 'md',
  },
});
export const StyledArrow = styled(Box, {
  fontSize: '12px',
  display: 'flex',
  alignItems: 'center',
  paddingInlineStart: '6px',
  color: '$gray9',
  position: 'relative',
});
export const StyledClear = styled(Box, {
  fontSize: '12px',
  position: 'absolute',
  right: '0',
  cursor: 'pointer',
  borderRadius: '100%',
  background: '$gray1',
  color: '$gray9',
  opacity: 0,
  ':hover': {
    color: '$gray11',
  },
});

export const StyledTrigger = styled('div', {
  width: 0,
  height: '100%',
});

export const StyledSelectedSingleItem = styled('span', {
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

export const StyledPlaceholder = styled('span', {
  whiteSpace: 'nowrap',
  pointerEvents: 'none',
  display: 'block',
  color: '$gray10',
  variants: {
    hide: {
      true: {
        display: 'none',
      },
    },
    size: {
      sm: {
        fontSize: '14px',
      },
      md: {
        fontSize: '14px',
      },
      lg: {
        fontSize: '16px',
      },
    },
  },
});
export const StyledInput = styled(Input, {
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
  input: {
    border: 'none',
    padding: '0 !important',
  },
  variants: {
    size: {
      sm: {
        fontSize: '14px',
      },
      md: {
        fontSize: '14px',
      },
      lg: {
        fontSize: '16px',
      },
    },
  },
});

export const StyledSelected = styled(Space, {
  height: '100%',
  alignItems: 'center',
  position: 'relative',
});
export const StyledSelectedItems = styled(Space, {
  alignItems: 'center',
  gap: '5px',
  flexWrap: 'wrap',
  padding: '3px 0',
  variants: {
    size: {
      sm: {
        padding: '0',
      },
      md: {
        padding: '3px 0',
      },
      lg: {
        padding: '3px 0',
      },
    },
  },
});

export const StyledSelectedMultipleItem = styled('span', {
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
  variants: {
    size: {
      sm: {
        height: '16px',
      },
      md: {
        height: '24px',
      },
      lg: {
        height: '32px',
        span: {
          fontSize: '16px',
        },
      },
    },
  },
});

export const StyledBtnRemove = styled('span', {
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

export const StyledInputMultiple = styled('span', {
  margin: 0,
  padding: 0,
  outline: 0,
  background: 'transparent',
  fontSize: '14px',
  fontFamily: '$untitled',
  whiteSpace: 'nowrap',
  minWidth: '4px',
  variants: {
    size: {
      sm: {
        fontSize: '14px',
      },
      md: {
        fontSize: '14px',
      },
      lg: {
        fontSize: '16px',
      },
    },
  },
});

const SCROLLBAR_WIDTH = 4;

export const StyledScrollAreaRoot = styled(ScrollArea.Root, {
  minWidth: '100px',
  overflow: 'hidden',
  fontSize: '14px',
  outline: 'none',
  background: 'white',
  boxShadow:
    '0px 3px 6px -4px rgba(0, 0, 0, 0.12), 0px 6px 16px rgba(0, 0, 0, 0.08), 0px 9px 28px 8px rgba(0, 0, 0, 0.05)',
  borderRadius: '4px',
});

export const StyledScrollAreaViewport = styled(ScrollArea.Viewport, {
  minHeight: '30px',
  padding: '4px 0',
  width: '100%',
  height: '100%',
  $$hightlightColor: '$colors-primary4',
  '&> div > *': {
    display: 'block',
    padding: '5px 12px',
    cursor: 'pointer',
  },
});

export const StyledScrollAreaScrollbar = styled(ScrollArea.Scrollbar, {
  display: 'flex',
  userSelect: 'none',
  touchAction: 'none',
  background: '$grayA4',
  padding: '0px 2px',
  transition: 'background 160ms ease-out',
  '&:hover': { background: '$grayA4' },
  '&[data-orientation="vertical"]': { width: SCROLLBAR_WIDTH },
});

export const StyledScrollAreaThumb = styled(ScrollArea.Thumb, {
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

export const StyledOptionItem = styled(Box, {
  padding: '5px 12px',
  cursor: 'pointer',
  '&:hover': {
    background: '$gray3',
  },
  variants: {
    selected: {
      true: {
        background: '$$hightlightColor',
        '&:hover': {
          background: '$$hightlightColor',
        },
      },
    },
  },
});
