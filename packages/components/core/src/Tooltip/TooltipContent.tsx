import * as TooltipPrimitive from '@radix-ui/react-tooltip';
import { styled, keyframes } from '../stitches.config';
import type * as Stitches from '@stitches/react';
import { TooltipProps } from './Tooltip';

const slideUpAndFade = keyframes({
  from: { opacity: 0, transform: 'translateY(2px)' },
  to: { opacity: 1, transform: 'translateY(0)' },
});
const slideRightAndFade = keyframes({
  from: { opacity: 0, transform: 'translateX(-2px)' },
  to: { opacity: 1, transform: 'translateX(0)' },
});
const slideDownAndFade = keyframes({
  from: { opacity: 0, transform: 'translateY(-2px)' },
  to: { opacity: 1, transform: 'translateY(0)' },
});
const slideLeftAndFade = keyframes({
  from: { opacity: 0, transform: 'translateX(2px)' },
  to: { opacity: 1, transform: 'translateX(0)' },
});
const StyledTooltipContent = styled(TooltipPrimitive.Content, {
  borderRadius: '4px',
  padding: '10px 15px',
  fontSize: '15px',
  lineHeight: 1,
  color: '$violet9',
  backgroundColor: '$gray1',
  boxShadow:
    'hsl(206 22% 7% / 35%) 0px 10px 38px -10px, hsl(206 22% 7% / 20%) 0px 10px 20px -15px',
  userSelect: 'none',
  animationDuration: '400ms',
  animationTimingFunction: 'cubic-bezier(0.16, 1, 0.3, 1)',
  willChange: 'transform, opacity',
  "&[data-state='delayed-open'][data-side='top']": {
    animationName: `${slideDownAndFade}`,
  },
  "&[data-state='delayed-open'][data-side='right']": {
    animationName: `${slideLeftAndFade}`,
  },
  "&[data-state='delayed-open'][data-side='bottom']": {
    animationName: `${slideUpAndFade}`,
  },
  "&[data-state='delayed-open'][data-side='left']": {
    animationName: `${slideRightAndFade}`,
  },
});
const StyledTooltipArrow = styled(TooltipPrimitive.Arrow, {
  fill: '$gray1',
});
export function TooltipContent({
  children,
  arrowProps,
  ...props
}: TooltipProps & {
  arrowProps: { css: Stitches.CSS };
} & TooltipPrimitive.TooltipContentProps) {
  return (
    <TooltipPrimitive.Portal>
      <StyledTooltipContent sideOffset={5} {...props}>
        {children}
        <StyledTooltipArrow css={arrowProps?.css} />
      </StyledTooltipContent>
    </TooltipPrimitive.Portal>
  );
}

export default TooltipContent;
