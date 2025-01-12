# Contributing Guideline

## Prerequisites

You will need `Node.js >=18.0.0 <=20.11.1` and `pnpm >=9.15.0` installed on your machine.

TODO!

## Publish NPM Package

Get Granular Access Token, read the [documentation here](https://docs.npmjs.com/about-access-tokens#about-granular-access-tokens).

You have to build the packages before publishing to npm repository.

```sh
echo "//registry.npmjs.org/:_authToken=YOUR_GRANULAR_ACCESS_TOKEN" >> ~/.npmrc

pnpm nx publish components-core --tag=next     # build and publish core package
pnpm nx publish icons --tag=next               # build and publish icons package
```
