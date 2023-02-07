import * as RadixSlider from '@radix-ui/react-slider';
import { ComponentProps, ElementRef, forwardRef } from 'react';
import { styled } from '../stitches.config';

const getColorSchemeVariants = (colorScheme?: string) => {
  return {
    $$bgSlider: colorScheme ? `$colors-${colorScheme}9` : '$colors-primary9',
    $$bgSliderRange: colorScheme
      ? `$colors-${colorScheme}5`
      : '$colors-primary5',
    $$bgSliderThumb: colorScheme
      ? `$colors-${colorScheme}7`
      : '$colors-primary7',
  };
};
const StyledSliderRoot = styled(RadixSlider.Root, {
  position: 'relative',
  display: 'flex',
  alignItems: 'center',
  userSelect: 'none',
  touchAction: 'none',
  width: '100%',
  height: 20,
});

const StyledSliderTrack = styled(RadixSlider.Track, {
  backgroundColor: '$blackA5',
  position: 'relative',
  flexGrow: 1,
  borderRadius: '9999px',
  height: 4,
});

const StyledSliderRange = styled(RadixSlider.Range, {
  position: 'absolute',
  backgroundColor: '$$bgSliderRange',
  borderRadius: '9999px',
  height: '100%',
  transition: 'background-color 100ms linear',
  '&:hover': { backgroundColor: `$$bgSliderThumb` },
});

const StyledSliderThumb = styled(RadixSlider.Thumb, {
  display: 'block',
  width: 10,
  height: 10,
  backgroundColor: 'white',
  boxShadow: `0 0 0 2px $$bgSliderThumb`,
  borderRadius: 10,
  transition: 'all 100ms linear',
  '&:hover': { boxShadow: `0 0 0 3px $$bgSlider`, width: 12, height: 12 },
  '&:focus': {
    outline: 'none',
    boxShadow: `0 0 0 3px $$bgSlider`,
    width: 12,
    height: 12,
  },
});

export type SliderPrimitive = ComponentProps<typeof StyledSliderRoot>;

export type SliderProps = {
  colorScheme?: string;
} & SliderPrimitive;

export const Slider = forwardRef<
  ElementRef<typeof StyledSliderRoot>,
  SliderProps
>(({ colorScheme, ...props }) => {
  return (
    <StyledSliderRoot
      defaultValue={[0]}
      max={100}
      css={{
        ...getColorSchemeVariants(colorScheme),
      }}
    >
      <StyledSliderTrack>
        <StyledSliderRange />
      </StyledSliderTrack>
      <StyledSliderThumb />
    </StyledSliderRoot>
  );
});

export default Slider;
