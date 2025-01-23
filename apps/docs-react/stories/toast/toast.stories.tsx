import { Button } from '@repo/ui-react/button'
import { Toaster, toast } from '@repo/ui-react/toast'
import type { Meta, StoryObj } from '@storybook/react'
import * as React from 'react'

const meta: Meta = {
  title: 'Basic Components/Toast',
  component: Toaster,
  parameters: {
    layout: 'centered',
  },
}

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  render: () => (
    <Button
      variant="outline"
      onClick={() => {
        toast.create({
          title: 'Event has been created',
          description: 'Sunday, December 03, 2023 at 9:00 AM',
          action: {
            label: 'View',
            onClick: () => console.info('Event has been created'),
          },
        })
      }}
    >
      Show Toast
    </Button>
  ),
}

export const AllVariants: Story = {
  render: () => (
    <div className="flex flex-wrap items-center gap-4">
      <Button
        variant="outline"
        onClick={() => {
          toast.create({
            title: 'Default Toast',
            description: 'This is a default toast message',
          })
        }}
      >
        Default
      </Button>

      <Button
        variant="outline"
        onClick={() => {
          toast.success({
            title: 'Success Toast',
            description: 'Your changes have been saved successfully.',
          })
        }}
      >
        Success
      </Button>

      <Button
        variant="outline"
        onClick={() => {
          toast.error({
            title: 'Error Toast',
            description: 'There was a problem with your request.',
          })
        }}
      >
        Error
      </Button>

      <Button
        variant="outline"
        onClick={() => {
          toast.create({
            title: 'Loading Toast',
            description: 'Please wait while we process your request...',
            type: 'loading',
          })
        }}
      >
        Loading
      </Button>
    </div>
  ),
}

export const WithActions: Story = {
  render: () => (
    <div className="flex flex-wrap items-center gap-4">
      <Button
        variant="outline"
        onClick={() => {
          toast.create({
            title: 'Delete Item',
            description: 'Are you sure you want to delete this item?',
            type: 'error',
            action: {
              label: 'Undo',
              onClick: () => console.log('Undo'),
            },
          })
        }}
      >
        With Undo Action
      </Button>

      <Button
        variant="outline"
        onClick={() => {
          toast.create({
            title: 'Update Available',
            description: 'A new version is available.',
            type: 'info',
            action: {
              label: 'Update Now',
              onClick: () => console.log('Update Now'),
            },
          })
        }}
      >
        With Update Action
      </Button>
    </div>
  ),
}

export const DifferentPlacements: Story = {
  render: () => (
    <div className="flex flex-wrap items-center gap-4">
      <Button
        variant="outline"
        onClick={() => {
          toast.create({
            title: 'Top Toast',
            description: 'This appears at the top',
            placement: 'top',
          })
        }}
      >
        Top
      </Button>

      <Button
        variant="outline"
        onClick={() => {
          toast.create({
            title: 'Top End Toast',
            description: 'This appears at the top-end',
            placement: 'top-end',
          })
        }}
      >
        Top End
      </Button>

      <Button
        variant="outline"
        onClick={() => {
          toast.create({
            title: 'Bottom Toast',
            description: 'This appears at the bottom',
            placement: 'bottom',
          })
        }}
      >
        Bottom
      </Button>
    </div>
  ),
}

export const WithPromise: Story = {
  render: () => (
    <Button
      variant="outline"
      onClick={() => {
        const promise = new Promise((resolve) => {
          setTimeout(resolve, 2000)
        })
        toast.promise(promise, {
          loading: { title: 'Loading', description: 'Please wait...' },
          success: { title: 'Success', description: 'Operation completed!' },
          error: { title: 'Error', description: 'Something went wrong.' },
        })
      }}
    >
      Start Promise Toast
    </Button>
  ),
}
