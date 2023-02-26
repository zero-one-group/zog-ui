import fs from 'fs-extra';
import { execFile as rawExecFile } from 'node:child_process';
import util from 'node:util';
import PQueue from 'p-queue';
import path from 'path';
import { icons } from './icons';
import { type IconSetGitSource } from './types';

const execFile = util.promisify(rawExecFile);

interface Context {
  distBaseDir: string;
  iconDir(name: string): string;
}

async function main() {
  const distBaseDir = path.join(__dirname, '../../../tmp/icons');
  const ctx: Context = {
    distBaseDir,
    iconDir(name: string) {
      return path.join(distBaseDir, name);
    },
  };

  // rm all icons and mkdir dist
  await fs.promises.rm(distBaseDir, {
    recursive: true,
    force: true,
  });
  await fs.promises.mkdir(distBaseDir, {
    recursive: true,
  });

  const queue = new PQueue({ concurrency: 10 });
  for (const icon of icons) {
    if (!icon.source) {
      continue;
    }
    const { source } = icon;
    queue.add(() => gitCloneIcon(source, ctx));
  }

  await queue.onIdle();
}

async function gitCloneIcon(source: IconSetGitSource, ctx: Context) {
  console.info(`Cloning icon: ${source.url} ${source.branch} branch`);
  await execFile(
    'git',
    ['clone', '--filter=tree:0', '--no-checkout', source.url, source.localName],
    { cwd: ctx.distBaseDir }
  );

  await execFile(
    'git',
    ['sparse-checkout', 'set', '--cone', '--skip-checks', source.remoteDir],
    {
      cwd: ctx.iconDir(source.localName),
    }
  );

  await execFile('git', ['checkout', source.branch], {
    cwd: ctx.iconDir(source.localName),
  });

  // Copy SVG files to defined icons directory
  const srcDir = path.join(
    __dirname,
    `../../../tmp/icons/${source.localName}/${source.remoteDir}`
  );
  const dstDir = path.resolve(__dirname, `../svg-files/${source.localName}`);
  await fs.copy(srcDir, dstDir, {
    overwrite: true,
    // filter: (file) => path.extname(file).toLowerCase() === 'svg',
  });
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
