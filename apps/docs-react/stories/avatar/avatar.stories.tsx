import { getInitials } from '@repo/core-ui/utils'
import { Avatar, AvatarFallback, AvatarImage } from '@repo/ui-react/avatar'
import type { Meta, StoryObj } from '@storybook/react'
import * as React from 'react'

const meta: Meta = {
  title: 'Basic Components/Avatar',
  component: Avatar,
  argTypes: {
    className: {
      control: 'text',
      description: 'Additional classes to apply',
    },
  },
}

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  render: () => (
    <Avatar>
      <AvatarImage src="https://avatars.githubusercontent.com/u/921834?v=4" alt="@riipandi" />
      <AvatarFallback>{getInitials('Aris Ripandi')}</AvatarFallback>
    </Avatar>
  ),
}

export const AvatarShowcase: Story = {
  render: () => (
    <div className="flex items-center gap-4">
      <Avatar>
        <AvatarImage src="https://avatars.githubusercontent.com/u/921834?v=4" alt="@riipandi" />
        <AvatarFallback>{getInitials('Aris Ripandi')}</AvatarFallback>
      </Avatar>
      <Avatar>
        <AvatarImage src="https://github.com/riipandi.png" alt="@riipandi" />
        <AvatarFallback>{getInitials('Aris Ripandi')}</AvatarFallback>
      </Avatar>
      <Avatar>
        <AvatarFallback>{getInitials('John Doe')}</AvatarFallback>
      </Avatar>
    </div>
  ),
}
