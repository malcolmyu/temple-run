<script setup lang="ts">
import * as THREE from 'three';
import { onBeforeUnmount, onMounted, ref, watch } from 'vue';
import { loadRunnerRig, normalizeRigHeight } from '../runnerRig.js';
import { DEFAULT_RIG_URL, skinById } from '../game/skins';

const props = defineProps<{ skinId: string }>();
const canvas = ref<HTMLCanvasElement | null>(null);

const BASE = import.meta.env.BASE_URL;
let renderer: THREE.WebGLRenderer | null = null;
let scene: THREE.Scene | null = null;
let camera: THREE.PerspectiveCamera | null = null;
let rig: { object: THREE.Object3D; update(dt: number, timeScale?: number): void; setClip(name: string, restart?: boolean): void } | null = null;
const loading = ref(false);
const failed = ref(false);
let token = 0;
let raf = 0;
let last = 0;
let yaw = 0;
let dragging = false;
let dragX = 0;
let idleAt = 0;

function initScene(): void {
  if (!canvas.value) return;
  renderer = new THREE.WebGLRenderer({ canvas: canvas.value, antialias: true, alpha: true });
  renderer.setPixelRatio(Math.min(window.devicePixelRatio || 1, 2));
  renderer.outputColorSpace = THREE.SRGBColorSpace;
  scene = new THREE.Scene();
  scene.add(new THREE.HemisphereLight(0xfff2da, 0x2c2418, 2.1));
  const key = new THREE.DirectionalLight(0xffe7bd, 2.4);
  key.position.set(2.4, 4, 3.4);
  scene.add(key);
  const rim = new THREE.DirectionalLight(0x9fc4ff, 1.0);
  rim.position.set(-3, 2.5, -2.5);
  scene.add(rim);
  const table = new THREE.Mesh(
    new THREE.CylinderGeometry(0.86, 0.92, 0.08, 36),
    new THREE.MeshStandardMaterial({ color: 0x2a241c, roughness: 0.55, metalness: 0.3 }),
  );
  table.position.y = -0.04;
  scene.add(table);
  const ring = new THREE.Mesh(
    new THREE.TorusGeometry(0.86, 0.03, 8, 48),
    new THREE.MeshStandardMaterial({ color: 0xd9b36a, roughness: 0.35, metalness: 0.7, emissive: 0x3a2a10, emissiveIntensity: 0.5 }),
  );
  ring.rotation.x = Math.PI / 2;
  scene.add(ring);
  camera = new THREE.PerspectiveCamera(34, 1, 0.1, 60);
  camera.position.set(0, 1.15, 4.4);
  camera.lookAt(0, 1.05, 0);
  resize();
  window.addEventListener('resize', resize);
  bindDrag();
}

function bindDrag(): void {
  const element = canvas.value;
  if (!element) return;
  element.addEventListener('pointerdown', (event) => {
    dragging = true;
    dragX = event.clientX;
    element.setPointerCapture?.(event.pointerId);
  });
  element.addEventListener('pointermove', (event) => {
    if (!dragging) return;
    yaw += (event.clientX - dragX) * 0.012;
    dragX = event.clientX;
    idleAt = performance.now() + 2400;
  });
  const stop = (): void => {
    dragging = false;
  };
  element.addEventListener('pointerup', stop);
  element.addEventListener('pointercancel', stop);
  element.addEventListener('pointerleave', stop);
}

function resize(): void {
  if (!renderer || !camera || !canvas.value) return;
  const width = canvas.value.clientWidth || 300;
  const height = canvas.value.clientHeight || 210;
  renderer.setSize(width, height, false);
  camera.aspect = width / height;
  camera.updateProjectionMatrix();
}

async function loadSkin(id: string): Promise<void> {
  const skin = skinById(id);
  const my = ++token;
  loading.value = true;
  failed.value = false;
  if (rig && scene) scene.remove(rig.object);
  rig = null;
  try {
    const loaded = await loadRunnerRig(
      `${BASE}assets/characters/rig-${skin.rig}.json`,
      `${BASE}assets/characters/${skin.texture}`,
      { scale: 0.27, yOffset: 0, clipFallbackUrl: DEFAULT_RIG_URL },
    );
    if (my !== token || !scene) return;
    normalizeRigHeight(loaded, 2.15);
    loaded.setClip('run');
    loaded.object.rotation.y = Math.PI;
    scene.add(loaded.object);
    rig = loaded;
  } catch (error) {
    if (my !== token) return;
    failed.value = true;
    console.warn('preview rig unavailable', error);
  } finally {
    if (my === token) loading.value = false;
  }
}

function loop(now: number): void {
  raf = requestAnimationFrame(loop);
  const dt = Math.min(0.05, Math.max(0.001, (now - last) / 1000));
  last = now;
  if (!renderer || !scene || !camera) return;
  if (rig) {
    rig.update(dt, 1);
    if (!dragging && now > idleAt) yaw += dt * 0.45;
    rig.object.rotation.y = Math.PI + yaw;
  }
  renderer.render(scene, camera);
}

onMounted(() => {
  initScene();
  void loadSkin(props.skinId);
  last = performance.now();
  idleAt = performance.now() + 1400;
  raf = requestAnimationFrame(loop);
});

watch(
  () => props.skinId,
  (id) => {
    yaw = 0;
    void loadSkin(id);
  },
);

onBeforeUnmount(() => {
  token++;
  cancelAnimationFrame(raf);
  window.removeEventListener('resize', resize);
  if (rig && scene) scene.remove(rig.object);
  renderer?.dispose();
});
</script>

<template>
  <div class="store-preview">
    <canvas ref="canvas" aria-label="角色 3D 预览" />
    <span class="preview-hint" role="status">{{ loading ? '角色加载中…' : failed ? '预览加载失败，请重新选择' : '拖动旋转' }}</span>
  </div>
</template>
