import * as PopoverPrimitive from '@radix-ui/react-popover';
import { PopoverProps } from './Popover';

export function PopoverTrigger({ children, ...props }: PopoverProps) {
  return (
    <PopoverPrimitive.Trigger asChild {...props}>
      {children}
    </PopoverPrimitive.Trigger>
  );
}

export default PopoverTrigger;
