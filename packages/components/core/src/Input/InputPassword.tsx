import { EyeInvisibleOutlined, EyeOutlined } from '@ant-design/icons';
import { styled } from '@stitches/react';
import { ComponentPropsWithoutRef, ElementType, useState } from 'react';
import { Space } from '../Space';
import { Input } from './Input';

export type InputPasswordProps = ComponentPropsWithoutRef<ElementType>;

const StyledInputPassword = styled(Space, {
  input: {
    border: 'none',
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
        width: '100%',
        padding: '8px 12px',
      },
    },
  },
  defaultVariants: {
    size: 'fullWidth',
  },
});

export const InputPassword = ({
  size,
  onChage,
  placeHolder,
  id,
  value,
  disabled,
  ...props
}: InputPasswordProps) => {
  const [type, setType] = useState('password');
  return (
    <StyledInputPassword size={size} {...props}>
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
