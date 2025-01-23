import type { DividerVariants } from '@repo/core-ui/divider.css'
import { Button } from '@repo/ui-react/button'
import { Divider } from '@repo/ui-react/divider'
import type { Meta, StoryObj } from '@storybook/react'
import * as Lucide from 'lucide-react'
import * as React from 'react'

const variantOptions: NonNullable<DividerVariants['variant']>[] = [
  'line',
  'line-text',
  'content',
  'text',
  'solid-text',
]

const meta: Meta<typeof Divider> = {
  title: 'Basic Components/Divider',
  component: Divider,
  argTypes: {
    variant: {
      control: { type: 'select' },
      options: variantOptions,
    },
  },
}

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  render: () => (
    <div className="w-full max-w-96">
      <Divider variant="line" />
    </div>
  ),
}

export const LineSpacing: Story = {
  render: () => (
    <div className="w-full max-w-96">
      <Divider variant="line-spacing" />
    </div>
  ),
}

export const LineText: Story = {
  render: () => (
    <div className="w-full max-w-96">
      <Divider variant="line-text">OR</Divider>
    </div>
  ),
}
export const DividerText: Story = {
  render: () => (
    <div className="w-full max-w-96">
      <Divider variant="text">OR</Divider>
    </div>
  ),
}

export const SolidText: Story = {
  render: () => (
    <div className="w-full max-w-96">
      <Divider variant="solid-text">Amount & Account</Divider>
    </div>
  ),
}

export const DividerContent: Story = {
  render: () => (
    <div className="w-full max-w-96">
      <Divider variant="content">
        <Button variant="outline" size="icon">
          <Lucide.Plus />
        </Button>
      </Divider>
    </div>
  ),
}
