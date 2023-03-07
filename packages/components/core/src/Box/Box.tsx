import { forwardRef, ReactNode } from 'react';
import { css } from '../stitches.config';
import type * as Stitches from '@stitches/react';
import { Slot } from '@radix-ui/react-slot';

const StyledBox = css('div', {
  boxSizing: 'border-box',
  fontFamily: '$untitled',
});

export type BoxProps = {
  children?: ReactNode;
  css?: Stitches.CSS;
  role?: string;
  onClick?: (e: React.MouseEvent<HTMLDivElement>) => void;
  onMouseEnter?: (e: React.MouseEvent<HTMLDivElement>) => void;
  className?: string;
  asChild?: boolean;
};

export const Box = forwardRef<HTMLDivElement, BoxProps>(
  ({ children, css, asChild, ...props }, ref) => {
    const Comp = asChild ? Slot : 'div';
    return (
      <Comp {...props} ref={ref} className={StyledBox({ css })}>
        {children}
      </Comp>
    );
  }
);
