import { type VariantProps, tv } from 'tailwind-variants'

export const radioGroupStyles = tv({
  slots: {
    root: 'grid gap-3',
    label: [
      'font-medium text-sm leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70',
    ],
    item: [
      'text-foreground ring-offset-background focus:outline-none',
      'focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2',
      'disabled:opacity-50 data-[disabled]:cursor-not-allowed',
      'data-[disabled]:border-muted-foreground',
    ],
    control: [
      'flex cursor-pointer items-center justify-center rounded-full bg-transparent p-0.5',
      'border border-muted-foreground data-[state=checked]:border-transparent',
      'after:block after:h-2.5 after:w-2.5 after:rounded-full',
      'data-[state=checked]:after:block data-[state=checked]:after:bg-foreground',
      'data-[state=checked]:outline data-[state=checked]:outline-foreground',
      'data-[disabled]:cursor-not-allowed data-[disabled]:border-muted',
      'data-[disabled]:hover:bg-transparent data-[disabled]:hover:text-muted-foreground',
      '',
    ],
    itemText: [
      'font-medium text-sm leading-none data-[disabled]:text-muted-foreground',
      'peer-disabled:cursor-not-allowed peer-disabled:opacity-70',
    ],
  },
  variants: {
    orientation: {
      horizontal: {
        root: 'flex flex-row space-x-1',
      },
      vertical: {
        root: 'flex flex-col space-y-1',
        item: 'flex items-center space-x-2',
      },
    },
  },
  compoundVariants: [],
  defaultVariants: {
    orientation: 'vertical',
  },
})

export type RadioGroupVariants = VariantProps<typeof radioGroupStyles>
