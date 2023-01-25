import { ComponentProps, ElementType, forwardRef } from 'react';
import { styled } from '../stitches.config';
import type {
  PolymorphicComponentPropsWithRef,
  PolymorphicRef,
} from '../types';

const StyledLayout = styled('section', {
  display: 'flex',
  boxSizing: 'border-box',
  flexDirection: 'column',
  flex: 'auto',
  fontFamily: '$untitled',
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
    { as, children, hasSider, ...props }: LayoutProps<T>,
    ref?: PolymorphicRef<T>
  ) => {
    return (
      <StyledLayout as={as} ref={ref} hasSider={hasSider} {...props}>
        {children}
      </StyledLayout>
    );
  }
);

export default Layout;
