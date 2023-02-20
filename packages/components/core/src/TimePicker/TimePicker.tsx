import { ClockCircleOutlined, CloseCircleFilled } from '@ant-design/icons';
import * as Popover from '@radix-ui/react-popover';
import clsx from 'clsx';
import {
  ComponentProps,
  useCallback,
  useEffect,
  useId,
  useMemo,
  useState,
} from 'react';
import { styled } from '../stitches.config';
import { getTwoDigit, TimePickerPanel } from './TimePickerPanel';

const getColorSchemeVariants = (colorScheme = 'primary') => {
  return {
    $$primaryColor: `$colors-${colorScheme}9`,
    $$highlightColor: `$colors-${colorScheme}4`,
  };
};

const Box = styled('div', {
  fontFamily: '$untitled',
  boxSizing: 'border-box',
});

const StyledWrapper = styled(Box, {
  display: 'inline-flex',
  minWidth: '100px',
  position: 'relative',
  $$primaryColor: '$colors-primary9',
  variants: {
    disabled: {
      true: {
        cursor: 'not-allowed',
      },
    },
    hasSelected: {
      true: {
        '&:hover': {
          '& .clear-btn': {
            opacity: 1,
          },
        },
      },
    },
  },
});

const StyledTrigger = styled(Popover.Trigger, {
  width: 0,
  padding: 0,
  margin: 0,
  outline: 'none',
  border: 'none',
});
const StyledAnchorWrapper = styled('div', {
  position: 'relative',
  height: '100%',
});
const StyledAnchor = styled(Popover.Anchor, {
  width: 0,
  position: 'absolute',
  height: '32px',
  top: '-5px',
  left: '-12px',
});

const StyledIcon = styled(Box, {
  fontSize: '16px',
  display: 'flex',
  alignItems: 'center',
  paddingInlineStart: '6px',
  color: '$blackA9',
  position: 'relative',
});

const StyledClear = styled(Box, {
  fontSize: '12px',
  position: 'absolute',
  right: '0',
  cursor: 'pointer',
  background: 'white',
  color: '$blackA8',
  opacity: 0,
  width: '16px',
  height: '16px',
  display: 'flex',
  alignItems: 'center',
  justifyContent: 'flex-end',
  transition: 'opacity .1s linear',
  ':hover': {
    color: '$blackA11',
  },
});

const StyledPicker = styled('div', {
  display: 'inline-flex',
  alignItems: 'center',
  borderRadius: '2px',
  outline: '1px solid #D9D9D9',
  padding: '5px 12px',
  background: 'white',
  cursor: 'pointer',
  fontSize: '14px',
  '&:hover': {
    outlineColor: '$$primaryColor',
  },
  variants: {
    focused: {
      true: {
        outlineColor: '$$primaryColor',
      },
    },
    disabled: {
      true: {
        pointerEvents: 'none',
        '*': {
          pointerEvents: 'none',
        },
        outlineColor: '#D9D9D9 !important',
        background: '#F5F5F5',
      },
    },
    isRange: {
      true: {
        cursor: 'default',
      },
    },
    size: {
      small: {
        padding: '1px 12px',
      },
      medium: {
        padding: '5px 12px',
      },
      large: {
        padding: '8px 12px',
      },
    },
  },
});

const StyledPickerInput = styled('input', {
  fontFamily: '$untitled',
  lineHeight: '22px',
  height: '22px',
  fontSize: '14px',
  background: 'transparent',
  outline: 'none',
  border: 'none',
  padding: 0,
  display: 'inline-block',
  boxSizing: 'border-box',
  width: '100px',
  variants: {
    focused: {
      true: {
        borderBottom: '1px solid $$primaryColor',
      },
    },
    size: {
      small: {
        fontSize: '14px',
      },
      medium: {
        fontSize: '14px',
      },
      large: {
        fontSize: '16px',
        height: '24px',
      },
    },
  },
});

const StyledPanelContainer = styled(Popover.Content, {
  minWidth: '100px',
  fontSize: '14px',
  outline: 'none',
  background: 'white',
  boxShadow:
    '0px 3px 6px -4px rgba(0, 0, 0, 0.12), 0px 6px 16px rgba(0, 0, 0, 0.08), 0px 9px 28px 8px rgba(0, 0, 0, 0.05)',
  borderRadius: '4px',
  display: 'none',
  variants: {
    open: {
      true: {
        display: 'block',
      },
    },
  },
});

const StyledSeparator = styled('span', {
  width: '32px',
  display: 'inline-flex',
  justifyContent: 'center',
  alignItems: 'center',
});

