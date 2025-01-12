import { type VariantProps, tv } from 'tailwind-variants'

export const buttonStyles = tv({
  slots: {
    base: [
      'inline-flex cursor-pointer items-center justify-center gap-2 whitespace-nowrap rounded-md font-medium text-sm transition-colors',
      'focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring disabled:pointer-events-none disabled:opacity-50',
      '[&[data-loading=true]_svg:not(:first-child)]:hidden [&_svg]:pointer-events-none [&_svg]:size-4 [&_svg]:shrink-0',
    ],
  },
  variants: {
    variant: {
      default: 'bg-primary text-primary-foreground shadow hover:bg-primary/90',
      destructive: 'bg-destructive text-destructive-foreground shadow-sm hover:bg-destructive/90',
      outline:
        'border border-input bg-background shadow-sm hover:bg-accent hover:text-accent-foreground',
      secondary: 'bg-secondary text-secondary-foreground shadow-sm hover:bg-secondary/80',
      ghost: 'hover:bg-accent hover:text-accent-foreground',
      link: 'text-primary underline-offset-4 hover:underline',
    },
    size: {
      default: 'h-9 px-4 py-2',
      sm: 'h-8 rounded-md px-3 text-xs',
      lg: 'h-10 rounded-md px-8',
      icon: 'size-9',
    },
    isLoading: {
      true: 'pointer-events-none relative cursor-wait',
      false: '',
    },
  },
  compoundVariants: [
    {
      isLoading: true,
      className: '[&>svg]:-ml-1 [&>svg]:size-4 [&>svg]:animate-spin',
    },
    {
      variant: ['default', 'destructive', 'outline', 'secondary', 'ghost', 'link'],
      isLoading: true,
      className: 'text-white/70',
    },
    {
      size: ['icon'],
      isLoading: true,
      className: '[&>svg]:ml-0',
    },
    {
      variant: 'outline',
      size: ['icon', 'sm'],
      className: 'border',
    },
    {
      variant: ['ghost', 'link'],
      size: ['lg'],
      className: 'font-semibold tracking-wide',
    },
    {
      variant: ['default', 'destructive', 'outline', 'secondary', 'ghost', 'link'],
      size: ['lg'],
      className: 'shadow-md',
    },
  ],
  defaultVariants: {
    variant: 'default',
    size: 'default',
    isLoading: false,
  },
})

export type ButtonVariants = VariantProps<typeof buttonStyles>
