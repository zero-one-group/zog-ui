import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogPortal,
  AlertDialogTrigger,
} from '@repo/ui-react/alert-dialog'
import {
  AlertDialogCancel,
  AlertDialogDescription,
  AlertDialogTitle,
} from '@repo/ui-react/alert-dialog'
import {
  AlertDialogContent,
  AlertDialogFooter,
  AlertDialogHeader,
} from '@repo/ui-react/alert-dialog'
import { Button } from '@repo/ui-react/button'
import type { Meta, StoryObj } from '@storybook/react'
import { fn } from '@storybook/test'
import * as React from 'react'

const meta: Meta = {
  title: 'Basic Components/AlertDialog',
  component: AlertDialog,
  parameters: {
    layout: 'centered',
  },
  argTypes: {
    defaultOpen: {
      control: 'boolean',
      description: 'The open state of the dialog when it is initially rendered',
    },
  },
  args: { onOpenChange: fn() },
}

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  render: (args) => (
    <AlertDialog {...args}>
      <AlertDialogTrigger className="cursor-pointer hover:underline">
        Show Dialog
      </AlertDialogTrigger>
      <AlertDialogPortal>
        <AlertDialogContent>
          <AlertDialogHeader>
            <AlertDialogTitle>Are you absolutely sure?</AlertDialogTitle>
            <AlertDialogDescription>
              This action cannot be undone. This will permanently delete your account and remove
              your data from our servers.
            </AlertDialogDescription>
          </AlertDialogHeader>
          <AlertDialogFooter>
            <AlertDialogCancel>Cancel</AlertDialogCancel>
            <AlertDialogAction>Continue</AlertDialogAction>
          </AlertDialogFooter>
        </AlertDialogContent>
      </AlertDialogPortal>
    </AlertDialog>
  ),
}

export const WithAction: Story = {
  render: (args) => {
    const handleAction = () => {
      console.info('Do something')
    }

    return (
      <AlertDialog {...args}>
        <AlertDialogTrigger asChild>
          <Button variant="destructive">Delete Account</Button>
        </AlertDialogTrigger>
        <AlertDialogPortal>
          <AlertDialogContent>
            <AlertDialogHeader>
              <AlertDialogTitle>Warning</AlertDialogTitle>
              <AlertDialogDescription>
                You are about to enter a dangerous area. Are you sure you want to proceed?
              </AlertDialogDescription>
            </AlertDialogHeader>
            <AlertDialogFooter>
              <AlertDialogCancel>Go Back</AlertDialogCancel>
              <AlertDialogAction variant="destructive" onClick={handleAction}>
                I Understand
              </AlertDialogAction>
            </AlertDialogFooter>
          </AlertDialogContent>
        </AlertDialogPortal>
      </AlertDialog>
    )
  },
}
