import { Button } from '@repo/ui-react/button'
import { Tooltip, TooltipContent, TooltipPotitioner, TooltipTrigger } from '@repo/ui-react/tooltip'
import type { Meta, StoryObj } from '@storybook/react'
import * as Lucide from 'lucide-react'
import React from 'react'

const meta: Meta<typeof Tooltip> = {
  title: 'Basic Components/Tooltip',
  component: Tooltip,
}
export default meta

type Story = StoryObj<typeof meta>

export const Default: Story = {
  render: (args) => (
    <div className="flex min-h-screen ">
      <div className="container mx-auto items-center gap-4 px-4 py-16">
        <Tooltip {...args}>
          <TooltipTrigger>
            <Button>Hover Me</Button>
          </TooltipTrigger>
          <TooltipPotitioner>
            <TooltipContent>I am a tooltip!</TooltipContent>
          </TooltipPotitioner>
        </Tooltip>
      </div>
    </div>
  ),
}

export const VariantPosition: Story = {
  render: (args) => (
    <div className="flex min-h-screen ">
      <div className="container mx-auto items-center gap-4 px-4 py-16">
        <div className="flex flex-wrap items-center">
          <div className="grid grid-cols-2 gap-4">
            <Tooltip
              {...args}
              positioning={{
                placement: 'right',
              }}
            >
              <TooltipTrigger>
                <Button>Hover Me</Button>
              </TooltipTrigger>
              <TooltipPotitioner>
                <TooltipContent>tooltip on right</TooltipContent>
              </TooltipPotitioner>
            </Tooltip>
            <Tooltip
              {...args}
              positioning={{
                placement: 'left',
              }}
            >
              <TooltipTrigger>
                <Button>Hover Me</Button>
              </TooltipTrigger>
              <TooltipPotitioner>
                <TooltipContent>tooltip on left</TooltipContent>
              </TooltipPotitioner>
            </Tooltip>
            <Tooltip
              {...args}
              positioning={{
                placement: 'top',
              }}
            >
              <TooltipTrigger>
                <Button>Hover Me</Button>
              </TooltipTrigger>
              <TooltipPotitioner>
                <TooltipContent>tooltip on top</TooltipContent>
              </TooltipPotitioner>
            </Tooltip>
            <Tooltip
              {...args}
              positioning={{
                placement: 'bottom',
              }}
            >
              <TooltipTrigger>
                <Button>Hover Me</Button>
              </TooltipTrigger>
              <TooltipPotitioner>
                <TooltipContent>tooltip on bottom</TooltipContent>
              </TooltipPotitioner>
            </Tooltip>
          </div>
        </div>
      </div>
    </div>
  ),
}

export const WithContentIcon: Story = {
  render: (args) => (
    <div className="flex min-h-screen ">
      <div className="container mx-auto items-center gap-4 px-4 py-16">
        <Tooltip {...args}>
          <TooltipTrigger>
            <Button>Hover Me</Button>
          </TooltipTrigger>
          <TooltipPotitioner>
            <TooltipContent>
              <div className="flex flex-auto items-center gap-2">
                <Lucide.Github size={16} />
                tooltip on bottom
              </div>
            </TooltipContent>
          </TooltipPotitioner>
        </Tooltip>
      </div>
    </div>
  ),
}
