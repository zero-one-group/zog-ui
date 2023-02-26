import type Stitches from '@stitches/react';
import { CSS, CSSProperties } from '@stitches/react';
import { forwardRef } from 'react';
import { Box, BoxProps } from '../Box';
import { MergeProps } from '../types';

export interface SpaceOptions {
  /**
   * Shorthand prop for `flexDirection
   * @type CSSProperties['flexDirection']
   */
  direction?: CSSProperties['flexDirection'];
  /**
   * Shorthand prop for `flexWrap
   * @type CSSProperties['flexWrap']
   */
  wrap?: CSSProperties['flexWrap'];
  /**
   * Shorthand prop for `justifyContent
   * @type CSSProperties['justifyContent']
   */
  justify?: CSSProperties['justifyContent'];
  /**
   * Shorthand prop for `alignItems
   * @type CSSProperties['alignItems']
   */
  align?: CSSProperties['alignItems'];
  /**
   * Shorthand prop for `gap
   * @type CSSProperties['gap']
   */
  gap?: CSSProperties['gap'];
  /**
   * Shorthand prop for `rowGap
   * @type CSSProperties['rowGap']
   */
  rowGap?: CSSProperties['rowGap'];
  /**
   * Shorthand prop for `columnGap
   * @type CSSProperties['columnGap']
   */
  columnGap?: CSSProperties['columnGap'];
  /**
   * Shorthand prop for `gridColumn
   * @type CSSProperties['gridColumn']
   */
  css?: CSS;
}

export type SpaceProps = Omit<MergeProps<BoxProps<'div'>, SpaceOptions>, 'as'>;

export const Space = forwardRef<HTMLDivElement, SpaceProps>(
  (
    {
      children,
      direction,
      wrap,
      justify,
      align,
      gap,
      rowGap,
      columnGap,
      css,
      ...props
    },
    ref
  ) => {
    const setGap = () => {
      const customGaps = ['s', 'm', 'l', 'xl', 'xxl'];
      if (gap) {
        if (customGaps.includes(gap as string)) {
          const gaps = {
            s: '$1',
            m: '$3',
            l: '$5',
            xl: '$6',
            xxl: '$8',
          };
          return gaps[gap as keyof typeof gaps];
        }
      }
      return gap;
    };
    const styles: Stitches.CSS = {
      display: 'flex',
      flexDirection: direction,
      flexWrap: wrap,
      justifyContent: justify,
      alignItems: align,
      gap: setGap(),
      rowGap,
      columnGap,
      ...css,
    };

    return (
      <Box ref={ref} css={styles} {...props}>
        {children}
      </Box>
    );
  }
);
