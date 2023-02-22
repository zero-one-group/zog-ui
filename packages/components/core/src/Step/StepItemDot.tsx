import { Box } from '../Box';
import { Space } from '../Space';
import { styled } from '../stitches.config';
import { Text } from '../Text';
import { StepItemProps } from './Step';

const StyledStepItemDot = styled(Space, {
  span: {
    height: '8px',
    width: '8px',
    backgroundColor: '$$bgStep',
    borderRadius: '50%',
    display: 'inline-block',
  },
  width: 'fit-content',
  variants: {
    orientation: {
      horizontal: {
        flexDirection: 'column',
        'div:first-child': {
          display: 'flex',
          alignItems: 'center',
        },
        hr: {
          width: '147px',
          backgroundColor: '$gray9',
          border: '1px solid $gray',
          marginLeft: '4px',
        },
        'div:last-child': {
          flexDirection: 'column',
          textAlign: 'center',
          marginLeft: '-138px',
        },
      },
      vertical: {
        flexDirection: 'row',
        'div:first-child': {
          display: 'flex',
          flexDirection: 'column',
          alignItems: 'center',
        },
        'div:last-child': {
          marginLeft: '20px',
        },
        hr: {
          border: '0',
          borderLeft: '1px solid $gray9',
          height: '22px',
          marginTop: '6px',
        },
      },
    },
    state: {
      stepProgress: {
        hr: {
          backgroundColor: '$gray9',
          border: '1px solid $gray9',
        },
      },
      stepWaiting: {
        color: '$gray9',
      },
      stepCompleted: {},
      stepError: {
        color: '$red9',
      },
    },
    size: {
      small: {
        span: {
          height: '8px',
          width: '8px',
        },
      },
      medium: {
        span: {
          height: '10px',
          width: '10px',
        },
      },
      large: {
        span: {
          height: '12px',
          width: '12px',
        },
      },
    },
  },
  compoundVariants: [
    {
      orientation: 'horizontal',
      state: 'stepWaiting',
      css: {
        span: {
          backgroundColor: '$gray9',
        },
        hr: {
          backgroundColor: '$gray9',
          border: '1px solid $gray9',
        },
      },
    },
    {
      orientation: 'horizontal',
      state: 'stepCompleted',
      css: {
        hr: {
          backgroundColor: '$$bgStep',
          border: '1px solid $$bgStep',
        },
      },
    },
    {
      orientation: 'horizontal',
      state: 'stepError',
      css: {
        span: {
          backgroundColor: '$red9',
        },
        hr: {
          backgroundColor: '$red9',
          border: '1px solid $red9',
        },
      },
    },
    {
      orientation: 'vertical',
      state: 'stepWaiting',
      css: {
        span: {
          backgroundColor: '$gray9',
        },
        hr: {
          backgroundColor: '$gray9',
          borderLeft: '1px solid $gray9',
        },
      },
    },
    {
      orientation: 'vertical',
      state: 'stepError',
      css: {
        span: {
          backgroundColor: '$red9',
        },
        hr: {
          backgroundColor: '$red9',
          borderLeft: '1px solid $red9',
        },
      },
    },
  ],
});

export const StepItemDot = ({
  label,
  description,
  state,
  step,
  icon,
  size,
  ...props
}: StepItemProps) => {
  const TextColor = () => {
    if (state === 'stepCompleted') {
      return '$gray9';
    }
    if (state === 'stepWaiting') {
      return '$gray9';
    }
    return 'gray1';
  };
  return (
    <StyledStepItemDot size={size} state={state} {...props}>
      <Box>
        <span />
        <hr />
      </Box>
      <Box>
        <Text css={{ fontSize: '$3', margin: '0' }}>{label}</Text>
        <Text css={{ fontSize: '$2', margin: '0', color: TextColor() }}>
          {description}
        </Text>
      </Box>
    </StyledStepItemDot>
  );
};
