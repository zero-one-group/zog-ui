import React, { ComponentPropsWithoutRef, ElementType } from 'react';
import { useFormDisabledContext, useFormItemContext } from '../Form';
import { Space } from '../Space';
import { styled } from '../stitches.config';

export type InputProps = ComponentPropsWithoutRef<ElementType> &
  Pick<ComponentPropsWithoutRef<typeof StyledInput>, 'size'>;

const StyledInput = styled(Space, {
  input: {
    border: '1px solid $inputDefaultBorder',
    transition: 'border .1s ease-in-out',
  },
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
    isInvalid: {
      true: {
        input: {
          borderColor: '$inputError !important',
        },
      },
    },
    isWarning: {
      true: {
        input: {
          borderColor: '$inputWarning !important',
        },
      },
    },
  },
  defaultVariants: {
    size: 'fullWidth',
  },
});

export const Input = React.forwardRef<HTMLInputElement, InputProps>(
  (
    {
      disabled: propDisabled,
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
      size: propSize,
      ...props
    }: InputProps,
    ref
  ) => {
    const formItem = useFormItemContext();
    const size = propSize ?? formItem.size;

    const disabledForm = useFormDisabledContext();
    const disabled = propDisabled || disabledForm;

    return (
      <StyledInput
        {...props}
        size={size}
        isInvalid={formItem.isInvalid}
        isWarning={formItem.isWarning && !formItem.isInvalid}
      >
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
