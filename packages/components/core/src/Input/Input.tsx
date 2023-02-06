import React, { ComponentPropsWithoutRef, ElementType } from 'react';
import { Space } from '../Space';
import { styled } from '../stitches.config';

export type InputProps = ComponentPropsWithoutRef<ElementType>;

const StyledInput = styled(Space, {
  'input:focus': {
    borderColor: '$blue9',
  },
  width: '100%',
  'input:disabled': {
    color: '$gray9',
  },
  variants: {
    size: {
      sm: {
        input: {
          padding: '1px 8px',
        },
      },
      md: {
        input: {
          padding: '5px 12px',
        },
      },
      lg: {
        input: {
          padding: '8px 12px',
        },
      },
      fullWidth: {
        input: {
          width: '100%',
          padding: '8px 12px',
        },
      },
    },
  },
  defaultVariants: {
    size: 'fullWidth',
  },
});

export const Input = React.forwardRef(
  ({
    disabled,
    defaultValue,
    placeHolder,
    type,
    value,
    id,
    maxLength,
    minLength,
    max,
    min,
    name,
    pattern,
    onChange,
    ref,
    ...props
  }: InputProps) => {
    return (
      <StyledInput {...props}>
        <input
          disabled={disabled}
          id={id}
          name={name}
          pattern={pattern}
          defaultValue={defaultValue}
          placeholder={placeHolder}
          type={type}
          value={value}
          ref={ref}
          onChange={onChange}
          maxLength={maxLength}
          minLength={minLength}
          max={max}
          min={min}
        />
      </StyledInput>
    );
  }
);
