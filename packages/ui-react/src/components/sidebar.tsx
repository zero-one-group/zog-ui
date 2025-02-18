import { type HTMLArkProps } from '@ark-ui/react/factory'
import type { ButtonVariants } from '@repo/core-ui/button.css'
import { sidebarMenuButtonStyles, sidebarStyles } from '@repo/core-ui/sidebar.css'
import { clx } from '@repo/core-ui/utils'
import * as Lucide from 'lucide-react'
import * as React from 'react'
import { Button } from './button'
import { Sheet, SheetContent } from './sheet'

const SIDEBAR_KEYBOARD_SHORTCUT = 'b'
const SIDEBAR_COOKIE_NAME = 'sidebar_state'
const SIDEBAR_COOKIE_MAX_AGE = 60 * 60 * 24 * 7
const SIDEBAR_WIDTH = '16rem'
const SIDEBAR_WIDTH_ICON = '3rem'

type SidebarContext = {
  state: 'expanded' | 'collapsed'
  open: boolean
  setOpen: (open: boolean) => void
  openMobile: boolean
  setOpenMobile: (open: boolean) => void
  isMobile: boolean
  toggleSidebar: () => void
}

const SidebarContext = React.createContext<SidebarContext | null>(null)

function useSidebar() {
  const context = React.useContext(SidebarContext)
  if (!context) {
    throw new Error('useSidebar must be used within a SidebarProvider.')
  }

  return context
}

const SidebarProvider = React.forwardRef<
  HTMLDivElement,
  HTMLArkProps<'div'> & {
    defaultOpen?: boolean
    open?: boolean
    onOpenChange?: (open: boolean) => void
  }
>(
  (
    {
      defaultOpen = true,
      open: openProp,
      onOpenChange: setOpenProp,
      style,
      className,
      children,
      ...props
    },
    ref
  ) => {
    const [isMobile, setIsMobile] = React.useState(false)
    const [openMobile, setOpenMobile] = React.useState(false)

    React.useEffect(() => {
      const handleResize = () => {
        setIsMobile(window.innerWidth < 768)
      }

      handleResize()
      window.addEventListener('resize', handleResize)
      return () => window.removeEventListener('resize', handleResize)
    }, [])

    const [_open, _setOpen] = React.useState(defaultOpen)
    const open = openProp ?? _open
    const setOpen = React.useCallback(
      (value: boolean | ((value: boolean) => boolean)) => {
        const openState = typeof value === 'function' ? value(open) : value
        if (setOpenProp) {
          setOpenProp(openState)
        } else {
          _setOpen(openState)
        }
        document.cookie = `${SIDEBAR_COOKIE_NAME}=${openState}; path=/; max-age=${SIDEBAR_COOKIE_MAX_AGE}`
      },
      [setOpenProp, open]
    )

    const toggleSidebar = React.useCallback(() => {
      return isMobile ? setOpenMobile((open) => !open) : setOpen((open) => !open)
    }, [isMobile, setOpen])

    React.useEffect(() => {
      const handleKeyDown = (event: KeyboardEvent) => {
        if (event.key === SIDEBAR_KEYBOARD_SHORTCUT && (event.metaKey || event.ctrlKey)) {
          event.preventDefault()
          toggleSidebar()
        }
      }

      window.addEventListener('keydown', handleKeyDown)
      return () => window.removeEventListener('keydown', handleKeyDown)
    }, [toggleSidebar])

    const state = open ? 'expanded' : 'collapsed'
    const contextValue = React.useMemo<SidebarContext>(
      () => ({
        state,
        open,
        setOpen,
        isMobile,
        openMobile,
        setOpenMobile,
        toggleSidebar,
      }),
      [state, open, setOpen, isMobile, openMobile, toggleSidebar]
    )

    const styles = sidebarStyles()

    return (
      <SidebarContext.Provider value={contextValue}>
        <div
          ref={ref}
          style={
            {
              '--sidebar-width': SIDEBAR_WIDTH,
              '--sidebar-width-icon': SIDEBAR_WIDTH_ICON,
              ...style,
            } as React.CSSProperties
          }
          className={clx(styles.sidebarProvider(), className)}
          {...props}
        >
          {children}
        </div>
      </SidebarContext.Provider>
    )
  }
)

const Sidebar = React.forwardRef<
  HTMLDivElement,
  React.ComponentPropsWithoutRef<'div'> & {
    hidden?: boolean
    side?: 'left' | 'right'
    variant?: 'sidebar' | 'floating' | 'inset'
    collapsible?: 'offcanvas' | 'icon' | 'none'
  }
