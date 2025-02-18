import { Tooltip as TooltipPrimitive, useTooltip } from '@ark-ui/react/tooltip'
import { tooltipStyles } from '@repo/core-ui/tooltip.css'
import * as React from 'react'

const TooltipProvider = TooltipPrimitive.RootProvider
const Tooltip = TooltipPrimitive.Root
const TooltipTrigger = TooltipPrimitive.Trigger

const TooltipContent = React.forwardRef<
  React.ComponentRef<typeof TooltipPrimitive.Content>,
  React.ComponentPropsWithoutRef<typeof TooltipPrimitive.Content>
>(({ className, ...props }, ref) => {
  const styles = tooltipStyles()

  return (
    <TooltipPrimitive.Positioner>
      <TooltipPrimitive.Content ref={ref} className={styles.base({ className })} {...props}>
        <TooltipPrimitive.Arrow>
          <TooltipPrimitive.ArrowTip className={styles.arrowTip()} />
        </TooltipPrimitive.Arrow>
        {props.children}
      </TooltipPrimitive.Content>
    </TooltipPrimitive.Positioner>
  )
})

TooltipContent.displayName = TooltipPrimitive.Content.displayName

export { Tooltip, TooltipContent, TooltipProvider, TooltipTrigger, useTooltip }
