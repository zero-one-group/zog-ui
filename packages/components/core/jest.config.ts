/* eslint-disable */
export default {
  displayName: 'components-core',
  preset: '../../../jest.preset.js',
  transform: {
    '^(?!.*\\.(js|jsx|ts|tsx|css|json)$)': '@nrwl/react/plugins/jest',
    '^.+\\.[tj]sx?$': ['babel-jest', { presets: ['@nrwl/react/babel'] }],
  },
  // If using swc compiler:
  // transform: {
  //   '^.+\\.[tj]sx?$': [
  //     '@swc/jest',
  //     { jsc: { transform: { react: { runtime: 'automatic' } } } },
  //   ],
  // },
  moduleFileExtensions: ['ts', 'tsx', 'js', 'jsx'],
  coverageDirectory: '../../../coverage/packages/components/core',
};
