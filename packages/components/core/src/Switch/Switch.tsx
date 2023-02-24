import * as RadixSwitch from '@radix-ui/react-switch';
import { keyframes, VariantProps } from '@stitches/react';
import React, { ComponentProps, forwardRef, useMemo, useState } from 'react';
import { useFormDisabledContext, useFormItemContext } from '../Form';
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
  color: '$gray1',
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
        fontSize: '.8rem',
      },
    },
  },
});

const SwitchThumb = styled(RadixSwitch.Thumb, {
  display: 'flex',
  alignItems: 'center',
  justifyContent: 'center',
  position: 'absolute',
  backgroundColor: '$gray1',
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
  border: '1px solid $gray1',
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

const StyledSwitchInner = styled('span', {
  display: 'block',
  height: '100%',
  overflow: 'hidden',
  variants: {
    checked: {
      true: {
        paddingLeft: 4,
        paddingRight: 18,
      },
      false: {
        paddingLeft: 18,
        paddingRight: 4,
      },
    },
    size: {
      sm: {
        lineHeight: '15px',
      },
      md: {
        lineHeight: '21px',
      },
    },
  },
  compoundVariants: [
    {
      checked: true,
      size: 'md',
      css: {
        paddingLeft: 6,
        paddingRight: 24,
      },
    },
    {
      checked: false,
      size: 'md',
      css: {
        paddingLeft: 24,
        paddingRight: 6,
      },
    },
  ],
  defaultVariants: {
    checked: false,
  },
});

const StyledSwitchInnerTextChecked = styled('div', {
  display: 'block',
  height: '100%',
  transition: 'margin-inline 100ms linear',
  variants: {
    checked: {
      true: {
        marginInlineStart: 0,
        marginInlineEnd: 0,
      },
      false: {
        marginInlineStart: 'calc(-100% + 24px - 48px)',
        marginInlineEnd: 'calc(100% - 24px + 48px)',
      },
    },
  },
  defaultVariants: {
    checked: false,
  },
});

const StyledSwitchInnerTextUnchecked = styled('div', {
  display: 'block',
  height: '100%',
  transition: 'margin-inline 100ms linear',
  variants: {
    checked: {
      true: {
        marginInlineStart: 'calc(100% - 24px + 48px)',
        marginInlineEnd: 'calc(-100% + 24px - 48px)',
      },
      false: {
        marginInlineStart: 0,
        marginInlineEnd: 0,
      },
    },
    size: {
      sm: {
        mt: '-16px',
      },
      md: {
        mt: '-22px',
      },
    },
  },
  defaultVariants: {
    checked: false,
  },
});

export type StyledSwitchProps = ComponentProps<typeof SwitchRoot>;

export type SwitchProps = {
  disabled?: boolean;
  loading?: boolean;
  colorScheme?: string;
  size?: Extract<VariantProps<typeof SwitchRoot>['size'], string>;
  checkedChildren?: React.ReactNode;
  uncheckedChildren?: React.ReactNode;
  value?: boolean;
} & StyledSwitchProps;

export const Switch = forwardRef<
  React.ElementRef<typeof SwitchRoot>,
  SwitchProps
>(
  (
    {
      id,
      colorScheme,
      defaultChecked,
      onClick,
      value,
      disabled: propDisabled,
      loading = false,
      size: propSize,
      checkedChildren,
      uncheckedChildren,
      ...props
    },
    ref
  ) => {
    const isControlled = value !== undefined;
    const initialCheckValue = isControlled
      ? (value as boolean)
      : defaultChecked || false;

    const [isChecked, setIsChecked] = useState<boolean>(initialCheckValue);

    const { size: formItemSize } = useFormItemContext();

    const size = useMemo(() => {
      if (propSize) return propSize;
      if (formItemSize) {
        return formItemSize === 'lg' ? 'md' : formItemSize;
      }
      return 'md';
    }, [propSize, formItemSize]);

    const disabledForm = useFormDisabledContext();
    const disabled = propDisabled || disabledForm;

    const handleClick = (event: React.MouseEvent<HTMLButtonElement>) => {
      if (isControlled) {
        typeof onClick === 'function' && onClick(event);
      } else {
        setIsChecked((check) => !check);
      }
    };

    return (
      <SwitchRoot
        id={id}
        ref={ref}
        css={{ ...getColorSchemeVariants(colorScheme) }}
        size={size}
        disabled={disabled || loading}
        checked={isControlled ? Boolean(value) : isChecked}
        onClick={(e) => handleClick(e)}
        {...props}
      >
        <SwitchThumb size={size}>
          {loading ? <StyledLoader size={size} /> : null}
        </SwitchThumb>
        {checkedChildren && uncheckedChildren ? (
          <StyledSwitchInner checked={isChecked} size={size}>
            <StyledSwitchInnerTextChecked checked={isChecked}>
              {checkedChildren}
            </StyledSwitchInnerTextChecked>
            <StyledSwitchInnerTextUnchecked checked={isChecked} size={size}>
              {uncheckedChildren}
            </StyledSwitchInnerTextUnchecked>
          </StyledSwitchInner>
        ) : null}
      </SwitchRoot>
    );
  }
);

export default Switch;
