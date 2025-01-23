import type { Assign } from '@ark-ui/react'
import { type HTMLArkProps, ark } from '@ark-ui/react/factory'
import { type TextareaVariants, textareaStyles } from '@repo/core-ui/textarea.css'
import * as React from 'react'

export interface TextareaProps extends Assign<HTMLArkProps<'textarea'>, TextareaVariants> {}

const Textarea = React.forwardRef<HTMLTextAreaElement, TextareaProps>(
  ({ className, ...props }, ref) => {
    return <ark.textarea className={textareaStyles({ className })} ref={ref} {...props} />
  }
)

Textarea.displayName = 'Textarea'

export { Textarea }
