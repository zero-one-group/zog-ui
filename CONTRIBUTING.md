# Contributing Guideline

## Generate JS Library

```sh
pnpm exec nx generate @nrwl/js:library helpers --importPath=@zog-ui/helpers \
 --unitTestRunner=jest --bundler=esbuild --publishable --no-interactive
```

## Generate React Library

```sh
pnpm exec nx generate @nrwl/react:library core --importPath=@zog-ui/core \
  --style=none --bundler=rollup --compiler=swc --unitTestRunner=jest \
  --pascalCaseFiles --publishable --no-interactive --directory=components
```

## Generate React UI Component

```sh
pnpm exec nx generate @nrwl/react:component avatar --directory=avatar \
  --project=components-core --style=none --flat --pascalCaseDirectory \
  --pascalCaseFiles --no-interactive
```

## Build Icons Package

```sh
# Get SVG source files
pnpm nx run icons:fetch

# Compile SVG into React component
pnpm nx run icons:compile

# Build icons npm package
pnpm nx run icons:build
```

## Setup Storybook

```sh
pnpm exec nx generate @nrwl/workspace:library docs --unitTestRunner=none --no-interactive

pnpm exec nx generate @nrwl/storybook:configuration docs --bundler=webpack \
  --uiFramework=@storybook/react --tsConfiguration --configureCypress=false \
  --no-interactive
```

## Publish NPM Package

Get Granular Access Token, read the [documentation here](https://docs.npmjs.com/about-access-tokens#about-granular-access-tokens).

You have to build the packages before publishing to npm repository.

```sh
echo "//registry.npmjs.org/:_authToken=YOUR_GRANULAR_ACCESS_TOKEN" >> ~/.npmrc

pnpm nx publish components-core --tag=next     # build and publish core package
pnpm nx publish icons --tag=next               # build and publish icons package
```
