import type { ProgressVariants } from '@repo/core-ui/progress.css'
import { Progress } from '@repo/ui-react/progress'
import type { Meta, StoryObj } from '@storybook/react'
import * as React from 'react'

const sizeOptions: NonNullable<ProgressVariants['size']>[] = ['default', 'sm', 'lg']

const meta: Meta<typeof Progress> = {
  title: 'Basic Components/Progress',
  component: Progress,
  args: {
    value: 60,
  },
  argTypes: {
    value: {
      control: { type: 'range', min: 0, max: 100 },
    },
    size: {
      control: 'radio',
      options: sizeOptions,
      table: {
        defaultValue: { summary: 'default' },
        type: { summary: 'ProgressVariants["size"]' },
      },
    },
  },
}

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  args: {
    label: 'Progress',
  },
  render: (args) => (
    <div className="min-w-[300px]">
      <Progress {...args} />
    </div>
  ),
}

export const Variants: Story = {
  render: (_args) => (
    <div className="min-w-[300px] space-y-4">
      <Progress size="sm" value={45} showValue={false} />
      <Progress size="default" value={72} showValue={false} variant="destructive" />
      <Progress size="lg" value={86} showValue={true} variant="success" />
    </div>
  ),
}
