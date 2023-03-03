import type Stitches from '@stitches/react';
import { CSSProperties } from '@stitches/react';
import { forwardRef, ReactNode } from 'react';
import { Box, BoxProps } from '../Box';
import { MergeProps } from '../types';

export interface GridOptions {
  /**
   * Shorthand prop for `gridTemplateColumns
   * @type CSSProperties['gridTemplateColumns']
   */
  templateColumns?: CSSProperties['gridTemplateColumns'];
  /**
   * Shorthand prop for `gridTemplateRows
   * @type CSSProperties['gridTemplateRows']
   */
  templateRows?: CSSProperties['gridTemplateRows'];
  /**
   * Shorthand prop for `gridTemplateAreas
   * @type CSSProperties['gridTemplateAreas']
   */
  templateAreas?: CSSProperties['gridTemplateAreas'];
  /**
   * Shorthand prop for `gridAutoFlow
   * @type CSSProperties['gridAutoFlow']
   */
  autoFlow?: CSSProperties['gridAutoFlow'];
  /**
   * Shorthand prop for `gridAutoColumns
   * @type CSSProperties['gridAutoColumns']
   */
  autoColumns?: CSSProperties['gridAutoColumns'];
  /**
   * Shorthand prop for `gridAutoRows
   * @type CSSProperties['gridAutoRows']
   */
  autoRows?: CSSProperties['gridAutoRows'];
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
}

export type GridProps = {
  children: ReactNode;
} & GridOptions;

export const Grid = forwardRef<HTMLDivElement, GridProps>(
  (
    {
      children,
      autoColumns,
      autoFlow,
      autoRows,
      columnGap,
      gap,
      rowGap,
      templateAreas,
      templateColumns,
      templateRows,
      ...props
    },
    ref
  ) => {
    const styles: Stitches.CSS = {
      display: 'grid',
      gridAutoColumns: autoColumns,
      gridAutoFlow: autoFlow,
      gridAutoRows: autoRows,
      columnGap,
      gap,
      rowGap,
      gridTemplateAreas: templateAreas,
      gridTemplateColumns: templateColumns,
      gridTemplateRows: templateRows,
    };

    return (
      <Box ref={ref} css={styles} {...props}>
        {children}
      </Box>
    );
  }
);
