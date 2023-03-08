import * as TooltipPrimitive from '@radix-ui/react-tooltip';
import { ReactNode } from 'react';
import type * as Stitches from '@stitches/react';

export interface TooltipProps {
  children: ReactNode;
  css?: Stitches.CSS;
}

export function Tooltip({
  children,
  ...props
}: TooltipProps & TooltipPrimitive.TooltipProps) {
  return (
    <TooltipPrimitive.Provider>
      <TooltipPrimitive.Root {...props}>{children}</TooltipPrimitive.Root>
    </TooltipPrimitive.Provider>
  );
}

export default Tooltip;
