import * as TooltipPrimitive from '@radix-ui/react-tooltip';
import { TooltipProps } from './Tooltip';

export function TooltipTrigger({ children, ...props }: TooltipProps) {
  return (
    <TooltipPrimitive.Trigger asChild {...props}>
      {children}
    </TooltipPrimitive.Trigger>
  );
}
