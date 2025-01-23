import { type VariantProps, tv } from 'tailwind-variants'

export const aspectRatioStyles = tv({
  base: 'relative w-full',
  slots: {
    container: 'relative w-full',
    content: 'absolute inset-0 size-full',
  },
  variants: {
    ratio: {
      auto: '',
      square: 'aspect-square',
      video: 'aspect-video',
      custom: '',
    },
  },
  defaultVariants: {
    ratio: 'auto',
  },
})

export type AspectRatioVariants = VariantProps<typeof aspectRatioStyles>
