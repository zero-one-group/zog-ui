import { type VariantProps, tv } from 'tailwind-variants'

export const tabsStyles = tv({
  slots: {
    base: 'flex w-full data-[orientation=vertical]:flex-row data-[orientation=horizontal]:flex-col',
    list: [
      'inline-flex h-9 items-center justify-center rounded-lg bg-muted p-1 text-muted-foreground',
      'data-[orientation=horizontal]:flex-row data-[orientation=vertical]:flex-col',
    ],
    trigger: [
      'inline-flex shrink-0 cursor-pointer items-center justify-center whitespace-nowrap',
      'rounded-md px-3 py-1 font-medium text-sm ring-offset-background transition-all focus:ring-0 focus-visible:outline-none focus-visible:ring-1',
      'focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50',
      'data-[selected]:bg-background data-[selected]:text-foreground data-[selected]:shadow',
      'data-[orientation=vertical]:justify-start',
    ],
    content: [
      'mt-2 ring-offset-background focus:ring-0 focus-visible:outline-none',
      'focus-visible:ring-1 focus-visible:ring-ring focus-visible:ring-offset-2',
    ],
  },
})

export type TabsVariants = VariantProps<typeof tabsStyles>
