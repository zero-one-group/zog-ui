import * as PopoverPrimitive from '@radix-ui/react-popover';
import { ReactNode } from 'react';
import type * as Stitches from '@stitches/react';
export interface PopoverProps {
  children: ReactNode;
  css?: Stitches.CSS;
}

export function Popover({ children, ...props }: PopoverProps) {
  return <PopoverPrimitive.Root {...props}>{children}</PopoverPrimitive.Root>;
}

export default Popover;
