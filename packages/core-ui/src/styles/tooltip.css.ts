import { type VariantProps, tv } from "tailwind-variants";

export const tooltipStyles = tv({
  slots: {
    base: [
      "z-50 overflow-hidden rounded-lg bg-black px-3 py-1.5 text-white text-xs",
      "data-[state=open]:motion-preset-pop data-[state=open]:motion-duration-300",
    ],
    arrow: [
      "transition-transform duration-150 ease-in-out",
    ],
  },
});

export type TooltipVariants = VariantProps<typeof tooltipStyles>;
