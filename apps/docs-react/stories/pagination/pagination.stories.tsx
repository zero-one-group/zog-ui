import { Button } from '@repo/ui-react/button'
import { Pagination, PaginationNext, PaginationPrevious } from '@repo/ui-react/pagination'
import { PaginationEllipsis, PaginationItem, PaginationLink } from '@repo/ui-react/pagination'
import { PaginationContent, PaginationContext } from '@repo/ui-react/pagination'
import type { Meta, StoryObj } from '@storybook/react'
import * as Lucide from 'lucide-react'
import * as React from 'react'

const meta: Meta<typeof Pagination> = {
  title: 'Basic Components/Pagination',
  component: Pagination,
}

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  render: () => {
    return (
      <Pagination count={40} pageSize={5} siblingCount={2}>
        <PaginationPrevious asChild>
          <Button variant="outline">
            <Lucide.ChevronLeft className="size-4" />
            <span>Previous</span>
          </Button>
        </PaginationPrevious>
        <PaginationContent>
          <PaginationContext>
            {(pagination) =>
              pagination.pages.map((page, index) =>
                page.type === 'page' ? (
                  <PaginationItem key={page.value} {...page}>
                    <PaginationLink href={`/${page.value}`} isActive={page.value === 3}>
                      {page.value}
                    </PaginationLink>
                  </PaginationItem>
                ) : (
                  <PaginationEllipsis key={page.type} index={index} />
                )
              )
            }
          </PaginationContext>
        </PaginationContent>
        <PaginationNext asChild>
          <Button variant="outline">
            <span>Next</span>
            <Lucide.ChevronRight className="size-4" />
          </Button>
        </PaginationNext>
      </Pagination>
    )
  },
}
