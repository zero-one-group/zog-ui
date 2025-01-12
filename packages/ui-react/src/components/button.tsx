import type { Assign } from '@ark-ui/react'
import { type HTMLArkProps, ark } from '@ark-ui/react/factory'
import { ButtonVariants, buttonStyles } from '@repo/core-ui/button.css'
import * as Lucide from 'lucide-react'
import * as React from 'react'

export interface ButtonProps extends Assign<HTMLArkProps<'button'>, ButtonVariants> {
  isLoading?: boolean
}

const Button = React.forwardRef<HTMLButtonElement, ButtonProps>(
  ({ variant, size, className, isLoading, disabled, children, asChild = false, ...props }, ref) => {
    const isDisabled = disabled || isLoading
    const styles = buttonStyles({ variant, size, isLoading })

    return (
      <ark.button
        ref={ref}
        className={styles.base({ className })}
        data-loading={isLoading}
        disabled={isDisabled}
        asChild={asChild}
        {...props}
      >
        {isLoading && <Lucide.Loader2 strokeWidth={2} />}
        {children}
      </ark.button>
    )
  }
)

Button.displayName = 'Button'

export { Button }
