import { Box } from '../Box';
import { Text } from '../Text';
import { Space } from '../Space';
import { styled } from '../stitches.config';
import { CloseOutlined } from '@ant-design/icons';
import type * as Stitches from '@stitches/react';

import { ReactNode } from 'react';
export type AlertProps = {
  css?: Stitches.CSS;
  title: string;
  description: string;
  onClose: () => void;
  icon: ReactNode;
  extraContent: ReactNode | string;
};
CloseOutlined.toString = () => '.anticon-close';

const StyledAlert = styled(Box, {
  [`& ${CloseOutlined}`]: {
    color: '$gray9',
    marginLeft: '$4',
  },
  minWidth: '395px',
  padding: '$2 $3',
  borderRadius: '2px',
  variants: {
    intent: {
      success: {
        border: '1px solid $lime4',
        backgroundColor: '$lime2',
        span: {
          color: '$lime9',
        },
      },
      info: {
        border: '1px solid $blue6',
        backgroundColor: '$blue4',
        span: {
          color: '$blue11',
        },
      },
      warning: {
        border: '1px solid $yellow6',
        backgroundColor: '$yellow2',
        span: {
          color: '$yellow11',
        },
      },
      error: {
        border: '1px solid $red6',
        backgroundColor: '$red4',
        span: {
          color: '$red11',
        },
      },
    },
  },
  defaultVariants: {
    intent: 'success',
  },
});

export const Alert = ({
  title,
  description,
  intent,
  icon,
  extraContent,
  onClose,
  ...props
}: AlertProps & Stitches.VariantProps<typeof StyledAlert>) => {
  return (
    <StyledAlert intent={intent} {...props}>
      <Space align="center">
        {icon}
        <Text
          css={{
            flex: 1,
            marginLeft: '10px',
            color: '$gray12',
          }}
        >
          {title}
        </Text>
        {extraContent}
        <CloseOutlined onClick={onClose} />
      </Space>
      <Space align="center">
        <Box css={{ width: '16px', height: '16px' }}></Box>
        <Text
          css={{
            flex: 1,
            marginLeft: '10px',
            color: '$gray12',
          }}
        >
          {description}
        </Text>
      </Space>
    </StyledAlert>
  );
};

export default Alert;
