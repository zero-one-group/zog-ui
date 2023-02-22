export type FormLayoutType = 'vertical' | 'horizontal';

export type FormDisabledContextType = {
  disabled?: boolean;
};

export type FormContextType = {
  layout?: FormLayoutType;
  labelCol?: number;
  wrapperCol?: number;
  size?: 'small' | 'medium' | 'large';
};

export type FormItemContextType = {
  isInvalid?: boolean;
  isWarning?: boolean;
  required?: boolean;
} & Pick<FormContextType, 'size'>;
