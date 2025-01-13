import { type VariantProps, tv } from 'tailwind-variants'

export const sidebarStyles = tv({
  slots: {
    base: '',
  },
  variants: {
    variant: {
      default: '',
    },
  },
  compoundVariants: [],
  defaultVariants: {
    variant: 'default',
  },
})

export type SidebarVariants = VariantProps<typeof sidebarStyles>

export const sidebarMenuButtonStyles = tv({
  base: 'peer/menu-button group-data-[collapsible=icon]:!size-8 group-data-[collapsible=icon]:!p-2 flex w-full items-center gap-2 overflow-hidden rounded-md p-2 text-left text-sm outline-none ring-sidebar-ring transition-[width,height,padding] hover:bg-sidebar-accent hover:text-sidebar-accent-foreground focus:ring-0 focus-visible:ring-1 active:bg-sidebar-accent active:text-sidebar-accent-foreground disabled:pointer-events-none disabled:opacity-50 group-has-[[data-sidebar=menu-action]]/menu-item:pr-8 aria-disabled:pointer-events-none aria-disabled:opacity-50 data-[active=true]:bg-sidebar-accent data-[active=true]:font-medium data-[active=true]:text-sidebar-accent-foreground data-[state=open]:hover:bg-sidebar-accent data-[state=open]:hover:text-sidebar-accent-foreground [&>span:last-child]:truncate [&>svg]:size-4 [&>svg]:shrink-0',
  variants: {
    variant: {
      default: 'hover:bg-sidebar-accent hover:text-sidebar-accent-foreground',
      outline:
        'bg-background shadow-[0_0_0_1px_hsl(var(--sidebar-border))] hover:bg-sidebar-accent hover:text-sidebar-accent-foreground hover:shadow-[0_0_0_1px_hsl(var(--sidebar-accent))]',
    },
    size: {
      default: 'h-8 text-sm',
      sm: 'h-7 text-xs',
      lg: 'group-data-[collapsible=icon]:!p-0 h-12 text-sm',
    },
  },
  compoundVariants: [],
  defaultVariants: {
    variant: 'default',
    size: 'default',
  },
})

export type SidebarMenuButtonVariants = VariantProps<typeof sidebarMenuButtonStyles>
