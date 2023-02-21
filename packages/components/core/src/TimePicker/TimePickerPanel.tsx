import clsx from 'clsx';
import { ComponentProps } from 'react';
import { Space } from '../Space';
import { styled } from '../stitches.config';
import { Time } from './TimePicker';

const Box = styled('div', {
  fontFamily: '$untitled',
  boxSizing: 'border-box',
});

const StyledPanelLayout = styled(Box, {
  display: 'inline-flex',
  flexDirection: 'column',
});

const StyledTimePanel = styled('div', {
  paddingTop: '4px',
});
const StyledTimeContent = styled('div', {
  display: 'flex',
  height: 224,
  width: '100%',
  tableLayout: 'fixed',
  borderCollapse: 'collapse',
});

const StyledTimePanelColumn = styled('ul', {
  flex: '1 0 auto',
  width: '56px',
  margin: '4px 0',
  padding: 0,
  overflowY: 'hidden',
  textAlign: 'start',
  listStyle: 'none',
  overflowX: 'hidden',
  '&:hover': {
    overflowY: 'auto',
  },
  '&::after': {
    display: 'block',
    height: '186px',
    content: '',
  },
});

const StyledTimePanelCell = styled('li', {
  marginInline: '4px',
});
const StyledTimePanelCellInner = styled('div', {
  display: 'flex',
  justifyContent: 'center',
  alignItems: 'center',
  width: '48px',
  height: '28px',
  margin: 0,
  color: 'rgba(0,0,0,.88)',
  lineHeight: '28px',
  borderRadius: '2px',
  cursor: 'pointer',
  '&:hover': {
    background: '$blackA3',
  },
  variants: {
    selected: {
      true: {
        background: '$$highlightColor',
      },
    },
  },
});

const StyledFooter = styled(Space, {
  borderTop: '1px solid $blackA4',
  justifyContent: 'space-between',
  padding: '4px 12px',
  lineHeight: '34px',
});

const StyledNow = styled('a', {
  color: '$$primaryColor',
  cursor: 'pointer',
  fontSize: '14px',
});
const StyledOk = styled('button', {
  background: '$$primaryColor',
  padding: '0 7px',
  height: '24px',
  outline: 'none',
  border: 'none',
  borderRadius: '2px',
  color: 'white',
  cursor: 'pointer',
  fontSize: '14px',
  '&:disabled': {
    outline: '1px solid $blackA7',
    background: '$blackA3',
    color: '$blackA11',
    cursor: 'not-allowed',
  },
});

// change 0 to 00, add 0 behind
export const getTwoDigit = (t: number) => ('0' + t).slice(-2);

const getDigits = (n: number) => {
  return Array.from(Array(n).keys()).map((deg) => getTwoDigit(deg));
};

const hourDigits = getDigits(24);
const sixtyDigits = getDigits(60);

type TimePickerPanelProps = {
  uniqId: string;
  selectedTime?: Time;
  onClickCell: (
    timeType: 'hour' | 'minute' | 'second',
    timeDigit: string
  ) => void;
  onClickNow?: () => void;
  onClickOk?: (selectedTime?: Time) => void;
} & ComponentProps<typeof StyledTimePanel>;

export const TimePickerPanel = ({
  uniqId,
  selectedTime,
  onClickCell,
  onClickNow,
  onClickOk,
  ...props
}: TimePickerPanelProps) => {
  return (
    <StyledPanelLayout className="panel-layout">
      <StyledTimePanel {...props}>
        <StyledTimeContent className="panel-content">
          <StyledTimePanelColumn className="panel-column-hour">
            {hourDigits.map((digit) => (
              <StyledTimePanelCell key={`${uniqId}-hour-${digit}`}>
                <StyledTimePanelCellInner
                  id={`${uniqId}-hour-${digit}`}
                  selected={digit === selectedTime?.hour}
                  onClick={() => onClickCell('hour', digit)}
                  className={clsx({ selected: digit === selectedTime?.hour })}
                >
                  {digit}
                </StyledTimePanelCellInner>
              </StyledTimePanelCell>
            ))}
          </StyledTimePanelColumn>
          <StyledTimePanelColumn className="panel-column-minute">
            {sixtyDigits.map((digit) => (
              <StyledTimePanelCell key={`${uniqId}-minute-${digit}`}>
                <StyledTimePanelCellInner
                  id={`${uniqId}-minute-${digit}`}
                  selected={digit === selectedTime?.minute}
                  onClick={() => onClickCell('minute', digit)}
                  className={clsx({ selected: digit === selectedTime?.minute })}
                >
                  {digit}
                </StyledTimePanelCellInner>
              </StyledTimePanelCell>
            ))}
          </StyledTimePanelColumn>
          <StyledTimePanelColumn className="panel-column-second">
            {sixtyDigits.map((digit) => (
              <StyledTimePanelCell key={`${uniqId}-second-${digit}`}>
                <StyledTimePanelCellInner
                  id={`${uniqId}-second-${digit}`}
                  selected={digit === selectedTime?.second}
                  onClick={() => onClickCell('second', digit)}
                  className={clsx({ selected: digit === selectedTime?.second })}
                >
                  {digit}
                </StyledTimePanelCellInner>
              </StyledTimePanelCell>
            ))}
          </StyledTimePanelColumn>
        </StyledTimeContent>
      </StyledTimePanel>
      {typeof onClickNow === 'function' || typeof onClickOk === 'function' ? (
        <StyledFooter className="panel-footer">
          <span>
            {onClickNow ? (
              <StyledNow className="btn-now" onClick={() => onClickNow()}>
                Now
              </StyledNow>
            ) : null}
          </span>
          <span>
            {onClickOk ? (
              <StyledOk
                onClick={() => onClickOk(selectedTime)}
                disabled={selectedTime === undefined}
                className="btn-ok"
              >
                Ok
              </StyledOk>
            ) : null}
          </span>
        </StyledFooter>
      ) : null}
    </StyledPanelLayout>
  );
};
