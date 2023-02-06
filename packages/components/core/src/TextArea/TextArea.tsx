import { ComponentPropsWithoutRef, ElementType } from 'react';
import { Space } from '../Space';
import { styled } from '../stitches.config';
export type TextAreaProps = ComponentPropsWithoutRef<ElementType>;

const StyledTextArea = styled(Space, {
  textarea: {
    height: '$6',
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
  },
  defaultVariants: {
    size: 'md',
  },
});
export const TextArea = ({
  disabled,
  defaultValue,
  placeholder,
  value,
  onChange,
  ...props
}: TextAreaProps) => {
  return (
    <StyledTextArea {...props}>
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
