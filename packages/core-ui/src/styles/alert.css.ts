import { type VariantProps, tv } from "tailwind-variants";

export const alertStyles = tv({
  slots: {
    base: "relative w-full rounded-lg border px-4 py-3 text-sm [&>svg+div]:translate-y-[-3px] [&>svg]:absolute [&>svg]:top-4 [&>svg]:left-4 [&>svg]:text-foreground [&>svg~*]:pl-7",
    title: "mb-1 font-medium leading-none tracking-tight",
    description: "text-sm [&_p]:leading-relaxed",
  },
  variants: {
    variant: {
      default: "bg-background text-foreground",
      destructive:
        "border-destructive/50 text-destructive dark:border-destructive [&>svg]:text-destructive",
      success:
        "border-green-500/50 text-green-500 dark:border-green-800 [&>svg]:text-green-500",
    },
  },
  compoundVariants: [
    {
      variant: ["destructive", "success"],
      className: "font-extrabold underline",
    },
  ],
  defaultVariants: {
    variant: "default",
  },
});

export type AlertVariants = VariantProps<typeof alertStyles>;
