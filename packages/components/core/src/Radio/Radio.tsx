import { Space } from '../Space';
import { styled } from '../stitches.config';
import type * as Stitches from '@stitches/react';
import { useFormDisabledContext } from '../Form';

export interface RadioProps {
  id: string;
  label: string;
  defaultChecked?: boolean;
  disabled?: boolean;
  css?: Stitches.CSS;
  name: string;
}
const StlyedRadio = styled(Space, {
  label: {
    color: '$gray12',
  },
  alignItems: 'center',
  fontSize: '$2',
  'input[type=radio]': {
    appearance: 'none',
    marginTop: 0,
  },
  'input[type=radio]::before': {
    content: '""',
    border: '1px solid $gray9',
    borderRadius: '100%',
    display: 'block',
    width: '14px',
    height: '14px',
    cursor: 'pointer',
    appearance: 'auto',
    boxSizing: 'border-box',
  },

  'input[type=radio]:hover::before': {
    content: '""',
    border: '1px solid $blue9',
    borderRadius: '100%',
    display: 'block',
    cursor: 'pointer',
    appearance: 'auto',
    boxSizing: 'border-box',
  },
  'input[type=radio]:active::before': {
    content: '""',
    border: '1px solid $blue9',
    boxShadow: '0px 0px 1px 1px $colors$blue5',
  },
  'input[type=radio]:checked::before': {
    border: '4px solid $gray1',
    cursor: 'pointer',
    boxSizing: 'border-box',
    outlineStyle: 'solid',
    outlineOffset: '-1px',
    outlineWidth: '2px',
    outlineColor: '$blue9',
    boxShadow: 'inset 0em 0em 0px 20px $colors$blue9',
  },
  position: 'relative',
  'input[type=radio]:checked:active::after': {
    content: '""',
    position: 'absolute',
    top: '1.3px',
    boxShadow: '0px 0px 1px 1px $colors$blue5',
    borderRadius: '100%',
    display: 'block',
    width: '14px',
    height: '14px',
    cursor: 'pointer',
    appearance: 'auto',
    boxSizing: 'border-box',
  },
  'input[type=radio]:disabled:hover::before': {
    borderColor: '$gray9',
    pointerEvents: 'none',
  },
  'input[type=radio]:disabled:checked::before': {
    pointerEvents: 'none',
    outlineColor: '$colors$gray10',
    boxShadow: 'inset 0em 0em 0px 20px $colors$gray10',
  },
  'input[type=radio]:disabled:checked:hover::before': {
    pointerEvents: 'none',
    borderColor: '$gray1',
    outlineColor: '$colors$gray10',
    boxShadow: 'inset 0em 0em 0px 20px $colors$gray10',
  },
  'input[type=radio]:disabled:checked:active::after': {
    pointerEvents: 'none',
    boxShadow: 'none',
  },
  'input[type=radio]:disabled:active::before': {
    borderColor: '$gray9',
    pointerEvents: 'none',
    boxShadow: 'none',
  },
  'input[type=radio]:disabled + label': {
    pointerEvents: 'none',
    color: '$gray9',
  },
});
export const Radio = ({
  id,
  label,
  defaultChecked,
  disabled: propDisabled,
  name,
  ...props
}: RadioProps) => {
  const disabledForm = useFormDisabledContext();
  const disabled = propDisabled || disabledForm;

  return (
    <StlyedRadio {...props}>
      <input
        type="radio"
        id={id}
        name={name}
        disabled={disabled}
        defaultChecked={defaultChecked}
      />
      <label htmlFor={id}>{label}</label>
    </StlyedRadio>
  );
};

export default Radio;
