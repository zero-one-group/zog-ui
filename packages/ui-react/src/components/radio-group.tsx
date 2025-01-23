import { type Assign } from '@ark-ui/react'
import { RadioGroup as RadioGroupPrimitive } from '@ark-ui/react/radio-group'
import type { RadioGroupRootProps } from '@ark-ui/react/radio-group'
import { type RadioGroupVariants, radioGroupStyles } from '@repo/core-ui/radio-group.css'
import * as React from 'react'

export interface RadioGroupProps extends Assign<RadioGroupRootProps, RadioGroupVariants> {}

const RadioGroup = React.forwardRef<
  React.ComponentRef<typeof RadioGroupPrimitive.Root>,
  RadioGroupProps
>(({ className, orientation, ...props }, ref) => {
  const styles = radioGroupStyles({ orientation })
  return <RadioGroupPrimitive.Root className={styles.root({ className })} {...props} ref={ref} />
})

const RadioGroupLabel = React.forwardRef<
  React.ComponentRef<typeof RadioGroupPrimitive.Label>,
  React.ComponentPropsWithoutRef<typeof RadioGroupPrimitive.Label>
>(({ className, ...props }, ref) => {
  const styles = radioGroupStyles()
  return <RadioGroupPrimitive.Label className={styles.label({ className })} {...props} ref={ref} />
})

const RadioGroupItem = React.forwardRef<
  React.ComponentRef<typeof RadioGroupPrimitive.Item>,
  React.ComponentPropsWithoutRef<typeof RadioGroupPrimitive.Item>
>(({ className, children, ...props }, ref) => {
  const styles = radioGroupStyles()
  return (
    <RadioGroupPrimitive.Item ref={ref} className={styles.item({ className })} {...props}>
      <RadioGroupPrimitive.ItemControl className={styles.control()} />
      <RadioGroupPrimitive.ItemText className={styles.itemText()}>
        {children}
      </RadioGroupPrimitive.ItemText>
      <RadioGroupPrimitive.ItemHiddenInput />
    </RadioGroupPrimitive.Item>
  )
})

RadioGroup.displayName = RadioGroupPrimitive.Root.displayName
RadioGroupItem.displayName = RadioGroupPrimitive.Item.displayName
RadioGroupLabel.displayName = RadioGroupPrimitive.Label.displayName

export { RadioGroup, RadioGroupItem, RadioGroupLabel }
