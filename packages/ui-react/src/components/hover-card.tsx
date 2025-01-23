import { HoverCard as HoverCardPrimitive } from '@ark-ui/react/hover-card'
import { Portal as PortalPrimitive } from '@ark-ui/react/portal'
import { type HoverCardVariants, hoverCardStyles } from '@repo/core-ui/hover-card.css'
import * as React from 'react'

const HoverCard = HoverCardPrimitive.Root
const HoverCardTrigger = HoverCardPrimitive.Trigger
const HoverCardPortal = PortalPrimitive

interface HoverCardContentProps
  extends React.ComponentPropsWithoutRef<typeof HoverCardPrimitive.Content>,
    HoverCardVariants {}

const HoverCardContent = React.forwardRef<
  React.ComponentRef<typeof HoverCardPrimitive.Content>,
  HoverCardContentProps
>(({ className, children, ...props }, ref) => {
  const styles = hoverCardStyles()
  return (
    <HoverCardPrimitive.Positioner>
      <HoverCardPrimitive.Content ref={ref} className={styles.content({ className })} {...props}>
        <HoverCardPrimitive.Arrow
          style={
            {
              '--arrow-size': '12px',
              '--arrow-background': 'var(--popover)',
            } as React.CSSProperties
          }
        >
          <HoverCardPrimitive.ArrowTip className={styles.arrowTip()} />
        </HoverCardPrimitive.Arrow>
        {children}
      </HoverCardPrimitive.Content>
    </HoverCardPrimitive.Positioner>
  )
})

HoverCardTrigger.displayName = HoverCardPrimitive.Trigger.displayName
HoverCardContent.displayName = HoverCardPrimitive.Content.displayName

export { HoverCard, HoverCardTrigger, HoverCardContent, HoverCardPortal }
