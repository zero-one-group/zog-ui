import { ToggleGroup as ToggleGroupPrimitive } from '@ark-ui/react/toggle-group'
import { toggleGroupStyles } from '@repo/core-ui/toggle-group.css'
import { type ToggleVariants, toggleStyles } from '@repo/core-ui/toggle.css'
import * as React from 'react'

const ToggleGroupContext = React.createContext<ToggleVariants>({
  size: 'default',
  variant: 'default',
})

const ToggleGroup = React.forwardRef<
  React.ComponentRef<typeof ToggleGroupPrimitive.Root>,
  React.ComponentPropsWithoutRef<typeof ToggleGroupPrimitive.Root> & ToggleVariants
>(({ className, variant, size, children, ...props }, ref) => {
  return (
    <ToggleGroupPrimitive.Root ref={ref} className={toggleGroupStyles({ className })} {...props}>
      <ToggleGroupContext.Provider value={{ variant, size }}>
        {children}
      </ToggleGroupContext.Provider>
    </ToggleGroupPrimitive.Root>
  )
})

const ToggleGroupItem = React.forwardRef<
  React.ComponentRef<typeof ToggleGroupPrimitive.Item>,
  React.ComponentPropsWithoutRef<typeof ToggleGroupPrimitive.Item> & ToggleVariants
>(({ className, children, variant, size, ...props }, ref) => {
  const context = React.useContext(ToggleGroupContext)
  const styles = toggleStyles({
    variant: context.variant || variant,
    size: context.size || size,
    className,
  })

  return (
    <ToggleGroupPrimitive.Item ref={ref} className={styles} {...props}>
      {children}
    </ToggleGroupPrimitive.Item>
  )
})

ToggleGroup.displayName = ToggleGroupPrimitive.Root.displayName
ToggleGroupItem.displayName = ToggleGroupPrimitive.Item.displayName

export { ToggleGroup, ToggleGroupItem }
