import { CheckCircleFilled, CloseCircleFilled } from '@ant-design/icons';
import * as ProgressPrimitive from '@radix-ui/react-progress';
import { ReactNode } from 'react';
import { Space } from '../Space';
import { styled } from '../stitches.config';
import { Text } from '../Text';

import type * as Stitches from '@stitches/react';
export type status = 'loading' | 'complete' | 'error';

export interface ProgressBarProps {
  value: number;
  hiddenProgress?: boolean;
  status?: status;
  iconComplete?: ReactNode;
  iconError?: ReactNode;
  css?: Stitches.CSS;
}
CheckCircleFilled.toString = () => '.anticon-check-circle';
CloseCircleFilled.toString = () => '.anticon-close-circle';
const ProgressBarRoot = styled(ProgressPrimitive.Root, {
  position: 'relative',
  overflow: 'hidden',
  background: '$gray7',
  borderRadius: '99999px',
  width: '100%',
  transform: 'translateZ(0)',
  variants: {
    size: {
      sm: {
        height: '6px',
      },
      md: {
        height: '8px',
      },
      lg: {
        height: '10px',
      },
    },
  },
  defaultVariants: {
    size: 'sm',
  },
});

const ProgressBarIndicator = styled(ProgressPrimitive.Indicator, {
  backgroundColor: '$primary9',
  width: '100%',
  height: '100%',
  borderRadius: '99999px',
  transition: 'transform 660ms cubic-bezier(0.65, 0, 0.35, 1)',
  '&[data-state="complete"]': {
    backgroundColor: '$grass8',
  },
  variants: {
    status: {
      loading: {
        backgroundColor: '$primary9 !important',
      },
      complete: {
        backgroundColor: '$grass8 !important',
      },
      error: {
        backgroundColor: '$red11 !important',
      },
    },
  },
});
export function ProgressBar({
  value,
  status = 'complete',
  hiddenProgress,
  iconError,
  iconComplete,
  css,
  ...props
}: ProgressBarProps) {
  const renderState = (status: status) => {
    if (status === 'complete') {
      return iconComplete ? iconComplete : <CheckCircleFilled />;
    }
    if (status === 'error') {
      return iconError ? iconError : <CloseCircleFilled />;
    }
    return <Text css={{ marginLeft: '2px', color: '$gray12' }}>{value}%</Text>;
  };
  return (
    <Space
      align="center"
      css={{
        [`& ${CheckCircleFilled}`]: {
          color: '$grass8',
          marginLeft: '2px',
        },
        [`& ${CloseCircleFilled}`]: {
          color: '$red11',
          marginLeft: '2px',
        },
      }}
    >
      <ProgressBarRoot {...props} value={value} css={css}>
        <ProgressBarIndicator
          status={status}
          {...props}
          css={{
            ...css,
            transform: `translateX(-${100 - value}%)`,
          }}
        />
      </ProgressBarRoot>
      {hiddenProgress ? null : renderState(status)}
    </Space>
  );
}

export default ProgressBar;
