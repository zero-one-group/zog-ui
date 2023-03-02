import * as TabsPrimitive from '@radix-ui/react-tabs';
import { styled } from '../stitches.config';
export const Tabs = styled(TabsPrimitive.Root, {
  /* reset */
  'button,fieldset,input': {
    all: 'unset',
  },
  button: {
    display: 'flex ',
    flexdirection: 'column ',
    gap: '11px',
    alignItems: 'center',
  },
  '&[data-orientation=vertical]': {
    display: 'flex',
    alignItems: 'baseline',
    gap: '12px',
  },
  position: 'relative',
});
export default Tabs;
