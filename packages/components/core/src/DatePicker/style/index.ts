import { CSS } from '@stitches/react';
import { getDatePickerOnlyStyle } from './date-picker';
import { getDateRangePickerOnlyStyle } from './date-range-picker';
import { renderCSS } from './render-css';
import { GetStyleArgs } from './type';

const getCommonStyle = ({
  primaryColor,
  backgroundColor,
  prefixCls,
}: GetStyleArgs): CSS => {
  const cls = `.${prefixCls}`;

  const getPanelContainerStyle = (): CSS => ({
    borderRadius: '2px',
    overflow: 'hidden',
    filter: 'drop-shadow(0px 2px 8px rgba(0, 0, 0, 0.15))',
    marginLeft: '0 !important',
  });
  const getPanelStyle = (): CSS => ({
    display: 'inline-block',
    verticalAlign: 'top',
    background: backgroundColor,
  });
  const getSharedPanelStyle = (): CSS => ({
    '&-decade-panel, &-year-panel, &-month-panel, &-week-panel, &-date-panel, &-time-panel':
      {
        display: 'flex',
        flexDirection: 'column',
        borderRadius: '20px',
        overflow: 'hidden',
        width: 280,
        table: {
          width: '100%',
          textAlign: 'center',
          borderCollapse: 'collapse',
        },
      },
  });
  const getDatetimePanelStyle = (): CSS => ({
    display: 'flex',
  });
  const getInputStyle = (): CSS => ({
    display: 'inline-flex',
    position: 'relative',
    width: '100%',
    '> input': {
      width: '100%',
      outline: 'none',
      border: 'none',
      fontSize: '1em',
      padding: 0,
      fontFamily: 'inherit',
      lineHeight: '1.5',
      '&::placeholder': renderCSS({
        color: '$blackA9',
      }),
    },
    '&-placeholder > input': {
      color: '$blackA9',
    },
  });
  const getInputSuffixStyle = (): CSS => ({
    fontSize: '12.5px',
    display: 'inline-flex',
    alignItems: 'center',
    marginInlineStart: '4px',
    color: '$blackA9',
  });
  const getInputClearStyle = (): CSS => ({
    position: 'absolute',
    top: '50%',
    transform: 'translateY(-50%)',
    right: '0',
    cursor: 'pointer',
    background: 'white',
    color: '$blackA9',
    opacity: 0,
    ':hover': {
      color: '$blackA11',
    },
  });

  const getDropdownStyle = (): CSS => ({
    fontFamily: '$untitled',
    fontSize: '14px',
    position: 'absolute',
    zIndex: 999,
    '&-range': {
      padding: '10px 0',
    },
    '&-hidden': {
      display: 'none',
    },
  });

  const iconLeft: CSS = {
    position: 'absolute',
    top: 0,
    insetInlineStart: 0,
    display: 'inline-block',
    width: '7px',
    height: '7px',
    border: '0 solid currentcolor',
    borderBlockStartWidth: '1.5px',
    borderBlockEndWidth: 0,
    borderInlineStartWidth: '1.5px',
    borderInlineEndWidth: 0,
    content: '',
    transform: 'rotate(-45deg)',
  };
  const arrowButtonStyle: CSS = {
    position: 'relative',
    display: 'inline-block',
    width: '.5em',
    height: '.5em',
  };
  const getSuperPrevBtnStyle = (): CSS => ({
    ...arrowButtonStyle,
    '&::before': iconLeft,
    '&::after': {
      ...iconLeft,
      insetInlineStart: '5px',
    },
  });
  const getPrevBtnStyle = (): CSS => ({
    ...arrowButtonStyle,
    '&::before': iconLeft,
  });
  const getNextBtnStyle = (): CSS => ({
    ...arrowButtonStyle,
    '&::before': {
      ...iconLeft,
      transform: 'rotate(-225deg)',
    },
  });

  const getSuperNextBtnStyle = (): CSS => ({
    ...arrowButtonStyle,
    '&::before': {
      ...iconLeft,
      transform: 'rotate(-225deg)',
    },
    '&::after': {
      ...iconLeft,
      insetInlineStart: '-5px',
      transform: 'rotate(-225deg)',
    },
  });

  const getHeaderStyle = (): CSS => ({
    display: 'flex',
    borderBottom: '1px solid rgba(5,5,5,.06)',
    padding: '0 8px',
    '> *': {
      flex: 'none',
    },
    '&-view': {
      flex: 'auto',
      display: 'inline-flex',
      gap: '.5em',
      justifyContent: 'center',
      fontWeight: 600,
      lineHeight: '42px',
    },
    button: {
      border: 0,
      fontFamily: '$untitled',
      fontSize: '1em',
      lineHeight: '40px',
      outline: 'none',
      background: 'transparent',
      cursor: 'pointer',
      color: '$blackA9',
      '&:hover': {
        color: 'black',
      },
    },
    '&-view > button': {
      padding: 0,
      color: 'black',
      '&:hover': {
        color: primaryColor,
      },
    },
    '&-super-prev-btn > span': getSuperPrevBtnStyle(),
    '&-prev-btn > span': getPrevBtnStyle(),
    '&-next-btn > span': getNextBtnStyle(),
    '&-super-next-btn > span': getSuperNextBtnStyle(),
  });

  const getBodyStyle = (): CSS => ({
    padding: '8px 12px',
  });

  const getContentStyle = (): CSS => ({
    height: 264,
    tableLayout: 'fixed',
    borderCollapse: 'collapse',
    th: {
      height: '32px',
      color: '$blackA12',
      verticalAlign: 'middle',
    },
    '& th, & td': {
      position: 'relative',
      minWidth: '24px',
      fontWeight: '400',
    },
  });

  const getFooterStyle = (): CSS => ({
    width: 'min-content',
    minWidth: '100%',
    lineHeight: '38px',
    textAlign: 'center',
    borderTop: '1px solid rgba(5,5,5,.06)',
  });
  const getRangeStyle = (): CSS => ({
    margin: 0,
    marginBottom: 0,
    padding: '4px 12px',
    overflow: 'hidden',
    lineHeight: '34px',
    textAlign: 'start',
    listStyle: 'none',
    display: 'flex',
    justifyContent: 'space-between',
  });

  const mainStyle: CSS = {
    fontSize: '14px',
    display: 'flex',
    alignItems: 'center',
    border: '1px solid $inputDefaultBorder',
    boxSizing: 'border-box',
    borderRadius: '2px',
    padding: '0 12px',
    transition: 'height .1s ease-in-out, font-size .1s ease-in-out',
    [`&-focused, &:hover`]: {
      border: `1px solid ${primaryColor}`,
    },
    '&-panel-container': getPanelContainerStyle(),
    '&-panel': getPanelStyle(),
    ...getSharedPanelStyle(),
    '&-date-panel': {
      width: 280,
    },
    [`&-year-panel ${cls}-cell-inner, &-quarter-panel ${cls}-cell-inner, &-month-panel ${cls}-cell-inner`]:
      {
        width: '60px',
        padding: '0 8px',
      },
    [`&-decade-panel ${prefixCls}-cell-inner`]: {
      padding: '0 4px',
    },
    '&-datetime-panel': getDatetimePanelStyle(),
    [`&-time-panel ${cls}-content`]: {
      display: 'flex',
      flex: 'auto',
      height: '224px',
    },
    '&-input': getInputStyle(),
    '&-suffix': getInputSuffixStyle(),
    '&-clear': getInputClearStyle(),
    '&-dropdown': getDropdownStyle(),
    '&-header': getHeaderStyle(),
    '&-body': getBodyStyle(),
    '&-content': getContentStyle(),
    '&-footer': getFooterStyle(),
    '&-ranges': getRangeStyle(),
    [`&:hover ${cls}-clear`]: {
      opacity: 1,
    },
    '&-panels': {
      display: 'inline-flex',
    },
    '&-disabled': {
      cursor: 'not-allowed',
      pointerEvents: 'none',
      background: '#F4F6F7',
      '& input': {
        background: '#F4F6F7',
      },
    },
  };
  return mainStyle;
};

export const getDatePickerStyle = (args: GetStyleArgs): CSS => ({
  ...getCommonStyle({ ...args }),
  ...getDatePickerOnlyStyle({ ...args }),
});
export const getDateRangePickerStyle = (args: GetStyleArgs): CSS => ({
  ...getCommonStyle({ ...args }),
  ...getDateRangePickerOnlyStyle({ ...args }),
});
