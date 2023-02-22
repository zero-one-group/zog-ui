import { Slot } from '@radix-ui/react-slot';
import React, {
  ComponentProps,
  createContext,
  ReactNode,
  useContext,
} from 'react';
import { styled } from '../stitches.config';
import { FormDisabledContext } from './FormDisabledContext';
import { FormContextType } from './type';

export const FormContext = createContext<FormContextType>({});

export const useFormContext = () => useContext(FormContext);

const StyledForm = styled('form', {
  display: 'block',
  boxSizing: 'border-box',
  fontFamily: '$untitled',
});

type BaseComponentFormType = ComponentProps<typeof StyledForm>;

export type FormProps = FormContextType & {
  children?: ReactNode;
  /**
   * Only has effect on horizontal mode layout
   */
  labelCol?: number;
  /**
   * Only has effect on horizontal mode layout
   */
  wrapperCol?: number;
  disabled?: boolean;
  // Need to declare all dor documentation reason
  /**
   * This function already e.preventDefault()
   */
  onSubmit?: BaseComponentFormType['onSubmit'];
  css?: BaseComponentFormType['css'];
  style?: BaseComponentFormType['style'];
  className?: BaseComponentFormType['className'];
  asChild?: boolean;
};

export const Form = ({
  children,
  css,
  style,
  className,
  onSubmit: propOnSubmit,
  asChild,
  ...contextProps
}: FormProps) => {
  const onSubmit: React.FormEventHandler<HTMLFormElement> = (e) => {
    e.preventDefault();
    if (propOnSubmit) {
      propOnSubmit(e);
    }
  };

  const Comp = asChild ? Slot : StyledForm;

  return (
    <Comp css={css} style={style} className={className} onSubmit={onSubmit}>
      <FormContext.Provider value={contextProps}>
        <FormDisabledContext.Provider
          value={{ disabled: contextProps.disabled }}
        >
          {children}
        </FormDisabledContext.Provider>
      </FormContext.Provider>
    </Comp>
  );
};