export type Time = {
  hour: string;
  minute: string;
  second: string;
};

type TimeRangeValue = {
  start: Time;
  end: Time;
};

export type TimePickerProps = {
  /**
   * Customize wrapper style
   */
  css?: ComponentProps<typeof StyledWrapper>['css'];
  colorScheme?: string;
  placeholder?: string;
  placeholderStart?: string;
  placeholderEnd?: string;
  disabled?: boolean;
  allowClear?: boolean;
  value?: Time | TimeRangeValue;
  size?: ComponentProps<typeof StyledPicker>['size'];
  onChange?: (value?: Time | Partial<TimeRangeValue>) => void;
  /**
   * Time Range Picker, there will be a start time and end time
   */
  isRange?: boolean;
  className?: string;
  dropdownClassname?: string;
};

const getTimeFromDate = (date: Date): Time => {
  return {
    hour: getTwoDigit(date.getHours()),
    minute: getTwoDigit(date.getMinutes()),
    second: getTwoDigit(date.getSeconds()),
  };
};

const defaultTime: Time = { hour: '00', minute: '00', second: '00' };

export function TimePicker({
  css,
  colorScheme = 'primary',
  disabled,
  allowClear = true,
  placeholder = 'Select time',
  placeholderStart = 'Start time',
  placeholderEnd = 'End time',
  isRange,
  value: valueFromProps,
  onChange: onChangeFromProps,
  size = 'medium',
  dropdownClassname,
  className,
}: TimePickerProps) {
  const [singleValue, setSingleValue] = useState<Time | undefined>();
  const [rangeValue, setRangeValue] = useState<
    Partial<TimeRangeValue> | undefined
  >();
  const [openStart, setOpenStart] = useState(false);
  const [openEnd, setOpenEnd] = useState(false);
  // Temporary Start, used in the dropdown
  const [tempStart, setTempStart] = useState<Time | undefined>();
  const [tempEnd, setTempEnd] = useState<Time | undefined>();
  const startUniqId = useId();
  const endUniqId = useId();

  const setState = useCallback(
    (newStartValue?: Time, newEndValue?: Time) => {
      if (
        typeof onChangeFromProps === 'function' &&
        valueFromProps !== undefined
      ) {
        setRangeValue(undefined);
        setSingleValue(undefined);
        // fully controlled
        if (isRange) {
          if (!newStartValue && !newEndValue) {
            onChangeFromProps(undefined);
          } else {
            const prevValues = valueFromProps as TimeRangeValue;
            let newStart = newStartValue;
            let newEnd = newEndValue;
            if (newStartValue && !newEndValue) {
              newEnd = newEndValue ?? prevValues.end;
            } else if (newEndValue && !newStartValue) {
              newStart = newStartValue ?? prevValues.start;
            }
            onChangeFromProps({ start: newStart, end: newEnd });
          }
        } else {
          onChangeFromProps(newStartValue);
        }
      } else {
        if (isRange) {
          if (!newStartValue && !newEndValue) {
            setRangeValue(undefined);
          } else if (newStartValue && newEndValue) {
            setRangeValue({ start: newStartValue, end: newEndValue });
          } else {
            if (newStartValue) {
              setRangeValue((prev) => ({ ...prev, start: newStartValue }));
            }
            if (newEndValue) {
              setRangeValue((prev) => ({ ...prev, end: newEndValue }));
            }
          }
          if (typeof onChangeFromProps === 'function') {
            if (!newStartValue && !newEndValue) {
              onChangeFromProps(undefined);
            } else {
              const prevValues = rangeValue;
              let newStart = newStartValue;
              let newEnd = newEndValue;
              if (newStartValue && !newEndValue) {
                newEnd = newEndValue ?? prevValues?.end;
              } else if (newEndValue && !newStartValue) {
                newStart = newStartValue ?? prevValues?.start;
              }
              onChangeFromProps({ start: newStart, end: newEnd });
            }
          }
        } else {
          setSingleValue(newStartValue);
          if (typeof onChangeFromProps === 'function') {
            onChangeFromProps(newStartValue);
          }
        }
      }
    },
    [isRange, onChangeFromProps, rangeValue, valueFromProps]
  );

  const closeDropdown = () => {
    setOpenStart(false);
    setOpenEnd(false);
  };

  const closeStartOpenEndDropdown = useCallback(() => {
    if (isRange) {
      setOpenEnd(true);
      setOpenStart(false);
    } else {
      closeDropdown();
    }
  }, [isRange]);

  const onClear = () => {
    setState();
    setTempStart(undefined);
    setTempEnd(undefined);
    closeDropdown();
  };

  const onClickNow = useCallback(() => {
    const now = new Date();
    const nowTime = getTimeFromDate(now);
    if (isRange && openEnd) {
      setTempEnd(nowTime);
      setState(undefined, nowTime);
      closeDropdown();
    } else {
      setTempStart(nowTime);
      setState(nowTime);

      closeStartOpenEndDropdown();
    }
  }, [closeStartOpenEndDropdown, isRange, openEnd, setState]);

  const onClickOk = useCallback(() => {
    if (isRange && openEnd && tempEnd !== undefined) {
      setState(undefined, tempEnd);
      closeDropdown();
    } else if (tempStart !== undefined) {
      setState(tempStart);
      closeStartOpenEndDropdown();
    }
  }, [
    closeStartOpenEndDropdown,
    isRange,
    openEnd,
    setState,
    tempEnd,
    tempStart,
  ]);

  const inputStartValue = useMemo(() => {
    let time;
    if (valueFromProps !== undefined) {
      time = openStart
        ? tempStart
        : isRange
        ? (valueFromProps as TimeRangeValue).start
        : (valueFromProps as Time);
    } else {
      time = openStart ? tempStart : isRange ? rangeValue?.start : singleValue;
    }
    if (!time) {
      return '';
    }
    return `${time.hour}:${time.minute}:${time.second}`;
  }, [valueFromProps, openStart, tempStart, isRange, rangeValue, singleValue]);

  const inputEndValue = useMemo(() => {
    let time;
    if (valueFromProps !== undefined) {
      time = openEnd
        ? tempEnd
        : isRange
        ? (valueFromProps as TimeRangeValue).end
        : (valueFromProps as Time);
    } else {
      time = openEnd ? tempEnd : rangeValue?.end;
    }
    if (!time) {
      return '';
    }
    return `${time.hour}:${time.minute}:${time.second}`;
  }, [valueFromProps, openEnd, tempEnd, isRange, rangeValue?.end]);

  const getStartCellId = useCallback(
    (timeId: string) => `${startUniqId}-${timeId}`,
    [startUniqId]
  );
  const getEndCellId = useCallback(
    (timeId: string) => `${endUniqId}-${timeId}`,
    [endUniqId]
  );
  const scrollIntoDivById = (divId: string, smooth?: boolean) => {
    const selectedEl = document.getElementById(divId);
    if (smooth) {
      selectedEl?.scrollIntoView({ behavior: 'smooth', block: 'start' });
    } else {
      selectedEl?.scrollIntoView(true);
    }
  };

  const onClickCell = useCallback(
    (timeType: 'hour' | 'minute' | 'second', timeDigit: string) => {
      if (isRange && openEnd) {
        setTempEnd((prev) => ({
          ...(prev ?? defaultTime),
          [timeType]: timeDigit,
        }));
        const timeId = getEndCellId(`${timeType}-${timeDigit}`);
        scrollIntoDivById(timeId, true);
        return;
      }
      setTempStart((prev) => ({
        ...(prev ?? defaultTime),
        [timeType]: timeDigit,
      }));
      const timeId = getStartCellId(`${timeType}-${timeDigit}`);
      scrollIntoDivById(timeId, true);
    },
    [isRange, openEnd, getEndCellId, getStartCellId]
  );

  useEffect(() => {
    if (openStart) {
      let digitHour = '00';
      let digitMinute = '00';
      let digitSecond = '00';
      if (singleValue) {
        digitHour = singleValue.hour;
        digitMinute = singleValue.minute;
        digitSecond = singleValue.second;
      } else if (rangeValue?.start) {
        digitHour = rangeValue.start.hour;
        digitMinute = rangeValue.start.minute;
        digitSecond = rangeValue.start.second;
      }
      const hourId = getStartCellId(`hour-${digitHour}`);
      const minuteId = getStartCellId(`minute-${digitMinute}`);
      const secondId = getStartCellId(`second-${digitSecond}`);
      scrollIntoDivById(hourId);
      scrollIntoDivById(minuteId);
      scrollIntoDivById(secondId);
    }
  }, [openStart, singleValue, rangeValue, getStartCellId]);

  useEffect(() => {
    if (openEnd) {
      let digitHour = '00';
      let digitMinute = '00';
      let digitSecond = '00';
      if (rangeValue?.end) {
        digitHour = rangeValue.end.hour;
        digitMinute = rangeValue.end.minute;
        digitSecond = rangeValue.end.second;
      }
      const hourId = getEndCellId(`hour-${digitHour}`);
      const minuteId = getEndCellId(`minute-${digitMinute}`);
      const secondId = getEndCellId(`second-${digitSecond}`);
      scrollIntoDivById(hourId);
      scrollIntoDivById(minuteId);
      scrollIntoDivById(secondId);
    }
  }, [singleValue, rangeValue, getEndCellId, openEnd]);

  useEffect(() => {
    if (isRange) {
      setRangeValue(valueFromProps as TimeRangeValue);
    } else {
      setSingleValue(valueFromProps as Time);
    }
  }, [valueFromProps, isRange]);

  const hasSelected =
    singleValue !== undefined ||
    valueFromProps !== undefined ||
    rangeValue?.start !== undefined ||
    rangeValue?.end !== undefined;

  const uniqId = isRange && openEnd ? endUniqId : startUniqId;
  const selectedTime = isRange && openEnd ? tempEnd : tempStart;

  return (
    <StyledWrapper
      css={{ ...css, ...getColorSchemeVariants(colorScheme) }}
      hasSelected={hasSelected}
      disabled={disabled}
      className={className}
    >
      <Popover.Root>
        <StyledTrigger />
        <Popover.Portal forceMount>
          <StyledPanelContainer
            align="start"
            sideOffset={3}
            onInteractOutside={() => {
              setOpenStart(false);
              setOpenEnd(false);
            }}
            onOpenAutoFocus={(e) => e.preventDefault()}
            css={getColorSchemeVariants(colorScheme)}
            open={openStart || openEnd}
            className={clsx('panel-container', dropdownClassname)}
          >
            <TimePickerPanel
              uniqId={uniqId}
              selectedTime={selectedTime}
              onClickCell={onClickCell}
              onClickNow={onClickNow}
              onClickOk={onClickOk}
              className="panel"
            />
          </StyledPanelContainer>
        </Popover.Portal>
        <StyledPicker
          className="picker"
          onClick={(e) =>
            isRange ? e.preventDefault() : setOpenStart((prev) => !prev)
          }
          focused={openStart || openEnd}
          disabled={disabled}
          isRange={isRange}
          size={size}
        >
          {openStart ? (
            <StyledAnchorWrapper>
              <StyledAnchor />
            </StyledAnchorWrapper>
          ) : null}
          <StyledPickerInput
            placeholder={isRange ? placeholderStart : placeholder}
            value={inputStartValue}
            onClick={(e) => {
              e.stopPropagation();
              setOpenStart((prev) => !prev);
            }}
            readOnly
            focused={isRange && openStart}
            size={size}
          />
          {isRange ? (
            <StyledSeparator className="input-range-separator">
              <svg
                width="1em"
                height="1em"
                viewBox="0 0 16 16"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  d="M13.6422 9.31563L11.0797 6.06563C11.033 6.00629 10.9734 5.95832 10.9055 5.92531C10.8375 5.89229 10.763 5.87509 10.6875 5.875H9.675C9.57031 5.875 9.5125 5.99531 9.57656 6.07812L11.8313 8.9375H2.375C2.30625 8.9375 2.25 8.99375 2.25 9.0625V10C2.25 10.0687 2.30625 10.125 2.375 10.125H13.2484C13.6672 10.125 13.9 9.64375 13.6422 9.31563Z"
                  fill="black"
                  fillOpacity="0.25"
                />
              </svg>
            </StyledSeparator>
          ) : null}
          {openEnd ? (
            <StyledAnchorWrapper>
              <StyledAnchor />
            </StyledAnchorWrapper>
          ) : null}
          {isRange ? (
            <StyledPickerInput
              placeholder={placeholderEnd || placeholder}
              value={inputEndValue}
              onClick={(e) => {
                e.stopPropagation();
                setOpenEnd((prev) => !prev);
              }}
              readOnly
              focused={isRange && openEnd}
            />
          ) : null}
          <StyledIcon className="suffix-icon">
            <ClockCircleOutlined />
            {allowClear && !disabled ? (
              <StyledClear
                className="clear-btn"
                onClick={(e) => {
                  e.stopPropagation();
                  onClear();
                }}
              >
                <CloseCircleFilled />
              </StyledClear>
            ) : null}
          </StyledIcon>
        </StyledPicker>
      </Popover.Root>
    </StyledWrapper>
  );
}

export default TimePicker;
