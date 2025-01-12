import { create } from '@storybook/theming'

const light = create({
  base: 'light',

  colorPrimary: 'rgb(236, 171, 6)',
  colorSecondary: 'rgb(236, 171, 6)',

  // UI
  appBg: 'rgb(245, 245, 245)',
  appContentBg: 'rgb(245, 245, 245)',
  appBorderColor: 'rgb(229, 229, 229)',
  appBorderRadius: 5,

  // Typography
  fontBase:
    "Seravek, 'Gill Sans Nova', Ubuntu, Calibri, 'DejaVu Sans', source-sans-pro, sans-serif",
  fontCode:
    "ui-monospace, 'Cascadia Code', 'Source Code Pro', Menlo, Consolas, 'DejaVu Sans Mono', monospace",

  // Text colors
  textColor: 'rgb(64, 64, 64)',
  textInverseColor: 'rgb(245, 245, 245)',

  // Toolbar default and active colors
  barTextColor: 'rgb(64, 64, 64)',
  barSelectedColor: 'rgb(236, 171, 6)',
  barBg: 'rgb(255, 255, 255)',

  // Form colors
  inputBg: 'rgb(255, 255, 255)',
  inputBorder: 'rgb(229, 229, 229)',
  inputTextColor: 'rgb(64, 64, 64)',
  inputBorderRadius: 5,

  brandUrl: '/?path=/docs/getting-started--docs',
  brandTarget: '_self',
})

const dark = create({
  base: 'dark',

  colorPrimary: 'rgb(236, 171, 6)',
  colorSecondary: 'rgb(236, 171, 6)',

  // UI
  appBg: 'rgb(20, 20, 20)',
  appContentBg: 'rgb(20, 20, 20)',
  appBorderColor: 'rgb(32, 32, 32)',
  appBorderRadius: 5,

  // Typography
  fontBase:
    "Seravek, 'Gill Sans Nova', Ubuntu, Calibri, 'DejaVu Sans', source-sans-pro, sans-serif",
  fontCode:
    "ui-monospace, 'Cascadia Code', 'Source Code Pro', Menlo, Consolas, 'DejaVu Sans Mono', monospace",

  // Text colors
  textColor: 'rgb(245, 245, 245)',
  textInverseColor: 'rgb(64, 64, 64)',

  // Toolbar default and active colors
  barTextColor: 'rgb(245, 245, 245)',
  barSelectedColor: 'rgb(236, 171, 6)',
  barBg: 'rgb(25, 25, 25)',

  // Form colors
  inputBg: 'rgb(30, 30, 30)',
  inputBorder: 'rgb(32, 32, 32)',
  inputTextColor: 'rgb(245, 245, 245)',
  inputBorderRadius: 5,

  brandUrl: '/?path=/docs/getting-started--docs',
  brandTarget: '_self',
})

export default { light, dark }
