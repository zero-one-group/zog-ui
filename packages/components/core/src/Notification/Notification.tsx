import React, {
  createContext,
  ReactNode,
  useCallback,
  useContext,
  useRef,
} from 'react';
import { NotificationData, NotificationSpotHandle } from './NotificationSpot';
import { NotificationPlacement } from './NotificationViewport';

const NotificationSpot = React.lazy(() => import('./NotificationSpot'));

type NotifyArg = NotificationData & { placement: NotificationPlacement };

type NotificationContextType = {
  notify: (data: NotifyArg) => void;
};

const NotificationContext = createContext<NotificationContextType>({
  notify() {
    return;
  },
});

export type NotificationProviderProps = {
  placements?: NotificationPlacement[] | 'all';
  children?: ReactNode;
};

export const NotificationProvider = ({
  placements = ['bottom-right'],
  children,
}: NotificationProviderProps) => {
  const topLeftSpotRef = useRef<NotificationSpotHandle>(null);
  const topRightSpotRef = useRef<NotificationSpotHandle>(null);
  const bottomLeftSpotRef = useRef<NotificationSpotHandle>(null);
  const bottomRightSpotRef = useRef<NotificationSpotHandle>(null);

  const notify = ({ placement, ...notifData }: NotifyArg) => {
    switch (placement) {
      case 'top-left':
        topLeftSpotRef.current?.addNotif(notifData);
        break;
      case 'top-right':
        topRightSpotRef.current?.addNotif(notifData);
        break;
      case 'bottom-left':
        bottomLeftSpotRef.current?.addNotif(notifData);
        break;
      case 'bottom-right':
      default:
        bottomRightSpotRef.current?.addNotif(notifData);
        break;
    }
  };

  return (
    <NotificationContext.Provider value={{ notify }}>
      {children}
      {placements.includes('top-left') || placements === 'all' ? (
        <NotificationSpot placement="top-left" ref={topLeftSpotRef} />
      ) : null}
      {placements.includes('top-right') || placements === 'all' ? (
        <NotificationSpot placement="top-right" ref={topRightSpotRef} />
      ) : null}
      {placements.includes('bottom-right') || placements === 'all' ? (
        <NotificationSpot placement="bottom-right" ref={bottomRightSpotRef} />
      ) : null}
      {placements.includes('bottom-left') || placements === 'all' ? (
        <NotificationSpot placement="bottom-left" ref={bottomLeftSpotRef} />
      ) : null}
    </NotificationContext.Provider>
  );
};

export const useNotification = ({
  placement,
}: {
  placement?: NotificationPlacement;
}) => {
  const { notify: baseNotify } = useContext(NotificationContext);

  const placementNotify = useCallback(
    ({ placement: originalPlacement, ...data }: NotifyArg) => {
      baseNotify({ ...data, placement: originalPlacement ?? placement });
    },
    [placement]
  );

  return [placementNotify] as const;
};
