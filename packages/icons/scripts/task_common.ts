/* eslint-disable @typescript-eslint/no-var-requires */
import { default as pf } from 'find-package-json';
import { promises as fs } from 'fs-extra';
import path from 'path';
import { promisify } from 'util';
import { icons } from './icons';
import { copyRecursive, getIconFiles, rmDirRecursive } from './logics';
import { IconDefinition } from './types';

const exec = promisify(require('child_process').exec);

export async function writeLicense({ DIST, rootDir }) {
  const licensePrefix = `\n---\n\nIcons are taken from the other projects, please check each project licences accordingly.\n\n`;
  const iconLicenses = icons
    .map((icon) =>
      [
        `${icon.name} - ${icon.projectUrl}`,
        `License: ${icon.license} ${icon.licenseUrl}`,
      ].join('\n')
    )
    .join('\n\n');

  await fs.copyFile(
    path.resolve(__dirname, '../../../LICENSE'),
    path.resolve(DIST, 'LICENSE')
  );
  await fs.appendFile(
    path.resolve(DIST, 'LICENSE'),
    licensePrefix + iconLicenses,
    'utf8'
  );
}

interface IconsetVersion {
  icon: IconDefinition;
  version: string;
  count: number;
}

export async function writeIconVersions({ DIST, LIB, rootDir }) {
  const versions: IconsetVersion[] = [];

  // searching for icon versions from package.json and git describe command
  for (const icon of icons) {
    const files = (
      await Promise.all(icon.contents.map((content) => getIconFiles(content)))
    ).flat();

    if (files.length === 0) {
      throw new Error(`Missing path for: ${icon.name}`);
    }

    const firstDir = path.dirname(files[0]);
    const packageJson = pf(firstDir).next().value;

    let version: string;
    if (
      packageJson?.version &&
      !packageJson.name?.includes('@01group-ui/icons-pack')
    ) {
      version = packageJson.version;
    } else {
      const { stdout } = await exec(
        `cd ${firstDir} && git describe --tags || cd ${firstDir} && git rev-parse HEAD`
      );
      version = stdout.trim();
    }

    versions.push({
      icon,
      version,
      count: files.length,
    });
  }

  const emptyVersions = versions.filter((v) => v.count === 0);
  if (emptyVersions.length !== 0) {
    throw Error(
      `empty icon sets: ${emptyVersions.map((v) => v.icon).join(', ')}`
    );
  }

  const versionsStr =
    'Icon Library|License|Version|Count\n' +
    '---|---|---|---\n' +
    versions
      .map((v) =>
        [
          `[${v.icon.name}](${v.icon.projectUrl})`,
          `[${v.icon.license}](${v.icon.licenseUrl})`,
          v.version,
          v.count,
        ].join('|')
      )
      .join('\n') +
    '\n';

  await fs.writeFile(
    path.resolve(rootDir, 'icons/VERSIONS'),
    versionsStr,
    'utf8'
  );
}

export async function buildLib({ DIST, LIB, rootDir }) {
  await rmDirRecursive(path.resolve(rootDir, 'icons/build/lib'));
  const execOpt = { cwd: `${rootDir}/icons` };
  await Promise.all([
    exec('tsc', execOpt),
    exec('tsc && babel ./build/lib/esm -d ./build/lib/esm', execOpt),
    exec('tsc -p ./icons/tsconfig.cjs.json', execOpt),
  ]);
}

export async function copyLib({ DIST, LIB, rootDir }) {
  await copyRecursive(path.resolve(rootDir, 'icons/build/lib'), LIB);
}
