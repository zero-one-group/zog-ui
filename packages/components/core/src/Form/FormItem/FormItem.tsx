import clsx from 'clsx';
import { ReactNode } from 'react';
import { styled } from '../../stitches.config';
import { useFormContext } from '../Form';
import {
  FormDisabledContext,
  useFormDisabledContext,
} from '../FormDisabledContext';
import {
  FormContextType,
  FormDisabledContextType,
  FormItemContextType,
} from '../type';
import { FormItemContext } from './FormItemContext';

const StyledItemWrapper = styled('div', {
  boxSizing: 'border-box',
  fontFamily: '$untitled',
  display: 'flex',
  marginBottom: 24,
  variants: {
    layout: {
      vertical: {
        flexDirection: 'column',
        alignItems: 'stretch',
      },
      horizontal: {
        flexDirection: 'row',
        alignItems: 'flex-start',
      },
    },
  },
  defaultVariants: {
    layout: 'horizontal',
  },
});

const StyledLabel = styled('div', {
  fontSize: '14px',
  lineHeight: 1.6,
  display: 'flex',
  alignItems: 'center',
  transition: 'min-height .1s ease-in-out',
  variants: {
    layout: {
      vertical: {
        justifyContent: 'flex-start',
        marginBottom: 6,
        minHeight: 'auto !important',
      },
      horizontal: {
        '&> label::after': {
          content: ':',
          marginInline: '2px 8px',
        },
        textAlign: 'end',
        justifyContent: 'flex-end',
      },
    },
    required: {
      true: {
        '&> label::before': {
          content: '*',
          color: '$inputError',
          marginRight: '2px',
          position: 'relative',
          bottom: -2,
        },
      },
    },
    size: {
      sm: {
        minHeight: 24,
      },
      md: {
        minHeight: 32,
      },
      lg: {
        minHeight: 40,
      },
    },
  },
  defaultVariants: {
    layout: 'horizontal',
    size: 'md',
  },
});
const StyledControl = styled('div', {
  display: 'flex',
  flexDirection: 'column',
  justifyContent: 'center',
  transition: 'min-height .1s ease-in-out',
  variants: {
    size: {
      sm: {
        minHeight: 24,
      },
      md: {
        minHeight: 32,
      },
      lg: {
        minHeight: 40,
      },
    },
  },
  defaultVariants: {
    size: 'md',
  },
});
const StyledControlInput = styled('div', {
  display: 'flex',
  alignItems: 'center',
});

const StyledTextWrapper = styled('div', {
  minHeight: 24,
});

const StyledBaseText = styled('div', {
  fontSize: 14,
  fontFamily: '$untitled',
  lineHeight: '22px',
});

const StyledHelpText = styled(StyledBaseText, {
  color: '$blackA10',
});
const StyledErrorMessage = styled(StyledBaseText, {
  color: '$inputError',
});
const StyledWarningMessage = styled(StyledBaseText, {
  color: '$inputWarning',
});

const StyledMarginOffset = styled('div', {
  marginBottom: -24,
});

const FULL_COL_SIZE = 24;

export type FormItemProps = {
  children?: ReactNode;
  label?: string;
  /**
   * Label col space, from 1-24
   *
   * Only has effect on horizontal mode layout
   */
  labelCol?: number;
  /**
   * Wrapper input col space, from 1-24
   */
  wrapperCol?: number;
  layout?: FormContextType['layout'];
  helpText?: string;
  errorMessage?: string;
  warningMessage?: string;
  className?: string;
} & Partial<FormItemContextType> &
  Partial<FormDisabledContextType>;

export const FormItem = ({
  children,
  label,
  layout: propLayout,
  labelCol: propLabelCol,
  wrapperCol: propWrapperCol,
  size: propSize,
  disabled: propDisabled,
  helpText,
  errorMessage,
  warningMessage,
  isInvalid,
  isWarning,
  className,
  ...contextProp
}: FormItemProps) => {
  // pick the disabled state from Form Component
  const disabledForm = useFormDisabledContext();
  const mergedDisabled = propDisabled || disabledForm;

  const form = useFormContext();

  const layout = propLayout ?? form.layout ?? 'horizontal';
  const labelCol = propLabelCol ?? form.labelCol ?? 5;
  const wrapperCol = propWrapperCol ?? form.wrapperCol ?? 19;
  const size = propSize ?? form.size ?? 'md';

  return (
    <FormItemContext.Provider
      value={{
        size,
        isInvalid: isInvalid || (!!errorMessage && errorMessage?.length > 0),
        isWarning:
          isWarning || (!!warningMessage && warningMessage?.length > 0),
        ...contextProp,
      }}
    >
      {/* Overide the FormDisabledContext value, so the children will use this value */}
      <FormDisabledContext.Provider value={{ disabled: mergedDisabled }}>
        <StyledItemWrapper
          layout={layout}
          className={clsx('form-item', className)}
        >
          <StyledLabel
            layout={layout}
            required={contextProp.required}
            css={
              layout === 'horizontal'
                ? {
                    flex: `0 0 ${(labelCol / FULL_COL_SIZE) * 100}%`,
                    maxWidth: `${(labelCol / FULL_COL_SIZE) * 100}%`,
                  }
                : {}
            }
            size={size}
            className="label"
          >
            {label ? <label>{label}</label> : null}
          </StyledLabel>
          <StyledControl
            css={{
              flex: `0 0 ${(wrapperCol / FULL_COL_SIZE) * 100}%`,
              maxWidth: `${(wrapperCol / FULL_COL_SIZE) * 100}%`,
            }}
            size={size}
            className="control"
          >
            <StyledControlInput className="control-input">
              {children}
            </StyledControlInput>
            {helpText || errorMessage || warningMessage ? (
              <>
                <StyledTextWrapper className="text-wrapper">
                  {helpText && !errorMessage && !warningMessage ? (
                    <StyledHelpText className="helper-text">
                      {helpText}
                    </StyledHelpText>
                  ) : null}
                  {warningMessage && !errorMessage ? (
                    <StyledWarningMessage className="warning-text">
                      {warningMessage}
                    </StyledWarningMessage>
                  ) : null}
                  {errorMessage ? (
                    <StyledErrorMessage className="error-text">
                      {errorMessage}
                    </StyledErrorMessage>
                  ) : null}
                </StyledTextWrapper>
                <StyledMarginOffset className="margin-offset" />
              </>
            ) : null}
          </StyledControl>
        </StyledItemWrapper>
      </FormDisabledContext.Provider>
    </FormItemContext.Provider>
  );
};
