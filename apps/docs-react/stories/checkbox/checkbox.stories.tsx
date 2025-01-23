import { Checkbox } from '@repo/ui-react/checkbox'
import type { Meta, StoryObj } from '@storybook/react'
import * as React from 'react'

const meta: Meta<typeof Checkbox> = {
  title: 'Basic Components/Checkbox',
  component: Checkbox,
  argTypes: {
    checked: {
      control: 'boolean',
      description: 'The controlled checked state of the checkbox',
    },
    disabled: {
      control: 'boolean',
      description: 'When true, prevents the user from interacting with the checkbox',
    },
  },
}

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  render: () => (
    <div className="flex items-center space-x-2">
      <Checkbox id="terms">Accept terms and conditions</Checkbox>
    </div>
  ),
}

export const CheckboxShowcase: Story = {
  render: () => (
    <div className="flex flex-col gap-4">
      <div className="flex items-center space-x-2">
        <Checkbox id="default">Default Checkbox</Checkbox>
      </div>

      <div className="flex items-center space-x-2">
        <Checkbox id="checked" defaultChecked>
          Checked Checkbox
        </Checkbox>
      </div>

      <div className="flex items-center space-x-2">
        <Checkbox id="disabled" disabled>
          Disabled Checkbox
        </Checkbox>
      </div>

      <div className="flex items-center space-x-2">
        <Checkbox id="disabled-checked" disabled defaultChecked>
          Disabled Checked
        </Checkbox>
      </div>
    </div>
  ),
}
