import type { RadioGroupVariants } from '@repo/core-ui/radio-group.css'
import { RadioGroup, RadioGroupItem, RadioGroupLabel } from '@repo/ui-react/radio-group'
import type { Meta, StoryObj } from '@storybook/react'
import * as React from 'react'

const orientationOptions: NonNullable<RadioGroupVariants['orientation']>[] = [
  'horizontal',
  'vertical',
]

const meta: Meta<typeof RadioGroup> = {
  title: 'Basic Components/RadioGroup',
  component: RadioGroup,
  argTypes: {
    orientation: {
      control: 'radio',
      options: orientationOptions,
      table: {
        defaultValue: { summary: 'vertical' },
        type: { summary: 'RadioGroupVariants["orientation"]' },
      },
    },
  },
}

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  args: {
    orientation: 'vertical',
  },
  render: (args) => {
    const options = [
      { id: 'all', label: 'All new messages' },
      { id: 'mentions', label: 'Direct messages and mentions' },
      { id: 'billing', label: 'Billing notifications' },
      { id: 'nothing', label: 'Nothing' },
    ]
    return (
      <RadioGroup defaultValue="react" {...args} onValueChange={(value) => console.info(value)}>
        <RadioGroupLabel>Notify me about...</RadioGroupLabel>
        <div className="flex flex-col space-y-3">
          {options.map((option) => (
            <RadioGroupItem key={option.id} value={option.id} disabled={option.id === 'billing'}>
              {option.label}
            </RadioGroupItem>
          ))}
        </div>
      </RadioGroup>
    )
  },
}

export const Horizontal: Story = {
  args: {
    orientation: 'horizontal',
  },
  render: (args) => {
    const options = [
      { id: 'react', label: 'React' },
      { id: 'solid', label: 'Solid' },
      { id: 'svelte', label: 'Svelte' },
      { id: 'vue', label: 'Vue' },
    ]
    return (
      <RadioGroup defaultValue="react" {...args} onValueChange={(value) => console.info(value)}>
        <RadioGroupLabel>Select an option:</RadioGroupLabel>
        <div className="flex flex-row space-x-2">
          {options.map((option) => (
            <RadioGroupItem key={option.id} value={option.id} disabled={option.id === 'svelte'}>
              {option.label}
            </RadioGroupItem>
          ))}
        </div>
      </RadioGroup>
    )
  },
}
