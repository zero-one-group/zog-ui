import { type Assign } from '@ark-ui/react'
import { FieldLabel as LabelPrimitive } from '@ark-ui/react'
import { type HTMLArkProps } from '@ark-ui/react/factory'
import { type LabelVariants, labelStyles } from '@repo/core-ui/label.css'
import * as React from 'react'

interface LabelProps extends Assign<HTMLArkProps<'label'>, LabelVariants> {}

const Label = React.forwardRef<React.ComponentRef<typeof LabelPrimitive>, LabelProps>(
  ({ className, ...props }, ref) => (
    <LabelPrimitive ref={ref} className={labelStyles({ className })} {...props} />
  )
)

Label.displayName = LabelPrimitive.displayName

export { Label }
