import { CalendarOutlined, CloseCircleFilled } from '@ant-design/icons';
import Picker, { PickerProps } from 'rc-picker';
import dateFnsGenerateConfig from 'rc-picker/lib/generate/dateFns';
import enUS from 'rc-picker/lib/locale/en_US';
import { ComponentProps, ReactElement, useRef } from 'react';
import { useFormDisabledContext, useFormItemContext } from '../Form';
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
  width: 200,
  position: 'relative',
  [`.${PREFIX_CLS}`]: {
    transition: 'border .1s ease-in-out',
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
      sm: {
        [`& .${PREFIX_CLS}`]: {
          height: 24,
        },
      },
      md: {
        [`& .${PREFIX_CLS}`]: {
          height: 32,
        },
      },
      lg: {
        [`& .${PREFIX_CLS}`]: {
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
  'css' | 'size' | 'fullWidth'
>;

export type DatePickerProps = DatePickerOwnProps &
  RcPickerProps &
  StyledWrapperProps;

export type DatePickerComponent = (props: DatePickerProps) => ReactElement;

export const DatePicker: DatePickerComponent = ({
  size: propSize,
  css,
  placeholder,
  showTime,
  showToday = true,
  locale = enUS,
  colorScheme,
  disabled: propDisabled,
  fullWidth,
  ...props
}) => {
  // picker panel parent should be the wrapper for styling reason
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
        disabled={disabled}
        {...props}
      />
    </StyledWrapperPicker>
  );
};
