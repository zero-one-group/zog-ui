import { type Assign } from '@ark-ui/react'
import { type HTMLArkProps, ark } from '@ark-ui/react/factory'
import { type HeadingVariants, headingStyles } from '@repo/core-ui/heading.css'
import * as React from 'react'

export interface HeadingProps extends Assign<HTMLArkProps<'h2'>, HeadingVariants> {}

const Heading = React.forwardRef<HTMLHeadingElement, HeadingProps>(
  ({ className, level = 'h2', weight, align, ...props }, ref) => {
    return (
      <ark.h2 ref={ref} className={headingStyles({ level, weight, align, className })} {...props} />
    )
  }
)

Heading.displayName = 'Heading'

export { Heading }
