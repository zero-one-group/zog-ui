import type { Assign } from '@ark-ui/react'
import { type HTMLArkProps, ark } from '@ark-ui/react/factory'
import { type SeparatorVariants, separatorStyles } from '@repo/core-ui/separator.css'
import * as React from 'react'

declare const ORIENTATIONS: readonly ['horizontal', 'vertical']
type Orientation = (typeof ORIENTATIONS)[number]

export interface SeparatorProps extends Assign<HTMLArkProps<'div'>, SeparatorVariants> {
  /**
   * Either `vertical` or `horizontal`. Defaults to `horizontal`.
   */
  orientation?: Orientation
  /**
   * Whether or not the component is purely decorative. When true, accessibility-related attributes
   * are updated so that that the rendered element is removed from the accessibility tree.
   */
  decorative?: boolean
}

const Separator = React.forwardRef<HTMLDivElement, SeparatorProps>(
  ({ className, orientation = 'horizontal', decorative, ...props }, ref) => {
    const styles = separatorStyles({ orientation, className })

    return (
      <ark.div
        ref={ref}
        role={decorative ? 'none' : 'separator'}
        aria-orientation={decorative ? undefined : orientation}
        className={styles}
        {...props}
      />
    )
  }
)

Separator.displayName = 'Separator'

export { Separator }
