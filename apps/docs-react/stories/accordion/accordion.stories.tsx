import { Accordion, AccordionTrigger } from '@repo/ui-react/accordion'
import { AccordionContent, AccordionItem } from '@repo/ui-react/accordion'
import type { Meta, StoryObj } from '@storybook/react'
import { fn } from '@storybook/test'
import * as React from 'react'

const meta: Meta = {
  title: 'Basic Components/Accordion',
  component: Accordion,
  argTypes: {
    type: {
      control: 'radio',
      options: ['single', 'multiple'],
      description: 'Determines whether one or multiple items can be opened at the same time',
      defaultValue: 'single',
    },
    collapsible: {
      control: 'boolean',
      description: 'When type is "single", allows closing content when clicking trigger',
      defaultValue: true,
    },
  },
  args: { onValueChange: fn() },
}

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  render: (args) => (
    <Accordion collapsible className="w-full min-w-[600px]" {...args}>
      <AccordionItem value="item-1">
        <AccordionTrigger>Is it accessible?</AccordionTrigger>
        <AccordionContent>Yes. It adheres to the WAI-ARIA design pattern.</AccordionContent>
      </AccordionItem>
      <AccordionItem value="item-2">
        <AccordionTrigger>Is it styled?</AccordionTrigger>
        <AccordionContent>
          Yes. It comes with default styles that matches the other components' aesthetic.
        </AccordionContent>
      </AccordionItem>
      <AccordionItem value="item-3">
        <AccordionTrigger>Is it animated?</AccordionTrigger>
        <AccordionContent>
          Yes. It's animated by default, but you can disable it if you prefer.
        </AccordionContent>
      </AccordionItem>
    </Accordion>
  ),
}

export const Multiple: Story = {
  render: (args) => (
    <Accordion multiple collapsible className="w-full min-w-[600px]" {...args}>
      <AccordionItem value="item-1">
        <AccordionTrigger>First Section</AccordionTrigger>
        <AccordionContent>You can open multiple sections at once.</AccordionContent>
      </AccordionItem>
      <AccordionItem value="item-2">
        <AccordionTrigger>Second Section</AccordionTrigger>
        <AccordionContent>Try clicking multiple headers.</AccordionContent>
      </AccordionItem>
    </Accordion>
  ),
}
