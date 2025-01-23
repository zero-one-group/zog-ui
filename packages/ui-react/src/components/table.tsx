import { type Assign } from '@ark-ui/react'
import type { HTMLArkProps, HTMLProps } from '@ark-ui/react/factory'
import { ark } from '@ark-ui/react/factory'
import { type TableVariants, tableStyles } from '@repo/core-ui/table.css'
import * as React from 'react'

const Table = React.forwardRef<HTMLTableElement, Assign<HTMLArkProps<'table'>, TableVariants>>(
  ({ className, ...props }, ref) => {
    const styles = tableStyles()
    return (
      <ark.div className={styles.wrapper()}>
        <ark.table ref={ref} className={styles.table({ className })} {...props} />
      </ark.div>
    )
  }
)

const TableHeader = React.forwardRef<HTMLTableSectionElement, HTMLProps<'thead'>>(
  ({ className, ...props }, ref) => {
    const styles = tableStyles()
    return <ark.thead ref={ref} className={styles.header({ className })} {...props} />
  }
)

const TableBody = React.forwardRef<HTMLTableSectionElement, HTMLProps<'tbody'>>(
  ({ className, ...props }, ref) => {
    const styles = tableStyles()
    return <ark.tbody ref={ref} className={styles.body({ className })} {...props} />
  }
)

const TableFooter = React.forwardRef<HTMLTableSectionElement, HTMLProps<'tfoot'>>(
  ({ className, ...props }, ref) => {
    const styles = tableStyles()
    return <ark.tfoot ref={ref} className={styles.footer({ className })} {...props} />
  }
)

const TableRow = React.forwardRef<HTMLTableRowElement, HTMLProps<'tr'>>(
  ({ className, ...props }, ref) => {
    const styles = tableStyles()
    return <ark.tr ref={ref} className={styles.row({ className })} {...props} />
  }
)

const TableHead = React.forwardRef<HTMLTableCellElement, HTMLProps<'th'>>(
  ({ className, ...props }, ref) => {
    const styles = tableStyles()
    return <ark.th ref={ref} className={styles.head({ className })} {...props} />
  }
)

const TableCell = React.forwardRef<HTMLTableCellElement, HTMLProps<'td'>>(
  ({ className, ...props }, ref) => {
    const styles = tableStyles()
    return <ark.td ref={ref} className={styles.cell({ className })} {...props} />
  }
)

const TableCaption = React.forwardRef<HTMLTableCaptionElement, HTMLProps<'caption'>>(
  ({ className, ...props }, ref) => {
    const styles = tableStyles()
    return <ark.caption ref={ref} className={styles.caption({ className })} {...props} />
  }
)

Table.displayName = 'Table'
TableHeader.displayName = 'TableHeader'
TableBody.displayName = 'TableBody'
TableFooter.displayName = 'TableFooter'
TableRow.displayName = 'TableRow'
TableHead.displayName = 'TableHead'
TableCell.displayName = 'TableCell'
TableCaption.displayName = 'TableCaption'

export { Table, TableHeader, TableBody, TableFooter, TableHead, TableRow, TableCell, TableCaption }
