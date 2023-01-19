import { ComponentProps, ElementType, forwardRef, ReactElement } from 'react';
import { styled } from '../stitches.config';
import { PolymorphicComponentPropsWithRef, PolymorphicRef } from '../types';
import type Stitches from '@stitches/react';

const headingElements = ['h1', 'h2', 'h3', 'h4', 'h5', 'h6'] as const;

const StyledHeading = styled('h1', {
  fontFamily: '$untitled',
  fontWeight: 600,
  fontSize: '$7',
});

export type HeadingProps<T extends ElementType> =
  PolymorphicComponentPropsWithRef<T, ComponentProps<typeof StyledHeading>>;

export type HeadingComponent = <T extends ElementType = typeof StyledHeading>(
  props: HeadingProps<T>
) => ReactElement | null;

export const Heading: HeadingComponent = forwardRef(
  <T extends ElementType = typeof StyledHeading>(
    { as, children, ...props }: HeadingProps<T>,
    ref?: PolymorphicRef<T>
  ) => {
    const overriderStyles: Stitches.CSS | undefined = (() => {
      if (typeof as !== 'string') {
        return undefined;
      }

      if (!headingElements.includes(as as (typeof headingElements)[number])) {
        return undefined;
      }

      const styles: Record<
        (typeof headingElements)[number],
        Stitches.CSS | undefined
      > = {
        h1: undefined,
        h2: {
          fontSize: '$6',
        },
        h3: {
          fontSize: '$5',
        },
        h4: {
          fontSize: '$4',
        },
        h5: {
          fontSize: '$3',
        },
        h6: {
          fontSize: '$2',
        },
      };

      return styles[as];
    })();

    return (
      <StyledHeading ref={ref} css={overriderStyles} as={as} {...props}>
        {children}
      </StyledHeading>
    );
  }
);
