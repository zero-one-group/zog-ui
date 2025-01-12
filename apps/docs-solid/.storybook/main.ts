import type { StorybookConfig } from 'storybook-solidjs-vite'
import { mergeConfig } from 'vite'

const config: StorybookConfig = {
  stories: ['./_docs/**/*.mdx', '../stories/**/*.mdx', '../stories/**/*.stories.@(ts|tsx)'],
  addons: [
    '@storybook/addon-links',
    '@storybook/addon-essentials',
    '@storybook/addon-interactions',
    '@storybook/addon-themes',
  ],
  framework: {
    name: 'storybook-solidjs-vite',
    options: {},
  },
  core: {
    disableTelemetry: true, // 👈 Disables telemetry
    enableCrashReports: false, // 👈 Appends the crash reports to the telemetry events
  },
  async viteFinal(config) {
    return mergeConfig(config, {
      build: {
        chunkSizeWarningLimit: 1024,
      },
    })
  },
}

export default config
