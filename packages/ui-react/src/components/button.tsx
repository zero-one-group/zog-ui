import type { Assign } from '@ark-ui/react'
import { type HTMLArkProps, ark } from '@ark-ui/react/factory'
import { type ButtonVariants, buttonStyles } from '@repo/core-ui/button.css'
import * as Lucide from 'lucide-react'
import * as React from 'react'

export interface ButtonProps extends Assign<HTMLArkProps<'button'>, ButtonVariants> {
  isLoading?: boolean
}

const Button = React.forwardRef<HTMLButtonElement, ButtonProps>(
  ({ variant, size, className, isLoading, disabled, children, ...props }, ref) => {
    // Wrap children in fragment when loading to ensure single child
    const content = isLoading ? (
      <>
        <Lucide.Loader2 strokeWidth={2} />
        {children}
      </>
    ) : (
      children
    )

    return (
      <ark.button
        ref={ref}
        className={buttonStyles({ variant, size, isLoading, className })}
        disabled={disabled || isLoading}
        data-loading={isLoading}
        {...props}
      >
        {content}
      </ark.button>
    )
  }
)

Button.displayName = 'Button'

export { Button }
