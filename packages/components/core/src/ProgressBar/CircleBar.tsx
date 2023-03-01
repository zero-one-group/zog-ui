import type * as Stitches from '@stitches/react';
import { Space } from '../Space';
import { styled } from '../stitches.config';
import { status } from './ProgressBar';

export interface CircleBarProps {
  value: number;
  status?: status;
  labelComplete?: string;
  labelError?: string;
  css?: Stitches.CSS;
}

const StyledCircleBar = styled(Space, {
  borderRadius: '50%',
  fontSize: '0',
  '&::after': {
    content: 'attr(data-progress)',
    display: 'flex',
    justifyContent: 'center',
    flexDirection: 'column',
    width: '100%',
    margin: '10px',
    borderRadius: '50%',
    background: '$gray1',
    textAlign: 'center',
  },
  variants: {
    size: {
      sm: {
        width: '80px',
        height: '80px',
        '&::after': {
          fontSize: '16px',
        },
      },
      md: {
        width: '120px',
        height: '120px',
        '&::after': {
          fontSize: '18px',
        },
      },
      lg: {
        width: '160px',
        height: '160px',
        '&::after': {
          fontSize: '24px',
        },
      },
    },
  },
  defaultVariants: {
    size: 'sm',
  },
});
export const CircleBar = ({
  size,
  value,
  labelComplete,
  labelError,
  css,
  status = 'loading',
}: CircleBarProps & Stitches.VariantProps<typeof StyledCircleBar>) => {
  const setLabel = (status: status) => {
    if (status === 'complete') return labelComplete ? labelComplete : '✓';
    if (status === 'error') return labelError ? labelError : '☓';
    return `${value}%`;
  };
  const setColor = (status: status) => {
    if (status === 'complete') return '$grass8';
    if (status === 'error') return '$red11';
    return '$primary11';
  };

  return (
    <StyledCircleBar
      size={size}
      css={{
        ...css,
        background: `conic-gradient(${setColor(status)} ${
          (value / 100) * 360
        }deg, $colors$gray5 0deg)`,
        color: `${setColor(status)}`,
      }}
      data-progress={setLabel(status)}
    />
  );
};

export default CircleBar;
