import type * as Stitches from '@stitches/react';
import { ComponentProps } from 'react';
import { styled } from '../stitches.config';

const getColorSchemeVariants = (colorScheme?: string) => {
  return {
    $$bgBtn: colorScheme ? `$colors-${colorScheme}9` : '$colors-primary9',
    $$bgBtnHover: colorScheme ? `$colors-${colorScheme}8` : '$colors-primary8',
    $$bgBtnActive: colorScheme
      ? `$colors-${colorScheme}11`
      : '$colors-primary11',
  };
};

const StyledButton = styled('button', {
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
        height: '$4',
      },
      md: {
        padding: '4px 15px',
        fontSize: '14px',
        lineHeight: '22px',
        height: '$6',
      },
      lg: {
        padding: '6.4px 15px',
        fontSize: '16px',
        lineHeight: '24px',
        height: '$7',
      },
    },
    styleType: {
      theme: {
        color: '$gray1',
        backgroundColor: '$$bgBtn',
        '&:hover': {
          backgroundColor: '$$bgBtnHover',
        },
        '&:active': {
          backgroundColor: '$$bgBtnActive',
        },
      },
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
        backgroundColor: '$$bgBtn',
        '&:hover': {
          backgroundColor: '$$bgBtnHover',
        },
        '&:active': {
          backgroundColor: '$$bgBtnActive',
        },
      },
      secondary: {
        backgroundColor: '$gray1',
        borderColor: '$gray8',
        '&:hover': {
          borderColor: '$$bgBtnHover',
          color: '$$bgBtnHover',
        },
        '&:active': {
          color: '$$bgBtnActive',
          borderColor: '$$bgBtnActive',
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
      size: 'md',
      variant: 'circle',
      css: {
        padding: '19px 15px',
        height: '$5',
      },
    },
    {
      styleType: 'danger',
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
      styleType: 'primary',
      variant: 'outlined',
      css: {
        color: '$$bgBtn',
        backgroundColor: '$gary1',
        border: '1px solid $$bgBtn',
        '&:hover': {
          backgroundColor: '$gary1',
        },
      },
    },
    {
      styleType: 'danger',
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
      styleType: 'theme',
      variant: 'dashed',
      css: {
        color: '$$bgBtn',
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
      styleType: 'primary',
      variant: 'dashed',
      css: {
        color: '$$bgBtn',
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
      styleType: 'primary',
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
      styleType: 'secondary',
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
      styleType: 'danger',
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
    styleType: 'default',
  },
});

export type ButtonProps = {
  colorScheme?: string;
  htmlType?: 'submit' | 'reset' | 'button';
  type?: Extract<
    Stitches.VariantProps<typeof StyledButton>['styleType'],
    string
  >;
} & Omit<ComponentProps<typeof StyledButton>, 'type'>;

export const Button = ({
  css,
  colorScheme,
  htmlType = 'submit',
  type = 'default',
  ...props
}: ButtonProps) => {
  return (
    <StyledButton
      css={{
        ...css,
        ...getColorSchemeVariants(colorScheme),
      }}
      type={htmlType}
      styleType={type}
      {...props}
    >
      {props.children}
    </StyledButton>
  );
};
