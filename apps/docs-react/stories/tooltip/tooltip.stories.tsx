import { Button } from '@repo/ui-react/button'
import { Tooltip, TooltipContent, TooltipTrigger } from '@repo/ui-react/tooltip'
import type { Meta, StoryObj } from '@storybook/react'
import * as Lucide from 'lucide-react'
import * as React from 'react'

const meta: Meta = {
  title: 'Basic Components/Tooltip',
  component: Tooltip,
  parameters: {
    layout: 'centered',
  },
}

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  render: () => (
    <Tooltip closeDelay={100} openDelay={100}>
      <TooltipTrigger asChild>
        <Button variant="outline" size="icon">
          <Lucide.Plus className="size-4" />
        </Button>
      </TooltipTrigger>
      <TooltipContent>
        <p>Add to library</p>
      </TooltipContent>
    </Tooltip>
  ),
}

export const TooltipShowcase: Story = {
  render: () => (
    <div className="flex items-center gap-8">
      <Tooltip>
        <TooltipTrigger asChild>
          <Button variant="outline">Hover me</Button>
        </TooltipTrigger>
        <TooltipContent>
          <p>Basic tooltip</p>
        </TooltipContent>
      </Tooltip>

      <Tooltip>
        <TooltipTrigger asChild>
          <Button variant="outline" size="icon">
            <Lucide.Settings className="size-4" />
          </Button>
        </TooltipTrigger>
        <TooltipContent>Settings</TooltipContent>
      </Tooltip>

      <Tooltip>
        <TooltipTrigger asChild>
          <Button variant="outline" size="icon">
            <Lucide.Bell className="size-4" />
          </Button>
        </TooltipTrigger>
        <TooltipContent>Notifications</TooltipContent>
      </Tooltip>
    </div>
  ),
}

export const PositionShowcase: Story = {
  render: () => (
    <div className="flex h-[200px] items-center justify-center gap-8">
      <Tooltip positioning={{ placement: 'top' }}>
        <TooltipTrigger asChild>
          <Button variant="outline">Top</Button>
        </TooltipTrigger>
        <TooltipContent>
          <p>Top tooltip</p>
        </TooltipContent>
      </Tooltip>

      <Tooltip positioning={{ placement: 'right' }}>
        <TooltipTrigger asChild>
          <Button variant="outline">Right</Button>
        </TooltipTrigger>
        <TooltipContent>
          <p>Right tooltip</p>
        </TooltipContent>
      </Tooltip>

      <Tooltip positioning={{ placement: 'bottom' }}>
        <TooltipTrigger asChild>
          <Button variant="outline">Bottom</Button>
        </TooltipTrigger>
        <TooltipContent>
          <p>Bottom tooltip</p>
        </TooltipContent>
      </Tooltip>

      <Tooltip positioning={{ placement: 'left' }}>
        <TooltipTrigger asChild>
          <Button variant="outline">Left</Button>
        </TooltipTrigger>
        <TooltipContent>
          <p>Left tooltip</p>
        </TooltipContent>
      </Tooltip>
    </div>
  ),
}
