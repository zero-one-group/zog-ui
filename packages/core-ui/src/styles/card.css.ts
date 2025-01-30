import { type VariantProps, tv } from 'tailwind-variants'

export const cardStyles = tv({
  slots: {
    base: 'rounded-lg border bg-card text-card-foreground shadow-sm max-w-sm',
    header: 'flex flex-col space-y-1.5 p-6 pb-0',
    title: 'font-semibold leading-none tracking-tight',
    description: 'text-muted-foreground text-sm',
    content: 'p-6 space-y-2',
    footer: 'flex items-center p-6 pt-0 gap-x-2',
  },
})

export type CardVariants = VariantProps<typeof cardStyles>
