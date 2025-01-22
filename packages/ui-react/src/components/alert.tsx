import { type Assign } from '@ark-ui/react'
import type { HTMLArkProps, HTMLProps } from '@ark-ui/react/factory'
import { ark } from '@ark-ui/react/factory'
import { type AlertVariants, alertStyles } from '@repo/core-ui/alert.css'
import * as React from 'react'

export interface AlertProps extends Assign<HTMLArkProps<'div'>, AlertVariants> {}

const Alert = React.forwardRef<HTMLDivElement, AlertProps>(
  ({ className, variant, ...props }, ref) => {
    const styles = alertStyles({ variant })
    return <div ref={ref} role="alert" className={styles.base({ className })} {...props} />
  }
)
Alert.displayName = 'Alert'

const AlertTitle = React.forwardRef<HTMLHeadingElement, HTMLProps<'h5'>>(
  ({ className, ...props }, ref) => {
    const styles = alertStyles()
    return <ark.h5 ref={ref} className={styles.title({ className })} {...props} />
  }
)
AlertTitle.displayName = 'AlertTitle'

const AlertDescription = React.forwardRef<HTMLDivElement, HTMLProps<'div'>>(
  ({ className, ...props }, ref) => {
    const styles = alertStyles()
    return <ark.div ref={ref} className={styles.description({ className })} {...props} />
  }
)
AlertDescription.displayName = 'AlertDescription'

export { Alert, AlertTitle, AlertDescription }
