import { CSS } from '@stitches/react';
import clsx from 'clsx';
import { ComponentProps } from 'react';
import { keyframes, styled } from '../stitches.config';

const wave = keyframes({
  '0%': { transform: 'translateX(-100%)' },
  '100%': { transform: 'translateX(100%)' },
});

const StyledSkeleton = styled('span', {
  $$animationDirection: 'normal',
  $$pseudoElementDisplay: 'block',
  backgroundColor: '$$baseColor',
  width: '100%',
  borderRadius: 2,
  display: 'inline-flex',
  justifyContent: 'center',
  alignItems: 'center',
  lineHeight: 1,
  position: 'relative',
  overflow: 'hidden',
  zIndex: 1,
  '.content': {
    position: 'relative',
    zIndex: 2,
  },
  '&::before': {
    zIndex: 0,
    content: ' ',
    display: '$$pseudoElementDisplay',
    position: 'absolute',
    top: 0,
    left: 0,
    right: 0,
    height: '100%',
    backgroundRepeat: 'no-repeat',
    backgroundImage:
      'linear-gradient( 90deg, $$baseColor, $$highlightColor, $$baseColor )',
    transform: 'translateX(-100%)',
    animationName: wave,
    animationDirection: '$$animationDirection',
    animationDuration: '$$animationDuration',
    animationTimingFunction: 'ease-in-out',
    animationIterationCount: 'infinite',
  },
  variants: {
    circle: {
      true: {
        aspectRatio: '1/1',
        borderRadius: '100%',
        width: '40px',
      },
    },
    square: {
      true: {
        aspectRatio: '1/1',
        width: '40px',
      },
    },
    image: {
      true: {
        width: 96,
        height: 96,
      },
    },
  },
});

const StyledIconImage = styled('div', {
  maxHeight: 42,
  maxWidth: 48,
  width: '100%',
  height: '100%',
  position: 'absolute',
  top: '50%',
  left: '50%',
  transform: 'translate(-50%, -50%)',
  zIndex: 2,
  aspectRatio: '48/42',
  '&> svg': {
    width: '100%',
    height: '100%',
  },
});

const BASE_COLOR = '$colors$gray3';
const HIGHLIGHT_COLOR = '$colors$gray1';
const ANIMATION_DURATION = '1.5s';

const getCssVars = ({
  baseColor,
  highlightColor,
  animationDuration,
}: Pick<
  SkeletonProps,
  'baseColor' | 'highlightColor' | 'animationDuration'
>) => {
  return {
    $$baseColor: baseColor,
    $$highlightColor: highlightColor,
    $$animationDuration: animationDuration,
  };
};

/* eslint-disable-next-line */
export interface SkeletonProps extends ComponentProps<typeof StyledSkeleton> {
  width?: CSS['width'];
  height?: CSS['height'];
  baseColor?: CSS['color'];
  highlightColor?: CSS['color'];
  animationDuration?: CSS['animationDuration'];
  /**
   * show image icon on center, if children provided the image icon will be replaced
   */
  image?: boolean;
}

export const Skeleton = ({
  children,
  width,
  height,
  css,
  className,
  baseColor = BASE_COLOR,
  highlightColor = HIGHLIGHT_COLOR,
  animationDuration = ANIMATION_DURATION,
  image,
  ...props
}: SkeletonProps) => {
  return (
    <StyledSkeleton
      {...props}
      css={{
        width,
        height,
        ...css,
        ...getCssVars({ baseColor, highlightColor, animationDuration }),
      }}
      className={clsx('skeleton', className)}
      image={image}
    >
      {children !== undefined ? (
        <div className="content">{children}</div>
      ) : image ? (
        <StyledIconImage className="icon-image">
          <svg
            viewBox="0 0 48 42"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              d="M15.9875 12.4326C15.9875 13.8612 15.5207 15.0749 14.587 16.0738C13.6533 17.0726 12.5214 17.5732 11.1913 17.5755C9.8611 17.5778 8.72918 17.0772 7.79551 16.0738C6.86184 15.0704 6.395 13.8566 6.395 12.4326C6.395 11.0086 6.86184 9.79493 7.79551 8.79151C8.72918 7.78808 9.8611 7.28751 11.1913 7.28979C12.5214 7.29208 13.6533 7.79265 14.587 8.79151C15.5207 9.79036 15.9875 11.0041 15.9875 12.4326ZM41.5675 22.7184V34.7184H6.395V29.5755L14.3888 21.0041L18.3856 25.2898L31.1756 11.5755L41.5675 22.7184ZM43.9657 3.86122H3.99688C3.77945 3.86122 3.59186 3.94579 3.43412 4.11493C3.27637 4.28408 3.1975 4.48522 3.1975 4.71836V37.2898C3.1975 37.5229 3.27637 37.7241 3.43412 37.8932C3.59186 38.0624 3.77945 38.1469 3.99688 38.1469H43.9657C44.1831 38.1469 44.3707 38.0624 44.5284 37.8932C44.6862 37.7241 44.765 37.5229 44.765 37.2898V4.71836C44.765 4.48522 44.6862 4.28408 44.5284 4.11493C44.3707 3.94579 44.1831 3.86122 43.9657 3.86122ZM47.9625 4.71836V37.2898C47.9625 38.4692 47.5714 39.4784 46.789 40.3172C46.0067 41.1561 45.0656 41.5755 43.9657 41.5755H3.99688C2.89694 41.5755 1.95581 41.1561 1.17348 40.3172C0.391161 39.4784 0 38.4692 0 37.2898V4.71836C0 3.53893 0.391161 2.52979 1.17348 1.69093C1.95581 0.852076 2.89694 0.432648 3.99688 0.432648H43.9657C45.0656 0.432648 46.0067 0.852076 46.789 1.69093C47.5714 2.52979 47.9625 3.53893 47.9625 4.71836Z"
              fill="black"
              fillOpacity="0.25"
            />
          </svg>
        </StyledIconImage>
      ) : null}
      &zwnj;
    </StyledSkeleton>
  );
};

export default Skeleton;
