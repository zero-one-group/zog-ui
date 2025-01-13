import { type VariantProps, tv } from 'tailwind-variants'

export const inputStyles = tv({
  slots: {
    wrapper: 'relative',
    wrapperWithCopy: 'flex gap-2',
    input:
      'flex h-9 w-full rounded-md border border-input bg-transparent px-3 py-1 text-sm shadow-sm transition-colors file:border-0 file:bg-transparent file:font-medium file:text-foreground file:text-sm placeholder:text-muted-foreground/60 focus:ring-0 focus-visible:border-primary focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-primary/50 disabled:cursor-not-allowed disabled:opacity-50',
    inputWithIcon: 'pr-10',
    toggleButton:
      '-translate-y-1/2 absolute top-1/2 right-3 cursor-pointer text-muted-foreground/60 transition-colors duration-200 hover:text-muted-foreground',
    copyButton:
      '-translate-y-1/2 absolute top-1/2 right-3 cursor-pointer text-muted-foreground/60 transition-colors duration-200 hover:text-muted-foreground',
  },
  variants: {
    hasPasswordToggle: {
      true: {
        input: 'pr-10',
      },
    },
    hasCopyButton: {
      true: {
        input: 'pr-10',
      },
    },
  },
})

export type InputVariants = VariantProps<typeof inputStyles>
