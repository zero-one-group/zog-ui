import { type VariantProps, tv } from 'tailwind-variants'

export const formStyles = tv({
  slots: {
    item: 'space-y-2',
    label: [
      'px-0.5 font-medium text-sm leading-none',
      'peer-disabled:cursor-not-allowed peer-disabled:opacity-70',
    ],
    control: '',
    description: 'mt-1 px-0.5 text-[0.8rem] text-muted-foreground',
    message: 'mt-1 px-0.5 font-normal text-[0.8rem] text-destructive',
  },
  variants: {
    error: {
      true: {
        message: 'text-foreground',
      },
    },
  },
})

export type FormVariants = VariantProps<typeof formStyles>
