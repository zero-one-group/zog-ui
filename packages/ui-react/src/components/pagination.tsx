import { type Assign } from '@ark-ui/react'
import { type HTMLArkProps, type HTMLProps, ark } from '@ark-ui/react/factory'
import { Pagination as PaginationPrimitive } from '@ark-ui/react/pagination'
import { buttonStyles } from '@repo/core-ui/button.css'
import { paginationStyles } from '@repo/core-ui/pagination.css'
import * as Lucide from 'lucide-react'
import * as React from 'react'
import type { ButtonProps } from './button'

const PaginationContext = PaginationPrimitive.Context

const Pagination = React.forwardRef<
  React.ComponentRef<typeof PaginationPrimitive.Root>,
  React.ComponentPropsWithoutRef<typeof PaginationPrimitive.Root>
>(({ className, ...props }, ref) => {
  const styles = paginationStyles()
  return <PaginationPrimitive.Root ref={ref} className={styles.base({ className })} {...props} />
})

const PaginationContent = React.forwardRef<HTMLUListElement, HTMLArkProps<'ul'>>(
  ({ className, ...props }, ref) => {
    const styles = paginationStyles()
    return <ark.ul ref={ref} className={styles.content({ className })} {...props} />
  }
)

const PaginationItem = React.forwardRef<HTMLLIElement, HTMLArkProps<'li'>>(
  ({ className, ...props }, ref) => {
    const styles = paginationStyles()
    return <ark.li ref={ref} className={styles.item({ className })} {...props} />
  }
)

export interface PaginationLinkProps extends Assign<Pick<ButtonProps, 'size'>, HTMLProps<'a'>> {
  isActive?: boolean
}

const PaginationLink = ({ className, isActive, size = 'icon', ...props }: PaginationLinkProps) => {
  return (
    <ark.a
      className={buttonStyles({ variant: isActive ? 'outline' : 'ghost', size, className })}
      aria-current={isActive ? 'page' : undefined}
      {...props}
    />
  )
}

const PaginationPrevious = React.forwardRef<
  React.ComponentRef<typeof PaginationPrimitive.PrevTrigger>,
  React.ComponentPropsWithoutRef<typeof PaginationPrimitive.PrevTrigger>
>(({ className, ...props }, ref) => {
  const styles = paginationStyles()
  return (
    <PaginationPrimitive.PrevTrigger
      className={styles.previous({ className })}
      aria-label="Go to previous page"
      ref={ref}
      {...props}
    />
  )
})

const PaginationNext = React.forwardRef<
  React.ComponentRef<typeof PaginationPrimitive.NextTrigger>,
  React.ComponentPropsWithoutRef<typeof PaginationPrimitive.NextTrigger>
>(({ className, ...props }, ref) => {
  const styles = paginationStyles()
  return (
    <PaginationPrimitive.NextTrigger
      className={styles.next({ className })}
      aria-label="Go to next page"
      ref={ref}
      {...props}
    />
  )
})

const PaginationEllipsis = React.forwardRef<
  React.ComponentRef<typeof PaginationPrimitive.Ellipsis>,
  React.ComponentPropsWithoutRef<typeof PaginationPrimitive.Ellipsis>
>(({ className, ...props }, ref) => {
  const styles = paginationStyles()
  return (
    <PaginationPrimitive.Ellipsis ref={ref} className={styles.ellipsis({ className })} {...props}>
      <Lucide.MoreHorizontal className={styles.ellipsisIcon()} />
      <ark.span className="sr-only hidden">More pages</ark.span>
    </PaginationPrimitive.Ellipsis>
  )
})

Pagination.displayName = 'Pagination'
PaginationContent.displayName = 'PaginationContent'
PaginationItem.displayName = 'PaginationItem'
PaginationLink.displayName = 'PaginationLink'
PaginationPrevious.displayName = 'PaginationPrevious'
PaginationNext.displayName = 'PaginationNext'
PaginationEllipsis.displayName = 'PaginationEllipsis'

export {
  Pagination,
  PaginationContext,
  PaginationContent,
  PaginationLink,
  PaginationItem,
  PaginationPrevious,
  PaginationNext,
  PaginationEllipsis,
}
