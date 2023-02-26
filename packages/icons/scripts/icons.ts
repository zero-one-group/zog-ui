import path from 'path';
import { type IconDefinition } from './types';

export const icons: IconDefinition[] = [
  {
    id: 'ant-design',
    name: 'Ant Design',
    contents: [
      {
        files: path.join(__dirname, `../svg-files/ant-design/filled/*.svg`),
        formatter: (name: string) => `AntFilled${name}`,
      },
      {
        files: path.join(__dirname, `../svg-files/ant-design/outlined/*.svg`),
        formatter: (name: string) => `AntOutlined${name}`,
      },
      {
        files: path.join(__dirname, `../svg-files/ant-design/twotone/*.svg`),
        formatter: (name: string) => `AntTwoTone${name}`,
      },
    ],
    projectUrl: 'https://github.com/ant-design/ant-design-icons',
    license: 'MIT',
    licenseUrl:
      'https://github.com/ant-design/ant-design-icons/blob/master/LICENSE',
    source: {
      type: 'git',
      localName: 'ant-design',
      remoteDir: 'packages/icons-svg/svg/',
      url: 'https://github.com/ant-design/ant-design-icons.git',
      branch: 'master',
    },
  },
];
