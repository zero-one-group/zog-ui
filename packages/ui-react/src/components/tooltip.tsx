import type { Assign, HTMLArkProps, TooltipRootProps } from "@ark-ui/react";
import { Tooltip as ArkTooltip } from "@ark-ui/react/tooltip";
import { type TooltipVariants, tooltipStyles } from "@repo/core-ui/tooltip.css";
import * as React from "react";

export interface TooltipProps
  extends Assign<HTMLArkProps<"div">, TooltipVariants>,
    TooltipRootProps {}

const TooltipProvider = ArkTooltip.RootProvider;

const Tooltip = React.forwardRef<HTMLDivElement, TooltipProps>(
  ({ children, content, ...props }, ref) => {
    const styles = tooltipStyles({});
    return (
      <ArkTooltip.Root {...props}>
        <ArkTooltip.Trigger>{children}</ArkTooltip.Trigger>
        <ArkTooltip.Positioner>
          <ArkTooltip.Content ref={ref} className={styles.base()}>
            <ArkTooltip.Arrow className={styles.arrow()}>
              <ArkTooltip.ArrowTip />
            </ArkTooltip.Arrow>
            {content}
          </ArkTooltip.Content>
        </ArkTooltip.Positioner>
      </ArkTooltip.Root>
    );
  }
);

export { TooltipProvider, Tooltip };
