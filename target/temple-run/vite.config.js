import { defineConfig } from 'vite';
import { fileURLToPath } from 'node:url';
import path from 'node:path';
const here = path.dirname(fileURLToPath(import.meta.url));
export default defineConfig({
  root: path.join(here, 'web'),
  base: './',
  // Expose the dev server on the LAN so phones can open it via the QR code in the side panel.
  server: { host: '0.0.0.0' },
  build: { outDir: path.join(here, 'dist'), emptyOutDir: true },
});
