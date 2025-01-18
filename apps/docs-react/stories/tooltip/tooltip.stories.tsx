import { Button } from "@repo/ui-react/button";
import { Tooltip, type TooltipProps } from "@repo/ui-react/tooltip";
import type { Meta, StoryObj } from "@storybook/react";
import React from "react";

const meta: Meta<TooltipProps> = {
  title: "Basic Components/Tooltip",
  component: Tooltip,
  argTypes: {
    openDelay: {
      control: "number",
      description: "the delay open of the mini window popup",
    },
    positioning: {
      control: "select",
      options: ["top", "bottom", "left", "right"],
    },
  },
};
export default meta;

type Story = StoryObj<typeof meta>;

export const Default: Story = {
  args: {
    content: "This is a tooltip!",
  },
  render: (args) => (
    <div className="flex min-h-screen items-center bg-gradient-to-br from-cyan-700 to-slate-800 text-white">
      <div className="container mx-auto px-4 py-16">
        <Tooltip {...args}>
          <Button>Hover Me</Button>
        </Tooltip>
      </div>
    </div>
  ),
};

export const VariantPosition: Story = {
  args: {
    content: "This is a tooltip!",
  },

  render: (args) => (
    <div className="flex min-h-screen ">
      <div className="container mx-auto items-center gap-4 px-4 py-16">
        <div className="flex flex-wrap items-center">
          <div className="grid grid-cols-2 gap-4">
            <Tooltip
              {...args}
              positioning={{
                placement: "right",
              }}
            >
              <Button>Hover Me</Button>
            </Tooltip>
            <Tooltip
              {...args}
              positioning={{
                placement: "left",
              }}
            >
              <Button>Hover Me</Button>
            </Tooltip>
            <Tooltip
              {...args}
              positioning={{
                placement: "top",
              }}
            >
              <Button>Hover Me</Button>
            </Tooltip>
            <Tooltip
              {...args}
              positioning={{
                placement: "bottom",
              }}
            >
              <Button>Hover Me</Button>
            </Tooltip>
          </div>
        </div>
      </div>
    </div>
  ),
};
