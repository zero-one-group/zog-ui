import { CSS } from '@stitches/react';
import { renderCSS } from './render-css';
import { GetStyleArgs } from './type';

export const getDatePickerOnlyStyle = ({
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
    [`&:not(${cls}-cell-selected):hover ${cls}-cell-inner`]: {
      background: '$blackA5',
    },
    [`&-selected ${cls}-cell-inner`]: {
      color: 'white',
      background: primaryColor,
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
  });

  const getTimePanelStyle = (): CSS => ({
    width: 'auto',
    minWidth: 'auto',
    '&-column': {
      flex: '1 0 auto',
      width: '56px',
      margin: '4px 0',
      padding: 0,
      overflowY: 'hidden',
      textAlign: 'start',
      listStyle: 'none',
      transition: 'background .2s',
      overflowX: 'hidden',
    },
    '&-column:hover': {
      overflowY: 'auto',
    },
    '&-cell': {
      marginInline: '4px',
      '&-inner': renderCSS({
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        width: '48px',
        height: '28px',
        margin: 0,
        paddingBlock: 0,
        paddingInlineEnd: 0,
        color: '$blackA12',
        lineHeight: '28px',
        borderRadius: '4px',
        fontSize: '1em',
        cursor: 'pointer',
        transition: 'background .2s',
        '&:hover': {
          background: '$blackA5',
        },
      }),
      '&-selected > div': {
        backgroundColor: highlightColor,
      },
    },
  });
  const getButtonOkStyle = (): CSS => ({
    marginInlineStart: 'auto',
    button: {
      padding: '0 8px',
      height: '24px',
      outline: 'none',
      border: 'none',
      background: primaryColor,
      color: 'white',
      borderRadius: '2px',
      fontSize: '14px',
      cursor: 'pointer',
    },
    'button:disabled': {
      background: '$blackA9',
      cursor: 'not-allowed',
    },
  });

  const mainStyle: CSS = {
    '&-cell': getCellStyle(),
    '&-time-panel': getTimePanelStyle(),
    '&-ok': getButtonOkStyle(),
    '&-today-btn': {
      color: primaryColor,
      cursor: 'pointer',
    },
  };
  return mainStyle;
};
