import { defineConfig } from 'vite';
import vue from '@vitejs/plugin-vue';
import { fileURLToPath } from 'node:url';
import path from 'node:path';
import os from 'node:os';

const here = path.dirname(fileURLToPath(import.meta.url));

/** Dev-only helper: the side-panel QR needs the LAN address, not localhost. */
function lanAddress() {
  for (const nic of Object.values(os.networkInterfaces())) {
    for (const net of nic ?? []) {
      if (net.family === 'IPv4' && !net.internal) return net.address;
    }
  }
  return null;
}

function lanUrlPlugin() {
  return {
    name: 'temple-lan-url',
    apply: 'serve',
    configureServer(server) {
      server.middlewares.use('/__lan-url', (_req, res) => {
        const address = server.httpServer?.address();
        const port = typeof address === 'object' && address ? address.port : 5173;
        const ip = lanAddress();
        res.setHeader('Content-Type', 'application/json');
        res.end(JSON.stringify({ url: ip ? `http://${ip}:${port}/` : null }));
      });
    },
  };
}

export default defineConfig({
  root: path.join(here, 'web'),
  base: './',
  plugins: [vue(), lanUrlPlugin()],
  // Expose the dev server on the LAN so phones can open it via the QR code in the side panel.
  server: { host: '0.0.0.0' },
  build: {
    outDir: path.join(here, 'dist'),
    emptyOutDir: true,
    rollupOptions: {
      // New TypeScript/Vue build is index.html; the legacy game stays at legacy.html.
      input: {
        main: path.join(here, 'web', 'index.html'),
        legacy: path.join(here, 'web', 'legacy.html'),
      },
    },
  },
});
