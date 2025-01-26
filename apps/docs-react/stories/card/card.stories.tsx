import { Button } from '@repo/ui-react/button'
import {
  Card,
  CardContent,
  CardDescription,
  CardFooter,
  CardHeader,
  CardTitle,
} from '@repo/ui-react/card'
import { Input } from '@repo/ui-react/input'
import { Label } from '@repo/ui-react/label'
import type { Meta, StoryObj } from '@storybook/react'
import * as React from 'react'

const meta: Meta<typeof Card> = {
  title: 'Basic Components/Card',
  component: Card,
}

export default meta

type Story = StoryObj<typeof meta>

export const Default: Story = {
  render: () => (
    <Card>
      <CardHeader>
        <CardTitle>Hello World</CardTitle>
        <CardDescription>We start new project</CardDescription>
      </CardHeader>
      <CardContent>
        This is the card content. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur
        nec odio vel dui euismod fermentum. Curabitur nec odio vel dui euismod fermentum.
      </CardContent>
      <CardFooter>
        <Button>View</Button>
        <Button>Accept</Button>
      </CardFooter>
    </Card>
  ),
}

export const AddImageShowcase: Story = {
  render: () => (
    <Card>
      <CardHeader>
        <CardTitle>Hello World</CardTitle>
        <CardDescription>We start new project</CardDescription>
      </CardHeader>
      <CardContent>
        <img
          src="https://images.unsplash.com/photo-1496181133206-80ce9b88a853?q=80&w=500&auto=format&fit=crop"
          alt="macbook pro on top of brown table"
        />
        <p>
          This is the card content. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
          Curabitur nec odio vel dui euismod fermentum. Curabitur nec odio vel dui euismod
          fermentum.
        </p>
      </CardContent>
      <CardFooter>
        <Button>View</Button>
        <Button>Join</Button>
      </CardFooter>
    </Card>
  ),
}

export const FormShowcase: Story = {
  render: () => (
    <Card>
      <CardHeader>
        <CardTitle>Account</CardTitle>
        <CardDescription>We start new project</CardDescription>
      </CardHeader>
      <CardContent>
        <div className="grid gap-1.5">
          <Label htmlFor="email">Email address</Label>
          <Input type="email" id="email" />
        </div>
        <div className="grid gap-1.5">
          <Label htmlFor="password">Password</Label>
          <Input type="password" id="password" />
        </div>
      </CardContent>
      <CardFooter>
        <Button>Signin</Button>
        <Button>Signup</Button>
      </CardFooter>
    </Card>
  ),
}
