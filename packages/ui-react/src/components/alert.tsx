import { type Assign } from '@ark-ui/react'
import { type HTMLArkProps, ark } from '@ark-ui/react/factory'
import { type AlertVariants, alertStyles } from '@repo/core-ui/alert.css'
import * as React from 'react'

const Alert = React.forwardRef<HTMLDivElement, Assign<HTMLArkProps<'div'>, AlertVariants>>(
  ({ className, variant, ...props }, ref) => {
    const styles = alertStyles({ variant })
    return (
      <ark.div ref={ref} role="alert" className={styles.base({ variant, className })} {...props} />
    )
  }
)

const AlertTitle = React.forwardRef<HTMLHeadingElement, HTMLArkProps<'h5'>>(
  ({ className, ...props }, ref) => {
    const styles = alertStyles()
    return <ark.h5 ref={ref} className={styles.title({ className })} {...props} />
  }
)

const AlertIcon = React.forwardRef<HTMLSpanElement, HTMLArkProps<'span'>>(
  ({ className, ...props }, ref) => {
    const styles = alertStyles()
    return <ark.span ref={ref} className={styles.icon({ className })} {...props} />
  }
)

const AlertDescription = React.forwardRef<HTMLParagraphElement, HTMLArkProps<'p'>>(
  ({ className, ...props }, ref) => {
    const styles = alertStyles()
    return <ark.p ref={ref} className={styles.description({ className })} {...props} />
  }
)

Alert.displayName = 'Alert'
AlertTitle.displayName = 'AlertTitle'
AlertIcon.displayName = 'AlertIcon'
AlertDescription.displayName = 'AlertDescription'

export { Alert, AlertTitle, AlertIcon, AlertDescription }
