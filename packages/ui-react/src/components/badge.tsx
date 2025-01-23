import { type Assign } from '@ark-ui/react'
import { type HTMLArkProps, ark } from '@ark-ui/react/factory'
import { type BadgeVariants, badgeStyles } from '@repo/core-ui/badge.css'
import * as React from 'react'

export interface BadgeProps extends Assign<HTMLArkProps<'div'>, BadgeVariants> {}

const Badge = React.forwardRef<
  HTMLDivElement,
  React.HTMLAttributes<HTMLDivElement> & BadgeVariants
>(({ className, variant, size, rounded, ...props }, ref) => {
  const styles = badgeStyles({ variant, size, rounded })
  return <ark.div className={styles.base({ className })} ref={ref} {...props} />
})

Badge.displayName = 'Badge'

export { Badge }
