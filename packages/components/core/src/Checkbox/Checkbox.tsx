import * as CheckboxPrimitive from '@radix-ui/react-checkbox';
import { ComponentProps, ReactElement } from 'react';
import { useFormDisabledContext } from '../Form';
import { styled } from '../stitches.config';

const getColorSchemeVariants = (colorScheme?: string) => {
  return {
    $$bgCheck: colorScheme ? `$colors-${colorScheme}9` : '$colors-primary9',
  };
};

const StyledCheckboxLabel = styled('label', {
  display: 'inline-flex',
  alignItems: 'center',
  columnGap: '.5em',
  color: '$gray12',
  fontFamily: '$untitled',
  cursor: 'pointer',
  variants: {
    disabled: {
      true: {
        cursor: 'not-allowed',
        color: '$blackA8',
      },
    },
  },
});

const StyledCheckboxRoot = styled(CheckboxPrimitive.Root, {
  padding: 0,
  display: 'inline-flex',
  alignItems: 'center',
  justifyContent: 'center',
  backgroundColor: 'transparent',
  outline: 'none',
  border: '1px solid $inputDefaultBorder',
  borderRadius: '.1em',
  cursor: 'pointer',
  width: '1em',
  height: '1em',
  '&:disabled': {
    cursor: 'not-allowed',
    border: '1px solid $inputDefaultBorder  !important',
    backgroundColor: '$gray3 !important',
  },
  '&:hover': {
    border: '1px solid $$bgCheck',
  },
  '&[aria-checked="true"]': {
    border: '1px solid $$bgCheck',
    backgroundColor: '$$bgCheck',
  },
});
const StyledCheckboxIndicator = styled(CheckboxPrimitive.Indicator, {
  color: '$gray12',
  height: '1em',
  fontSize: '.7em',
  '&[data-disabled=""]': {
    color: '$blackA8 !important',
  },
  '&[data-state="indeterminate"]': {
    height: '.7em',
    width: '.7em',
    backgroundColor: '$$bgCheck',
    color: 'transparent !important',
  },
  '&[data-state="indeterminate"][data-disabled]': {
    backgroundColor: '$blackA8',
  },
});

type CheckboxOwnProps = {
  /** Color of the checkbox, includes background checked and border when hovered */
  colorScheme?: string;
  /** The size of fontSize and checkbox size */
  boxSize?: string | number;
};

type CheckboxLabelPrimitiveProps = ComponentProps<typeof StyledCheckboxLabel>;

type CheckboxLabelProps = {
  /** Customize style of label */
  labelCss?: CheckboxLabelPrimitiveProps['css'];
  /** Custom label className */
  labelClassname?: CheckboxLabelPrimitiveProps['className'];
};

export type CheckboxProps = CheckboxOwnProps &
  ComponentProps<typeof StyledCheckboxRoot> &
  CheckboxLabelProps;

export type CheckboxComponent = (props: CheckboxProps) => ReactElement;

export const Checkbox: CheckboxComponent = ({
  boxSize = '$2',
  colorScheme,
  css,
  labelCss,
  labelClassname,
  disabled: propDisabled,
  ...props
}) => {
  const disabledForm = useFormDisabledContext();
  const disabled = propDisabled || disabledForm;

  return (
    <StyledCheckboxLabel
      css={{
        fontSize: boxSize,
        ...labelCss,
      }}
      className={labelClassname}
      disabled={disabled}
    >
      <StyledCheckboxRoot
        css={{
          fontSize: '1.15em',
          ...getColorSchemeVariants(colorScheme),
          ...css,
        }}
        disabled={disabled}
        {...props}
      >
        <StyledCheckboxIndicator>
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
