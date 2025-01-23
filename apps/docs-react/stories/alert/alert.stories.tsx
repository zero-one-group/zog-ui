import type { AlertVariants } from '@repo/core-ui/alert.css'
import { Alert, AlertDescription, AlertIcon, AlertTitle } from '@repo/ui-react/alert'
import type { Meta, StoryObj } from '@storybook/react'
import * as Lucide from 'lucide-react'
import * as React from 'react'

const variantOptions: NonNullable<AlertVariants['variant']>[] = ['default', 'destructive']

const meta: Meta<typeof Alert> = {
  title: 'Basic Components/Alert',
  component: Alert,
  argTypes: {
    variant: {
      control: { type: 'radio' },
      options: variantOptions,
      table: {
        defaultValue: { summary: 'default' },
        type: { summary: 'AlertVariants["variant"]' },
      },
    },
  },
}

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  render: (args) => (
    <Alert {...args}>
      <AlertIcon asChild>
        <Lucide.Info className="size-4" />
      </AlertIcon>
      <AlertTitle>Heads up!</AlertTitle>
      <AlertDescription>
        You can add components and dependencies to your app using the cli.
      </AlertDescription>
    </Alert>
  ),
}

export const VariantShowcase: Story = {
  parameters: {
    controls: { exclude: ['variant'] },
  },
  render: (args) => (
    <div className="flex flex-col gap-4">
      <Alert {...args}>
        <AlertIcon asChild>
          <Lucide.Info className="size-4" />
        </AlertIcon>
        <AlertTitle>Default Alert</AlertTitle>
        <AlertDescription>This is a default alert - check it out!</AlertDescription>
      </Alert>

      <Alert {...args} variant="destructive">
        <Lucide.AlertCircle className="size-4" />
        <AlertTitle>Error Alert</AlertTitle>
        <AlertDescription>Something went wrong! Please try again later.</AlertDescription>
      </Alert>
    </div>
  ),
}
