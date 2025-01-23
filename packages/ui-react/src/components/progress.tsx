import { type Assign } from '@ark-ui/react'
import { Progress as ProgressPrimitive, type ProgressRootProps } from '@ark-ui/react/progress'
import { type ProgressVariants, progressStyles } from '@repo/core-ui/progress.css'
import * as React from 'react'

export interface ProgressProps extends Assign<ProgressRootProps, ProgressVariants> {
  label?: string
  showValue?: boolean
}

const Progress = React.forwardRef<React.ComponentRef<typeof ProgressPrimitive.Root>, ProgressProps>(
  ({ className, value, size, variant, label, showValue = false, ...props }, ref) => {
    const styles = progressStyles({ size, variant })
    return (
      <ProgressPrimitive.Root
        ref={ref}
        className={styles.base({ className })}
        value={value}
        {...props}
      >
        {label && (
          <ProgressPrimitive.Label className={styles.label()}>{label}</ProgressPrimitive.Label>
        )}
        <ProgressPrimitive.Track className={styles.track()}>
          <ProgressPrimitive.Range
            className={styles.range()}
            style={{ transform: `translateX(-${100 - (value || 0)}%)` }}
          />
        </ProgressPrimitive.Track>
        {showValue && (
          <ProgressPrimitive.ValueText className={styles.valueText()}>
            {value}%
          </ProgressPrimitive.ValueText>
        )}
      </ProgressPrimitive.Root>
    )
  }
)

Progress.displayName = ProgressPrimitive.Root.displayName

export { Progress }
