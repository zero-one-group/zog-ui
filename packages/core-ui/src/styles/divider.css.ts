import { type VariantProps, tv } from 'tailwind-variants'

export const dividerStyles = tv({
  base: 'relative flex w-full items-center',
  variants: {
    variant: {
      line: 'before:-translate-y-1/2 h-0 before:absolute before:top-1/2 before:left-0 before:h-px before:w-full before:bg-border',
      'line-spacing': [
        'before:-translate-y-1/2 h-1 before:absolute before:top-1/2 before:left-0 before:h-px before:w-full before:bg-border',
      ],
      'line-text': [
        'gap-2.5 text-muted-foreground text-sm',
        'before:h-px before:w-full before:flex-1 before:bg-border',
        'after:h-px after:w-full after:flex-1 after:bg-border',
      ],
      content: [
        'gap-2.5',
        'before:h-px before:w-full before:flex-1 before:bg-border',
        'after:h-px after:w-full after:flex-1 after:bg-border',
      ],
      text: 'px-2 py-1 text-muted-foreground text-xs',
      'solid-text': 'bg-muted px-5 py-1.5 text-muted-foreground text-xs uppercase',
    },
  },
  defaultVariants: {
    variant: 'line',
  },
})

export type DividerVariants = VariantProps<typeof dividerStyles>
