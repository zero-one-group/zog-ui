import { Box } from '../Box';
import { Text } from '../Text';
import { Space } from '../Space';
import { Button } from '../Button';
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
};

const StyledAlert = styled(Box, {
  minWidth: '395px',
  padding: '$2 $3',
  borderRadius: '2px',
  variants: {
    intent: {
      success: {
        border: '1px solid #B7EB8F',
        backgroundColor: '#F6FFED',
        span: {
          color: '#52c41a',
        },
      },
      info: {
        border: '1px solid #91D5FF',
        backgroundColor: '#E6F7FF',
        span: {
          color: '#1890ff',
        },
      },
      warning: {
        border: '1px solid #FFE58F',
        backgroundColor: '#FFFBE6',
        span: {
          color: '#fa8c16',
        },
      },
      error: {
        border: '1px solid #FFCCC7',
        backgroundColor: '#FFF1F0',
        span: {
          color: '#f5222d',
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
          }}
        >
          {title}
        </Text>
        <Button
          intent="default"
          css={{
            marginRight: '10px',
            backgroundColor: '#E6F7FF',
            borderColor: '#91D5FF',
          }}
          size="lg"
          variant="dashed"
        >
          Swap
        </Button>
        <CloseOutlined
          onClick={onClose}
          style={{
            color: 'rgb(199, 199, 199)',
          }}
        />
      </Space>
      <Text>{description}</Text>
    </StyledAlert>
  );
};

export default Alert;
