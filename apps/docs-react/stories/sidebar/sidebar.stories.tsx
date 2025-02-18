import { Collapsible, CollapsibleContent, CollapsibleTrigger } from '@repo/ui-react/collapsible'
import {
  Sidebar,
  SidebarContent,
  SidebarGroup,
  SidebarGroupContent,
  SidebarGroupLabel,
  SidebarHeader,
  SidebarInset,
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
  SidebarMenuSub,
  SidebarMenuSubButton,
  SidebarMenuSubItem,
  SidebarProvider,
  SidebarRail,
  SidebarTrigger,
} from '@repo/ui-react/sidebar'

import type { Meta, StoryObj } from '@storybook/react'
import * as Lucide from 'lucide-react'
import * as React from 'react'

const meta: Meta<typeof Sidebar> = {
  title: 'Basic Components/Sidebar',
  component: Sidebar,
  parameters: {
    layout: 'centered',
  },
  decorators: [
    (Story) => (
      <SidebarProvider>
        <Story />
      </SidebarProvider>
    ),
  ],
  args: {
    hidden: false,
    side: 'left',
    variant: 'sidebar',
    collapsible: 'offcanvas',
  },
  argTypes: {
    hidden: {
      control: 'boolean',
    },
    side: {
      control: {
        type: 'radio',
        options: ['left', 'right'],
      },
    },
    variant: {
      control: {
        type: 'radio',
        options: ['sidebar', 'floating', 'inset'],
      },
    },
    collapsible: {
      control: {
        type: 'radio',
        options: ['offcanvas', 'icon', 'none'],
      },
    },
  },
}

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  render: () => (
    <>
      <Sidebar>
        <SidebarContent>
          <SidebarGroup>
            <SidebarHeader>
              <img
                src="https://avatars.githubusercontent.com/u/60282968?s=200&v=4"
                alt="zero-one-group"
                className="size-10 rounded-full"
              />
              <SidebarGroupLabel className="text-lg">ZOG UI</SidebarGroupLabel>
            </SidebarHeader>
            <SidebarGroupContent>
              <SidebarMenu>
                <SidebarMenuItem>
                  <SidebarMenuButton>
                    <Lucide.Home />
                    Home
                  </SidebarMenuButton>
                </SidebarMenuItem>
                <SidebarMenuItem>
                  <SidebarMenuButton>
                    <Lucide.Settings />
                    Setting
                  </SidebarMenuButton>
                </SidebarMenuItem>
                <SidebarMenuItem>
                  <SidebarMenuButton>
                    <Lucide.TerminalSquare />
                    Terminal
                  </SidebarMenuButton>
                </SidebarMenuItem>
                <Collapsible defaultOpen className="group/collapsible">
                  <SidebarMenuItem>
                    <CollapsibleTrigger asChild>
                      <SidebarMenuButton>
                        <Lucide.TextQuote />
                        Quotes
                        <Lucide.ChevronRight className="ml-auto transition-transform duration-200 group-data-[state=open]/collapsible:rotate-90" />
                      </SidebarMenuButton>
                    </CollapsibleTrigger>
                    <CollapsibleContent>
                      <SidebarMenuSub>
                        <SidebarMenuSubItem>
                          <SidebarMenuSubButton>Hello World</SidebarMenuSubButton>
                        </SidebarMenuSubItem>
                      </SidebarMenuSub>
                    </CollapsibleContent>
                  </SidebarMenuItem>
                </Collapsible>
              </SidebarMenu>
            </SidebarGroupContent>
          </SidebarGroup>
        </SidebarContent>
        <SidebarRail />
      </Sidebar>
      <SidebarInset>
        <div className="flex min-h-screen items-center bg-gradient-to-br from-primary to-slate-800 text-white">
          <SidebarTrigger className="m-1 self-start" />
        </div>
      </SidebarInset>
    </>
  ),
}
