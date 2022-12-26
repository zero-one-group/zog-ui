import { create } from '@storybook/theming';

const light = create({
  base: 'light',

  colorPrimary: '#007aff',
  colorSecondary: 'rgb(77, 172, 255)',

  // UI
  appBg: '#f0f9ff',
  appContentBg: '#fff',
  appBorderColor: '#DDD',
  appBorderRadius: 2,

  // Typography
  fontBase: 'Inter, "Open Sans", sans-serif',
  fontCode: '"JetBrains Mono NL", Monaco, "Roboto Mono", Consolas, monospace',

  // Text colors
  textColor: 'rgb(16, 25, 35)',
  textInverseColor: 'rgba(255,255,255,0.9)',

  // Toolbar default and active colors
  barTextColor: '#1e293b',
  barSelectedColor: 'rgb(77, 172, 255)',
  barBg: '#fff',

  // Form colors
  inputBg: '#fff',
  inputBorder: '#DDD',
  inputTextColor: '#1e293b',
  inputBorderRadius: 3,

  brandUrl: '/?path=/docs/introduction--page',
  // brandImage: 'https://zero-one-group.com/images/brand-svg/logotype-dark.svg',
  // brandTitle: 'Zero Design System',
  brandTarget: '_self',
});

const dark = create({
  base: 'dark',

  colorPrimary: 'rgb(77, 172, 255)',
  colorSecondary: 'rgb(60, 82, 105)',

  // UI
  appBg: 'rgb(20, 31, 44)',
  appContentBg: 'rgb(32, 50, 70)',
  appBorderColor: 'rgba(255,255,255, .125)',
  appBorderRadius: 2,

  // Typography
  fontBase: 'Inter, "Open Sans", sans-serif',
  fontCode: '"JetBrains Mono NL", Monaco, "Roboto Mono", Consolas, monospace',

  // Text colors
  textColor: '#fff',
  textInverseColor: 'rgba(0,0,0,0.9)',

  // Toolbar default and active colors
  barTextColor: '#fff',
  barSelectedColor: 'rgb(77, 172, 255)',
  barBg: 'rgb(32, 50, 70)',

  // Form colors
  inputBg: '#fff',
  inputBorder: '#DDD',
  inputTextColor: '#1e293b',
  inputBorderRadius: 3,

  brandUrl: '/?path=/docs/introduction--page',
  // brandImage: 'https://zero-one-group.com/images/brand-svg/logotype-dark.svg',
  // brandTitle: 'Zero Design System',
  brandTarget: '_self',
});

export default { light, dark };
