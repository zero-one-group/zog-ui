import { type VariantProps, tv } from 'tailwind-variants'

export const tooltipStyles = tv({
  slots: {
    base: [
      // Base styles
      'z-50 overflow-hidden rounded-md bg-black px-3 py-1.5 text-white text-xs shadow-md',

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
    // FIXME: the arrow tip is not shown
    arrowTip: 'debug relative border-border border-t border-l',
  },
})

export type TooltipVariants = VariantProps<typeof tooltipStyles>
