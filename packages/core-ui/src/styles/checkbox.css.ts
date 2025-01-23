import { type VariantProps, tv } from 'tailwind-variants'

export const checkboxStyles = tv({
  slots: {
    root: 'group inline-flex items-center gap-2',
    base: [
      'peer size-[18px] shrink-0 rounded-[4px] border border-input ring-offset-background',
      'focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2',
      'transition-colors duration-200 disabled:cursor-not-allowed disabled:opacity-50',
      'data-[state=checked]:bg-primary data-[state=checked]:text-primary-foreground',
      'data-[state=checked]:border-primary',
    ],
    indicator: [
      'flex items-center justify-center text-current',
      'data-[state=checked]:zoom-in-50 data-[state=checked]:animate-in',
    ],
    label: [
      'text-sm leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70',
      'select-none',
    ],
    icon: 'size-4 stroke-[3px]',
  },
})

export type CheckboxVariants = VariantProps<typeof checkboxStyles>
