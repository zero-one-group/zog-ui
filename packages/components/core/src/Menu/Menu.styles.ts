import * as RadixMenu from '@radix-ui/react-navigation-menu';
import { styled } from '../stitches.config';

export const StyledMenuRoot = styled(RadixMenu.Root, {
  position: 'relative',
  display: 'flex',
  justifyContent: 'center',
  zIndex: 1,
  variants: {
    mode: {
      horizontal: {},
      vertical: {},
      inline: {},
    },
  },
});
