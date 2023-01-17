import { CSSProperties } from '@stitches/react';
import { forwardRef } from 'react';
import { Box, BoxProps } from '../Box';
import { MergeProps } from '../types';
import type Stitches from '@stitches/react';

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
  /**
   * Shorthand prop for `gridColumn
   * @type CSSProperties['gridColumn']
   */
  column?: CSSProperties['gridColumn'];
  /**
   * Shorthand prop for `gridRow
   * @type CSSProperties['gridRow']
   */
  row?: CSSProperties['gridRow'];
}

export type GridProps = Omit<MergeProps<BoxProps<'div'>, GridOptions>, 'as'>;

export const Grid = forwardRef<HTMLDivElement, GridProps>(
  (
    {
      children,
      autoColumns,
      autoFlow,
      autoRows,
      column,
      columnGap,
      gap,
      row,
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
      gridColumn: column,
      columnGap,
      gap,
      gridRow: row,
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
