import { EyeInvisibleOutlined, EyeOutlined } from '@ant-design/icons';
import { styled } from '@stitches/react';
import { ComponentPropsWithoutRef, ElementType, useState } from 'react';
import { useFormDisabledContext, useFormItemContext } from '../Form';
import { Space } from '../Space';
import { Input } from './Input';

export type InputPasswordProps = ComponentPropsWithoutRef<ElementType>;

const StyledInputPassword = styled(Space, {
  input: {
    border: 'none !important',
    background: 'transparent',
    padding: '0 !important',
  },
  padding: '4px 12px',
  'input:focus': {
    outline: 'none',
    div: {
      backgroundColor: 'blue',
    },
  },
  width: 'fit-content',
  border: '1px solid $inputDefaultBorder',
  transition: 'border .1s ease-in-out',
  borderRadius: '2px',
  alignItems: 'center',
  justifyContent: 'space-between',
  '&:focus-within': {
    borderColor: '$blue9',
  },
  variants: {
    size: {
      small: {
        height: '$5',
        padding: '1px 8px',
      },
      medium: {
        height: '$6',
        padding: '5px 12px',
      },
      large: {
        height: '$7',
        padding: '8px 12px',
      },
      fullWidth: {
        width: '100%',
        padding: '8px 12px',
      },
    },
    isInvalid: {
      true: {
        border: '1px solid $inputError !important',
      },
    },
    isWarning: {
      true: {
        border: '1px solid $inputWarning !important',
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

export const InputPassword = ({
  size: propSize,
  onChage,
  placeHolder,
  id,
  value,
  disabled: propDisabled,
  ...props
}: InputPasswordProps) => {
  const [type, setType] = useState('password');

  const formItem = useFormItemContext();
  const size = propSize ?? formItem.size;

  const disabledForm = useFormDisabledContext();
  const disabled = propDisabled || disabledForm;

  return (
    <StyledInputPassword
      size={size}
      {...props}
      isInvalid={formItem.isInvalid}
      isWarning={formItem.isWarning && !formItem.isInvalid}
      disabled={disabled}
    >
      <Input
        type={type}
        onChange={onChage}
        placeHolder={placeHolder}
        id={id}
        value={value}
        size={size}
        disabled={disabled}
      />
      {type === 'password' ? (
        <EyeInvisibleOutlined onClick={() => setType('text')} />
      ) : (
        <EyeOutlined
          style={{ color: '#1890FF' }}
          onClick={() => setType('password')}
        />
      )}
    </StyledInputPassword>
  );
};
