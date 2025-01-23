import { Switch } from '@repo/ui-react/switch'
import type { Meta, StoryObj } from '@storybook/react'
import * as React from 'react'

const meta: Meta<typeof Switch> = {
  title: 'Basic Components/Switch',
  component: Switch,
  argTypes: {
    checked: {
      control: 'boolean',
      description: 'The controlled checked state of the switch',
    },
    disabled: {
      control: 'boolean',
      description: 'When true, prevents the user from interacting with the switch',
    },
    defaultChecked: {
      control: 'boolean',
      description: 'The default checked state when initially rendered',
    },
  },
}

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  render: () => <Switch />,
}

export const SwitchShowcase: Story = {
  render: () => (
    <div className="flex flex-col gap-4">
      <div className="flex items-center gap-2">
        <Switch id="airplane-mode">Airplane Mode</Switch>
      </div>

      <div className="flex items-center gap-2">
        <Switch id="disabled" disabled>
          Disabled
        </Switch>
      </div>

      <div className="flex items-center gap-2">
        <Switch id="default-checked" defaultChecked>
          Default Checked
        </Switch>
      </div>
    </div>
  ),
}
