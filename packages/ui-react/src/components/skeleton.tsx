import type { Assign } from '@ark-ui/react'
import { type HTMLArkProps, ark } from '@ark-ui/react/factory'
import { type SkeletonVariants, skeletonStyles } from '@repo/core-ui/skeleton.css'
import * as React from 'react'

export interface SkeletonProps extends Assign<HTMLArkProps<'div'>, SkeletonVariants> {}

const Skeleton = React.forwardRef<HTMLDivElement, SkeletonProps>(({ className, ...props }, ref) => {
  return <ark.div ref={ref} className={skeletonStyles({ className })} {...props} />
})

Skeleton.displayName = 'Skeleton'

export { Skeleton }
