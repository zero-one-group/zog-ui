import { addons } from '@storybook/manager-api'
import type { Preview, StoryContext, StoryFn } from 'storybook-solidjs'
import DocumentationTemplate from './template.mdx'
import customTheme from './theme'
import '@repo/core-ui/tailwind.css'
import '../src/main.css'

const withTheme = (StoryFn: StoryFn, context: StoryContext) => {
  const isDark = context.globals.theme === 'dark'
  document.documentElement.classList.toggle('dark', isDark)
  addons.getChannel().emit('DARK_MODE', isDark)
  return StoryFn(context.args, context)
}

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
    },
    options: {
      // https://storybook.js.org/docs/writing-stories/naming-components-and-hierarchy
      storySort: {
        order: [
          'Introduction',
          'Getting Started',
          'Basic Components',
          'Interactive Features',
          'Visualizations',
          '*',
        ],
      },
    },
    backgrounds: { disable: true },
    layout: 'centered',
    docs: {
      theme: customTheme.light,
      defaultName: 'Documentation',
      page: DocumentationTemplate,
      toc: {
        /* Enables the table of contents */
        headingSelector: 'h2, h3',
        ignoreSelector: '#primary',
        title: 'Table of Contents',
        disable: false,
        unsafeTocbotOptions: {
          orderedList: false,
        },
      },
    },
  },
  globalTypes: {
    theme: {
      name: 'Theme',
      description: 'Global theme switcher',
      defaultValue: 'dark',
      toolbar: {
        items: [
          { value: 'light', icon: 'sun', title: 'Light Theme' },
          { value: 'dark', icon: 'moon', title: 'Dark Theme' },
        ],
        showName: true,
        dynamicTitle: true,
      },
    },
  },
  decorators: [withTheme],
}

export default preview
