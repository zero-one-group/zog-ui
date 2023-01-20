import type Stitches from '@stitches/react';
import { ComponentProps, ElementType, forwardRef, ReactElement } from 'react';
import { styled } from '../stitches.config';
import { PolymorphicComponentPropsWithRef, PolymorphicRef } from '../types';

const StyledLink = styled('a', {
  boxSizing: 'border-box',
  fontFamily: '$untitled',
  display: 'inline-flex',
  alignItems: 'center',
  gap: '4px',
  color: '$gray8',
  cursor: 'pointer',
});

export type LinkProps<T extends ElementType> = PolymorphicComponentPropsWithRef<
  T,
  ComponentProps<typeof StyledLink>
> & {
  active?: boolean;
  leftIcon?: boolean;
};

export type LinkComponent = <T extends ElementType = typeof StyledLink>(
  props: LinkProps<T>
) => ReactElement | null;

export const Link: LinkComponent = forwardRef(
  <T extends ElementType = typeof StyledLink>(
    { children, active, leftIcon, ...props }: LinkProps<T>,
    ref?: PolymorphicRef<T>
  ) => {
    const styles: Stitches.CSS = {
      fd: leftIcon ? 'row-reverse' : 'row',
      color: active ? '$gray12' : '$gray8',
    };
    return (
      <StyledLink ref={ref} css={styles} {...props}>
        <span>{children}</span>
        {props.icon}
      </StyledLink>
    );
  }
);
