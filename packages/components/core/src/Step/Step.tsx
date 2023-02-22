import { ComponentPropsWithoutRef, ElementType, ReactNode } from 'react';
import { Space } from '../Space';
import { styled } from '../stitches.config';

const getColorSchemeVariants = (colorScheme?: string) => {
  return {
    $$bgStep: colorScheme ? `$colors-${colorScheme}9` : '$colors-primary9',
  };
};

export type StepProps = ComponentPropsWithoutRef<ElementType> & {
  orientation: 'horizontal' | 'vertical';
  colorScheme?: string;
};

export type StepItemProps = ComponentPropsWithoutRef<ElementType> & {
  orientation: 'vertical' | 'horizontal';
  label?: string;
  description?: string;
  state: 'stepProgress' | 'stepCompleted' | 'stepWaiting' | 'stepError';
  step: number;
  icon?: ReactNode;
  size?: 'small' | 'medium' | 'large';
};

export const StyledStep = styled(Space, {
  'div:last-child': {
    'hr:last-child': {
      borderLeft: '0px !important',
      border: '0px !important',
    },
    'div:last-child hr': {
      borderBottom: '0px !important',
    },
  },
});

export const Step = ({ colorScheme, ...props }: StepProps) => {
  return (
    <StyledStep
      css={{
        ...getColorSchemeVariants(colorScheme),
      }}
      {...props}
    >
      {props.children}
    </StyledStep>
  );
};
