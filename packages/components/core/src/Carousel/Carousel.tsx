import { ComponentProps, useMemo } from 'react';
import Slider from 'react-slick';

import 'slick-carousel/slick/slick.css';
import { styled } from '../stitches.config';

const StyledSlider = styled(Slider, {
  position: 'relative',
  boxSizing: 'border-box',
});

const StyledPagination = styled('div', {
  position: 'absolute',
  zIndex: 15,
  display: 'flex',
  justifyContent: 'center',
  alignItems: 'center',
  listStyle: 'none',
  '& > li.slick-active > button': {
    opacity: 1,
  },
  variants: {
    position: {
      top: {
        top: 12,
        insetInline: 0,
        '& > li.slick-active > button': {
          width: 24,
        },
      },
      bottom: {
        bottom: 12,
        insetInline: 0,
        '& > li.slick-active > button': {
          width: 24,
        },
      },
      left: {
        left: 12,
        insetBlock: 0,
        flexDirection: 'column',
        '& > li.slick-active > button': {
          height: 24,
        },
      },
      right: {
        right: 12,
        insetBlock: 0,
        flexDirection: 'column',
        '& > li.slick-active > button': {
          height: 24,
        },
      },
    },
  },
  defaultVariants: {
    position: 'bottom',
  },
});

const StyledButton = styled('button', {
  outline: 'none',
  border: 'none',
  padding: 0,
  background: 'white',
  opacity: 0.3,
  cursor: 'pointer',
  position: 'relative',
  transition: 'all .2s linear',
  '&::after': {
    position: 'absolute',
    inset: -4,
    content: '',
  },
  variants: {
    direction: {
      vertical: {
        margin: '4px 0',
        width: '3px',
        height: '16px',
      },
      horizontal: {
        marginInline: '4px',
        width: '16px',
        height: '3px',
      },
    },
  },
  defaultVariants: {
    direction: 'horizontal',
  },
});

type BaseSliderType = ComponentProps<typeof StyledSlider>;

export type CarouselProps = {
  /**
   * if not specified will default to `bottom` on default mode
   * but, in vertical mode will default placed at `left`
   */
  dotsPosition?: ComponentProps<typeof StyledPagination>['position'];
  /**
   * Fade effect
   */
  fade?: BaseSliderType['fade']; // need to declare all, cause somehow the props didn't exist in the storybook
  autoplay?: BaseSliderType['autoplay'];
  autoplaySpeed?: BaseSliderType['autoplaySpeed'];
  children?: BaseSliderType['children'];
  vertical?: BaseSliderType['vertical'];
  infinite?: BaseSliderType['infinite'];
  /**
   * triggered before slide changed
   */
  onBeforeChange?: BaseSliderType['beforeChange'];
  /**
   * triggered after slide changed
   */
  onAfterChange?: BaseSliderType['afterChange'];
  css?: BaseSliderType['css'];
  className?: BaseSliderType['className'];
  /**
   * ref to control the slider
   */
  ref?: BaseSliderType['ref'];
  /**
   * customize dot wrapper,
   * more documentation on react-slick
   */
  customPaging?: BaseSliderType['customPaging'];
  /**
   * customize dot component,
   * more documentation on react-slick
   */
  appendDots?: BaseSliderType['appendDots'];
};

export const Carousel = ({
  children,
  dotsPosition,
  vertical,
  ...props
}: CarouselProps) => {
  const position = useMemo(() => {
    return dotsPosition ?? (vertical ? 'left' : 'bottom');
  }, [dotsPosition, vertical]);

  const direction = useMemo(() => {
    if (!position) return undefined;
    return position === 'bottom' || position === 'top'
      ? 'horizontal'
      : 'vertical';
  }, [position]);

  return (
    <StyledSlider
      dots
      arrows={false}
      vertical={vertical}
      verticalSwiping={vertical}
      appendDots={(dots) => (
        <StyledPagination className="dot-wrapper" position={position}>
          {dots}
        </StyledPagination>
      )}
      customPaging={() => (
        <StyledButton className="dot" direction={direction} />
      )}
      {...props}
    >
      {children}
    </StyledSlider>
  );
};