>(
  (
    {
      hidden = true,
      side = 'left',
      variant = 'sidebar',
      collapsible = 'offcanvas',
      className,
      children,
      ...props
    },
    ref
  ) => {
    const { isMobile, state, openMobile, setOpenMobile } = useSidebar()

    if (collapsible === 'none') {
      return (
        <div
          className={clx(
            'flex h-full w-[--sidebar-width] flex-col bg-[var(--color-sidebar)] text-sidebar-foreground',
            className
          )}
          ref={ref}
          {...props}
        >
          {children}
        </div>
      )
    }

    if (isMobile) {
      return (
        <Sheet open={openMobile} onOpenChange={(e) => setOpenMobile(e.open)}>
          <SheetContent
            data-sidebar="sidebar"
            data-mobile="true"
            className="w-[var(--sidebar-width)] bg-[var(--color-sidebar)] p-0 text-sidebar-foreground duration-200 ease-linear [&>button]:hidden"
            side={side}
            {...props}
          >
            <div className="flex h-full w-full flex-col">{children}</div>
          </SheetContent>
        </Sheet>
      )
    }

    return (
      <div
        ref={ref}
        data-state={state}
        data-collapsible={state === 'collapsed' ? collapsible : ''}
        data-variant={variant}
        data-side={side}
        className={clx('group peer text-sidebar-foreground md:block', hidden && 'hidden')}
      >
        <div
          className={clx(
            'relative h-svh w-[var(--sidebar-width)] bg-transparent transition-[width] duration-200 ease-linear',
            'group-data-[collapsible=offcanvas]:w-0',
            'group-data-[side=right]:rotate-180',
            variant === 'floating' || variant === 'inset'
              ? 'group-data-[collapsible=icon]:w-[calc(var(--sidebar-width-icon)_+_theme(spacing.4))]'
              : 'group-data-[collapsible=icon]:w-[--sidebar-width-icon]'
          )}
        />
        <div
          className={clx(
            'fixed inset-y-0 z-10 h-svh w-[var(--sidebar-width)] transition-[left,right,width] duration-200 ease-linear md:flex',
            side === 'left'
              ? 'left-0 group-data-[collapsible=offcanvas]:left-[calc(var(--sidebar-width)*-1)]'
              : 'right-0 group-data-[collapsible=offcanvas]:right-[calc(var(--sidebar-width)*-1)]',
            // Adjust the padding for floating and inset variants.
            variant === 'floating' || variant === 'inset'
              ? 'p-2 group-data-[collapsible=icon]:w-[calc(var(--sidebar-width-icon)_+_theme(spacing.4)_+2px)]'
              : 'group-data-[collapsible=icon]:w-[var(--sidebar-width-icon)] group-data-[side=left]:border-r group-data-[side=right]:border-l',
            hidden && 'hidden',
            className
          )}
          {...props}
        >
          <div
            data-sidebar="sidebar"
            className="flex h-full w-full flex-col bg-[var(--color-sidebar)] group-data-[variant=floating]:rounded-lg group-data-[variant=floating]:border group-data-[variant=floating]:border-sidebar-border group-data-[variant=floating]:shadow"
          >
            {children}
          </div>
        </div>
      </div>
    )
  }
)
Sidebar.displayName = 'Sidebar'

const SidebarTrigger = React.forwardRef<
  HTMLButtonElement,
  React.ComponentPropsWithoutRef<typeof Button>
>(({ className, onClick, ...props }, ref) => {
  const { toggleSidebar } = useSidebar()
  const styles = sidebarStyles()
  return (
    <Button
      ref={ref}
      data-sidebar="trigger"
      className={clx(styles.sidebarTriggerButton(), className)}
      onClick={(event) => {
        onClick?.(event)
        toggleSidebar()
      }}
      {...props}
    >
      <Lucide.PanelLeft />
      {/* <span className="sr-only">Toggle Sidebar</span> */}
    </Button>
  )
})
SidebarTrigger.displayName = 'SidebarTrigger'

const SidebarHeader = React.forwardRef<HTMLDivElement, React.ComponentPropsWithoutRef<'div'>>(
  ({ className, ...props }, ref) => {
    const styles = sidebarStyles()

    return (
      <div ref={ref} data-sidebar="header" className={clx(styles.header(), className)} {...props} />
    )
  }
)
SidebarHeader.displayName = 'SidebarHeader'

const SidebarInset = React.forwardRef<HTMLDivElement, React.ComponentPropsWithoutRef<'main'>>(
  ({ className, ...props }, ref) => {
    const styles = sidebarStyles()
    return <main ref={ref} className={clx(styles.inset(), className)} {...props} />
  }
)
SidebarInset.displayName = 'SidebarInset'

const SidebarContent = React.forwardRef<HTMLDivElement, React.ComponentPropsWithoutRef<'div'>>(
  ({ className, ...props }, ref) => {
    const styles = sidebarStyles()

    return (
      <div
        ref={ref}
        data-sidebar="content"
        className={clx(styles.content(), className)}
        {...props}
      />
    )
  }
)
SidebarContent.displayName = 'SidebarContent'

const SidebarGroup = React.forwardRef<HTMLDivElement, React.ComponentPropsWithoutRef<'div'>>(
  ({ className, ...props }, ref) => {
    const styles = sidebarStyles()
    return (
      <div
        ref={ref}
        data-sidebar="group"
        className={clx(styles.sidebarGroup(), className)}
        {...props}
      />
    )
  }
)
SidebarGroup.displayName = 'SidebarGroup'

