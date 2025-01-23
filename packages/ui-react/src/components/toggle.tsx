import { Toggle as TogglePrimitive } from '@ark-ui/react/toggle'
import { type ToggleVariants, toggleStyles } from '@repo/core-ui/toggle.css'
import * as React from 'react'

const ToggleIndicator = TogglePrimitive.Indicator

const Toggle = React.forwardRef<
  React.ComponentRef<typeof TogglePrimitive.Root>,
  React.ComponentPropsWithoutRef<typeof TogglePrimitive.Root> & ToggleVariants
>(({ className, variant, size, ...props }, ref) => (
  <TogglePrimitive.Root
    ref={ref}
    className={toggleStyles({ variant, size, className })}
    {...props}
  />
))

Toggle.displayName = TogglePrimitive.Root.displayName
ToggleIndicator.displayName = 'ToggleIndicator'

export { Toggle, ToggleIndicator }
