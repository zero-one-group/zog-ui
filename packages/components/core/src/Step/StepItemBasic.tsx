import { Space } from '../Space';
import { styled } from '../stitches.config';

import { CheckCircleOutlined, CloseCircleOutlined } from '@ant-design/icons';
import { Box } from '../Box';
import { Button } from '../Button';
import { Text } from '../Text';
import { StepItemProps } from './Step';

const StyledStepItemBasic = styled(Space, {
  width: 'fit-content',
  'div:first-child': {
    marginRight: '20px',
  },
  hr: {
    display: 'none',
  },
  span: {
    color: '$$bgStep',
  },
  variants: {
    orientation: {
      horizontal: {
        display: 'flex',
        alignItems: 'center',
        'div:last-child': {
          'div:first-child': {
            display: 'flex',
            alignItems: 'center',
            flexDirection: 'row-reverse',
          },
          hr: {
            display: 'block !important',
            border: '0px',
            borderBottom: '1px solid $gray9',
            width: '147px',
            marginLeft: '16px',
          },
        },
      },
      vertical: {
        'div:first-child': {
          display: 'flex',
          flexDirection: 'column',
          alignItems: 'flex-start',
          'hr:last-child': {
            display: 'block !important',
            border: '0px',
            borderLeft: '1px solid $gray9',
            height: '22px',
          },
        },
      },
    },
    state: {
      stepProgress: {},
      stepWaiting: {
        color: '$gray10',
        '> span, ': {
          color: '$gray10',
        },
      },
      stepCompleted: {},
      stepError: {
        '> span, ': {
          color: '$red10',
        },
        '> div': {
          ':last-child': {
            color: '$red10',
          },
        },
      },
    },
    size: {
      small: {
        span: {
          fontSize: '22px',
        },
      },
      medium: {
        span: {
          fontSize: '38px',
        },
      },
      large: {
        span: {
          fontSize: '40px',
        },
      },
    },
  },
  compoundVariants: [
    {
      state: 'stepCompleted',
      orientation: 'vertical',
      css: {
        'div:first-child': {
          'hr:last-child': {
            borderLeft: '1px solid $$bgStep',
          },
        },
      },
    },
    {
      state: 'stepError',
      orientation: 'vertical',
      css: {
        'div:first-child': {
          'hr:last-child': {
            borderLeft: '1px solid $red9',
          },
        },
      },
    },
    {
      state: 'stepCompleted',
      orientation: 'horizontal',
      css: {
        'div:last-child': {
          hr: {
            borderBottom: '1px solid $$bgStep',
          },
        },
      },
    },
    {
      state: 'stepError',
      orientation: 'horizontal',
      css: {
        'div:last-child': {
          hr: {
            borderBottom: '1px solid $red9',
          },
        },
      },
    },
  ],
  defaultVariants: {
    orientation: 'horizontal',
    state: 'stepWaiting',
    size: 'small',
  },
});

export const StepItemBasic = ({
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
    <StyledStepItemBasic
      justify="space-between"
      state={state}
      size={size}
      {...props}
    >
      {(() => {
        if (icon) {
          return (
            <Box>
              {icon}
              <hr />
            </Box>
          );
        } else {
          if (state === 'stepCompleted') {
            return (
              <Box>
                <CheckCircleOutlined />
                <hr />
              </Box>
            );
          }
          if (state === 'stepError') {
            return (
              <Box>
                <CloseCircleOutlined />
                <hr />
              </Box>
            );
          } else {
            return (
              <Box>
                <Button
                  disabled={state === 'stepWaiting' ? true : false}
                  intent="primary"
                  size={size}
                  variant="circle"
                >
                  {step}
                </Button>
                <hr />
              </Box>
            );
          }
        }
      })()}

      <Box>
        <Box>
          <hr />
          <Text css={{ fontSize: '$3', margin: '0' }}>{label}</Text>
        </Box>
        <Text css={{ fontSize: '$2', margin: '0', color: TextColor() }}>
          {description}
        </Text>
      </Box>
    </StyledStepItemBasic>
  );
};
