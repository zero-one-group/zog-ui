import * as RadixSlider from '@radix-ui/react-slider';
import { ComponentProps, ElementRef, forwardRef, useState } from 'react';
import { CSS, styled } from '../stitches.config';
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
    $$bgSliderDisabled: '$colors-gray7',
  };
};
const StyledSliderRoot = styled(RadixSlider.Root, {
  position: 'relative',
  display: 'flex',
  alignItems: 'center',
  userSelect: 'none',
  touchAction: 'none',
  "&[data-orientation='vertical']": {
    flexDirection: 'column',
    width: 20,
    height: 200,
  },
  "&:not([data-orientation='vertical'])": {
    width: 200,
    height: 20,
  },
});

const StyledSliderTrack = styled(RadixSlider.Track, {
  backgroundColor: '$blackA5',
  position: 'relative',
  flexGrow: 1,
  borderRadius: '9999px',
  "&[data-orientation='vertical']": {
    width: 4,
  },
  "&:not([data-orientation='vertical'])": {
    height: 4,
  },
  '&[data-disabled]': {
    backgroundColor: '$$bgSliderDisabled',
  },
});

const StyledSliderRange = styled(RadixSlider.Range, {
  position: 'absolute',
  backgroundColor: '$$bgSliderRange',
  borderRadius: '9999px',

  transition: 'background-color 100ms linear',
  "&[data-orientation='vertical']": {
    width: '100%',
  },
  "&:not([data-orientation='vertical'])": {
    height: '100%',
  },
  '&[data-disabled]': {
    backgroundColor: '$$bgSliderDisabled',
  },
  '&:hover': { backgroundColor: `$$bgSliderThumb` },
});

export type SliderPrimitive = ComponentProps<typeof StyledSliderRoot>;

export type SliderProps = {
  colorScheme?: string;
  css?: CSS;
} & SliderPrimitive;

export const Slider = forwardRef<
  ElementRef<typeof StyledSliderRoot>,
  SliderProps
>(({ colorScheme, defaultValue, value, css, ...props }) => {
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
        ...css,
        ...getColorSchemeVariants(colorScheme),
      }}
      onValueCommit={(value) => {
        setIsDragging(value.map((val, i) => val === commitedValue[i]));
        setCommitedValue(value);
      }}
      {...props}
    >
      <StyledSliderTrack>
        <StyledSliderRange />
      </StyledSliderTrack>
      {sliderValues.map((value, index) => (
        <SliderThumb
          orientation={props.orientation}
          dragging={isDragging[index]}
          key={index}
          value={value}
        />
      ))}
    </StyledSliderRoot>
  );
});

export default Slider;
