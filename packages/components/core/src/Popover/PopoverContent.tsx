import * as PopoverPrimitive from '@radix-ui/react-popover';

import type * as Stitches from '@stitches/react';

import { PopoverProps } from '../Popover';
import { styled, keyframes } from '../stitches.config';
const slideDownAndFade = keyframes({
  from: { opacity: 0, transform: 'translateY(-2px)' },
  to: { opacity: 1, transform: 'translateY(0)' },
});
const slideUpAndFade = keyframes({
  from: { opacity: 0, transform: 'translateY(2px)' },
  to: { opacity: 1, transform: 'translateY(0)' },
});
const slideRightAndFade = keyframes({
  from: { opacity: 0, transform: 'translateX(-2px)' },
  to: { opacity: 1, transform: 'translateX(0)' },
});
const slideLeftAndFade = keyframes({
  from: { opacity: 0, transform: 'translateX(2px)' },
  to: { opacity: 1, transform: 'translateX(0)' },
});
const StyledPopoverContent = styled(PopoverPrimitive.Content, {
  borderRadius: '4px',
  padding: '20px',
  width: '260px',
  backgroundColor: '$gray1',
  boxShadow:
    'hsl(206 22% 7% / 35%) 0px 10px 38px -10px, hsl(206 22% 7% / 20%) 0px 10px 20px -15px',
  animationDuration: '400ms',
  animationTimingFunction: 'cubic-bezier(0.16, 1, 0.3, 1)',
  willChange: 'transform, opacity',
  '&:hover': {
    boxShadow: `hsl(206 22% 7% / 35%) 0px 10px 38px -10px, hsl(206 22% 7% / 20%) 0px 10px 20px -15px,\n    0 0 0 2px $colors$violet7`,
  },
  "&[data-state='open'][data-side='top']": {
    animationName: `${slideDownAndFade}`,
  },
  "&[data-state='open'][data-side='right']": {
    animationName: `${slideLeftAndFade}`,
  },
  "&[data-state='open'][data-side='bottom']": {
    animationName: `${slideUpAndFade}`,
  },
  "&[data-state='open'][data-side='left']": {
    animationName: `${slideRightAndFade}`,
  },
});
const StyledPopoverArrow = styled(PopoverPrimitive.Arrow, {
  fill: '$gray1',
});

export function PopoverContent({
  children,
  arrowProps,
  ...props
}: PopoverProps & { arrowProps: { css: Stitches.CSS } }) {
  return (
    <PopoverPrimitive.Portal>
      <StyledPopoverContent {...props} sideOffset={5}>
        {children}
        <StyledPopoverArrow css={arrowProps?.css} />
      </StyledPopoverContent>
    </PopoverPrimitive.Portal>
  );
}

export default PopoverContent;
