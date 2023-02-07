import * as RadixSwitch from '@radix-ui/react-switch';
import { VariantProps } from '@stitches/react';
import { ComponentProps, forwardRef } from 'react';
import { styled } from '../stitches.config';

const getColorSchemeVariants = (colorScheme?: string) => {
  return {
    $$bgSwitch: colorScheme ? `$colors-${colorScheme}A9` : '$colors-blueA9',
    $$bgSwitchFocus: colorScheme
      ? `$colors-${colorScheme}A7`
      : '$colors-blueA7',
    $$bgSwitchDisabled: colorScheme
      ? `$colors-${colorScheme}A4`
      : '$colors-blueA4',
  };
};

const SwitchRoot = styled(RadixSwitch.Root, {
  all: 'unset',
  backgroundColor: '$grayA10',
  borderRadius: '9999px',
  position: 'relative',
  boxShadow: `0 2px 10px $blackA7`,
  WebkitTapHighlightColor: 'rgba(0, 0, 0, 0)',
  '&:focus': {
    boxShadow: `0 0 0 2px $$bgSwitchFocus`,
    transition: 'box-shadow 90ms',
    willChange: 'box-shadow',
  },
  '&[data-state="checked"]': { backgroundColor: '$$bgSwitch' },
  variants: {
    size: {
      sm: {
        width: 28,
        height: 16,
      },
      md: {
        width: 44,
        height: 22,
      },
    },
    disabledVariant: {
      true: {
        backgroundColor: '$grayA6',
        '&[data-state="checked"]': { backgroundColor: '$$bgSwitchDisabled' },
      },
    },
  },
});

const SwitchThumb = styled(RadixSwitch.Thumb, {
  display: 'block',
  backgroundColor: 'white',
  borderRadius: '9999px',
  boxShadow: `0 2px 2px $blackA9`,
  transition: 'transform 100ms',
  transform: 'translateX(2px)',
  willChange: 'transform',
  variants: {
    size: {
      sm: {
        width: 12,
        height: 12,
        '&[data-state="checked"]': { transform: 'translateX(14px)' },
      },
      md: {
        width: 18,
        height: 18,
        '&[data-state="checked"]': { transform: 'translateX(24px)' },
      },
    },
  },
});

export interface SwitchProps extends ComponentProps<typeof SwitchRoot> {
  disabled?: boolean;
  colorScheme?: string;
  size?: Extract<VariantProps<typeof SwitchRoot>['size'], string>;
}

export const Switch = forwardRef<
  React.ElementRef<typeof SwitchRoot>,
  SwitchProps
>(
  (
    { id, colorScheme, disabled = false, size = 'md', ...props }: SwitchProps,
    ref
  ) => {
    return (
      <SwitchRoot
        id={id}
        ref={ref}
        css={{ ...getColorSchemeVariants(colorScheme) }}
        size={size}
        disabled={disabled}
        disabledVariant={disabled}
        {...props}
      >
        <SwitchThumb size={size} />
      </SwitchRoot>
    );
  }
);

export default Switch;
