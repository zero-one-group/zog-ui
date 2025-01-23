import type { Assign } from '@ark-ui/react'
import type { HTMLArkProps, HTMLProps } from '@ark-ui/react/factory'
import { ark } from '@ark-ui/react/factory'
import { type CardVariants, cardStyles } from '@repo/core-ui/card.css'
import * as React from 'react'

const Card = React.forwardRef<HTMLDivElement, Assign<HTMLArkProps<'div'>, CardVariants>>(
  ({ className, ...props }, ref) => {
    const styles = cardStyles()
    return <ark.div ref={ref} className={styles.base({ className })} {...props} />
  }
)

const CardHeader = React.forwardRef<HTMLDivElement, HTMLProps<'div'>>(
  ({ className, ...props }, ref) => {
    const styles = cardStyles()
    return <ark.div ref={ref} className={styles.header({ className })} {...props} />
  }
)

const CardTitle = React.forwardRef<HTMLHeadingElement, HTMLProps<'h3'>>(
  ({ className, ...props }, ref) => {
    const styles = cardStyles()
    return <ark.h3 ref={ref} className={styles.title({ className })} {...props} />
  }
)

const CardDescription = React.forwardRef<HTMLParagraphElement, HTMLProps<'p'>>(
  ({ className, ...props }, ref) => {
    const styles = cardStyles()
    return <ark.p ref={ref} className={styles.description({ className })} {...props} />
  }
)

const CardContent = React.forwardRef<HTMLDivElement, HTMLProps<'div'>>(
  ({ className, ...props }, ref) => {
    const styles = cardStyles()
    return <ark.div ref={ref} className={styles.content({ className })} {...props} />
  }
)

const CardFooter = React.forwardRef<HTMLDivElement, HTMLProps<'div'>>(
  ({ className, ...props }, ref) => {
    const styles = cardStyles()
    return <ark.div ref={ref} className={styles.footer({ className })} {...props} />
  }
)

Card.displayName = 'Card'
CardHeader.displayName = 'CardHeader'
CardTitle.displayName = 'CardTitle'
CardDescription.displayName = 'CardDescription'
CardContent.displayName = 'CardContent'
CardFooter.displayName = 'CardFooter'

export { Card, CardHeader, CardFooter, CardTitle, CardDescription, CardContent }
