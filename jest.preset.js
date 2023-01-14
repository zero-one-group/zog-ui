const nxPreset = require('@nrwl/jest/preset').default;
const path = require('path');

module.exports = {
  ...nxPreset,
  setupFilesAfterEnv: [
    path.resolve(__dirname, 'setup-tests.ts'),
    'jest-extended/all',
  ],
};
