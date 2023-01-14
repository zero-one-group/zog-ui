import {
  ComponentPropsWithoutRef,
  ComponentPropsWithRef,
  ElementType,
  PropsWithChildren,
} from 'react';

export type AsProps<T extends ElementType> = {
  as?: T;
};

export type KeyPropsToOmit<T extends ElementType, P> = keyof (AsProps<T> & P);

export type PolymorphicComponentProps<
  T extends ElementType,
  Props = unknown
> = PropsWithChildren<AsProps<T> & Props> &
  Omit<ComponentPropsWithoutRef<T>, KeyPropsToOmit<T, Props>>;

export type PolymorphicRef<T extends ElementType> =
  ComponentPropsWithRef<T>['ref'];

export type PolymorphicComponentPropsWithRef<
  T extends ElementType,
  Props = unknown
> = PolymorphicComponentProps<T, Props> & { ref?: PolymorphicRef<T> };
