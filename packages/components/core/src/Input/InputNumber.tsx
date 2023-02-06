import { styled } from '@stitches/react';
import { ComponentPropsWithoutRef, ElementType } from 'react';
import { Button } from '../Button';
import { Space } from '../Space';
import { Input } from './Input';

export type InputNumberProps = ComponentPropsWithoutRef<ElementType>;

const StyledWrapInputNumber = styled(Space, {
  variants: {
    leftIcon: {
      true: {
        'div:first-child': {
          borderLeft: 'none',
          borderRadius: '0px',
        },
      },
    },
  },
});

const StyledInputNumber = styled(Space, {
  input: {
    border: 'none',
    background: 'transparent',
    width: '100%',
    padding: '0 !important',
  },
  'input[type="number"]': {
    WebkitAppearance: 'textfield',
    MozAppearance: 'textfield',
    appearance: 'textfield',
  },
  'input[type=number]::-webkit-inner-spin-button,\ninput[type=number]::-webkit-outer-spin-button':
    {
      WebkitAppearance: 'none',
    },
  padding: '4px 12px',
  'input:focus': {
    outline: 'none',
    div: {
      backgroundColor: 'blue',
    },
  },
  width: 'fit-content',
  border: '1px solid $gray9',
  borderRadius: '2px',
  alignItems: 'center',
  justifyContent: 'space-between',
  '&:focus-within': {
    borderColor: '$blue9',
  },

  variants: {
    size: {
      sm: {
        height: '$5',
        padding: '1px 8px',
        '+div': {
          height: '$5',
        },
      },
      md: {
        height: '$6',
        padding: '5px 12px',
      },
      lg: {
        height: '$7',
        padding: '8px 12px',
      },
      fullWidth: {
        padding: '8px 12px',
        width: '100%',
      },
    },
    leftIcon: {
      true: {
        borderLeft: 'none',
        borderRadius: '0px',
      },
    },
    inrementDecrement: {
      true: {
        borderTopRightRadius: '0px',
        borderBottomRightRadius: '0px',
        borderRight: 'none',
      },
    },
    disabled: {
      true: {
        backgroundColor: '#f8f8f8',
      },
    },
  },
  defaultVariants: {
    size: 'fullWidth',
  },
});

export const InputNumber = ({
  onChange,
  increment,
  decrement,
  placeHolder,
  id,
  value,
  size,
  disabled,
  leftIcon,
  rightIcon,
  incrementIcon,
  decrementIcon,
  max,
  min,
  enableNegativeValue = false,
  ...props
}: InputNumberProps) => {
  if (value === 0 && enableNegativeValue === false && value < min + 1) {
    increment = undefined;
  }
  if (value > max - 1) {
    decrement = undefined;
  }

  return (
    <StyledWrapInputNumber leftIcon={Boolean(leftIcon)}>
      {leftIcon ? (
        <Button
          disabled={disabled}
          onClick={decrement}
          intent="secondary"
          variant="square"
        >
          {leftIcon}
        </Button>
      ) : null}
      <StyledInputNumber
        size={size}
        disabled={disabled}
        leftIcon={Boolean(leftIcon)}
        inrementDecrement={Boolean(incrementIcon) && Boolean(decrementIcon)}
        {...props}
      >
        <Input
          onChange={onChange}
          placeHolder={placeHolder}
          id={id}
          defaultValue={0}
          value={value}
          size={size}
          disabled={disabled}
          max={max}
          min={min}
          type="number"
        />
      </StyledInputNumber>
      {incrementIcon && decrementIcon ? (
        <Space direction="column">
          <Button
            disabled={disabled}
            css={{
              height: '50%',
              borderBottom: '0px',
              borderTopRightRadius: rightIcon ? '0' : '2px',
              borderRight: rightIcon ? 'none' : '',
            }}
            onClick={decrement}
            intent="secondary"
            variant="square"
          >
            {incrementIcon}
          </Button>
          <Button
            disabled={disabled}
            css={{
              height: '50%',
              borderBottomRightRadius: rightIcon ? '' : '2px',
              borderRight: rightIcon ? 'none' : '',
            }}
            onClick={increment}
            intent="secondary"
            variant="square"
          >
            {decrementIcon}
          </Button>
        </Space>
      ) : null}
      {rightIcon ? (
        <Button
          disabled={disabled}
          css={{
            borderTopRightRadius: '2px',
            borderBottomRightRadius: '2px',
          }}
          onClick={decrement}
          intent="secondary"
          variant="square"
        >
          {rightIcon}
        </Button>
      ) : null}
    </StyledWrapInputNumber>
  );
};
