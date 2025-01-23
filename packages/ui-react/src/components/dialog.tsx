import { Dialog as DialogPrimitive } from '@ark-ui/react/dialog'
import { Portal as PortalPrimitive } from '@ark-ui/react/portal'
import { dialogStyles } from '@repo/core-ui/dialog.css'
import * as Lucide from 'lucide-react'
import * as React from 'react'

const Dialog = DialogPrimitive.Root
const DialogTrigger = DialogPrimitive.Trigger
const DialogClose = DialogPrimitive.CloseTrigger
const DialogPortal = PortalPrimitive

const DialogOverlay = React.forwardRef<
  React.ComponentRef<typeof DialogPrimitive.Backdrop>,
  React.ComponentPropsWithoutRef<typeof DialogPrimitive.Backdrop>
>(({ className, ...props }, ref) => {
  const styles = dialogStyles()
  return <DialogPrimitive.Backdrop ref={ref} className={styles.overlay({ className })} {...props} />
})

const DialogContent = React.forwardRef<
  React.ComponentRef<typeof DialogPrimitive.Content>,
  React.ComponentPropsWithoutRef<typeof DialogPrimitive.Content>
>(({ className, children, ...props }, ref) => {
  const styles = dialogStyles()
  return (
    <DialogPrimitive.Positioner className={styles.positioner()}>
      <DialogOverlay />
      <DialogPrimitive.Content ref={ref} className={styles.content({ className })} {...props}>
        {children}
        <DialogPrimitive.CloseTrigger className={styles.close()}>
          <Lucide.XIcon className={styles.closeIcon()} strokeWidth={2} />
          <span className="sr-only hidden">Close</span>
        </DialogPrimitive.CloseTrigger>
      </DialogPrimitive.Content>
    </DialogPrimitive.Positioner>
  )
})

const DialogHeader = ({ className, ...props }: React.HTMLAttributes<HTMLDivElement>) => {
  const styles = dialogStyles()
  return <div className={styles.header({ className })} {...props} />
}

const DialogFooter = ({ className, ...props }: React.HTMLAttributes<HTMLDivElement>) => {
  const styles = dialogStyles()
  return <div className={styles.footer({ className })} {...props} />
}

const DialogTitle = React.forwardRef<
  React.ComponentRef<typeof DialogPrimitive.Title>,
  React.ComponentPropsWithoutRef<typeof DialogPrimitive.Title>
>(({ className, ...props }, ref) => {
  const styles = dialogStyles()
  return <DialogPrimitive.Title ref={ref} className={styles.title({ className })} {...props} />
})

const DialogDescription = React.forwardRef<
  React.ComponentRef<typeof DialogPrimitive.Description>,
  React.ComponentPropsWithoutRef<typeof DialogPrimitive.Description>
>(({ className, ...props }, ref) => {
  const styles = dialogStyles()
  return (
    <DialogPrimitive.Description
      ref={ref}
      className={styles.description({ className })}
      {...props}
    />
  )
})

DialogTitle.displayName = DialogPrimitive.Title.displayName
DialogContent.displayName = DialogPrimitive.Content.displayName
DialogDescription.displayName = DialogPrimitive.Description.displayName
DialogTrigger.displayName = 'DialogTrigger'
DialogClose.displayName = 'DialogClose'
DialogHeader.displayName = 'DialogHeader'
DialogFooter.displayName = 'DialogFooter'
DialogOverlay.displayName = 'DialogOverlay'

export {
  Dialog,
  DialogOverlay,
  DialogTrigger,
  DialogClose,
  DialogContent,
  DialogHeader,
  DialogFooter,
  DialogTitle,
  DialogDescription,
  DialogPortal,
}
