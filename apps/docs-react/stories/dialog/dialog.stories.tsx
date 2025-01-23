import { Button } from '@repo/ui-react/button'
import {
  Dialog,
  DialogClose,
  DialogPortal,
  DialogTitle,
  DialogTrigger,
} from '@repo/ui-react/dialog'
import { DialogContent, DialogDescription, DialogFooter, DialogHeader } from '@repo/ui-react/dialog'
import { Input } from '@repo/ui-react/input'
import { Label } from '@repo/ui-react/label'
import type { Meta, StoryObj } from '@storybook/react'
import * as Lucide from 'lucide-react'
import * as React from 'react'

const meta: Meta<typeof Dialog> = {
  title: 'Basic Components/Dialog',
  parameters: {
    layout: 'centered',
  },
  component: Dialog,
}

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  render: () => (
    <Dialog>
      <DialogTrigger asChild>
        <Button variant="outline">Open Dialog</Button>
      </DialogTrigger>
      <DialogPortal>
        <DialogContent className="sm:max-w-sm">
          <DialogHeader>
            <DialogTitle>Edit Profile</DialogTitle>
            <DialogDescription>
              Make changes to your profile here. Click save when you're done.
            </DialogDescription>
          </DialogHeader>
          <div className="pb-4">
            <p>Dialog content goes here</p>
          </div>
          <DialogFooter>
            <Button type="submit">Save changes</Button>
          </DialogFooter>
        </DialogContent>
      </DialogPortal>
    </Dialog>
  ),
}

export const WithForm: Story = {
  render: () => (
    <Dialog>
      <DialogTrigger asChild>
        <Button variant="outline">Edit Profile</Button>
      </DialogTrigger>
      <DialogPortal>
        <DialogContent className="sm:max-w-sm">
          <DialogHeader>
            <DialogTitle>Edit profile</DialogTitle>
            <DialogDescription>
              Make changes to your profile here. Click save when you're done.
            </DialogDescription>
          </DialogHeader>
          <div className="space-y-4 py-4">
            <div className="flex items-center gap-4">
              <Label htmlFor="name" className="w-24 shrink-0 justify-self-end text-right">
                Names
              </Label>
              <Input id="name" defaultValue="Aris Ripandi" className="flex-1" />
            </div>
            <div className="flex items-center gap-4">
              <Label htmlFor="username" className="w-24 shrink-0 justify-self-end text-right">
                Username
              </Label>
              <Input id="username" defaultValue="@riipandi" className="flex-1" />
            </div>
          </div>
          <DialogFooter>
            <Button type="submit">Save changes</Button>
          </DialogFooter>
        </DialogContent>
      </DialogPortal>
    </Dialog>
  ),
}

export const CustomClose: Story = {
  render: () => (
    <Dialog>
      <DialogTrigger asChild>
        <Button variant="outline">Share</Button>
      </DialogTrigger>
      <DialogPortal>
        <DialogContent className="sm:max-w-md">
          <DialogHeader>
            <DialogTitle>Share link</DialogTitle>
            <DialogDescription>
              Anyone who has this link will be able to view this.
            </DialogDescription>
          </DialogHeader>
          <div className="flex items-center space-x-2">
            <div className="grid flex-1 gap-2">
              <Label htmlFor="link" className="sr-only hidden">
                Link
              </Label>
              <Input id="link" defaultValue="https://github.com/riipandi" readOnly />
            </div>
            <Button type="submit" variant="outline" size="icon" className="px-3">
              <span className="sr-only hidden">Copy</span>
              <Lucide.Copy className="size-4" />
            </Button>
          </div>
          <DialogFooter className="sm:justify-start">
            <DialogClose asChild>
              <Button type="button" variant="outline">
                Close
              </Button>
            </DialogClose>
          </DialogFooter>
        </DialogContent>
      </DialogPortal>
    </Dialog>
  ),
}
