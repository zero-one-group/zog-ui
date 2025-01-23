import type { Assign } from '@ark-ui/react'
import { type HTMLArkProps, ark } from '@ark-ui/react/factory'
import { type AspectRatioVariants, aspectRatioStyles } from '@repo/core-ui/aspect-ratio.css'
import * as React from 'react'

export interface AspectRatioProps
  extends Assign<HTMLArkProps<'div'>, Omit<AspectRatioVariants, 'ratio'>> {
  ratio?: number | AspectRatioVariants['ratio']
}

const AspectRatio = React.forwardRef<HTMLDivElement, AspectRatioProps>(
  ({ className, ratio, children, ...props }, ref) => {
    const styles = aspectRatioStyles()

    return (
      <ark.div ref={ref} className={styles.container({ className })} {...props}>
        <div
          style={
            {
              paddingBottom: typeof ratio === 'number' ? `${(1 / ratio) * 100}%` : undefined,
            } as React.CSSProperties
          }
        >
          <div className={styles.content()}>{children}</div>
        </div>
      </ark.div>
    )
  }
)

AspectRatio.displayName = 'AspectRatio'

export { AspectRatio }