const SidebarGroupLabel = React.forwardRef<
  HTMLDivElement,
  React.ComponentPropsWithoutRef<'div'> & { asChild?: boolean }
>(({ className, asChild = false, ...props }, ref) => {
  const styles = sidebarStyles()

  return (
    <div
      ref={ref}
      data-sidebar="group-label"
      className={clx(styles.sidebarGroupLabel(), className)}
      {...props}
    />
  )
})
SidebarGroupLabel.displayName = 'SidebarGroupLabel'

const SidebarGroupContent = React.forwardRef<HTMLDivElement, React.ComponentPropsWithoutRef<'div'>>(
  ({ className, ...props }, ref) => {
    const styles = sidebarStyles()
    return (
      <div
        ref={ref}
        data-sidebar="group-content"
        className={clx(styles.sidebarGroupContent(), className)}
        {...props}
      />
    )
  }
)
SidebarGroupContent.displayName = 'SidebarGroupContent'

const SidebarMenu = React.forwardRef<HTMLUListElement, React.ComponentPropsWithoutRef<'ul'>>(
  ({ className, ...props }, ref) => {
    const styles = sidebarStyles()
    return (
      <ul
        ref={ref}
        data-sidebar="menu"
        className={clx(styles.sidebarMenu(), className)}
        {...props}
      />
    )
  }
)
SidebarMenu.displayName = 'SidebarMenu'

const SidebarMenuItem = React.forwardRef<HTMLLIElement, React.ComponentPropsWithoutRef<'li'>>(
  ({ className, ...props }, ref) => {
    const styles = sidebarStyles()
    return (
      <li
        ref={ref}
        data-sidebar="menu-item"
        className={clx(styles.sidebarMenuItem(), className)}
        {...props}
      />
    )
  }
)
SidebarMenuItem.displayName = 'SidebarMenuItem'

const SidebarMenuButton = React.forwardRef<
  HTMLButtonElement,
  React.ComponentPropsWithoutRef<'button'> & ButtonVariants
>(({ variant = 'default', size = 'default', className, ...props }, ref) => {
  const styles = sidebarMenuButtonStyles()
  return (
    <button
      ref={ref}
      data-sidebar="menu-button"
      className={clx(styles.base(), className)}
      {...props}
    />
  )
})
SidebarMenuButton.displayName = 'SidebarMenuButton'

const SidebarMenuSub = React.forwardRef<HTMLUListElement, React.ComponentPropsWithoutRef<'ul'>>(
  ({ className, ...props }, ref) => {
    const styles = sidebarStyles()
    return (
      <ul
        ref={ref}
        data-sidebar="menu-sub"
        className={clx(styles.sidebarMenuSub(), className)}
        {...props}
      />
    )
  }
)
SidebarMenuSub.displayName = 'SidebarMenuSub'

const SidebarMenuSubItem = React.forwardRef<HTMLLIElement, React.ComponentPropsWithoutRef<'li'>>(
  ({ className, ...props }, ref) => {
    const styles = sidebarStyles()
    return (
      <li
        ref={ref}
        data-sidebar="menu-sub-item"
        className={clx(styles.sidebarMenuItem(), className)}
        {...props}
      />
    )
  }
)
SidebarMenuSubItem.displayName = 'SidebarMenuSubItem'

const SidebarMenuSubButton = React.forwardRef<
  HTMLAnchorElement,
  React.ComponentPropsWithoutRef<'a'>
>(({ className, ...props }) => {
  const styles = sidebarMenuButtonStyles()

  return (
    <a data-sidebar="menu-sub-button" className={clx(styles.subButton(), className)} {...props} />
  )
})
SidebarMenuSubButton.displayName = 'SidebarMenuSubButton'

const SidebarFooter = React.forwardRef<HTMLDivElement, React.ComponentPropsWithoutRef<'div'>>(
  ({ className, ...props }, ref) => {
    const styles = sidebarStyles()
    return (
      <div ref={ref} data-sidebar="footer" className={clx(styles.footer(), className)} {...props} />
    )
  }
)
SidebarFooter.displayName = 'SidebarFooter'

const SidebarRail = React.forwardRef<HTMLButtonElement, React.ComponentPropsWithoutRef<'button'>>(
  ({ className, ...props }, ref) => {
    const { toggleSidebar } = useSidebar()
    const styles = sidebarStyles()

    return (
      <button
        ref={ref}
        data-sidebar="rail"
        aria-label="Toggle Sidebar"
        tabIndex={-1}
        onClick={toggleSidebar}
        title="Toggle Sidebar"
        className={clx(styles.rail(), className)}
        {...props}
      />
    )
  }
)
SidebarRail.displayName = 'SidebarRail'

export {
  Sidebar,
  SidebarContent,
  SidebarFooter,
  SidebarGroup,
  SidebarGroupContent,
  SidebarGroupLabel,
  SidebarHeader,
  SidebarInset,
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
  SidebarMenuSub,
  SidebarMenuSubButton,
  SidebarMenuSubItem,
  SidebarProvider,
  SidebarRail,
  SidebarTrigger,
}
