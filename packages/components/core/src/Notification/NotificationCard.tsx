import { CloseOutlined } from '@ant-design/icons';
import * as Toast from '@radix-ui/react-toast';
import { ComponentProps, ReactNode } from 'react';
import { Space } from '../Space';
import { keyframes, styled } from '../stitches.config';
import { NotificationPlacement } from './NotificationViewport';

const VIEWPORT_PADDING = 20;

const hide = keyframes({
  '0%': { opacity: 1 },
  '100%': { opacity: 0 },
});

const slideInFromRight = keyframes({
  from: { transform: `translateX(calc(100% + ${VIEWPORT_PADDING}px))` },
  to: { transform: 'translateX(0)' },
});
const slideInFromLeft = keyframes({
  from: {
    transform: `translateX(calc(-1*calc(100% + ${VIEWPORT_PADDING}px)))`,
  },
  to: { transform: 'translateX(0)' },
});

const swipeOutRight = keyframes({
  from: { transform: 'translateX(var(--radix-toast-swipe-end-x))' },
  to: { transform: `translateX(calc(100% + ${VIEWPORT_PADDING}px))` },
});
const swipeOutLeft = keyframes({
  from: { transform: 'translateX(var(--radix-toast-swipe-end-x))' },
  to: {
    transform: `translateX(calc(-1 * calc(100% + ${VIEWPORT_PADDING}px)))`,
  },
});

const StyledNotificationRoot = styled(Toast.Root, {
  padding: '18px 20px',
  background: 'white',
  boxShadow:
    '0px 3px 6px -4px rgba(0, 0, 0, 0.12), 0px 6px 16px rgba(0, 0, 0, 0.08), 0px 9px 28px 8px rgba(0, 0, 0, 0.05)',
  borderRadius: '4px',
  fontFamily: '$untitled',
  color: '$blackA12',
  display: 'flex',
  alignItems: 'flex-start',
  gap: '16px',
  '&[data-state="closed"]': {
    animation: `${hide} 200ms ease-in`,
  },
  '&[data-swipe="move"]': {
    transform: 'translateX(var(--radix-toast-swipe-move-x))',
  },
  '&[data-swipe="cancel"]': {
    transform: 'translateX(0)',
    transition: 'transform 200ms ease-out',
  },
  variants: {
    placement: {
      'top-right': {
        '&[data-state="open"]': {
          animation: `${slideInFromRight} 150ms cubic-bezier(0.16, 1, 0.3, 1)`,
        },
        '&[data-swipe="end"]': {
          animation: `${swipeOutRight} 100ms ease-out`,
        },
      },
      'bottom-right': {
        '&[data-state="open"]': {
          animation: `${slideInFromRight} 150ms cubic-bezier(0.16, 1, 0.3, 1)`,
        },
        '&[data-swipe="end"]': {
          animation: `${swipeOutRight} 100ms ease-out`,
        },
      },
      'top-left': {
        '&[data-state="open"]': {
          animation: `${slideInFromLeft} 150ms cubic-bezier(0.16, 1, 0.3, 1)`,
        },
        '&[data-swipe="end"]': {
          animation: `${swipeOutLeft} 100ms ease-out`,
        },
      },
      'bottom-left': {
        '&[data-state="open"]': {
          animation: `${slideInFromLeft} 150ms cubic-bezier(0.16, 1, 0.3, 1)`,
        },
        '&[data-swipe="end"]': {
          animation: `${swipeOutLeft} 100ms ease-out`,
        },
      },
    },
  },
  defaultVariants: {
    placement: 'bottom-right',
  },
});

const StyledIcon = styled('span', {
  fontSize: '24px',
  width: '24px',
  height: '24px',
});

const StyledTitle = styled(Toast.Title, {
  fontSize: '16px',
});
const StyledClose = styled(Toast.Close, {
  marginLeft: '4px',
  fontSize: '14px',
  lineHeight: '14px',
  border: 0,
  outline: 0,
  display: 'inline-block',
  background: 'transparent',
  color: '$blackA10',
  padding: 0,
  cursor: 'pointer',
  transition: 'color .1s linear',
  '&:hover': {
    color: '$blackA12',
  },
});
const StyledDescription = styled(Toast.Description, {
  marginTop: 8,
  fontSize: 14,
  lineHeight: '22px',
  color: '$blackA11',
});
const StyledAction = styled(Toast.Action, {
  backgroundColor: '$primary9',
  color: 'white',
  borderRadius: 2,
  fontSize: 14,
  border: 0,
  outline: 0,
  paddingInline: 8,
  lineHeight: '22px',
  cursor: 'pointer',
});

type NotificationAction = {
  label: string;
  onClick?: () => void;
  alt?: string;
};

export type NotificationCardProps = {
  title?: string;
  description?: ReactNode;
  icon?: ReactNode;
  action?: NotificationAction;
  actionComponent?: ReactNode;
  placement?: NotificationPlacement;
} & ComponentProps<typeof StyledNotificationRoot>;

export const NotificationCard = ({
  title,
  description,
  icon,
  action,
  actionComponent,
  duration,
  ...props
}: NotificationCardProps) => {
  return (
    <StyledNotificationRoot {...props} duration={duration}>
      {icon ? <StyledIcon className="icon">{icon}</StyledIcon> : null}
      <div style={{ flex: 1 }} className="content">
        <Space justify="space-between" align="start" className="head">
          <div style={{ flex: 1 }}>
            {title ? (
              <StyledTitle className="title">{title}</StyledTitle>
            ) : null}
          </div>
          <StyledClose className="button-close">
            <CloseOutlined />
          </StyledClose>
        </Space>
        {description ? (
          <StyledDescription className="description">
            {description}
          </StyledDescription>
        ) : null}
        {action || actionComponent ? (
          <div
            style={{
              marginTop: 16,
              display: 'flex',
              justifyContent: 'flex-end',
            }}
            className="action-wrapper"
          >
            {action ? (
              <StyledAction
                altText={action.alt ?? action.label}
                onClick={action.onClick}
                className="action"
              >
                {action.label}
              </StyledAction>
            ) : null}
            {actionComponent}
          </div>
        ) : null}
      </div>
    </StyledNotificationRoot>
  );
};
