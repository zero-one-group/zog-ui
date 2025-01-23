import type { Assign } from '@ark-ui/react'
import { type HTMLArkProps, ark } from '@ark-ui/react/factory'
import { type InputVariants, inputStyles } from '@repo/core-ui/input.css'
import * as Lucide from 'lucide-react'
import * as React from 'react'
import { Button } from './button'
import { toast } from './toast'
import { Tooltip, TooltipContent, TooltipTrigger } from './tooltip'

export interface InputProps extends Assign<HTMLArkProps<'input'>, InputVariants> {
  onCopy?: () => void
  showCopyButton?: boolean
  showExternalCopyButton?: boolean
}

const Input = React.forwardRef<HTMLInputElement, InputProps>(
  ({ className, type, showCopyButton, showExternalCopyButton, onCopy, ...props }, ref) => {
    const [showPassword, setShowPassword] = React.useState(false)
    const styles = inputStyles({
      hasPasswordToggle: type === 'password',
      hasCopyButton: showCopyButton && !type,
    })

    const togglePassword = () => setShowPassword(!showPassword)

    const handleCopy = () => {
      if (!props.value) {
        toast.error({ title: 'Nothing to copy' })
        return
      }
      navigator.clipboard.writeText(props.value.toString())
      toast.success({ title: 'Copied to clipboard' })
      onCopy?.()
    }

    const PasswordToggle = () => (
      <Tooltip positioning={{ placement: 'top' }} closeDelay={100} openDelay={150}>
        <TooltipTrigger asChild>
          <ark.button type="button" onClick={togglePassword} className={styles.toggleButton()}>
            {showPassword ? (
              <Lucide.EyeOff className="size-4" strokeWidth={2} />
            ) : (
              <Lucide.Eye className="size-4" strokeWidth={2} />
            )}
          </ark.button>
        </TooltipTrigger>
        <TooltipContent>
          <ark.p>{showPassword ? 'Hide password' : 'Show password'}</ark.p>
        </TooltipContent>
      </Tooltip>
    )

    const CopyButton = () => (
      <Tooltip positioning={{ placement: 'top' }}>
        <TooltipTrigger asChild>
          <ark.button type="button" onClick={handleCopy} className={styles.copyButton()}>
            <Lucide.Copy className="size-4" strokeWidth={2} />
          </ark.button>
        </TooltipTrigger>
        <TooltipContent>
          <ark.p>Copy to clipboard</ark.p>
        </TooltipContent>
      </Tooltip>
    )

    const ExternalCopyButton = () => (
      <Tooltip positioning={{ placement: 'top' }}>
        <TooltipTrigger asChild>
          <Button
            type="button"
            variant="outline"
            size="icon"
            onClick={handleCopy}
            className="shrink-0"
          >
            <Lucide.Copy className="size-4" strokeWidth={2} />
          </Button>
        </TooltipTrigger>
        <TooltipContent>
          <ark.p>Copy to clipboard</ark.p>
        </TooltipContent>
      </Tooltip>
    )

    if (showExternalCopyButton) {
      return (
        <ark.div className={styles.wrapperWithCopy()}>
          <ark.div className={styles.wrapper()}>
            <ark.input
              type={showPassword ? 'text' : type}
              className={styles.input({ className })}
              ref={ref}
              {...props}
            />
            {type === 'password' && <PasswordToggle />}
          </ark.div>
          <ExternalCopyButton />
        </ark.div>
      )
    }

    return (
      <ark.div className={styles.wrapper()}>
        <ark.input
          type={showPassword ? 'text' : type}
          className={styles.input({ className })}
          ref={ref}
          {...props}
        />
        {type === 'password' && <PasswordToggle />}
        {showCopyButton && !type && <CopyButton />}
      </ark.div>
    )
  }
)

Input.displayName = 'Input'

export { Input }
