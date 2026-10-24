// Contact sheet rendered from the EXPORTED OBJ FILES (not from Unity data) - this is the
// visual proof that the deliverables load in three.js with correct size, UVs and texture.
// params: files=f1,f2,...  cols=2 rows=2  view=iso|front|side|top  box=1  label
import * as THREE from 'three';
import { OBJLoader } from 'three/addons/loaders/OBJLoader.js';

const q = new URLSearchParams(location.search);
const FILES = (q.get('files') || '').split(',').filter(Boolean);
const COLS = +(q.get('cols') || 2), ROWS = +(q.get('rows') || 2);
const VIEW = q.get('view') || 'iso';
const BOX = q.get('box') !== '0';

const W = window.innerWidth, H = window.innerHeight;
const renderer = new THREE.WebGLRenderer({ antialias: true });
renderer.setPixelRatio(1);
renderer.setSize(W, H);
renderer.setClearColor(0x11151a, 1);
renderer.setScissorTest(true);
document.body.appendChild(renderer.domElement);

const texLoader = new THREE.TextureLoader();
const texWall = texLoader.load('/assets/apk/wallTexture.png');
const texTree = texLoader.load('/assets/apk/treeTexture.png');
texTree.colorSpace = THREE.SRGBColorSpace;

const objLoader = new OBJLoader();
const scene = new THREE.Scene();
const grid = new THREE.GridHelper(60, 30, 0x2a3a46, 0x1c2830);
grid.position.y = 0.01;
scene.add(grid);

function box(w, h, d, color, y0 = 0) {
  const g = new THREE.EdgesGeometry(new THREE.BoxGeometry(w, h, d));
  const l = new THREE.LineSegments(g, new THREE.LineBasicMaterial({ color }));
  l.position.y = y0 + h / 2;
  return l;
}
if (BOX) {
  scene.add(box(30, 36.8, 60, 0xd8b100));   // corridor volume (wall faces at X = +-15)
  scene.add(box(30, 10.8, 60, 0xd04545));   // player-scale volume (player rig is 10.8 u tall)
  for (const x of [-10, 0, 10]) {
    const g = new THREE.BufferGeometry().setFromPoints([
      new THREE.Vector3(x, 0.02, -32), new THREE.Vector3(x, 0.02, 32)]);
    scene.add(new THREE.Line(g, new THREE.LineBasicMaterial({ color: 0x37c08a })));
  }
}

const DIRS = {
  iso: new THREE.Vector3(0.6, 0.42, -0.68).normalize(),
  front: new THREE.Vector3(0, 0.14, -1).normalize(),
  side: new THREE.Vector3(1, 0.16, -0.08).normalize(),
  top: new THREE.Vector3(0.001, 1, 0.02).normalize(),
};

const cells = new Array(FILES.length).fill(null);
const group = new THREE.Group();
scene.add(group);
let done = 0;
FILES.forEach((f, i) => {
  const col = i % COLS, row = Math.floor(i / COLS);
  const cx = -W / 2 + (col + 0.5) * (W / COLS);
  const cy = H / 2 - (row + 0.5) * (H / ROWS);
  objLoader.load('/assets/obstacles/' + f, (obj) => {
    const isTree = f.startsWith('tree-');
    obj.traverse(o => {
      if (!o.isMesh) return;
      o.material = new THREE.MeshBasicMaterial({
        map: isTree ? texTree : texWall, side: THREE.DoubleSide,
        transparent: isTree, alphaTest: isTree ? 0.4 : 0,
      });
    });
    // centre XZ on the cell, keep Y as authored (y = 0 is the road plane)
    const bb = new THREE.Box3().setFromObject(obj);
    const cc = bb.getCenter(new THREE.Vector3());
    obj.position.set(-cc.x, 0, -cc.z);
    const holder = new THREE.Group();
    holder.add(obj);
    const b2 = new THREE.Box3().setFromObject(obj);
    const size = b2.getSize(new THREE.Vector3());
    const dir = DIRS[VIEW] || DIRS.iso;
    if (VIEW === 'iso') {
      // fit the whole thing (plus the corridor box) into the cell
      const r = Math.max(size.length() * 0.61, 30);
      const cam = new THREE.OrthographicCamera(-r, r, r * 1.0, -r, 0.1, 4000);
      cam.position.copy(dir).multiplyScalar(r * 3);
      cam.lookAt(0, 12, 0);
      cells[i] = { cam, holder, label: f, size, minY: b2.min.y, idx: i };
    } else if (VIEW === 'front') {
      const r = Math.max(size.x * 0.61, 18);
      const cam = new THREE.OrthographicCamera(-r, r, r * (H / COLS) / (W / ROWS), -r * (H / COLS) / (W / ROWS), 0.1, 4000);
      cam.position.copy(dir).multiplyScalar(300);
      cam.lookAt(0, 12, 0);
      cells[i] = { cam, holder, label: f, size, minY: b2.min.y, idx: i };
    } else {
      const r = Math.max(size.length() * 0.61, 24);
      const cam = new THREE.OrthographicCamera(-r, r, r, -r, 0.1, 4000);
      cam.position.copy(dir).multiplyScalar(r * 4);
      cam.lookAt(0, 10, 0);
      cells[i] = { cam, holder, label: f, size, minY: b2.min.y, idx: i };
    }
    done++;
    if (done === FILES.length) window.__READY__ = cells.filter(Boolean).length;
  }, undefined, (e) => { console.error('OBJ FAILED', f, e); done++; });
});

