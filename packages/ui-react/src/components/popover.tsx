import { Popover as PopoverPrimitive } from '@ark-ui/react/popover'
import { Portal as PortalPrimitive } from '@ark-ui/react/portal'
import { popoverStyles } from '@repo/core-ui/popover.css'
import * as React from 'react'

const Popover = PopoverPrimitive.Root
const PopoverTrigger = PopoverPrimitive.Trigger
const PopoverIndicator = PopoverPrimitive.Indicator
const PopoverAnchor = PopoverPrimitive.Anchor
const PopoverPortal = PortalPrimitive

const PopoverContent = React.forwardRef<
  React.ComponentRef<typeof PopoverPrimitive.Content>,
  React.ComponentPropsWithoutRef<typeof PopoverPrimitive.Content>
>(({ className, ...props }, ref) => {
  return (
    <PopoverPrimitive.Positioner>
      <PopoverPrimitive.Content ref={ref} className={popoverStyles({ className })} {...props} />
    </PopoverPrimitive.Positioner>
  )
})

PopoverTrigger.displayName = 'PopoverTrigger'
PopoverIndicator.displayName = 'PopoverIndicator'
PopoverAnchor.displayName = 'PopoverAnchor'
PopoverContent.displayName = PopoverPrimitive.Content.displayName

export { Popover, PopoverTrigger, PopoverIndicator, PopoverContent, PopoverAnchor, PopoverPortal }
