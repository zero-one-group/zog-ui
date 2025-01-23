import { type VariantProps, tv } from 'tailwind-variants'

export const collapsibleStyles = tv({
  slots: {
    base: 'w-full',
    trigger: 'relative',
    content: [
      'overflow-hidden',
      // Entry animations
      'data-[state=open]:motion-safe:motion-opacity-in-0',
      'data-[state=open]:motion-safe:motion-scale-in-95',
      'data-[state=open]:motion-safe:motion-duration-200',

      // Exit animations
      'data-[state=closed]:motion-safe:motion-opacity-out-0',
      'data-[state=closed]:motion-safe:motion-scale-out-95',
      'data-[state=closed]:motion-safe:motion-duration-150',
    ],
  },
})

export type CollapsibleVariants = VariantProps<typeof collapsibleStyles>
