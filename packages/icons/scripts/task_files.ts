import { transform } from '@svgr/core';
import camelcase from 'camelcase';
import { promises as fs } from 'fs-extra';
import path from 'path';
import { icons } from './icons';
import { getIconFiles, rmDirRecursive } from './logics';
import { IconDefinition } from './types';

import svgrTemplate from './svgr-template';

const timestamp = new Date().toUTCString();
const MOD_HEADER = `// THIS FILE IS AUTO GENERATED (${timestamp})\n`;

// eslint-disable-next-line @typescript-eslint/no-unused-vars
export async function dirInit({ DIST, rootDir }) {
  const ignore = (err: { code: string }) => {
    if (err.code === 'EEXIST') return;
    throw err;
  };

  await rmDirRecursive(path.resolve(DIST, 'src/lib')).catch((err) => {
    if (err.code === 'ENOENT') return;
    throw err;
  });
  await fs.mkdir(DIST, { recursive: true }).catch(ignore);
  await fs.mkdir(path.resolve(DIST, 'src')).catch(ignore);
  await fs.mkdir(path.resolve(DIST, 'src', 'lib')).catch(ignore);

  for (const icon of icons) {
    const iconBasePath = path.resolve(DIST, 'src', 'lib', icon.id);
    await fs.mkdir(iconBasePath).catch(ignore);
    await fs.writeFile(
      path.resolve(iconBasePath, 'index.ts'),
      MOD_HEADER,
      'utf8'
    );
  }

  // Write index file
  await fs.writeFile(path.resolve(DIST, 'src', 'index.ts'), MOD_HEADER, 'utf8');
}

// eslint-disable-next-line @typescript-eslint/no-unused-vars
export async function writeIconModuleFiles(icon: IconDefinition, { DIST }) {
  const exists = new Set(); // for remove duplicate

  for (const content of icon.contents) {
    const files = await getIconFiles(content);

    for (const file of files) {
      const svgStrRaw = await fs.readFile(file, 'utf8');
      const rawName = path.basename(file, path.extname(file));
      const pascalName = camelcase(rawName, { pascalCase: true });
      const name =
        (content.formatter && content.formatter(pascalName, file)) ||
        pascalName;
      if (exists.has(name)) continue;
      exists.add(name);

      const jsCode = await transform(
        svgStrRaw,
        {
          plugins: [
            '@svgr/plugin-svgo',
            '@svgr/plugin-jsx',
            '@svgr/plugin-prettier',
          ],
          typescript: true,
          // ref: true,
          icon: true,
          prettier: true,
          template: svgrTemplate,
        },
        { componentName: name }
      );

      // write like: module/heroicons/HiCheck.tsx
      const filePath = path.resolve(DIST, `src/lib/${icon.id}/${name}.tsx`);
      await fs.writeFile(filePath, MOD_HEADER + jsCode, 'utf8');

      // write index file for each icons
      const indexPath = path.resolve(DIST, `src/lib/${icon.id}/index.ts`);
      const indexFileContent = `export { ${name} } from './${name}';\n`;
      fs.appendFile(indexPath, indexFileContent, 'utf-8');

      exists.add(file);
    }
  }
}
