import { createContext, useContext } from 'react';
import { FormDisabledContextType } from './type';

export const FormDisabledContext = createContext<FormDisabledContextType>({
  disabled: false,
});

export const useFormDisabledContext = () => {
  const { disabled } = useContext(FormDisabledContext);

  return disabled;
};
