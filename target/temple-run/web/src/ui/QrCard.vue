<script setup lang="ts">
import { onMounted, ref } from 'vue';
import qrcode from 'qrcode-generator';

const target = ref('');
const svg = ref('');
const note = ref('');
const copied = ref(false);

function render(url: string): void {
  target.value = url;
  const qr = qrcode(0, 'M');
  qr.addData(url);
  qr.make();
  svg.value = qr.createSvgTag({ cellSize: 4, margin: 0, scalable: true });
}

onMounted(async () => {
  if (!['localhost', '127.0.0.1', '::1'].includes(location.hostname)) {
    render(`${location.origin}/`);
    return;
  }
  // The desktop page is usually opened on localhost; ask the dev server for the LAN URL
  // so the QR can actually be scanned by a phone on the same Wi-Fi.
  try {
    const response = await fetch('/__lan-url', { headers: { accept: 'application/json' } });
    const data = (await response.json()) as { url?: string | null };
    if (data.url) {
      render(data.url);
      return;
    }
  } catch {
    // Static build or preview: fall through to the current origin.
  }
  note.value = '手机请把 localhost 换成电脑的局域网 IP';
  render(`${location.origin}/`);
});

async function copy(): Promise<void> {
  try {
    await navigator.clipboard.writeText(target.value);
    copied.value = true;
    window.setTimeout(() => {
      copied.value = false;
    }, 1500);
  } catch {
    // Clipboard permissions are optional; the URL stays selectable either way.
  }
}
</script>

<template>
  <div class="qr-card">
    <div class="qr-frame" v-html="svg" />
    <div class="qr-meta">
      <strong>手机扫码 · 局域网直接玩</strong>
      <span>手机与电脑连同一 Wi-Fi，扫码即开</span>
      <code title="点击复制" @click="copy">{{ target }}</code>
      <em v-if="copied">已复制</em>
      <em v-else-if="note">{{ note }}</em>
    </div>
  </div>
</template>
