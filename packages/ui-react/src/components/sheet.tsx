import { type Assign } from '@ark-ui/react'
import { Dialog as SheetPrimitive } from '@ark-ui/react/dialog'
import { Portal as PortalPrimitive } from '@ark-ui/react/portal'
import { type SheetVariants, sheetStyles } from '@repo/core-ui/sheet.css'
import * as Lucide from 'lucide-react'
import * as React from 'react'

const Sheet = SheetPrimitive.Root
const SheetTrigger = SheetPrimitive.Trigger
const SheetClose = SheetPrimitive.CloseTrigger
const SheetPortal = PortalPrimitive

const SheetOverlay = React.forwardRef<
  React.ComponentRef<typeof SheetPrimitive.Backdrop>,
  React.ComponentPropsWithoutRef<typeof SheetPrimitive.Backdrop>
>(({ className, ...props }, ref) => {
  const styles = sheetStyles()
  return <SheetPrimitive.Backdrop ref={ref} className={styles.overlay({ className })} {...props} />
})

const SheetContent = React.forwardRef<
  React.ComponentRef<typeof SheetPrimitive.Content>,
  Assign<SheetPrimitive.ContentProps, SheetVariants>
>(({ side = 'right', className, children, ...props }, ref) => {
  const styles = sheetStyles({ side })
  return (
    <SheetPrimitive.Positioner className={styles.positioner()}>
      <SheetOverlay />
      <SheetPrimitive.Content ref={ref} className={styles.base({ className })} {...props}>
        <SheetPrimitive.CloseTrigger className={styles.contentCloseWrapper()}>
          <Lucide.XIcon className={styles.contentCloseIcon()} strokeWidth={2} />
          <span className="sr-only hidden">Close</span>
        </SheetPrimitive.CloseTrigger>
        {children}
      </SheetPrimitive.Content>
    </SheetPrimitive.Positioner>
  )
})

const SheetHeader = ({ className, ...props }: React.HTMLAttributes<HTMLDivElement>) => {
  const styles = sheetStyles()
  return <div className={styles.header({ className })} {...props} />
}

const SheetFooter = ({ className, ...props }: React.HTMLAttributes<HTMLDivElement>) => {
  const styles = sheetStyles()
  return <div className={styles.footer({ className })} {...props} />
}

const SheetTitle = React.forwardRef<
  React.ComponentRef<typeof SheetPrimitive.Title>,
  React.ComponentPropsWithoutRef<typeof SheetPrimitive.Title>
>(({ className, ...props }, ref) => {
  const styles = sheetStyles()
  return <SheetPrimitive.Title ref={ref} className={styles.title({ className })} {...props} />
})

const SheetDescription = React.forwardRef<
  React.ComponentRef<typeof SheetPrimitive.Description>,
  React.ComponentPropsWithoutRef<typeof SheetPrimitive.Description>
>(({ className, ...props }, ref) => {
  const styles = sheetStyles()
  return (
    <SheetPrimitive.Description
      className={styles.description({ className })}
      ref={ref}
      {...props}
    />
  )
})

SheetContent.displayName = SheetPrimitive.Content.displayName
SheetHeader.displayName = 'SheetHeader'
SheetFooter.displayName = 'SheetFooter'
SheetTitle.displayName = SheetPrimitive.Title.displayName
SheetDescription.displayName = SheetPrimitive.Description.displayName

export {
  Sheet,
  SheetPortal,
  SheetOverlay,
  SheetTrigger,
  SheetClose,
  SheetContent,
  SheetHeader,
  SheetFooter,
  SheetTitle,
  SheetDescription,
}