const ov = document.getElementById('ov') || document.createElement('div');
ov.id = 'ov';
Object.assign(ov.style, { position: 'absolute', inset: '0', pointerEvents: 'none' });
document.body.appendChild(ov);

function frame() {
  renderer.setScissorTest(true);
  cells.filter(Boolean).forEach(({ cam, holder, label, size, minY, idx }) => {
    const i = idx;
    const col = i % COLS, row = Math.floor(i / COLS);
    const x = col * (W / COLS), y = H - (row + 1) * (H / ROWS);
    renderer.setViewport(x, y, W / COLS, H / ROWS);
    renderer.setScissor(x, y, W / COLS, H / ROWS);
    drainAll();
    scene.add(holder);
    cam.aspect = (W / COLS) / (H / ROWS);
    if (cam.isPerspectiveCamera) cam.updateProjectionMatrix();
    renderer.render(scene, cam);
    scene.remove(holder);
  });
  requestAnimationFrame(frame);
}
function drainAll() {
  // remove every previously added holder so cells don't stack
  for (const c of cells) if (c && c.holder.parent) c.holder.parent.remove(c.holder);
}
requestAnimationFrame(frame);

// labels + cell borders (HTML overlay keeps the text crisp at any canvas size)
function drawOverlay() {
  const cw = W / COLS, ch = H / ROWS;
  ov.innerHTML = '';
  cells.filter(Boolean).forEach(({ label, size, minY, idx }) => {
    const i = idx;
    const col = i % COLS, row = Math.floor(i / COLS);
    const d = document.createElement('div');
    d.style.cssText = `position:absolute;left:${col * cw + 10}px;top:${row * ch + 8}px;color:#dfe9f2;` +
      'font:14px/1.4 ui-monospace,Menlo,monospace;text-shadow:0 1px 3px #000';
    d.innerHTML = `<b>${label}</b>`;
    ov.appendChild(d);
    const s = document.createElement('div');
    s.style.cssText = `position:absolute;left:${col * cw + 10}px;top:${row * ch + ch - 34}px;color:#9fb4c6;` +
      'font:12px/1.35 ui-monospace,Menlo,monospace;text-shadow:0 1px 3px #000';
    s.textContent = `${size.x.toFixed(1)} x ${size.y.toFixed(1)} x ${size.z.toFixed(1)} u   minY ${minY.toFixed(2)}`;
    ov.appendChild(s);
    const b = document.createElement('div');
    b.style.cssText = `position:absolute;left:${col * cw}px;top:${row * ch}px;width:${cw}px;height:${ch}px;` +
      'border:1px solid #24323d;box-sizing:border-box';
    ov.appendChild(b);
  });
}
const t = setInterval(() => { if (window.__READY__ !== undefined) { drawOverlay(); clearInterval(t); } }, 100);
