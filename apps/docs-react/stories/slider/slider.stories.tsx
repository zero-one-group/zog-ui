import { Slider, SliderControl, SliderLabel, SliderValue } from '@repo/ui-react/slider'
import type { Meta, StoryObj } from '@storybook/react'
import * as React from 'react'

const meta: Meta<typeof Slider> = {
  title: 'Basic Components/Slider',
  component: Slider,
  argTypes: {
    defaultValue: {
      control: 'object',
      description: 'The default value of the slider',
    },
    max: {
      control: 'number',
      description: 'The maximum value for the slider',
    },
    step: {
      control: 'number',
      description: 'The stepping interval',
    },
    disabled: {
      control: 'boolean',
      description: 'When true, prevents the user from interacting with the slider',
    },
  },
}

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  render: () => (
    <div className="w-full min-w-[600px] p-6">
      <Slider defaultValue={[50]} max={100} step={1} className="w-[60%]">
        <SliderLabel>Progress</SliderLabel>
        <SliderControl />
        <SliderValue />
      </Slider>
    </div>
  ),
}

export const SliderShowcase: Story = {
  render: () => (
    <div className="flex w-full min-w-[600px] flex-col gap-8">
      <Slider defaultValue={[50]} max={100} step={1}>
        <SliderLabel>Default Slider</SliderLabel>
        <SliderControl />
        <SliderValue />
      </Slider>

      <Slider defaultValue={[25, 75]} max={100} step={1}>
        <SliderLabel>Range Slider</SliderLabel>
        <SliderControl />
        <SliderValue />
      </Slider>

      <Slider defaultValue={[40]} max={100} step={1} disabled>
        <SliderLabel>Disabled Slider</SliderLabel>
        <SliderControl />
        <SliderValue />
      </Slider>

      <Slider defaultValue={[20]} max={100} step={20}>
        <SliderLabel>Step Slider</SliderLabel>
        <SliderControl />
        <SliderValue />
      </Slider>
    </div>
  ),
}
