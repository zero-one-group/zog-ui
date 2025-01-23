import { type VariantProps, tv } from 'tailwind-variants'

export const progressStyles = tv({
  slots: {
    base: 'relative w-full overflow-hidden rounded-full bg-secondary/20',
    track: 'flex h-full w-full items-center',
    range: [
      'h-full flex-1 bg-primary transition-all',
      'motion-safe:animate-in motion-safe:duration-300 motion-safe:ease-in-out',
      'data-[state=indeterminate]:motion-safe:animate-progress-loading',
    ],
    valueText: [
      '-translate-x-1/2 -translate-y-1/2 absolute top-1/2 left-1/2',
      'font-medium text-primary-foreground text-xs',
      'motion-safe:fade-in-0 motion-safe:animate-in',
    ],
    label: 'mb-2 font-medium text-foreground text-sm',
  },
  variants: {
    size: {
      sm: { base: 'h-1' },
      default: { base: 'h-2.5' },
      lg: { base: 'h-4' },
    },
    variant: {
      default: {
        range: 'bg-primary',
      },
      success: {
        range: 'bg-success',
      },
      destructive: {
        range: 'bg-destructive',
      },
    },
  },
  defaultVariants: {
    size: 'default',
    variant: 'default',
  },
})

export type ProgressVariants = VariantProps<typeof progressStyles>
