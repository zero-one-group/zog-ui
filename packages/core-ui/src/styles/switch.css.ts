import { type VariantProps, tv } from 'tailwind-variants'

export const switchStyles = tv({
  slots: {
    root: [
      'inline-flex cursor-pointer items-center justify-center gap-2',
      'data-[disabled]:cursor-not-allowed data-[disabled]:opacity-50',
    ],
    control: [
      'peer inline-flex h-5 w-9 shrink-0 cursor-pointer items-center rounded-full border-2',
      'border-transparent shadow-xs transition-colors',
      'focus:ring-0 focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring',
      'focus-visible:ring-offset-2 focus-visible:ring-offset-background',
      'data-[state=checked]:bg-primary data-[state=unchecked]:bg-input',
      'data-[disabled]:cursor-not-allowed data-[disabled]:opacity-50',
      'group-data-[disabled]:pointer-events-none',
    ],
    thumb: [
      'pointer-events-none block size-4 rounded-full bg-background shadow-lg ring-0 transition-transform',
      'data-[state=checked]:translate-x-4 data-[state=unchecked]:translate-x-0',
      'group-data-[disabled]:opacity-50',
    ],
    label: [
      'font-medium text-sm leading-none',
      'group-data-[disabled]:cursor-not-allowed group-data-[disabled]:opacity-50',
    ],
  },
})

export type SwitchVariants = VariantProps<typeof switchStyles>
