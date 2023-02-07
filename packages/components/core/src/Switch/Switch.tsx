import * as RadixSwitch from '@radix-ui/react-switch';
import { keyframes, VariantProps } from '@stitches/react';
import { ComponentProps, forwardRef } from 'react';
import { styled } from '../stitches.config';

const getColorSchemeVariants = (colorScheme?: string) => {
  return {
    $$bgSwitch: colorScheme ? `$colors-${colorScheme}A9` : '$colors-blueA9',
    $$bgSwitchFocus: colorScheme
      ? `$colors-${colorScheme}A7`
      : '$colors-blueA7',
    $$bgSwitchDisabled: colorScheme
      ? `$colors-${colorScheme}A6`
      : '$colors-blueA6',
  };
};

const SwitchRoot = styled(RadixSwitch.Root, {
  all: 'unset',
  backgroundColor: '$grayA10',
  borderRadius: '9999px',
  position: 'relative',
  boxShadow: `0 2px 10px $blackA7`,
  WebkitTapHighlightColor: 'rgba(0, 0, 0, 0)',
  overflow: 'hidden',
  width: 'auto',
  color: 'white',
  fontFamily: '$untitled',
  '&:focus': {
    boxShadow: `0 0 0 2px $$bgSwitchFocus`,
    transition: 'box-shadow 90ms',
    willChange: 'box-shadow',
  },
  '&[data-state="checked"]': {
    backgroundColor: '$$bgSwitch',
    '&[data-disabled]': { backgroundColor: '$$bgSwitchDisabled' },
  },
  '&[data-disabled]': { backgroundColor: '$grayA6' },
  variants: {
    size: {
      sm: {
        minWidth: 28,
        height: 16,
        fontSize: '.5rem',
      },
      md: {
        minWidth: 44,
        height: 22,
      },
    },
  },
});

const SwitchThumb = styled(RadixSwitch.Thumb, {
  display: 'flex',
  alignItems: 'center',
  justifyContent: 'center',
  position: 'absolute',
  backgroundColor: 'white',
  borderRadius: '9999px',
  boxShadow: `0 2px 2px $blackA9`,
  top: '2px',
  insetInlineStart: '2px',
  transition: 'inset-inline-start 100ms',
  '&[data-state="checked"]': {
    '& div': {
      borderTop: '1px solid $$bgSwitchDisabled',
    },
  },
  '& div': {
    borderTop: '1px solid $grayA7',
  },
  variants: {
    size: {
      sm: {
        width: 12,
        height: 12,
        '&[data-state="checked"]': { insetInlineStart: 'calc(100% - 14px)' },
      },
      md: {
        width: 18,
        height: 18,
        '&[data-state="checked"]': { insetInlineStart: 'calc(100% - 20px)' },
      },
    },
  },
});

const rotate = keyframes({
  '0%': { transform: 'rotate(0deg)' },
  '100%': { transform: 'rotate(360deg)' },
});

const StyledLoader = styled('div', {
  borderRadius: '50%',
  border: '1px solid white',
  animation: `${rotate} 1s linear infinite`,
  variants: {
    size: {
      sm: {
        width: 8,
        height: 8,
      },
      md: {
        width: 12,
        height: 12,
      },
    },
  },
});

export interface SwitchProps extends ComponentProps<typeof SwitchRoot> {
  disabled?: boolean;
  loading?: boolean;
  colorScheme?: string;
  size?: Extract<VariantProps<typeof SwitchRoot>['size'], string>;
}

export const Switch = forwardRef<
  React.ElementRef<typeof SwitchRoot>,
  SwitchProps
>(
  (
    {
      id,
      colorScheme,
      disabled = false,
      loading = false,
      size = 'md',
      ...props
    },
    ref
  ) => {
    return (
      <SwitchRoot
        id={id}
        ref={ref}
        css={{ ...getColorSchemeVariants(colorScheme) }}
        size={size}
        disabled={disabled || loading}
        {...props}
      >
        <SwitchThumb size={size}>
          {loading ? <StyledLoader size={size} /> : null}
        </SwitchThumb>
      </SwitchRoot>
    );
  }
);

export default Switch;
