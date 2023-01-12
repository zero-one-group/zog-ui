import { styled } from '../stitches.config';

export const Button = styled('button', {
  // Reset
  all: 'unset',
  alignItems: 'center',
  boxSizing: 'border-box',
  userSelect: 'none',
  '&::before': {
    boxSizing: 'border-box',
  },
  '&::after': {
    boxSizing: 'border-box',
  },

  // Custom reset?
  display: 'inline-flex',
  flexShrink: 0,
  justifyContent: 'center',
  lineHeight: '1',
  WebkitTapHighlightColor: 'rgba(0,0,0,0)',

  // Custom
  height: '$5',
  px: '$2',
  fontFamily: '$untitled',
  fontSize: '$2',
  fontWeight: 500,
  fontVariantNumeric: 'tabular-nums',
  borderWidth: '1px',
  borderRadius: '2px',
  boxShadow: '0px 2px 0px rgba(0, 0, 0, 0.043)',
  variants: {
    size: {
      sm: {
        padding: '0 7px',
        fontSize: '14px',
        lineHeight: '22px',
      },
      md: {
        padding: '4px 15px',
        fontSize: '14px',
        lineHeight: '22px',
      },
      lg: {
        padding: '6.4px 15px',
        fontSize: '16px',
        lineHeight: '24px',
      },
    },
    colorScheme: {
      default: {
        color: '$gray12',
        backgroundColor: '$gray1',
        borderColor: '$gray11',
        '&:hover': {
          backgroundColor: '$gray1',
        },
        '&:active': {
          backgroundColor: '$gray1',
        },
      },
      primary: {
        color: '$gray1',
        backgroundColor: '$blue9',
        '&:hover': {
          backgroundColor: '$blue8',
        },
        '&:active': {
          backgroundColor: '$blue11',
        },
      },
      secondary: {
        backgroundColor: '$gray1',
        borderColor: '$gray8',
        '&:hover': {
          borderColor: '$blue8',
          color: '$blue8',
        },
        '&:active': {
          color: '$blue11',
          borderColor: '$blue11',
        },
      },
      danger: {
        backgroundColor: '$red11',
        color: '$gray1',
        '&:hover': {
          borderColor: '$red11',
          backgroundColor: '$red9',
        },
      },
    },
    variant: {
      default: {
        borderStyle: 'solid',
      },
      outlined: {
        backgroundColor: '$gray1',
      },
      dashed: {
        borderStyle: 'dashed',
        backgroundColor: '$gray1',
      },
      circle: {
        borderRadius: '100%',
        width: 'auto',
        height: 'auto',
      },
      square: {
        border: 'none',
        width: 'auto',
        height: 'auto',
      },
    },
    disabled: {
      true: {
        backgroundColor: '$gray3',
        borderColor: '$gray9',
        color: '$gray9',
        '&:hover': {
          backgroundColor: '$gray3',
        },
        '&:active': {
          backgroundColor: '$gray3',
        },
      },
    },
    ghost: {
      true: {
        backgroundColor: 'transparent',
      },
    },
  },
  compoundVariants: [
    {
      colorScheme: 'danger',
      variant: 'outlined',
      css: {
        color: '$red10',
        border: '1px solid $red10',
        backgroundColor: '$gary1',
        '&:hover': {
          backgroundColor: '$gary1',
        },
      },
    },
    {
      colorScheme: 'primary',
      variant: 'outlined',
      css: {
        color: '$blue9',
        backgroundColor: '$gary1',
        border: '1px solid $blue9',
        '&:hover': {
          backgroundColor: '$gary1',
        },
      },
    },
    {
      colorScheme: 'danger',
      variant: 'dashed',
      css: {
        color: '$red10',
        backgroundColor: '$gary1',
        '&:hover': {
          backgroundColor: '$gary1',
        },
      },
    },
    {
      colorScheme: 'primary',
      variant: 'dashed',
      css: {
        color: '$blue9',
        backgroundColor: '$gary1',
        '&:hover': {
          backgroundColor: '$gray1',
        },
        '&:active': {
          backgroundColor: '$gary1',
        },
      },
    },
    {
      colorScheme: 'primary',
      disabled: true,
      css: {
        backgroundColor: '$gray3',
        borderColor: '$gray9',
        color: '$gray9',
        '&:hover': {
          backgroundColor: '$gray3',
        },
        '&:active': {
          backgroundColor: '$gray3',
        },
      },
    },
    {
      colorScheme: 'secondary',
      disabled: true,
      css: {
        backgroundColor: '$gray3',
        borderColor: '$gray9',
        color: '$gray9',
        '&:hover': {
          backgroundColor: '$gray3',
          borderColor: '$gray9',
          color: '$gray9',
        },
        '&:active': {
          backgroundColor: '$gray3',
          borderColor: '$gray9',
          color: '$gray9',
        },
      },
    },
    {
      colorScheme: 'danger',
      disabled: true,
      css: {
        backgroundColor: '$gray3',
        borderColor: '$gray9',
        color: '$gray9',
        '&:hover': {
          backgroundColor: '$gray3',
          borderColor: '$gray9',
          color: '$gray9',
        },
        '&:active': {
          backgroundColor: '$gray3',
          borderColor: '$gray9',
          color: '$gray9',
        },
      },
    },
  ],

  defaultVariants: {
    size: 'sm',
    variant: 'default',
    colorScheme: 'default',
  },
});
