import { type Assign } from '@ark-ui/react'
import { type HTMLArkProps, ark } from '@ark-ui/react/factory'
import { type TextVariants, textStyles } from '@repo/core-ui/text.css'
import * as React from 'react'

export interface TextProps extends Assign<HTMLArkProps<'p'>, TextVariants> {}

const Text = React.forwardRef<HTMLParagraphElement, TextProps>(
  ({ size, weight, align, variant, className, ...props }, ref) => {
    return (
      <ark.p
        ref={ref}
        className={textStyles({ size, weight, align, variant, className })}
        {...props}
      />
    )
  }
)

Text.displayName = 'Text'

export { Text }
