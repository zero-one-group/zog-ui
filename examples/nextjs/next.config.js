/** @type {import('next').NextConfig} */
const nextConfig = {
  // Read: https://nextjs.org/blog/next-13-1#built-in-module-transpilation-stable
  // transpilePackages: ['@zero-ui/core'],
  reactStrictMode: true,
  swcMinify: true,
};

module.exports = nextConfig;
