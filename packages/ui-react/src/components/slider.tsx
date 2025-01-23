import { type Assign } from '@ark-ui/react'
import { Slider as SliderPrimitive, type SliderRootProps } from '@ark-ui/react/slider'
import { type SliderVariants, sliderStyles } from '@repo/core-ui/slider.css'
import * as React from 'react'

export interface SliderProps extends Assign<SliderRootProps, SliderVariants> {}

const Slider = React.forwardRef<React.ComponentRef<typeof SliderPrimitive.Root>, SliderProps>(
  ({ className, size, ...props }, ref) => {
    const styles = sliderStyles({ size })
    return <SliderPrimitive.Root ref={ref} className={styles.root({ className })} {...props} />
  }
)

const SliderControl = React.forwardRef<
  React.ComponentRef<typeof SliderPrimitive.Control>,
  React.ComponentPropsWithoutRef<typeof SliderPrimitive.Control>
>(({ className, ...props }, ref) => {
  const styles = sliderStyles()
  return (
    <SliderPrimitive.Control ref={ref} className={styles.control()} {...props}>
      <SliderPrimitive.Track className={styles.track()}>
        <SliderPrimitive.Range className={styles.range()} />
      </SliderPrimitive.Track>
      <SliderPrimitive.Thumb index={0} className={styles.thumb()}>
        <SliderPrimitive.HiddenInput />
      </SliderPrimitive.Thumb>
    </SliderPrimitive.Control>
  )
})

const SliderLabel = React.forwardRef<
  React.ComponentRef<typeof SliderPrimitive.Label>,
  React.ComponentPropsWithoutRef<typeof SliderPrimitive.Label>
>(({ className, ...props }, ref) => {
  const styles = sliderStyles()
  return <SliderPrimitive.Label className={styles.label({ className })} {...props} ref={ref} />
})

const SliderValue = React.forwardRef<
  React.ComponentRef<typeof SliderPrimitive.ValueText>,
  React.ComponentPropsWithoutRef<typeof SliderPrimitive.ValueText>
>(({ className, ...props }, ref) => {
  const styles = sliderStyles()
  return (
    <SliderPrimitive.ValueText className={styles.valueText({ className })} {...props} ref={ref} />
  )
})

Slider.displayName = SliderPrimitive.Root.displayName
SliderControl.displayName = SliderPrimitive.Control.displayName
SliderLabel.displayName = SliderPrimitive.Label.displayName
SliderValue.displayName = SliderPrimitive.ValueText.displayName

export { Slider, SliderLabel, SliderControl, SliderValue }
