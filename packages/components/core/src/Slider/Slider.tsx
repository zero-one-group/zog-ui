import * as RadixSlider from '@radix-ui/react-slider';
import {
  ComponentProps,
  ElementRef,
  forwardRef,
  useMemo,
  useState,
} from 'react';
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
    height: 400,
  },
  "&:not([data-orientation='vertical'])": {
    width: 400,
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

const StyledSliderStep = styled('div', {
  position: 'absolute',
  width: 'calc(100% - 4px)',
  height: 4,
});

const StyledSliderDot = styled('span', {
  position: 'absolute',
  display: 'block',
  width: 3,
  height: 3,
  backgroundColor: 'white',
  boxShadow: `0 0 0 2px $$bgSliderDisabled`,
  borderRadius: 3,
  transform: 'translateY(-50%)',
  top: '50%',
  variants: {
    active: {
      true: {
        boxShadow: `0 0 0 2px $$bgSliderThumb`,
      },
    },
  },
});

const StyledSliderMarks = styled('div', {
  position: 'absolute',
  width: 'calc(100% - 4px)',
  height: 4,
  top: 14,
});

const StyledSliderMarkItem = styled('span', {
  position: 'absolute',
  display: 'block',
  transform: 'translateX(-50%)',
  textAlign: 'center',
  fontFamily: '$untitled',
});

export type SliderPrimitive = ComponentProps<typeof StyledSliderRoot>;

export type SliderProps = {
  colorScheme?: string;
  css?: CSS;
  showTicks?: boolean;
  ticks?: number | string[];
  snapToTicks?: boolean;
} & SliderPrimitive;

export const Slider = forwardRef<
  ElementRef<typeof StyledSliderRoot>,
  SliderProps
>(
  ({
    colorScheme,
    defaultValue,
    value,
    css,
    max = 100,
    snapToTicks = false,
    showTicks = false,
    ticks = 1,
    ...props
  }) => {
    const [sliderValues, setSliderValues] = useState<number[]>(
      value ? value : defaultValue || [0]
    );

    const [commitedValue, setCommitedValue] = useState<number[]>(sliderValues);

    const [isDragging, setIsDragging] = useState<boolean[]>(
      new Array(sliderValues.length).fill(false)
    );

    const handleChangeSlider = (value: number[]) => {
      setSliderValues(value);
      if (isDragging.every((x) => x === false)) {
        setIsDragging(value.map((val, index) => val !== commitedValue[index]));
      }
    };

    const step =
      typeof ticks === 'number' ? ticks : Math.floor(max / (ticks.length - 1));
    const numberOfTicks = Math.floor(max / step) + 1;

    const renderTicks = useMemo(() => {
      return [...Array.from(Array(numberOfTicks).keys())].map((dot) => (
        <StyledSliderDot
          key={dot}
          active={
            !props.disabled &&
            sliderValues.some((value: number) => value >= dot * step)
          }
          css={{ left: `${dot * step}%` }}
        />
      ));
    }, [numberOfTicks, step, props.disabled, sliderValues]);

    const renderMarks = useMemo(() => {
      return typeof ticks !== 'number'
        ? ticks.map((mark, index) => (
            <StyledSliderMarkItem key={mark} css={{ left: `${index * step}%` }}>
              {mark}
            </StyledSliderMarkItem>
          ))
        : null;
    }, [step, ticks]);

    return (
      <StyledSliderRoot
        value={sliderValues}
        onValueChange={(value) => handleChangeSlider(value)}
        css={{
          ...css,
          ...getColorSchemeVariants(colorScheme),
        }}
        onValueCommit={(value) => {
          setIsDragging((prev) => prev.map(() => false));
          setCommitedValue(value);
        }}
        step={snapToTicks ? step : undefined}
        {...props}
      >
        <StyledSliderTrack>
          <StyledSliderRange />
          {showTicks ? (
            <StyledSliderStep>{renderTicks}</StyledSliderStep>
          ) : null}
          {typeof ticks !== 'number' ? (
            <StyledSliderMarks>{renderMarks}</StyledSliderMarks>
          ) : null}
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
  }
);

export default Slider;
