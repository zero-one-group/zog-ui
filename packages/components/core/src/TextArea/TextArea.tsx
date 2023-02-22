import { ComponentPropsWithoutRef, ElementType } from 'react';
import { useFormDisabledContext, useFormItemContext } from '../Form';
import { Space } from '../Space';
import { styled } from '../stitches.config';
export type TextAreaProps = ComponentPropsWithoutRef<ElementType> &
  Pick<ComponentPropsWithoutRef<typeof StyledTextArea>, 'size'>;

const StyledTextArea = styled(Space, {
  textarea: {
    height: '$6',
    border: '1px solid $inputDefaultBorder',
    transition: 'border .1s ease-in-out',
  },
  'textarea:focus': {
    borderColor: '$blue9',
  },
  'textarea:disabled': {
    color: '$gray9',
  },
  variants: {
    size: {
      sm: {
        textarea: {
          padding: '1px 8px',
        },
      },
      md: {
        textarea: {
          padding: '5px 12px',
        },
      },
      lg: {
        textarea: {
          padding: '8px 12px',
        },
      },
      fullWidth: {
        textarea: {
          height: '$5',
          width: '100%',
          padding: '8px 12px',
        },
      },
    },
    isInvalid: {
      true: {
        textarea: {
          borderColor: '$inputError !important',
        },
      },
    },
    isWarning: {
      true: {
        textarea: {
          borderColor: '$inputWarning !important',
        },
      },
    },
  },
  defaultVariants: {
    size: 'md',
  },
});
export const TextArea = ({
  disabled: propDisabled,
  defaultValue,
  placeholder,
  value,
  onChange,
  size: propSize,
  ...props
}: TextAreaProps) => {
  const formItem = useFormItemContext();
  const size = propSize ?? formItem.size;

  const disabledForm = useFormDisabledContext();
  const disabled = propDisabled || disabledForm;

  return (
    <StyledTextArea
      {...props}
      size={size}
      isInvalid={formItem.isInvalid}
      isWarning={formItem.isWarning && !formItem.isInvalid}
    >
      <textarea
        onChange={onChange}
        value={value}
        disabled={disabled}
        defaultValue={defaultValue}
        placeholder={placeholder}
      />
    </StyledTextArea>
  );
};
