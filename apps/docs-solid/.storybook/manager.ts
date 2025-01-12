import { addons } from '@storybook/manager-api'
import customTheme from './theme'

const channel = addons.getChannel()
let isDark = true

channel.on('DARK_MODE', (darkMode: boolean) => {
  isDark = darkMode
  addons.setConfig({
    theme: isDark ? customTheme.dark : customTheme.light,
  })
})

addons.setConfig({
  sidebar: {
    showRoots: false,
    collapsedRoots: ['other'],
  },
  panelPosition: 'right',
  enableShortcuts: false,
  isFullscreen: false,
  showNav: true,
  showPanel: true,
  showToolbar: true,
  toolbar: {
    copy: { hidden: true },
    eject: { hidden: false },
    fullscreen: { hidden: true },
    title: { hidden: false },
    zoom: { hidden: false },
    'storybook/viewport': { hidden: false },
    'storybook/outline': { hidden: false },
    'storybook/theme-toggle': { hidden: true },
  },
  initialActive: 'sidebar',
  selectedPanel: 'controls',
})
