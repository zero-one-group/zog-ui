import { ComponentProps, ReactElement, useRef } from 'react';
import { RangePicker, RangePickerProps } from 'rc-picker';
import dateFnsGenerateConfig from 'rc-picker/lib/generate/dateFns';
import enUS from 'rc-picker/lib/locale/en_US';
import { styled } from '../stitches.config';
import { CalendarOutlined, CloseCircleFilled } from '@ant-design/icons';
import { getDateRangePickerStyle } from './style';

const PREFIX_CLS = 'zero-picker';

const StyledWrapperPicker = styled('div', {
  position: 'relative',
  $$primaryColor: '#1890FF',
  $$highlightColor: '#E6F7FF',
  [`.${PREFIX_CLS}`]: {
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
      default: {
        [`& .${PREFIX_CLS}-range`]: {
          padding: '5px 12px',
        },
      },
      small: {
        [`& .${PREFIX_CLS}-range`]: {
          padding: '0 12px',
        },
      },
      medium: {
        [`& .${PREFIX_CLS}-range`]: {
          padding: '5px 12px',
        },
      },
      large: {
        [`& .${PREFIX_CLS}-range`]: {
          padding: '8px 12px',
          input: {
            fontSize: '16px',
          },
        },
      },
    },
  },
});

type DateRangePickerOwnProps = {
  color?: string;
};

type RcRangePickerProps = Omit<
  RangePickerProps<Date>,
  'generateConfig' | 'getPopupContainer' | 'prefixCls'
>;
type StyledWrapperProps = Pick<
  ComponentProps<typeof StyledWrapperPicker>,
  'css' | 'size'
>;

export type DateRangePickerProps = DateRangePickerOwnProps &
  RcRangePickerProps &
  StyledWrapperProps;

export type DateRangePickerComponent = (
  props: DateRangePickerProps
) => ReactElement;

export const DateRangePicker: DateRangePickerComponent = ({
  size,
  css,
  placeholder,
  locale = enUS,
  ...props
}) => {
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const wrapperRef = useRef<any>(null);

  return (
    <StyledWrapperPicker css={css} size={size} ref={wrapperRef}>
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
        {...props}
      />
    </StyledWrapperPicker>
  );
};
