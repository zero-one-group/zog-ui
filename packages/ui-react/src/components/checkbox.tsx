import { Checkbox as CheckboxPrimitive } from '@ark-ui/react/checkbox'
import { checkboxStyles } from '@repo/core-ui/checkbox.css'
import * as Lucide from 'lucide-react'
import * as React from 'react'

const Checkbox = React.forwardRef<
  React.ComponentRef<typeof CheckboxPrimitive.Root>,
  React.ComponentPropsWithoutRef<typeof CheckboxPrimitive.Root>
>(({ className, children, ...props }, ref) => {
  const styles = checkboxStyles()
  return (
    <CheckboxPrimitive.Root ref={ref} className={styles.root()} {...props}>
      <CheckboxPrimitive.Control className={styles.base({ className })}>
        <CheckboxPrimitive.Indicator className={styles.indicator()}>
          <Lucide.Check className={styles.icon()} />
        </CheckboxPrimitive.Indicator>
      </CheckboxPrimitive.Control>

      {children && (
        <CheckboxPrimitive.Label className={styles.label()}>{children}</CheckboxPrimitive.Label>
      )}
      <CheckboxPrimitive.HiddenInput />
    </CheckboxPrimitive.Root>
  )
})

Checkbox.displayName = CheckboxPrimitive.Root.displayName

export { Checkbox }
