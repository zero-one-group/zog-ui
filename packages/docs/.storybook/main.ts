import { rootMain } from '../../../.storybook/main';

import type { StorybookConfig, Options } from '@storybook/core-common';

const config: StorybookConfig = {
  ...rootMain,
  stories: [
    ...rootMain.stories,
    '../src/stories/**/*.stories.mdx',
    '../src/stories/**/*.stories.@(js|jsx|ts|tsx)',
  ],
  addons: [...(rootMain.addons || []), '@nrwl/react/plugins/storybook'],
  features: {
    interactionsDebugger: true, // 👈 Enable playback controls
  },
  core: {
    ...rootMain.core,
    builder: {
      name: 'webpack5',
      options: {
        fsCache: true,
      },
    },
  },
  webpackFinal: async (config, { configType }: Options) => {
    // apply any global webpack configs that might have been specified in .storybook/main.ts
    if (rootMain.webpackFinal) {
      config = await rootMain.webpackFinal(config, { configType } as Options);
    }

    // add your own webpack tweaks if needed

    return config;
  },
};

module.exports = config;
