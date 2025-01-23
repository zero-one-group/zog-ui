import { Accordion as AccordionPrimitive } from '@ark-ui/react/accordion'
import { ark } from '@ark-ui/react/factory'
import { accordionStyles } from '@repo/core-ui/accordion.css'
import * as Lucide from 'lucide-react'
import * as React from 'react'

const Accordion = AccordionPrimitive.Root

const AccordionItem = React.forwardRef<
  React.ComponentRef<typeof AccordionPrimitive.Item>,
  React.ComponentPropsWithoutRef<typeof AccordionPrimitive.Item>
>(({ className, ...props }, ref) => {
  const styles = accordionStyles()
  return <AccordionPrimitive.Item ref={ref} className={styles.item({ className })} {...props} />
})

const AccordionTrigger = React.forwardRef<
  React.ComponentRef<typeof AccordionPrimitive.ItemTrigger>,
  React.ComponentPropsWithoutRef<typeof AccordionPrimitive.ItemTrigger>
>(({ className, children, ...props }, ref) => {
  const styles = accordionStyles()
  return (
    <AccordionPrimitive.ItemTrigger
      ref={ref}
      className={styles.headerTrigger({ className })}
      {...props}
    >
      {children}
      <Lucide.ChevronDown className={styles.headerIcon()} strokeWidth={2} />
    </AccordionPrimitive.ItemTrigger>
  )
})

const AccordionContent = React.forwardRef<
  React.ComponentRef<typeof AccordionPrimitive.ItemContent>,
  React.ComponentPropsWithoutRef<typeof AccordionPrimitive.ItemContent>
>(({ className, children, ...props }, ref) => {
  const styles = accordionStyles()
  return (
    <AccordionPrimitive.ItemContent ref={ref} className={styles.contentWrapper()} {...props}>
      <ark.div className={styles.contentChildren({ className })}>{children}</ark.div>
    </AccordionPrimitive.ItemContent>
  )
})

AccordionItem.displayName = 'AccordionItem'
AccordionTrigger.displayName = AccordionPrimitive.ItemTrigger.displayName
AccordionContent.displayName = AccordionPrimitive.ItemContent.displayName

export { Accordion, AccordionItem, AccordionTrigger, AccordionContent }
