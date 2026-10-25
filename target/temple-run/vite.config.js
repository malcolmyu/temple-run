import { defineConfig } from 'vite';
import vue from '@vitejs/plugin-vue';
import { fileURLToPath } from 'node:url';
import path from 'node:path';

const here = path.dirname(fileURLToPath(import.meta.url));

export default defineConfig({
  root: path.join(here, 'web'),
  base: './',
  plugins: [vue()],
  // Expose the dev server on the LAN so phones can open it via the QR code in the side panel.
  server: { host: '0.0.0.0' },
  build: {
    outDir: path.join(here, 'dist'),
    emptyOutDir: true,
    rollupOptions: {
      // The legacy game stays on index.html; the TypeScript/Vue rewrite lives on next.html
      // until it reaches feature parity.
      input: {
        main: path.join(here, 'web', 'index.html'),
        next: path.join(here, 'web', 'next.html'),
      },
    },
  },
});
