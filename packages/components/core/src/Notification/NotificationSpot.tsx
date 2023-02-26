import * as Toast from '@radix-ui/react-toast';
import {
  forwardRef,
  useId,
  useImperativeHandle,
  useMemo,
  useState,
} from 'react';
import { NotificationCard, NotificationCardProps } from './NotificationCard';
import {
  NotificationPlacement,
  NotificationViewport,
} from './NotificationViewport';

type NotificationSpotProps = {
  placement?: NotificationPlacement;
};

export type NotificationData = Pick<
  NotificationCardProps,
  | 'title'
  | 'description'
  | 'icon'
  | 'action'
  | 'actionComponent'
  | 'className'
  | 'css'
  | 'style'
> &
  Pick<Toast.ToastProps, 'duration'>;

export type NotificationSpotHandle = {
  addNotif: (notif: NotificationData) => void;
};

const NotificationSpot = forwardRef<
  NotificationSpotHandle,
  NotificationSpotProps
>(({ placement = 'bottom-right' }, forwardedRef) => {
  const uniqId = useId();
  const [notificationList, setNotificationList] = useState<NotificationData[]>(
    []
  );

  useImperativeHandle(forwardedRef, () => ({
    addNotif(notif) {
      setNotificationList((prev) => [...prev, notif]);
    },
  }));

  const swipeDirection = useMemo<Toast.SwipeDirection>(() => {
    if (placement === 'top-left' || placement === 'bottom-left') {
      return 'left';
    }
    return 'right';
  }, [placement]);

  return (
    <Toast.Provider
      label={`${placement}-notification`}
      swipeDirection={swipeDirection}
    >
      {notificationList.map((notif, i) => (
        <NotificationCard
          placement={placement}
          key={`notification-${uniqId}-${i}`}
          {...notif}
        />
      ))}
      <NotificationViewport placement={placement} />
    </Toast.Provider>
  );
});

export default NotificationSpot;
