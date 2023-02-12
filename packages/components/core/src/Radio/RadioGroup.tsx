import { Space } from '../Space';
import { styled } from '../stitches.config';
import { RadioGroupProps } from './RadioButtonGroup';

const StyledRadioGroup = styled(Space, {
  variants: {
    orientation: {
      horizontal: {
        flexDirection: 'row',
      },
      vertical: {
        flexDirection: 'column',
      },
    },
  },
  defaultVariants: {
    orientation: 'horizontal',
  },
});

export const RadioGroup = ({ children, ...props }: RadioGroupProps) => {
  return <StyledRadioGroup {...props}>{children}</StyledRadioGroup>;
};

export default RadioGroup;
