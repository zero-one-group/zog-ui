import { Dialog as AlertDialogPrimitive, useDialog } from '@ark-ui/react/dialog'
import { Portal as PortalPrimitive } from '@ark-ui/react/portal'
import { alertDialogStyles } from '@repo/core-ui/alert-dialog.css'
import { buttonStyles } from '@repo/core-ui/button.css'
import * as React from 'react'
import { Button } from './button'

const AlertDialog = AlertDialogPrimitive.Root
const AlertDialogTrigger = AlertDialogPrimitive.Trigger
const AlertDialogPortal = PortalPrimitive

const AlertDialogOverlay = React.forwardRef<
  React.ComponentRef<typeof AlertDialogPrimitive.Backdrop>,
  React.ComponentPropsWithoutRef<typeof AlertDialogPrimitive.Backdrop>
>(({ className, ...props }, ref) => {
  const styles = alertDialogStyles()
  return (
    <AlertDialogPrimitive.Backdrop ref={ref} className={styles.overlay({ className })} {...props} />
  )
})

const AlertDialogContent = React.forwardRef<
  React.ComponentRef<typeof AlertDialogPrimitive.Content>,
  React.ComponentPropsWithoutRef<typeof AlertDialogPrimitive.Content>
>(({ className, ...props }, ref) => {
  const styles = alertDialogStyles()
  return (
    <AlertDialogPrimitive.Positioner className={styles.positioner()}>
      <AlertDialogOverlay />
      <AlertDialogPrimitive.Content
        ref={ref}
        className={styles.content({ className })}
        {...props}
      />
    </AlertDialogPrimitive.Positioner>
  )
})

const AlertDialogHeader = ({ className, ...props }: React.HTMLAttributes<HTMLDivElement>) => {
  const styles = alertDialogStyles()
  return <div className={styles.header({ className })} {...props} />
}

const AlertDialogFooter = ({ className, ...props }: React.HTMLAttributes<HTMLDivElement>) => {
  const styles = alertDialogStyles()
  return <div className={styles.footer({ className })} {...props} />
}

const AlertDialogTitle = React.forwardRef<
  React.ComponentRef<typeof AlertDialogPrimitive.Title>,
  React.ComponentPropsWithoutRef<typeof AlertDialogPrimitive.Title>
>(({ className, ...props }, ref) => {
  const styles = alertDialogStyles()
  return <AlertDialogPrimitive.Title ref={ref} className={styles.title({ className })} {...props} />
})

const AlertDialogDescription = React.forwardRef<
  React.ComponentRef<typeof AlertDialogPrimitive.Description>,
  React.ComponentPropsWithoutRef<typeof AlertDialogPrimitive.Description>
>(({ className, ...props }, ref) => {
  const styles = alertDialogStyles()
  return (
    <AlertDialogPrimitive.Description
      ref={ref}
      className={styles.description({ className })}
      {...props}
    />
  )
})

const AlertDialogAction = React.forwardRef<
  React.ComponentRef<typeof AlertDialogPrimitive.CloseTrigger>,
  React.ComponentPropsWithoutRef<typeof Button>
>(({ className, variant = 'default', size = 'default', onClick, ...props }, ref) => {
  const styles = buttonStyles({ variant, size, className })
  const dialog = useDialog()

  const handleClick = (e: React.MouseEvent<HTMLButtonElement>) => {
    onClick?.(e)
    dialog.setOpen(!!dialog.open)
  }

  return (
    <AlertDialogPrimitive.CloseTrigger
      onClick={handleClick}
      className={styles}
      ref={ref}
      {...props}
    />
  )
})

const AlertDialogCancel = React.forwardRef<
  React.ComponentRef<typeof AlertDialogPrimitive.CloseTrigger>,
  React.ComponentPropsWithoutRef<typeof Button>
>(({ className, variant = 'ghost', size = 'default', ...props }, ref) => {
  const styles = buttonStyles({ variant, size, className })
  return <AlertDialogPrimitive.CloseTrigger ref={ref} className={styles} {...props} />
})

AlertDialogContent.displayName = AlertDialogPrimitive.Content.displayName
AlertDialogTitle.displayName = AlertDialogPrimitive.Title.displayName
AlertDialogDescription.displayName = AlertDialogPrimitive.Description.displayName
AlertDialogCancel.displayName = AlertDialogPrimitive.CloseTrigger.displayName
AlertDialogAction.displayName = 'AlertDialogAction'
AlertDialogHeader.displayName = 'AlertDialogHeader'
AlertDialogFooter.displayName = 'AlertDialogFooter'
AlertDialogOverlay.displayName = 'AlertDialogOverlay'

export {
  AlertDialog,
  AlertDialogPortal,
  AlertDialogOverlay,
  AlertDialogTrigger,
  AlertDialogContent,
  AlertDialogHeader,
  AlertDialogFooter,
  AlertDialogTitle,
  AlertDialogDescription,
  AlertDialogAction,
  AlertDialogCancel,
  useDialog,
}
