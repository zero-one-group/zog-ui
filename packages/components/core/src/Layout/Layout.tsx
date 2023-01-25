import { ComponentProps, ElementType, forwardRef } from 'react';
import { Space } from '../Space';
import { styled } from '../stitches.config';
import type {
  PolymorphicComponentPropsWithRef,
  PolymorphicRef
} from '../types';

const StyledLayout = styled(Space, {
  flexDirection: 'column',
  variants: {
    hasSider: {
      true: {
        flexDirection: 'row',
      },
    },
  },
});

export type LayoutProps<T extends ElementType> =
  PolymorphicComponentPropsWithRef<T, ComponentProps<typeof StyledLayout>>;

export const Layout = forwardRef(
  <T extends ElementType = typeof StyledLayout>(
    { children, hasSider, ...props }: LayoutProps<T>,
    ref?: PolymorphicRef<T>
  ) => {
    return (
      <StyledLayout ref={ref} hasSider={hasSider} {...props}>
        {children}
      </StyledLayout>
    );
  }
);

export default Layout;
