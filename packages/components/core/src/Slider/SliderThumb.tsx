import * as RadixSlider from '@radix-ui/react-slider';
import * as Tooltip from '@radix-ui/react-tooltip';
import { ComponentProps, ElementRef, forwardRef } from 'react';
import { keyframes, styled } from '../stitches.config';

const StyledSliderThumb = styled(RadixSlider.Thumb, {
  display: 'block',
  width: 10,
  height: 10,
  backgroundColor: 'white',
  boxShadow: `0 0 0 2px $$bgSliderThumb`,
  borderRadius: 10,
  transition: 'all 100ms linear',
  '&:hover': {
    boxShadow: `0 0 0 3px $$bgSlider`,
    width: 12,
    height: 12,
    cursor: 'pointer',
  },
  '&:focus': {
    outline: 'none',
    boxShadow: `0 0 0 3px $$bgSlider`,
    width: 12,
    height: 12,
  },
});

const slideUpAndFade = keyframes({
  '0%': { opacity: 0, transform: 'translateY(2px)' },
  '100%': { opacity: 1, transform: 'translateY(0)' },
});

const slideRightAndFade = keyframes({
  '0%': { opacity: 0, transform: 'translateX(-2px)' },
  '100%': { opacity: 1, transform: 'translateX(0)' },
});

const slideDownAndFade = keyframes({
  '0%': { opacity: 0, transform: 'translateY(-2px)' },
  '100%': { opacity: 1, transform: 'translateY(0)' },
});

const slideLeftAndFade = keyframes({
  '0%': { opacity: 0, transform: 'translateX(2px)' },
  '100%': { opacity: 1, transform: 'translateX(0)' },
});

const TooltipContent = styled(Tooltip.Content, {
  borderRadius: 4,
  padding: '10px 15px',
  fontSize: 15,
  fontFamily: '$untitled',
  lineHeight: 1,
  color: 'white',
  backgroundColor: '$gray12',
  boxShadow:
    'hsl(206 22% 7% / 35%) 0px 10px 38px -10px, hsl(206 22% 7% / 20%) 0px 10px 20px -15px',
  userSelect: 'none',
  animationDuration: '100ms',
  animationTimingFunction: 'cubic-bezier(0.16, 1, 0.3, 1)',
  willChange: 'transform, opacity',
  '&[data-state="delayed-open"]': {
    '&[data-side="top"]': { animationName: slideDownAndFade },
    '&[data-side="right"]': { animationName: slideLeftAndFade },
    '&[data-side="bottom"]': { animationName: slideUpAndFade },
    '&[data-side="left"]': { animationName: slideRightAndFade },
  },
});

const TooltipArrow = styled(Tooltip.Arrow, {
  fill: '$gray12',
});

type SliderThumbProps = {
  value: number;
  dragging: boolean;
} & ComponentProps<typeof StyledSliderThumb>;

export const SliderThumb = forwardRef<
  ElementRef<typeof StyledSliderThumb>,
  SliderThumbProps
>(({ value, dragging, ...props }, ref) => (
  <Tooltip.Provider skipDelayDuration={0}>
    <Tooltip.Root open={dragging}>
      <Tooltip.Trigger asChild>
        <StyledSliderThumb ref={ref} {...props} />
      </Tooltip.Trigger>
      <Tooltip.Portal>
        <TooltipContent key={value} sideOffset={5}>
          {value}
          <TooltipArrow />
        </TooltipContent>
      </Tooltip.Portal>
    </Tooltip.Root>
  </Tooltip.Provider>
));
