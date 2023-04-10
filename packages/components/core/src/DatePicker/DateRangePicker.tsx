import { CalendarOutlined, CloseCircleFilled } from '@ant-design/icons';
import { RangePicker, RangePickerProps } from 'rc-picker';
import dateFnsGenerateConfig from 'rc-picker/lib/generate/dateFns';
import enUS from 'rc-picker/lib/locale/en_US';
import { ComponentProps, ReactElement, useRef } from 'react';
import { useFormDisabledContext, useFormItemContext } from '../Form';
import { styled } from '../stitches.config';
import { getDateRangePickerStyle } from './style';

const getColorSchemeVariants = (colorScheme?: string) => {
  return {
    $$primaryColor: colorScheme
      ? `$colors-${colorScheme}9`
      : '$colors-primary9',
    $$highlightColor: colorScheme
      ? `$colors-${colorScheme}4`
      : '$colors-primary4',
  };
};

const PREFIX_CLS = 'zero-picker';

const StyledWrapperPicker = styled('div', {
  input: {
    backgroundColor: 'transparent',
  },
  '.zero-picker-panel': {
    background: '$gray1 !important',
  },
  'button, th, td': {
    color: '$gray12 !important',
  },
  '.zero-picker-time-panel-cell-inner': {
    color: '$gray12 !important',
  },
  'input::placeholder, .zero-picker-suffix, .zero-picker-range-separator': {
    color: '$gray9 !important',
  },
  width: 350,
  position: 'relative',
  [`.${PREFIX_CLS}`]: {
    transition: 'border .1s ease-in-out',
    fontSize: '14px',
    fontFamily: '$untitled',
    ...getDateRangePickerStyle({
      primaryColor: '$$primaryColor',
      highlightColor: '$$highlightColor',
      backgroundColor: 'white',
      prefixCls: PREFIX_CLS,
    }),
  },
  variants: {
    size: {
      sm: {
        [`& .${PREFIX_CLS}-range`]: {
          height: 24,
        },
      },
      md: {
        [`& .${PREFIX_CLS}-range`]: {
          height: 32,
        },
      },
      lg: {
        [`& .${PREFIX_CLS}-range`]: {
          height: 40,
          input: {
            fontSize: '16px',
          },
        },
      },
    },
    isInvalid: {
      true: {
        '.zero-picker': {
          borderColor: '$inputError !important',
        },
      },
    },
    isWarning: {
      true: {
        '.zero-picker': {
          borderColor: '$inputWarning !important',
        },
      },
    },
    fullWidth: {
      true: {
        width: '100%',
      },
    },
  },
  defaultVariants: {
    size: 'md',
  },
});

type DateRangePickerOwnProps = {
  /** Color of the selected date, input focus and hovered also highlight
   * please don't use color with opacity
   * if not set, `primary color` will used*/
  colorScheme?: string;
};

type RcRangePickerProps = Omit<
  RangePickerProps<Date>,
  | 'generateConfig'
  | 'getPopupContainer'
  | 'prefixCls'
  | 'components'
  | 'dateRender'
  | 'defaultOpen'
  | 'defaultPickerValue'
  | 'direction'
  | 'dropdownAlign'
  | 'inputRender'
  | 'monthCellRender'
  | 'panelRender'
  | 'pickerRef'
  | 'transitionName'
  | 'tabIndex'
  | 'picker'
>;
type StyledWrapperProps = Pick<
  ComponentProps<typeof StyledWrapperPicker>,
  'css' | 'size' | 'fullWidth'
>;

export type DateRangePickerProps = DateRangePickerOwnProps &
  RcRangePickerProps &
  StyledWrapperProps;

export type DateRangePickerComponent = (
  props: DateRangePickerProps
) => ReactElement;

export const DateRangePicker: DateRangePickerComponent = ({
  size: propSize,
  disabled: propDisabled,
  css,
  placeholder,
  locale = enUS,
  colorScheme,
  fullWidth,
  ...props
}) => {
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const wrapperRef = useRef<any>(null);

  const formItem = useFormItemContext();
  const size = propSize ?? formItem.size;

  const disabledForm = useFormDisabledContext();
  const disabled = propDisabled || disabledForm;

  return (
    <StyledWrapperPicker
      ref={wrapperRef}
      css={{ ...css, ...getColorSchemeVariants(colorScheme) }}
      size={size}
      isWarning={formItem.isWarning && !formItem.isInvalid}
      isInvalid={formItem.isInvalid}
      fullWidth={fullWidth}
    >
      <RangePicker<Date>
        prefixCls={PREFIX_CLS}
        generateConfig={dateFnsGenerateConfig}
        locale={locale}
        suffixIcon={<CalendarOutlined />}
        prevIcon={<span />}
        superPrevIcon={<span />}
        nextIcon={<span />}
        superNextIcon={<span />}
        allowClear
        clearIcon={<CloseCircleFilled />}
        placeholder={['Start date', 'End date']}
        showNow={false}
        getPopupContainer={() => wrapperRef.current}
        separator={
          <svg
            width="16"
            height="17"
            viewBox="0 0 16 17"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              d="M13.6422 9.31865L11.0797 6.06865C11.033 6.00932 10.9734 5.96134 10.9055 5.92833C10.8375 5.89531 10.763 5.87811 10.6875 5.87802H9.675C9.57031 5.87802 9.5125 5.99833 9.57656 6.08115L11.8313 8.94052H2.375C2.30625 8.94052 2.25 8.99677 2.25 9.06552V10.003C2.25 10.0718 2.30625 10.128 2.375 10.128H13.2484C13.6672 10.128 13.9 9.64677 13.6422 9.31865Z"
              fill="black"
              fill-opacity="0.25"
            />
          </svg>
        }
        disabled={disabled}
        picker="date"
        {...props}
      />
    </StyledWrapperPicker>
  );
};
