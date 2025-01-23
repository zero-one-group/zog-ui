import type { Assign } from '@ark-ui/react'
import type { HTMLArkProps } from '@ark-ui/react/factory'
import { Toast as ToastPrimitive, Toaster as ToasterPrimitive } from '@ark-ui/react/toast'
import { type CreateToasterReturn, createToaster } from '@ark-ui/react/toast'
import { type ToastVariants, toastStyles } from '@repo/core-ui/toast.css'
import * as Lucide from 'lucide-react'
import * as React from 'react'
import { Button } from './button'

const toast = createToaster({
  placement: 'bottom-end',
  overlap: true,
})

export interface ToasterProps extends Assign<HTMLArkProps<'div'>, ToastVariants> {
  toaster?: CreateToasterReturn
}

const Toaster = React.forwardRef<React.ComponentRef<typeof ToastPrimitive.Root>, ToasterProps>(
  ({ toaster = toast, className, ...props }, ref) => {
    const styles = toastStyles()

    return (
      <ToasterPrimitive ref={ref} toaster={toaster} {...props}>
        {(toast) => {
          const variant = toast.type as any
          return (
            <ToastPrimitive.Root key={toast.id} className={styles.root({ className, variant })}>
              <ToastPrimitive.Title className={styles.title()}>{toast.title}</ToastPrimitive.Title>

              {toast.description && (
                <ToastPrimitive.Description className={styles.description()}>
                  {toast.description}
                </ToastPrimitive.Description>
              )}

              {toast.action && (
                <ToastPrimitive.ActionTrigger asChild className={styles.actionTrigger()}>
                  <Button variant={toast.type === 'error' ? 'destructive' : 'outline'} size="sm">
                    {toast.action.label}
                  </Button>
                </ToastPrimitive.ActionTrigger>
              )}

              <ToastPrimitive.CloseTrigger className={styles.closeTrigger()}>
                <Lucide.XIcon className={styles.closeIcon()} strokeWidth={2} />
              </ToastPrimitive.CloseTrigger>
            </ToastPrimitive.Root>
          )
        }}
      </ToasterPrimitive>
    )
  }
)

export { Toaster, toast, createToaster }
