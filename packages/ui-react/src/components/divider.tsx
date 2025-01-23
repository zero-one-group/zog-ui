import type { Assign } from '@ark-ui/react'
import { type HTMLArkProps, ark } from '@ark-ui/react/factory'
import { type DividerVariants, dividerStyles } from '@repo/core-ui/divider.css'

function Divider({ className, variant, ...rest }: Assign<HTMLArkProps<'div'>, DividerVariants>) {
  return <ark.div className={dividerStyles({ variant, class: className })} {...rest} />
}

Divider.displayName = 'Divider'

export { Divider }
