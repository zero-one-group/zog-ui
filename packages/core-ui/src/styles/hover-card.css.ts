import { type VariantProps, tv } from 'tailwind-variants'

export const hoverCardStyles = tv({
  slots: {
    content: [
      // Base styles
      'relative z-50 w-72 rounded-md border bg-popover p-4 text-popover-foreground shadow-md outline-none',

      // Entry animations
      'data-[state=open]:motion-safe:motion-opacity-in-0',
      'data-[state=open]:motion-safe:motion-scale-in-95',
      'data-[state=open]:motion-safe:motion-duration-200',

      // Exit animations
      'data-[state=closed]:motion-safe:motion-opacity-out-0',
      'data-[state=closed]:motion-safe:motion-scale-out-95',
      'data-[state=closed]:motion-safe:motion-duration-150',

      // Position-based slide animations
      'data-[placement=top]:motion-safe:motion-translate-y-in-2',
      'data-[placement=bottom]:motion-safe:motion-translate-y-in--2',
      'data-[placement=left]:motion-safe:motion-translate-x-in-2',
      'data-[placement=right]:motion-safe:motion-translate-x-in--2',
    ],
    arrowTip: 'relative border-border border-t border-l',
  },
})

export type HoverCardVariants = VariantProps<typeof hoverCardStyles>
