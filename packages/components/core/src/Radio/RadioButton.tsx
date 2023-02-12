import { Space } from '../Space';
import { styled } from '../stitches.config';
import { RadioProps } from './Radio';

const StyledRadioButton = styled(Space, {
  width: 'fit-content',
  'input[type=radio]': {
    display: 'none',
  },
  'input[type=radio]:disabled + label': {
    backgroundColor: '$gray3',
    pointerEvents: 'none',
    color: '$gray9',
  },
  'input[type=radio]:checked + label': {
    borderColor: '$blue9',
    color: '$blue9',
  },
  'input[type=radio]:hover + label': {
    color: '$blue9',
  },
  button: {
    borderColor: '$gray9',
  },
});
const StyledLabel = styled('label', {
  border: '1px solid $gray9',
  padding: '4px 15px',
  fontSize: '14px',
  borderRadius: '2px',
});
export const RadioButton = ({
  id,
  label,
  defaultChecked,
  disabled,
  name,
  ...props
}: RadioProps) => {
  return (
    <StyledRadioButton {...props}>
      <input
        type="radio"
        id={id}
        disabled={disabled}
        name={name}
        defaultChecked={defaultChecked}
      />
      <StyledLabel htmlFor={id}>{label}</StyledLabel>
    </StyledRadioButton>
  );
};

export default RadioButton;
