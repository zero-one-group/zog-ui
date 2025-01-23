import { type VariantProps, tv } from 'tailwind-variants'

export const sliderStyles = tv({
  slots: {
    root: 'flex w-full flex-col gap-1',
    control: 'relative flex items-center data-[disabled]:opacity-50',
    track: 'flex-1 overflow-hidden rounded-full bg-muted',
    range: 'bg-primary data-[disabled]:bg-muted-foreground/50',
    thumb: [
      'z-[1] rounded-full border-2 border-primary bg-background shadow-sm outline-none',
      'data-[disabled]:border-muted-foreground/50 data-[disabled]:bg-background',
      'data-[disabled]:cursor-not-allowed',
    ],
    label: 'font-medium text-foreground text-sm',
    valueText: 'font-medium text-foreground text-sm',
    markerGroup: '-mt-1',
    marker: [
      'text-muted-foreground',
      'before:bg-white dark:before:bg-primary-foreground',
      'before:block before:rounded-full before:content-[""]',
      'before:-translate-x-1/2 before:relative before:left-1/2',
    ],
  },
  variants: {
    size: {
      sm: {
        control: 'h-4',
        range: 'h-1.5',
        track: 'h-1.5',
        thumb: 'h-4 w-4',
        marker: 'text-sm before:top-[-10px] before:h-1 before:w-1',
        label: 'text-sm',
      },
      md: {
        control: 'h-5',
        range: 'h-2',
        track: 'h-2',
        thumb: 'h-5 w-5',
        marker: 'text-sm before:top-[-12px] before:h-1 before:w-1',
        label: 'text-sm',
      },
      lg: {
        control: 'h-6',
        range: 'h-2.5',
        track: 'h-2.5',
        thumb: 'h-6 w-6',
        marker: 'text-base before:top-[-15px] before:h-1.5 before:w-1.5',
        label: 'text-base',
      },
    },
  },
  defaultVariants: {
    size: 'md',
  },
})

export type SliderVariants = VariantProps<typeof sliderStyles>
