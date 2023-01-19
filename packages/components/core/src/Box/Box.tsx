import { ComponentProps, ElementType, forwardRef, ReactElement } from 'react';
import { styled } from '../stitches.config';
import { PolymorphicComponentPropsWithRef, PolymorphicRef } from '../types';

const StyledBox = styled('div', {
  boxSizing: 'border-box',
  fontFamily: '$untitled',
});

export type BoxProps<T extends ElementType> = PolymorphicComponentPropsWithRef<
  T,
  ComponentProps<typeof StyledBox>
>;

export type BoxComponent = <T extends ElementType = typeof StyledBox>(
  props: BoxProps<T>
) => ReactElement | null;

export const Box: BoxComponent = forwardRef(
  <T extends ElementType = typeof StyledBox>(
    { children, ...props }: BoxProps<T>,
    ref?: PolymorphicRef<T>
  ) => {
    return (
      <StyledBox ref={ref} {...props}>
        {children}
      </StyledBox>
    );
  }
);
