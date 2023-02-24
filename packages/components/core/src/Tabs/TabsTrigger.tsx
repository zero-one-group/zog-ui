import { ReactNode } from 'react';
import { styled } from '../stitches.config';

import type * as Stitches from '@stitches/react';
import * as TabsPrimitive from '@radix-ui/react-tabs';
type TabsTriggerProps = {
  value: string;
  leftIcon?: ReactNode;
  rightIcon?: ReactNode;
  children: string | ReactNode;
  css?: Stitches.CSS;
};

const StyledTabsTrigger = styled(TabsPrimitive.Trigger, {
  position: 'relative',
  '&[data-state=active]': {
    color: '$blue9',
    span: {
      color: '$blue9',
    },
    boxShadow: 'inset 0 -1px 0 0 currentColor, 0 1px 0 0 currentColor',
  },
  '&[data-orientation=vertical]': {
    paddingRight: '12px',
    '&[data-state=active]': {
      boxShadow:
        'currentcolor -1px 0px 0px 0px inset, currentcolor 1px 0px 0px 0px',
    },
  },
  span: {
    color: '$gray12',
    width: 'max-content',
  },
});

export const TabsTrigger = ({
  value,
  leftIcon,
  children,
  rightIcon,
  ...props
}: TabsTriggerProps) => {
  return (
    <StyledTabsTrigger value={value} {...props}>
      {leftIcon}
      <span>{children}</span>
      {rightIcon}
    </StyledTabsTrigger>
  );
};

export default TabsTrigger;
