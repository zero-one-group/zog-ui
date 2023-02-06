import { CalendarOutlined, CloseCircleFilled } from '@ant-design/icons';
import Picker, { PickerProps } from 'rc-picker';
import dateFnsGenerateConfig from 'rc-picker/lib/generate/dateFns';
import enUS from 'rc-picker/lib/locale/en_US';
import { ComponentProps, ReactElement, useRef } from 'react';
import { styled } from '../stitches.config';
import { getDatePickerStyle } from './style';

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
  position: 'relative',
  [`.${PREFIX_CLS}`]: {
    fontSize: '14px',
    fontFamily: '$untitled',
    ...getDatePickerStyle({
      primaryColor: '$$primaryColor',
      highlightColor: '$$highlightColor',
      backgroundColor: 'white',
      prefixCls: PREFIX_CLS,
    }),
  },
  variants: {
    size: {
      default: {
        [`& .${PREFIX_CLS}`]: {
          padding: '5px 12px',
        },
      },
      small: {
        [`& .${PREFIX_CLS}`]: {
          padding: '0 12px',
        },
      },
      medium: {
        [`& .${PREFIX_CLS}`]: {
          padding: '5px 12px',
        },
      },
      large: {
        [`& .${PREFIX_CLS}`]: {
          padding: '8px 12px',
          input: {
            fontSize: '16px',
          },
        },
      },
    },
  },
});

type DatePickerOwnProps = {
  /** Color of the selected date, input focus and hovered also highlight
   * please don't use color with opacity
   * if not set, `primary color` will used*/
  colorScheme?: string;
  /** Show time picker beside datepicker*/
  showTime?: boolean;
  /** Show button today for selecting today's date*/
  showToday?: boolean;
};

type RcPickerProps = Omit<
  PickerProps<Date>,
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
>;
type StyledWrapperProps = Pick<
  ComponentProps<typeof StyledWrapperPicker>,
  'css' | 'size'
>;

export type DatePickerProps = DatePickerOwnProps &
  RcPickerProps &
  StyledWrapperProps;

export type DatePickerComponent = (props: DatePickerProps) => ReactElement;

export const DatePicker: DatePickerComponent = ({
  size,
  css,
  placeholder,
  showTime,
  showToday = true,
  locale = enUS,
  colorScheme,
  ...props
}) => {
  // picker panel parent should be the wrapper for styling reason
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const wrapperRef = useRef<any>(null);

  return (
    <StyledWrapperPicker
      css={{ ...css, ...getColorSchemeVariants(colorScheme) }}
      size={size}
      ref={wrapperRef}
    >
      <Picker<Date>
        prefixCls={PREFIX_CLS}
        generateConfig={dateFnsGenerateConfig}
        locale={locale}
        suffixIcon={<CalendarOutlined />}
        prevIcon={<span />}
        superPrevIcon={<span />}
        nextIcon={<span />}
        superNextIcon={<span />}
        clearIcon={<CloseCircleFilled />}
        allowClear
        placeholder={placeholder || `Select ${props.picker || 'date'}`}
        showToday={showToday}
        showTime={showTime}
        showNow={false}
        getPopupContainer={() => wrapperRef.current}
        {...props}
      />
    </StyledWrapperPicker>
  );
};
