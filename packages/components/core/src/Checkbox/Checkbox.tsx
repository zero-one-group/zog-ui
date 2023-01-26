import { ReactElement } from 'react';
import * as CheckboxPrimitive from '@radix-ui/react-checkbox';
import { styled } from '../stitches.config';

const StyledCheckboxLabel = styled('label', {
  display: 'inline-flex',
  alignItems: 'center',
  columnGap: '.5em',
  fontFamily: '$untitled',
});

const StyledCheckboxRoot = styled(CheckboxPrimitive.Root, {
  padding: 0,
  display: 'inline-flex',
  alignItems: 'center',
  justifyContent: 'center',
  backgroundColor: 'white',
  outline: 'none',
  border: '1px solid #D9D9D9',
  borderRadius: '.2em',
  cursor: 'pointer',
  '&:disabled': {
    cursor: 'not-allowed',
    backgroundColor: '#F4F6F7 !important',
    border: '1px solid #D9D9D9  !important',
  },
});
const StyledCheckboxIndicator = styled(CheckboxPrimitive.Indicator, {
  color: 'white',
  '&[data-disabled=""]': {
    color: '$blackA8 !important',
  },
});

type CheckboxOwnProps = {
  onCheckedChange?: (checked: CheckboxPrimitive.CheckedState) => void;
  checked?: CheckboxPrimitive.CheckedState;
  defaultChecked?: CheckboxPrimitive.CheckedState;
  disabled?: boolean;
  colorScheme?: string;
  boxSize?: string | number;
};

export type CheckboxProps = CheckboxOwnProps & CheckboxPrimitive.CheckboxProps;

export type CheckboxComponent = (props: CheckboxProps) => ReactElement;

export const Checkbox: CheckboxComponent = ({ boxSize = '$3', ...props }) => {
  const colorScheme = props.colorScheme || '#1890FF';

  return (
    <StyledCheckboxLabel
      css={{
        fontSize: boxSize,
        cursor: props.disabled ? 'not-allowed' : 'pointer',
        color: props.disabled ? '$blackA8' : undefined,
      }}
    >
      <StyledCheckboxRoot
        css={{
          fontSize: boxSize,
          width: '1em',
          height: '1em',
          '&:hover': {
            border: `1px solid ${colorScheme}`,
          },
          '&[aria-checked="true"]': {
            border: `1px solid ${colorScheme}`,
            backgroundColor: colorScheme,
          },
          '&[aria-checked="indeterminated"]:not(:disabled)::after': {
            content: '',
            width: '.5em',
            height: '.5em',
            backgroundColor: colorScheme,
          },
        }}
        {...props}
      >
        <StyledCheckboxIndicator
          css={{
            height: '1em',
            fontSize: '.7em',
          }}
        >
          <svg
            aria-hidden
            style={{ display: 'inline-block' }}
            width="1em"
            height="1em"
            viewBox="0 0 12 8"
            fill="currentColor"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              d="M5.10533 7.60407L5.08771 7.62169L0.687866 3.22185L2.12054 1.78917L5.10539 4.77402L9.87941 0L11.3121 1.43268L5.12301 7.62175L5.10533 7.60407Z"
              fill="currentColor"
            />
          </svg>
        </StyledCheckboxIndicator>
      </StyledCheckboxRoot>
      {props.children ? <span>{props.children}</span> : null}
    </StyledCheckboxLabel>
  );
};
