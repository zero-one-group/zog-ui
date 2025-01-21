import type { Assign, HTMLArkProps } from '@ark-ui/react'
import { Tooltip as ArkTooltip } from '@ark-ui/react/tooltip'
import { type TooltipVariants, tooltipStyles } from '@repo/core-ui/tooltip.css'
import * as React from 'react'

export interface TooltipProps
  extends Assign<HTMLArkProps<'div'>, TooltipVariants>,
    React.ComponentPropsWithoutRef<typeof ArkTooltip.Content> {}

const TooltipProvider = ArkTooltip.RootProvider

const Tooltip = ArkTooltip.Root

const TooltipTrigger = ArkTooltip.Trigger

const TooltipPotitioner = ArkTooltip.Positioner

const TooltipArrow = ArkTooltip.Arrow

const TooltipArrowTip = ArkTooltip.ArrowTip

const TooltipContent = React.forwardRef<HTMLDivElement, TooltipProps>(
  ({ className, ...props }, ref) => {
    const styles = tooltipStyles({})
    return <ArkTooltip.Content ref={ref} className={styles.base()} {...props} />
  }
)
TooltipContent.displayName = 'Tooltip'

export {
  Tooltip,
  TooltipTrigger,
  TooltipPotitioner,
  TooltipContent,
  TooltipProvider,
  TooltipArrow,
  TooltipArrowTip,
}
