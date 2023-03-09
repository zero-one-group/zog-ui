import { Slot } from '@radix-ui/react-slot';
import type * as Stitches from '@stitches/react';
import { forwardRef } from 'react';
import { css } from '../stitches.config';
import { AsChildProps } from '../types';

const styledBoxClassName = css('div', {
  boxSizing: 'border-box',
  fontFamily: '$untitled',
});

export type BoxProps = AsChildProps<
  'div',
  Stitches.VariantProps<typeof styledBoxClassName>
>;

export const Box = forwardRef<HTMLDivElement, BoxProps>(
  ({ children, css, asChild, className, ...props }, ref) => {
    const Comp = asChild ? Slot : 'div';
    return (
      <Comp
        ref={ref}
        className={[className, styledBoxClassName({ css })].join(' ')}
        {...props}
      >
        {children}
      </Comp>
    );
  }
);
