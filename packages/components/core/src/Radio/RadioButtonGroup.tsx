import { ReactNode } from 'react';
import { Space } from '../Space';
import { styled } from '../stitches.config';
import type * as Stitches from '@stitches/react';

export type RadioGroupProps = {
  children: ReactNode;
  css?: Stitches.CSS;
};
const StyledRadioButtonGroup = styled(Space, {
  label: {
    borderRadius: '0px',
  },
  'div:first-child label': {
    borderTopLeftRadius: '2px',
    borderBottomLeftRadius: '2px',
  },
  'div:last-child label': {
    borderTopRightRadius: '2px',
    borderBottomRightRadius: '2px',
  },
  div: {
    marginLeft: '-1px',
  },
  'input[type=radio]:checked + label': {
    zIndex: '99',
  },
});

export const RadioButtonGroup = ({ children, ...props }: RadioGroupProps) => {
  return <StyledRadioButtonGroup {...props}>{children}</StyledRadioButtonGroup>;
};

export default RadioButtonGroup;
