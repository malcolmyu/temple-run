import {execFileSync} from 'node:child_process';
import { defineConfig, type Plugin } from 'vite';
import vue from '@vitejs/plugin-vue';
import { fileURLToPath } from 'node:url';
import path from 'node:path';
import os from 'node:os';
import startup from './web/src/game/startupAssets.generated.json';

const here = path.dirname(fileURLToPath(import.meta.url));

/** Dev-only helper: the side-panel QR needs the LAN address, not localhost. */
function lanAddress() {
  const candidates = [];
  for (const [name, nic] of Object.entries(os.networkInterfaces())) {
    for (const net of nic ?? []) {
      if (net.family !== 'IPv4' || net.internal) continue;
      // Skip benchmark / link-local / CGNAT addresses used by VPNs and containers.
      if (/^(198\.1[89]\.|169\.254\.|100\.(6[4-9]|[7-9]\d|1[01]\d|12[0-7])\.)/.test(net.address)) continue;
      let score = 3;
      if (net.address.startsWith('192.168.')) score = 0;
      else if (net.address.startsWith('10.')) score = 1;
      else if (/^172\.(1[6-9]|2\d|3[01])\./.test(net.address)) score = 2;
      if (name === 'en0') score -= 0.5;
      candidates.push({ address: net.address, score });
    }
  }
  candidates.sort((a, b) => a.score - b.score);
  return candidates[0]?.address ?? null;
}

function lanUrlPlugin():Plugin {
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
  plugins: [{name:'visible-build-version',transformIndexHtml:{order:'pre',handler:html=>html.replaceAll('__BUILD_VERSION__',execFileSync('git',['rev-parse','--short=12','HEAD'],{cwd:here,encoding:'utf8'}).trim())}},vue(), lanUrlPlugin(), {
    name:'playable-start-preloads',
    transformIndexHtml:{order:'post',handler(_html,ctx){
      if(!ctx.bundle)return [];
      return [...Object.values(ctx.bundle).filter(c=>c.type==='chunk'&&['game','three'].includes(c.name)).map(c=>({tag:'link',attrs:{rel:'modulepreload',href:'./'+c.fileName,crossorigin:''},injectTo:'head' as const})),
        {tag:'link',attrs:{rel:'preload',as:'fetch',href:'./'+startup.pack,crossorigin:''},injectTo:'head' as const}];
    }},
  }],
  // Expose the dev server on the LAN so phones can open it via the QR code in the side panel.
  server: { host: '0.0.0.0' },
  build: {
    outDir: path.join(here, 'dist'),
    emptyOutDir: true,
    manifest:true,
    rollupOptions: {
      // New TypeScript/Vue build is index.html; the legacy game stays at legacy.html.
      output:{manualChunks(id:string){
        if(id.includes('/node_modules/three/'))return 'three';
        if(id.includes('/node_modules/@vue/')||id.includes('/node_modules/vue/'))return 'vue';
      }},
      input: {
        main: path.join(here, 'web', 'index.html'),
        legacy: path.join(here, 'web', 'legacy.html'),
      },
    },
  },
});
