import { ComponentProps, ElementType, forwardRef, ReactElement } from 'react';
import { styled } from '../stitches.config';
import { PolymorphicComponentPropsWithRef, PolymorphicRef } from '../types';

const StyledText = styled('p', {
  fontFamily: '$untitled',
});

export type TextProps<T extends ElementType> = PolymorphicComponentPropsWithRef<
  T,
  ComponentProps<typeof StyledText>
>;

export type TextComponent = <T extends ElementType = typeof StyledText>(
  props: TextProps<T>
) => ReactElement | null;

export const Text: TextComponent = forwardRef(
  <T extends ElementType = typeof StyledText>(
    { as, children, ...props }: TextProps<T>,
    ref?: PolymorphicRef<T>
  ) => {
    return (
      <StyledText ref={ref} as={as} {...props}>
        {children}
      </StyledText>
    );
  }
);
