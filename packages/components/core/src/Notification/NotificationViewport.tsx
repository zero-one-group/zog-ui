import * as Toast from '@radix-ui/react-toast';
import { styled } from '../stitches.config';

export const NotificationViewport = styled(Toast.Viewport, {
  position: 'fixed',
  display: 'flex',
  flexDirection: 'column',
  padding: 25,
  gap: 10,
  width: 390,
  maxWidth: '100vw',
  margin: 0,
  listStyle: 'none',
  zIndex: 2147483647,
  outline: 'none',
  variants: {
    placement: {
      'top-right': {
        top: 0,
        right: 0,
        flexDirection: 'column-reverse',
      },
      'bottom-right': {
        bottom: 0,
        right: 0,
      },
      'top-left': {
        top: 0,
        left: 0,
        flexDirection: 'column-reverse',
      },
      'bottom-left': {
        bottom: 0,
        left: 0,
      },
    },
  },
  defaultVariants: {
    placement: 'bottom-right',
  },
});

export type NotificationPlacement =
  | 'top-left'
  | 'top-right'
  | 'bottom-right'
  | 'bottom-left';
