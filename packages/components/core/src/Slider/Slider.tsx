import * as RadixSlider from '@radix-ui/react-slider';
import { ComponentProps, ElementRef, forwardRef, useState } from 'react';
import { flushSync } from 'react-dom';
import { styled } from '../stitches.config';
import { SliderThumb } from './SliderThumb';

const getColorSchemeVariants = (colorScheme?: string) => {
  return {
    $$bgSlider: colorScheme ? `$colors-${colorScheme}9` : '$colors-primary9',
    $$bgSliderRange: colorScheme
      ? `$colors-${colorScheme}7`
      : '$colors-primary7',
    $$bgSliderThumb: colorScheme
      ? `$colors-${colorScheme}8`
      : '$colors-primary8',
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

export type SliderPrimitive = ComponentProps<typeof StyledSliderRoot>;

export type SliderProps = {
  colorScheme?: string;
} & SliderPrimitive;

export const Slider = forwardRef<
  ElementRef<typeof StyledSliderRoot>,
  SliderProps
>(({ colorScheme, defaultValue, value, ...props }) => {
  const [sliderValues, setSliderValues] = useState<number[]>(
    value ? value : defaultValue || [0]
  );

  const [commitedValue, setCommitedValue] = useState<number[]>(sliderValues);

  const [isDragging, setIsDragging] = useState<boolean[]>([false]);

  const handleChangeSlider = (value: number[]) => {
    setSliderValues(value);
    if (!isDragging.some((x) => x === true)) {
      setIsDragging([true]);
    }
  };

  return (
    <StyledSliderRoot
      value={sliderValues}
      onValueChange={(value) => handleChangeSlider(value)}
      css={{
        ...getColorSchemeVariants(colorScheme),
      }}
      onValueCommit={(value) => {
        flushSync(() => {
          setIsDragging(value.map((val, i) => val === commitedValue[i]));
        });
        setCommitedValue(value);
      }}
      {...props}
    >
      <StyledSliderTrack>
        <StyledSliderRange />
      </StyledSliderTrack>
      {sliderValues.map((value, index) => (
        <SliderThumb dragging={isDragging[index]} key={index} value={value} />
      ))}
    </StyledSliderRoot>
  );
});

export default Slider;
