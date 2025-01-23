import { type VariantProps, tv } from 'tailwind-variants'

export const toastStyles = tv({
  slots: {
    root: [
      'overflow-anywhere relative min-w-xs rounded-md border p-4 shadow-lg',
      'translate-z-0 translate-x-[var(--x)] translate-y-[var(--y)] scale-[var(--scale)]',
      'z-[var(--z-index)] h-[var(--height)] opacity-[var(--opacity)] duration-300 ease-default',
      'transition-[translate,scale,opacity,height] will-change-[translate,opacity,scale]',
    ],
    title: 'font-semibold text-sm',
    description: 'mt-1 text-xs leading-tight',
    actionTrigger: 'mt-2.5',
    closeTrigger: [
      'absolute top-4 right-4 rounded-sm opacity-70 ring-offset-background transition-opacity hover:opacity-100',
      'focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:pointer-events-none',
      'cursor-pointer data-[state=open]:bg-accent data-[state=open]:text-muted-foreground',
    ],
    closeIcon: 'size-4',
  },
  variants: {
    variant: {
      info: {
        root: 'border-border bg-background text-muted-foreground',
        title: 'text-foreground',
        description: 'text-muted-foreground',
      },
      success: {
        root: 'border-green-300 bg-green-50 text-success dark:border-green-800 dark:bg-background',
        title: 'text-success',
        description: 'text-success/90',
      },
      error: {
        root: 'border-red-300 bg-red-50 text-success dark:border-red-800 dark:bg-background',
        title: 'text-error',
        description: 'text-error/90',
      },
      loading: {
        root: 'text border-muted bg-background',
        title: 'text-foreground',
        description: 'text-muted-foreground',
      },
    },
    size: {
      sm: {
        root: 'p-3',
        title: 'text-sm',
        description: 'text-xs',
      },
      md: {
        root: 'p-4',
        title: 'text-sm',
        description: 'text-sm',
      },
      lg: {
        root: 'p-6',
        title: 'text-base',
        description: 'text-sm',
      },
    },
  },
  defaultVariants: {
    variant: 'info',
    size: 'md',
  },
})

export type ToastVariants = VariantProps<typeof toastStyles>
