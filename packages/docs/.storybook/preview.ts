import { addParameters } from '@storybook/react';
import badgeParameter from './parameter';

// Register extra parameters
addParameters(badgeParameter);

export const parameters = {
  layout: 'padded',
  actions: { argTypesRegex: '^on[A-Z].*' },
  options: {
    // https://storybook.js.org/docs/react/writing-stories/naming-components-and-hierarchy
    storySort: {
      order: [
        'Introduction',
        'Getting Started',
        'Server Side Rendering',
        'Foundations',
        'Components',
        '*',
      ],
    },
  },
  controls: {
    hideNoControlsWarning: true,
    sort: 'requiredFirst',
    matchers: {
      color: /(background|color)$/i,
      date: /Date$/,
    },
  },
};
