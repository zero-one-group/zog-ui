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
      },
      md: {
        height: '$6',
      },
      lg: {
        height: '$7',
      },
      fullWidth: {
        width: '100%',
      },
    },
  },
  defaultVariants: {
    size: 'fullWidth',
  },
});

export const InputPassword = (props: InputPasswordProps) => {
  const [type, setType] = useState('password');
  return (
    <StyledInputPassword {...props}>
      <Input type={type} {...props} size="fullWidth" />
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
