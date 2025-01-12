import tailwindcss from '@tailwindcss/vite'
import { resolve } from 'pathe'
import { defineConfig } from 'vite'
import solid from 'vite-plugin-solid'
import tsconfigPaths from 'vite-tsconfig-paths'

export default defineConfig({
  plugins: [solid(), tailwindcss(), tsconfigPaths()],
  publicDir: resolve('public'),
  build: {
    emptyOutDir: true,
    chunkSizeWarningLimit: 1024 * 4,
    reportCompressedSize: false,
    outDir: resolve('dist'),
    rollupOptions: {
      input: { app: resolve('index.html') },
    },
  },
  base: '/',
  server: {
    port: 3002,
    strictPort: true,
    host: true,
  },
})
