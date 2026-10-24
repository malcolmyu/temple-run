import * as THREE from 'three';
import { OBJLoader } from 'three/addons/loaders/OBJLoader.js';
const FILES = [
  'tree-jump-left', 'tree-jump-right', 'tree-slide', 'tree-trip-left', 'tree-trip-right',
  'pit', 'pit-long-a', 'pit-long-b', 'flame-tower', 'tower-arch',
  'narrow-beam-left', 'narrow-beam-right', 'narrow-wall-left', 'narrow-wall-right', 'stone-pedestal',
];
const scene = new THREE.Scene();
scene.background = new THREE.Color(0x3b4c42);
const camera = new THREE.PerspectiveCamera(52, innerWidth / innerHeight, 0.1, 400);
camera.position.set(0, 30, 74); camera.lookAt(0, 2, -8);
const renderer = new THREE.WebGLRenderer({ antialias: true });
renderer.setSize(innerWidth, innerHeight); renderer.setPixelRatio(Math.min(devicePixelRatio, 2));
document.body.append(renderer.domElement);
scene.add(new THREE.HemisphereLight(0xffffff, 0x6d604c, 2.6));
const sun = new THREE.DirectionalLight(0xffe2a7, 2.6); sun.position.set(-14, 30, 16); scene.add(sun);
scene.add(new THREE.GridHelper(120, 60, 0x6b8f74, 0x35503f));
const tex = new THREE.TextureLoader().load('/assets/apk/wallTexture.png'); tex.colorSpace = THREE.SRGBColorSpace;
const mat = new THREE.MeshStandardMaterial({ map: tex, roughness: .95, side: THREE.DoubleSide });
const loader = new OBJLoader();
const stats = {};
function label(text, x, y, z) {
  const c = document.createElement('canvas'); c.width = 256; c.height = 64;
  const g = c.getContext('2d'); g.fillStyle = '#e8dcc0'; g.font = 'bold 28px sans-serif'; g.textAlign = 'center';
  g.fillText(text, 128, 40);
  const t = new THREE.CanvasTexture(c); t.colorSpace = THREE.SRGBColorSpace;
  const sp = new THREE.Sprite(new THREE.SpriteMaterial({ map: t, transparent: true, depthTest: false }));
  sp.position.set(x, y, z); sp.scale.set(9, 2.25, 1); scene.add(sp);
}
const COLS = 5, STEP = 14, ROW = 16;
FILES.forEach((name, i) => {
  loader.load(`/assets/obstacles/${name}.obj`, (obj) => {
    obj.traverse((p) => { if (p.isMesh) p.material = mat; });
    const box = new THREE.Box3().setFromObject(obj);
    const size = box.getSize(new THREE.Vector3());
    const ctr = box.getCenter(new THREE.Vector3());
    // normalise: fit inside ~7 units, centre XZ, min Y -> 0
    const s = 7 / Math.max(size.x, size.y, size.z);
    obj.scale.setScalar(s);
    obj.position.set(-ctr.x * s, -box.min.y * s, -ctr.z * s);
    const col = i % COLS, row = Math.floor(i / COLS);
    const x = (col - (COLS - 1) / 2) * STEP, z = -row * ROW;
    obj.position.x += x; obj.position.z += z;
    scene.add(obj);
    label(`${name} ${size.x.toFixed(0)}x${size.y.toFixed(0)}x${size.z.toFixed(0)}`, x, 8.4, z);
    stats[name] = { size: size.toArray().map(v => +v.toFixed(1)), scale: +(s).toFixed(2) };
    window.__stats = stats;
  });
});
renderer.setAnimationLoop(() => renderer.render(scene, camera));
window.__cam = (x, y, z, tx, ty, tz) => { camera.position.set(x, y, z); camera.lookAt(tx ?? 0, ty ?? 2, tz ?? -10); };
