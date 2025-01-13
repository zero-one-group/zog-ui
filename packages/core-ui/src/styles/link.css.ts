import { type VariantProps, tv } from 'tailwind-variants'

export const linkStyles = tv({
  slots: {
    base: [
      'inline-flex items-center gap-1 rounded-sm transition-colors duration-200 disabled:pointer-events-none disabled:opacity-50',
      'focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2',
    ],
    icon: ['size-3.5', 'shrink-0', 'transition-opacity'],
  },
  variants: {
    variant: {
      default: 'text-primary hover:text-primary/80',
      muted: 'text-muted-foreground hover:text-foreground',
      nav: 'text-foreground/60 hover:text-foreground',
      ghost: 'text-foreground/80 hover:text-foreground',
    },
    size: {
      sm: 'text-sm',
      default: 'text-base',
      lg: 'font-medium text-lg',
    },
    newTab: {
      true: '',
      false: '',
    },
  },
  compoundVariants: [
    {
      variant: ['default', 'muted'],
      className: 'underline-offset-4 hover:underline',
    },
    {
      variant: ['nav', 'ghost'],
      className: 'rounded-md px-2 py-1',
    },
    {
      variant: 'nav',
      className: 'hover:bg-accent/50',
    },
    {
      variant: 'ghost',
      className: 'hover:bg-accent',
    },
    {
      newTab: true,
      slots: {
        icon: 'inline-block',
      },
    },
    {
      newTab: false,
      slots: {
        icon: 'hidden',
      },
    },
  ],
  defaultVariants: {
    variant: 'default',
    size: 'default',
    newTab: false,
  },
})

export type LinkVariants = VariantProps<typeof linkStyles>
