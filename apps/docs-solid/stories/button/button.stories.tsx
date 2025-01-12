import type { ButtonVariants } from '@repo/core-ui/button.css'
import { Button, type ButtonProps } from '@repo/ui-solid/button'
import { fn } from '@storybook/test'
import * as Lucide from 'lucide-solid'
import type { Meta, StoryObj } from 'storybook-solidjs'

const variantOptions: NonNullable<ButtonVariants['variant']>[] = [
  'default',
  'destructive',
  'outline',
  'secondary',
  'ghost',
  'link',
]

const sizeOptions: NonNullable<ButtonVariants['size']>[] = ['sm', 'default', 'lg', 'icon']

const meta: Meta<ButtonProps> = {
  title: 'Basic Components/Button',
  component: Button,
  argTypes: {
    children: {
      control: 'text',
      table: {
        type: { summary: 'ReactNode | string' },
      },
    },
    variant: {
      control: { type: 'radio' },
      options: variantOptions,
      table: {
        defaultValue: { summary: 'default' },
        type: { summary: 'ButtonVariants["variant"]' },
      },
    },
    size: {
      control: { type: 'inline-radio' },
      options: sizeOptions,
      table: {
        type: { summary: 'ButtonVariants["size"]' },
      },
    },
    isLoading: {
      control: 'boolean',
    },
    asChild: {
      control: 'boolean',
      description: 'Render as child element',
      table: {
        type: { summary: 'boolean' },
      },
    },
  },
  args: { onClick: fn() },
}

export default meta
type Story = StoryObj<typeof meta>

// Individual Stories for Controls
export const Default: Story = {
  parameters: {
    controls: { exclude: ['asChild'] },
  },
  args: { children: 'Button' },
}

// Showcases with Focused Controls
export const VariantShowcase: Story = {
  parameters: {
    controls: { exclude: ['variant', 'children', 'asChild'] },
  },
  args: {
    size: 'default',
    isLoading: false,
    disabled: false,
  },
  render: (args) => (
    <div class="flex flex-wrap items-center gap-4">
      <Button {...args}>Default</Button>
      <Button {...args} variant="secondary">
        Secondary
      </Button>
      <Button {...args} variant="destructive">
        Destructive
      </Button>
      <Button {...args} variant="outline">
        Outline
      </Button>
      <Button {...args} variant="ghost">
        Ghost
      </Button>
      <Button {...args} variant="link">
        Link
      </Button>
    </div>
  ),
}

export const SizeShowcase: Story = {
  parameters: {
    controls: { exclude: ['size', 'children', 'asChild'] },
  },
  args: {
    variant: 'default',
    isLoading: false,
    disabled: false,
  },
  render: (args) => (
    <div class="flex flex-wrap items-end gap-4">
      <Button {...args} size="sm">
        Small
      </Button>
      <Button {...args}>Default</Button>
      <Button {...args} size="lg">
        Large
      </Button>
      <Button {...args} size="icon">
        <Lucide.Plus />
      </Button>
    </div>
  ),
}

export const IconShowcase: Story = {
  parameters: {
    controls: { exclude: ['children', 'asChild', 'variant'] },
  },
  args: {
    size: 'default',
    isLoading: false,
    disabled: false,
  },
  render: (args) => (
    <div class="flex flex-wrap items-center gap-4">
      <Button {...args}>
        <Lucide.Search class="-ml-0.5" />
        Search
      </Button>
      <Button {...args} variant="secondary">
        <Lucide.Mail class="-ml-0.5" />
        Email
      </Button>
      <Button {...args} variant="outline">
        <Lucide.Github class="-ml-0.5" />
        Github
      </Button>
      <Button {...args} size="icon" variant="ghost">
        <Lucide.Bell class="-ml-0.5" />
      </Button>
    </div>
  ),
}

export const StateShowcase: Story = {
  parameters: {
    controls: { exclude: ['children', 'asChild'] },
  },
  args: {
    variant: 'default',
    size: 'default',
  },
  render: (args) => (
    <div class="flex flex-wrap items-center gap-4">
      <Button {...args} isLoading>
        Loading
      </Button>
      <Button {...args} disabled>
        Disabled
      </Button>
      <Button {...args} variant="outline" disabled>
        Disabled Outline
      </Button>
    </div>
  ),
}
