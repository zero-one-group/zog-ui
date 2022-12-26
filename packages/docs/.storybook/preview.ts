import { addParameters } from '@storybook/react';
import badgeParameter from './parameter';
// import '../src/styles/styles.css';

// Register extra parameters
addParameters(badgeParameter);

export const parameters = {
  layout: 'padded',
  actions: { argTypesRegex: '^on[A-Z].*' },
  options: {
    // eslint-disable-next-line
    storySort: (a: any, b: any) => a[1].id.localeCompare(b[1].id),
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
