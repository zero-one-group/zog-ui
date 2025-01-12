import { withThemeByClassName } from '@storybook/addon-themes'
import type { Preview, ReactRenderer } from '@storybook/react'
import { themes } from '@storybook/theming'
import '@repo/core-ui/tailwind.css'

const preview: Preview = {
  // Optional parameter to center the component in the Canvas.
  // More info: https://storybook.js.org/docs/configure/story-layout
  parameters: {
    actions: { argTypesRegex: '^on[A-Z].*' },
    controls: {
      hideNoControlsWarning: true,
      sort: 'requiredFirst',
      matchers: {
        color: /(background|color)$/i,
        date: /Date$/i,
      },
      exclude: ['asChild', 'onClick'],
    },
    options: {
      // https://storybook.js.org/docs/writing-stories/naming-components-and-hierarchy
      storySort: {
        method: 'alphabetical',
        order: [
          'Introduction',
          'Getting Started',
          'Basic Components',
          'Layout Components',
          'Visualizations',
          '*',
        ],
      },
    },
    backgrounds: { disable: true },
    layout: 'padded',
    docs: {
      theme: themes.dark,
      defaultName: 'Documentation',
      toc: {
        /* Enables the table of contents */
        headingSelector: 'h2, h3',
        ignoreSelector: '#preview',
        title: 'Table of Contents',
        disable: false,
        unsafeTocbotOptions: {
          orderedList: false,
        },
      },
    },
  },
  // globalTypes: {
  //   theme: {
  //     name: 'Theme',
  //     description: 'Theme switcher',
  //     defaultValue: 'light',
  //     toolbar: {
  //       items: [
  //         { value: 'light', icon: 'sun', title: 'Light Theme' },
  //         { value: 'dark', icon: 'moon', title: 'Dark Theme' },
  //       ],
  //       showName: false,
  //       dynamicTitle: false,
  //     },
  //   },
  // },
  decorators: [
    withThemeByClassName<ReactRenderer>({
      themes: { light: 'light', dark: 'dark' },
      defaultTheme: 'light',
    }),
    (Story) => Story(),
  ],
}

export default preview
