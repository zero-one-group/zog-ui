import type { Assign } from '@ark-ui/react'
import type { HTMLArkProps, HTMLProps } from '@ark-ui/react/factory'
import { ark } from '@ark-ui/react/factory'
import { type BreadcrumbVariants, breadcrumbStyles } from '@repo/core-ui/breadcrumb.css'
import * as Lucide from 'lucide-react'
import * as React from 'react'

interface BreadcrumbProps extends Assign<HTMLArkProps<'nav'>, BreadcrumbVariants> {
  separator?: React.ReactNode
}

const Breadcrumb = React.forwardRef<HTMLElement, BreadcrumbProps>(({ ...props }, ref) => (
  <ark.nav ref={ref} aria-label="breadcrumb" {...props} />
))

const BreadcrumbList = React.forwardRef<HTMLOListElement, HTMLProps<'ol'>>(
  ({ className, ...props }, ref) => {
    const styles = breadcrumbStyles()
    return <ol ref={ref} className={styles.list({ className })} {...props} />
  }
)

const BreadcrumbItem = React.forwardRef<HTMLLIElement, HTMLProps<'li'>>(
  ({ className, ...props }, ref) => {
    const styles = breadcrumbStyles()
    return <li ref={ref} className={styles.item({ className })} {...props} />
  }
)

const BreadcrumbLink = React.forwardRef<HTMLAnchorElement, HTMLArkProps<'a'>>(
  ({ className, ...props }, ref) => {
    const styles = breadcrumbStyles()
    return <ark.a ref={ref} className={styles.link({ className })} {...props} />
  }
)

const BreadcrumbPage = React.forwardRef<HTMLSpanElement, HTMLProps<'span'>>(
  ({ className, ...props }, ref) => {
    const styles = breadcrumbStyles()
    return (
      <span
        ref={ref}
        aria-disabled="true"
        aria-current="page"
        className={styles.page({ className })}
        {...props}
      />
    )
  }
)

const BreadcrumbSeparator = ({ children, className, ...props }: HTMLProps<'span'>) => {
  const styles = breadcrumbStyles()
  return (
    <span
      role="presentation"
      aria-hidden="true"
      className={styles.separator({ className })}
      {...props}
    >
      {children ?? <Lucide.ChevronRight strokeWidth={2} />}
    </span>
  )
}

const BreadcrumbEllipsis = ({ className, ...props }: HTMLProps<'span'>) => {
  const styles = breadcrumbStyles()
  return (
    <span
      role="presentation"
      aria-hidden="true"
      className={styles.ellipsis({ className })}
      {...props}
    >
      <Lucide.Ellipsis className={styles.ellipsisIcon()} strokeWidth={2} />
      <ark.span className="sr-only hidden">More</ark.span>
    </span>
  )
}

Breadcrumb.displayName = 'Breadcrumb'
BreadcrumbList.displayName = 'BreadcrumbList'
BreadcrumbItem.displayName = 'BreadcrumbItem'
BreadcrumbLink.displayName = 'BreadcrumbLink'
BreadcrumbPage.displayName = 'BreadcrumbPage'
BreadcrumbSeparator.displayName = 'BreadcrumbSeparator'
BreadcrumbEllipsis.displayName = 'BreadcrumbEllipsis'

export {
  Breadcrumb,
  BreadcrumbList,
  BreadcrumbItem,
  BreadcrumbLink,
  BreadcrumbPage,
  BreadcrumbSeparator,
  BreadcrumbEllipsis,
}
