import { addons } from '@storybook/addons';
import myTheme from './mytheme';

addons.setConfig({
  theme: myTheme.light,
  isFullscreen: false,
  showNav: true,
  showPanel: true,
  panelPosition: 'bottom',
  initialActive: 'sidebar',
  enableShortcuts: false,
  showToolbar: true,
  sidebar: {
    showRoots: true,
    collapsedRoots: ['other'],
  },
  toolbar: {
    title: { hidden: false },
    zoom: { hidden: false },
    eject: { hidden: true },
    copy: { hidden: true },
    fullscreen: { hidden: true },
  },
});
