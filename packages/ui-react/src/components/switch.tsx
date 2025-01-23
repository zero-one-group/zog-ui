import { Switch as SwitchPrimitives } from '@ark-ui/react/switch'
import { switchStyles } from '@repo/core-ui/switch.css'
import * as React from 'react'

const Switch = React.forwardRef<
  React.ComponentRef<typeof SwitchPrimitives.Root>,
  React.ComponentPropsWithoutRef<typeof SwitchPrimitives.Root>
>(({ className, children, ...props }, ref) => {
  const styles = switchStyles()
  return (
    <SwitchPrimitives.Root className={styles.root({ className })} {...props} ref={ref}>
      <SwitchPrimitives.Control className={styles.control({ className })}>
        <SwitchPrimitives.Thumb className={styles.thumb()} />
      </SwitchPrimitives.Control>

      {children && (
        <SwitchPrimitives.Label className={styles.label()}>{children}</SwitchPrimitives.Label>
      )}

      <SwitchPrimitives.HiddenInput />
    </SwitchPrimitives.Root>
  )
})

Switch.displayName = SwitchPrimitives.Root.displayName

export { Switch }
