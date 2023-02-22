import { createContext, useContext } from 'react';
import { FormItemContextType } from '../type';

export const FormItemContext = createContext<FormItemContextType>({});

export const useFormItemContext = () => {
  return useContext(FormItemContext);
};
