import {
  ComponentPropsWithoutRef,
  ComponentPropsWithRef,
  ElementType,
  PropsWithChildren,
} from 'react';

/**
 * @deprecated Use `asChild` instead
 */
export type AsProps<T extends ElementType> = {
  as?: T;
};

/**
 * @deprecated Use `asChild` instead
 */
export type KeyPropsToOmit<T extends ElementType, P> = keyof (AsProps<T> & P);

/**
 * @deprecated Use `asChild` instead
 */
export type PolymorphicComponentProps<
  T extends ElementType,
  Props = unknown
> = PropsWithChildren<AsProps<T> & Props> &
  Omit<ComponentPropsWithoutRef<T>, KeyPropsToOmit<T, Props>>;

/**
 * @deprecated Use `asChild` instead
 */
export type PolymorphicRef<T extends ElementType> =
  ComponentPropsWithRef<T>['ref'];

export type PolymorphicComponentPropsWithRef<
  T extends ElementType,
  Props = unknown
> = PolymorphicComponentProps<T, Props> & { ref?: PolymorphicRef<T> };

export type MergeProps<T, P> = Omit<T, keyof P> & P;

export type RemoveAsProps<Props> = Omit<Props, 'as'>;
