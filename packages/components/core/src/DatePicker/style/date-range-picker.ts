import { CSS } from '@stitches/react';
import { renderCSS } from './render-css';
import { GetStyleArgs } from './type';

export const getDateRangePickerOnlyStyle = ({
  primaryColor,
  highlightColor,
  prefixCls,
}: GetStyleArgs): CSS => {
  const cls = `.${prefixCls}`;

  const getCellStyle = (): CSS => ({
    padding: '4px 0',
    color: '$blackA9',
    cursor: 'pointer',
    '&-in-view': {
      color: '$blackA12',
      [`&${cls}-cell-range-start ${cls}-cell-inner, &${cls}-cell-range-end ${cls}-cell-inner`]:
        renderCSS({
          color: 'white',
          background: primaryColor,
        }),
      [`&${cls}-cell-in-range ${cls}-cell-inner`]: renderCSS({
        background: highlightColor,
      }),
      [`&${cls}-cell-in-range::before`]: renderCSS({
        background: highlightColor,
      }),
      [`&${cls}-cell-range-start`]: renderCSS({
        [`${cls}-cell-inner`]: {
          borderTopRightRadius: 0,
          borderBottomRightRadius: 0,
        },
        '&::before': renderCSS({
          background: highlightColor,
          insetInlineStart: '50%',
        }),
      }),
      [`&${cls}-cell-range-end`]: renderCSS({
        [`${cls}-cell-inner`]: {
          borderTopLeftRadius: 0,
          borderBottomLeftRadius: 0,
        },
        '&::before': renderCSS({
          background: highlightColor,
          insetInlineEnd: '50%',
        }),
      }),
    },
    '&-inner': {
      position: 'relative',
      zIndex: 2,
      display: 'inline-block',
      fontSize: '1em',
      minWidth: '24px',
      height: '24px',
      lineHeight: '24px',
      borderRadius: '2px',
    },
    [`&:not(${cls}-cell-range-start, ${cls}-cell-range-end):hover ${cls}-cell-inner`]:
      {
        background: '$blackA5',
      },
    [`&-today ${cls}-cell-inner::before`]: {
      position: 'absolute',
      top: 0,
      insetInlineEnd: 0,
      bottom: 0,
      insetInlineStart: 0,
      zIndex: 1,
      border: `1px solid ${primaryColor}`,
      borderRadius: '2px',
      content: '',
    },
    '&::before': {
      position: 'absolute',
      top: '50%',
      insetInlineStart: 0,
      insetInlineEnd: 0,
      zIndex: 1,
      height: '24px',
      transform: 'translateY(-50%)',
      transition: 'all .3s',
      content: '',
    },
  });

  const mainStyle: CSS = {
    '&-cell': getCellStyle(),
    '&-range': {
      position: 'relative',
      display: 'inline-flex',
      border: '1px solid #D9D9D9',
      borderRadius: '2px',
      padding: '5px 12px',
      [`${cls}-input`]: renderCSS({
        padding: '0',
        display: 'inline',
        width: 'auto',
        border: 'none',
      }),
      [`${cls}-clear`]: renderCSS({
        right: '12px',
      }),
      '&-separator': renderCSS({
        padding: '0 8px',
      }),
      '&-wrapper': renderCSS({
        position: 'relative',
      }),
      '&-arrow': renderCSS({
        position: 'absolute',
        zIndex: 1,
        // display: 'none',
        marginInlineStart: '16.5px',
        transition: 'left .3s ease-out',
        borderRadius: '0 0 2px',
        pointerEvents: 'none',
        width: '32px',
        height: '32px',
        overflow: 'hidden',
        top: 0,
        display: 'block',
        transform: 'translateY(-100%)',
        '&::before': renderCSS({
          position: 'absolute',
          bottom: 0,
          insetInlineStart: 0,
          width: '32px',
          height: '8px',
          background: '#fff',
          clipPath:
            "path('M 6.343145750507619 8 A 4 4 0 0 0 9.17157287525381 6.82842712474619 L 14.585786437626904 1.414213562373095 A 2 2 0 0 1 17.414213562373096 1.414213562373095 L 22.82842712474619 6.82842712474619 A 4 4 0 0 0 25.65685424949238 8 Z')",
          content: '',
        }),
      }),
    },
    '&-input > input': renderCSS({
      borderBottom: `1px solid transparent`,
    }),
    '&-input-active > input:focus': renderCSS({
      borderBottom: `1px solid ${primaryColor}`,
    }),
  };
  return mainStyle;
};
