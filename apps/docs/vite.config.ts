import tailwindcss from '@tailwindcss/vite'
import react from '@vitejs/plugin-react'
import { resolve } from 'pathe'
import { defineConfig } from 'vite'
import tsconfigPaths from 'vite-tsconfig-paths'

export default defineConfig({
  plugins: [react(), tailwindcss(), tsconfigPaths()],
  publicDir: resolve('public'),
  build: {
    emptyOutDir: true,
    chunkSizeWarningLimit: 1024,
    reportCompressedSize: false,
    outDir: resolve('dist'),
    rollupOptions: {
      input: { app: resolve('index.html') },
    },
  },
  base: '/',
  server: {
    port: 4200,
    strictPort: true,
    host: true,
  },
})
