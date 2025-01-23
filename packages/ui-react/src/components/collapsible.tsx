import { Collapsible as CollapsiblePrimitive } from '@ark-ui/react/collapsible'
import { collapsibleStyles } from '@repo/core-ui/collapsible.css'
import * as React from 'react'

const Collapsible = React.forwardRef<
  HTMLDivElement,
  React.ComponentPropsWithoutRef<typeof CollapsiblePrimitive.Root>
>(({ className, ...props }, ref) => {
  const styles = collapsibleStyles()
  return <CollapsiblePrimitive.Root ref={ref} className={styles.base({ className })} {...props} />
})

const CollapsibleTrigger = React.forwardRef<
  HTMLButtonElement,
  React.ComponentPropsWithoutRef<typeof CollapsiblePrimitive.Trigger>
>(({ className, ...props }, ref) => {
  const styles = collapsibleStyles()
  return (
    <CollapsiblePrimitive.Trigger ref={ref} className={styles.trigger({ className })} {...props} />
  )
})

const CollapsibleContent = React.forwardRef<
  HTMLDivElement,
  React.ComponentPropsWithoutRef<typeof CollapsiblePrimitive.Content>
>(({ className, ...props }, ref) => {
  const styles = collapsibleStyles()
  return (
    <CollapsiblePrimitive.Content ref={ref} className={styles.content({ className })} {...props} />
  )
})

Collapsible.displayName = 'Collapsible'
CollapsibleTrigger.displayName = 'CollapsibleTrigger'
CollapsibleContent.displayName = 'CollapsibleContent'

export { Collapsible, CollapsibleTrigger, CollapsibleContent }
