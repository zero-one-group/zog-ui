import { ComponentPropsWithoutRef, ElementType, ReactNode } from 'react';
import { Space } from '../Space';
import { styled } from '../stitches.config';

export type StepProps = ComponentPropsWithoutRef<ElementType> & {
  orientation: 'horizontal' | 'vertical';
};
export type StepItemProps = ComponentPropsWithoutRef<ElementType> & {
  orientation: 'vertical' | 'horizontal';
  label?: string;
  description?: string;
  state: 'stepProgress' | 'stepCompleted' | 'stepWaiting' | 'stepError';
  step: number;
  icon?: ReactNode;
  size?: 'sm' | 'md' | 'lg';
};
export const Step = styled(Space, {
  'div:last-child': {
    'hr:last-child': {
      borderLeft: '0px !important',
    },
    'div:last-child hr': {
      borderBottom: '0px !important',
    },
  },
});
