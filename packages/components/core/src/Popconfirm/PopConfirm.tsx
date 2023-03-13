import { ExclamationCircleFilled } from '@ant-design/icons';
import { Button } from '../Button';
import { Popover, PopoverContent, PopoverTrigger } from '../Popover';
import { Space } from '../Space';
import { styled } from '../stitches.config';
import * as PopoverPrimitive from '@radix-ui/react-popover';
import { Text } from '../Text';
import { ReactNode } from 'react';
import type * as Stitches from '@stitches/react';

export interface PopConfirmProps {
  side: 'top' | 'right' | 'bottom' | 'left';
  title: 'string';
  trigger: ReactNode;
  onAction: () => void;
  customIcon: ReactNode;
  css?: Stitches.CSS;
  labelButtonLeft: string | ReactNode;
  labelButtonRight: string | ReactNode;
}
ExclamationCircleFilled.toString = () => '.anticon-exclamation-circle';
const StyledPopConfirm = styled('div', {
  [`& ${ExclamationCircleFilled}`]: {
    color: '$orange10',
    marginRight: '6px',
  },
  color: '$gray12',
  width: '100%',
  overflow: 'hidden',
  textOverflow: 'ellipsis',
});
const StyledClose = styled(PopoverPrimitive.Close, {
  height: '30px',
  width: 'fit-content',
  padding: '6px',
  border: '1px solid $gray7',
  background: '$gray1',
  color: '$gray12',
  borderRadius: '4px',
});
export function PopConfirm({
  side,
  title,
  trigger,
  onAction,
  customIcon,
  css,
  labelButtonLeft,
  labelButtonRight,
}: PopConfirmProps) {
  return (
    <Popover>
      <PopoverTrigger>{trigger}</PopoverTrigger>
      <PopoverContent side={side}>
        <StyledPopConfirm css={css}>
          <Space align="center" justify="space-between">
            {customIcon ? customIcon : <ExclamationCircleFilled />}
            <Text>{title}</Text>
          </Space>
          <Space gap="6px" align="center" justify="flex-end">
            <StyledClose aria-label="Close">{labelButtonLeft}</StyledClose>
            <Button
              onClick={onAction}
              intent="primary"
              size="md"
              variant="default"
            >
              {labelButtonRight}
            </Button>
          </Space>
        </StyledPopConfirm>
      </PopoverContent>
    </Popover>
  );
}

export default PopConfirm;
