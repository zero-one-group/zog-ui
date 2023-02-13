import { ClockCircleOutlined, CloseCircleFilled } from '@ant-design/icons';
import * as Popover from '@radix-ui/react-popover';
import { ComponentProps, useCallback, useEffect, useId, useState } from 'react';
import { styled } from '../stitches.config';
import { TimePickerPanel } from './TimePickerPanel';

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

const Box = styled('div', {
  fontFamily: '$untitled',
  boxSizing: 'border-box',
});

const StyledWrapper = styled(Box, {
  display: 'inline-flex',
  // gridTemplateColumns: 'auto 1fr',
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
  // height: '100%',
});
const StyledAnchorWrapper = styled('div', {
  position: 'relative',
  height: '100%',
});
const StyledAnchor = styled(Popover.Anchor, {
  width: 0,
  position: 'absolute',
  bottom: '-8px',
  left: '-12px',
  // height: '100%',
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
  // gridTemplateColumns: '1fr auto',
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
  width: '100px',
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

/* eslint-disable-next-line */
export interface TimePickerProps {
  css?: ComponentProps<typeof StyledWrapper>['css'];
  colorScheme?: string;
  placeholder?: string;
  placeholderStart?: string;
  placeholderEnd?: string;
  disabled?: boolean;
  allowClear?: boolean;
  value?: Time;
  onChange: (value: Time | TimeRangeValue) => void;
  /**
   * Range Time Picker, there will be a start time and end time
   */
  isRange?: boolean;
}

// change 0 to 00, add 0 behind
const getTwoDigit = (t: number) => ('0' + t).slice(-2);

const getTimeFromDate = (date: Date): Time => {
  return {
    hour: getTwoDigit(date.getHours()),
    minute: getTwoDigit(date.getMinutes()),
    second: getTwoDigit(date.getSeconds()),
  };
};

export function TimePicker({
  css,
  colorScheme,
  disabled,
  allowClear = true,
  placeholder = 'Select time',
  placeholderStart = 'Start time',
  placeholderEnd = 'End time',
  isRange,
  ...props
}: TimePickerProps) {
  const [openStart, setOpenStart] = useState(false);
  const [openEnd, setOpenEnd] = useState(false);
  const [start, setStart] = useState<Time | undefined>();
  const [end, setEnd] = useState<Time | undefined>();
  // Temporary Start, used in the dropdown
  const [tempStart, setTempStart] = useState<Time | undefined>();
  const [tempEnd, setTempEnd] = useState<Time | undefined>();
  const startUniqId = useId();
  const endUniqId = useId();

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
    setStart(undefined);
    setTempStart(undefined);
    setEnd(undefined);
    setTempEnd(undefined);
    closeDropdown();
  };

  const onClickNow = useCallback(() => {
    const now = new Date();
    const nowTime = getTimeFromDate(now);
    if (isRange && openEnd) {
      setTempEnd(nowTime);
      setEnd(nowTime);
      closeDropdown();
    } else {
      setTempStart(nowTime);
      setStart(nowTime);

      closeStartOpenEndDropdown();
    }
  }, [closeStartOpenEndDropdown, isRange, openEnd]);

  const onClickOk = useCallback(() => {
    if (isRange && openEnd && tempEnd !== undefined) {
      setEnd(tempEnd);
      closeDropdown();
    } else if (tempStart !== undefined) {
      setStart(tempStart);
      closeStartOpenEndDropdown();
    }
  }, [closeStartOpenEndDropdown, isRange, openEnd, tempEnd, tempStart]);

  const getInputStart = useCallback(() => {
    const time = openStart ? tempStart : start;
    if (!time) {
      return '';
    }
    return `${time.hour}:${time.minute}:${time.second}`;
  }, [start, tempStart, openStart]);

  const getInputEnd = useCallback(() => {
    const time = openEnd ? tempEnd : end;
    if (!time) {
      return '';
    }
    return `${time.hour}:${time.minute}:${time.second}`;
  }, [end, tempEnd, openEnd]);

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
      const defaultTemp: Time = { hour: '00', minute: '00', second: '00' };
      if (isRange && openEnd) {
        setTempEnd((prev) => ({
          ...(prev ?? defaultTemp),
          [timeType]: timeDigit,
        }));
        const timeId = getEndCellId(`${timeType}-${timeDigit}`);
        scrollIntoDivById(timeId, true);
        return;
      }
      setTempStart((prev) => ({
        ...(prev ?? defaultTemp),
        [timeType]: timeDigit,
      }));
      const timeId = getStartCellId(`${timeType}-${timeDigit}`);
      scrollIntoDivById(timeId, true);
    },
    [isRange, openEnd, getEndCellId, getStartCellId]
  );

  useEffect(() => {
    if (openStart) {
      let hourId: string;
      let minuteId: string;
      let secondId: string;
      if (start !== undefined) {
        hourId = getStartCellId(`hour-${start.hour}`);
        minuteId = getStartCellId(`minute-${start.minute}`);
        secondId = getStartCellId(`second-${start.second}`);
      } else {
        // reset the time panel / scroll to top
        hourId = getStartCellId(`hour-00`);
        minuteId = getStartCellId(`minute-00`);
        secondId = getStartCellId(`second-00`);
      }
      scrollIntoDivById(hourId);
      scrollIntoDivById(minuteId);
      scrollIntoDivById(secondId);
    }
  }, [openStart, start, getStartCellId]);

  useEffect(() => {
    if (openEnd) {
      let hourId: string;
      let minuteId: string;
      let secondId: string;
      if (end !== undefined) {
        hourId = getEndCellId(`hour-${end.hour}`);
        minuteId = getEndCellId(`minute-${end.minute}`);
        secondId = getEndCellId(`second-${end.second}`);
      } else {
        // reset the time panel / scroll to top
        hourId = getEndCellId(`hour-00`);
        minuteId = getEndCellId(`minute-00`);
        secondId = getEndCellId(`second-00`);
      }
      scrollIntoDivById(hourId);
      scrollIntoDivById(minuteId);
      scrollIntoDivById(secondId);
    }
  }, [openEnd, end, getEndCellId]);

  const hasSelected = start !== undefined || end !== undefined;
  const inputStartValue = getInputStart();
  const inputEndValue = getInputEnd();

  const uniqId = isRange && openEnd ? endUniqId : startUniqId;
  const selectedTime = isRange && openEnd ? tempEnd : tempStart;
  return (
    <StyledWrapper
      css={{ ...css, ...getColorSchemeVariants(colorScheme) }}
      hasSelected={hasSelected}
      disabled={disabled}
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
          >
            <TimePickerPanel
              uniqId={uniqId}
              selectedTime={selectedTime}
              onClickCell={onClickCell}
              onClickNow={onClickNow}
              onClickOk={onClickOk}
            />
          </StyledPanelContainer>
        </Popover.Portal>
        <StyledPicker
          className="picker"
          onClick={(e) =>
            isRange ? e.preventDefault() : setOpenStart((prev) => !prev)
          }
          focused={openStart}
          disabled={disabled}
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
          />
          {isRange ? (
            <StyledSeparator>
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
                  fill-opacity="0.25"
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
            />
          ) : null}
          <StyledIcon>
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
