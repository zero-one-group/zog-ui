import { promises as fs } from 'fs-extra';
import path from 'path';
import { performance } from 'perf_hooks';
import { icons } from './icons';
import * as taskCommon from './task_common';
import * as taskFiles from './task_files';

// file path
const ROOT_DIR = path.resolve(__dirname, '../../');

async function task(name: string, fn: any) {
  const start = performance.now();
  await fn();
  const end = performance.now();
  console.info(`${name}: `, Math.floor(end - start) / 1000, 'sec\n\n');
}

async function main() {
  try {
    const twsIconsOpt = {
      rootDir: ROOT_DIR,
      DIST: path.resolve(ROOT_DIR, 'icons'),
    };

    await task('✅ -- compiling @01group-ui/icons', async () => {
      await taskFiles.dirInit(twsIconsOpt);
      await taskCommon.writeLicense(twsIconsOpt);
      // Write the icons components
      for (const icon of icons) {
        await taskFiles.writeIconModuleFiles(icon, twsIconsOpt);
        const mainIndexPath = path.resolve(twsIconsOpt.DIST, `src/index.ts`);
        const mainIndexContent = `export * from './lib/${icon.id}';\n`;
        fs.appendFile(mainIndexPath, mainIndexContent, 'utf-8');
      }
    });

    console.info('✅ -- build task finish');
  } catch (e) {
    console.error(e);
    process.exit(1);
  }
}
main();
export {};
