// Contact sheet for Temple Run obstacle-prefab candidates.
// Geometry is pre-baked into "corridor frame": Y up, ground = 0, +Z = running direction,
// X = across the corridor. Data from /obstacle-tools/data.json.
import * as THREE from 'three';

const q = new URLSearchParams(location.search);
const COLS = +(q.get('cols') || 3);
const ROWS = +(q.get('rows') || 3);
const SHEET = +(q.get('sheet') || 0);
const VIEW = q.get('view') || 'front';
const MODE = q.get('mode') || 'solid';
const ONLY = q.get('only') || '';
const BOX = q.get('box') === '1';
const RX = (+(q.get('rx') || -22)) * Math.PI / 180;
const RY = (+(q.get('ry') || 38)) * Math.PI / 180;
const FIT = +(q.get('fit') || 0.84);
const CELL = 1.25;
const VW = window.innerWidth, VH = window.innerHeight;

const renderer = new THREE.WebGLRenderer({ antialias: true, preserveDrawingBuffer: true });
renderer.setPixelRatio(1);
renderer.setSize(VW, VH);
renderer.domElement.style.width = '100%';
renderer.domElement.style.height = '100%';
renderer.setClearColor(0x14181c, 1);
document.body.appendChild(renderer.domElement);
renderer.domElement.style.cssText = 'position:absolute;left:0;top:0';

const scene = new THREE.Scene();
scene.add(new THREE.HemisphereLight(0xffffff, 0x4a4030, 1.25));
const key = new THREE.DirectionalLight(0xfff2d0, 1.5); key.position.set(0.6, 0.9, 1); scene.add(key);
const fill = new THREE.DirectionalLight(0x9fb8d0, 0.6); fill.position.set(-1, -0.4, 0.6); scene.add(fill);

const tl = new THREE.TextureLoader();
const texWall = tl.load('/assets/apk/wallTexture.png');
const texTree = tl.load('/assets/apk/treeTexture.png');
for (const t of [texWall, texTree]) { t.colorSpace = THREE.SRGBColorSpace; t.anisotropy = 4; t.wrapS = t.wrapT = THREE.RepeatWrapping; }
const matWall = new THREE.MeshBasicMaterial({ map: texWall, side: THREE.DoubleSide });
const matTree = new THREE.MeshBasicMaterial({ map: texTree, side: THREE.DoubleSide, alphaTest: 0.3 });
const matTile = new THREE.MeshBasicMaterial({ map: texWall, side: THREE.DoubleSide, transparent: true, opacity: 0.22, depthWrite: false });
const matWire = new THREE.MeshBasicMaterial({ color: 0x8fd6ff, wireframe: true });

const data = await fetch('/obstacle-tools/data.json').then(r => r.json());
let items = data.entries;
if (ONLY) items = items.filter(e => new RegExp(ONLY, 'i').test(e.prefab));
const perSheet = COLS * ROWS;
const page = items.slice(SHEET * perSheet, (SHEET + 1) * perSheet);

const cam = new THREE.OrthographicCamera(-COLS * CELL / 2, COLS * CELL / 2, ROWS * CELL / 2, -ROWS * CELL / 2, 0.01, 200);
cam.position.set(0, 0, 40);
scene.add(cam);

function gridGroup() {
  const g = new THREE.Group();
  const mk = (x1, z1, x2, z2, color, y = 0.02) => {
    const geo = new THREE.BufferGeometry().setFromPoints([
      new THREE.Vector3(x1, y, z1), new THREE.Vector3(x2, y, z2)]);
    g.add(new THREE.Line(geo, new THREE.LineBasicMaterial({ color })));
  };
  for (let x = -20; x <= 20; x += 5) mk(x, -30, x, 30, x === 0 ? 0x335577 : 0x223344);
  for (let z = -30; z <= 30; z += 10) mk(-20, z, 20, z, z === 0 ? 0x445566 : 0x223344);
  // lane centre lines: X = -10 / 0 / +10
  for (const x of [-10, 0, 10]) mk(x, -30, x, 30, 0x66cc99);
  // 10-unit height ticks at the corridor corners
  for (const x of [-15, 15]) {
    const geo = new THREE.BufferGeometry().setFromPoints([new THREE.Vector3(x, 0, -30), new THREE.Vector3(x, 40, -30)]);
    g.add(new THREE.Line(geo, new THREE.LineBasicMaterial({ color: 0x665544 })));
  }
  return g;
}

const labels = [];
page.forEach((e, i) => {
  const col = i % COLS, row = Math.floor(i / COLS);
  const cx = (col - (COLS - 1) / 2) * CELL;
  const cy = ((ROWS - 1) / 2 - row) * CELL;

  const content = new THREE.Group();
  for (const m of e.meshes) {
    if (!m.P.length) continue;
    const geo = new THREE.BufferGeometry();
    geo.setAttribute('position', new THREE.Float32BufferAttribute(m.P, 3));
    if (m.UV && m.UV.length) geo.setAttribute('uv', new THREE.Float32BufferAttribute(m.UV, 2));
    geo.setIndex(m.I);
    geo.computeVertexNormals();
    let mat;
    if (MODE === 'wire') mat = matWire;
    else if (m.tex === 'treeTexture') mat = matTree;
    else mat = (m.role === 'tile' && e.meshes.length > 1) ? matTile : matWall;
    const mesh = new THREE.Mesh(geo, mat);
    content.add(mesh);
    if (MODE === 'solid') {
      const wg = new THREE.Mesh(geo, matWire);
      wg.material = new THREE.MeshBasicMaterial({ color: 0x2a4152, wireframe: true });
      content.add(wg); // faint wire overlay helps read the shape
    }
  }
  content.add(gridGroup());
  if (BOX) {
    const edge = (pts, color) => {
      const g2 = new THREE.BufferGeometry().setFromPoints(pts.map(p => new THREE.Vector3(p[0], p[1], p[2])));
      return new THREE.LineSegments(new THREE.EdgesGeometry(new THREE.BoxGeometry(1,1,1).translate(0,0,0)), new THREE.LineBasicMaterial({ color }));
    };
    const addBox = (sx, sy, sz, y0, color) => {
      const g2 = new THREE.BoxGeometry(sx, sy, sz);
      g2.translate(0, y0 + sy/2, 0);
      content.add(new THREE.LineSegments(new THREE.EdgesGeometry(g2), new THREE.LineBasicMaterial({ color })));
    };
    addBox(30, 36, 60, 0, 0xffcc33);   // corridor volume 30 wide, 36 high, 60 long
    addBox(30, 11, 60, 0, 0xff4466);   // player-height box 11 units
  }

  const inner = new THREE.Group();
  inner.add(content);
  if (VIEW === 'front') inner.rotation.set(0, 0, 0);
  else if (VIEW === 'top') inner.rotation.set(Math.PI / 2, 0, 0);
  else if (VIEW === 'side') inner.rotation.set(0, -Math.PI / 2, 0);
  else inner.rotation.set(RX, RY, 0);
  inner.updateMatrixWorld(true);
  const box = new THREE.Box3().setFromObject(inner);
  const c = box.getCenter(new THREE.Vector3());
  const s = box.getSize(new THREE.Vector3());
  const fitDim = VIEW === 'front' ? Math.max(s.x, s.y) : VIEW === 'top' ? Math.max(s.x, s.z) : VIEW === 'side' ? Math.max(s.y, s.z) : Math.max(s.x, s.y, s.z);
  const k = FIT / Math.max(fitDim, 1e-6);
  inner.position.set(-c.x, -c.y, -c.z);
  const pivot = new THREE.Group();
  pivot.add(inner);
  pivot.scale.setScalar(k);
  pivot.position.set(cx, cy, 0);
  scene.add(pivot);

  labels.push({ cx, cy, name: e.prefab, role: e.role, meshes: e.meshes });
});

renderer.render(scene, cam);

// ---- overlay: cell borders + labels ----
const ov = document.createElement('div');
ov.style.cssText = 'position:absolute;left:0;top:0;width:100%;height:100%;pointer-events:none;font-family:ui-monospace,Menlo,monospace';
document.body.appendChild(ov);
const proj = (x, y) => {
  const p = new THREE.Vector3(x, y, 0).project(cam);
  return [(p.x * 0.5 + 0.5) * VW, (-p.y * 0.5 + 0.5) * VH];
};
for (let cc = 0; cc <= COLS; cc++) {
  const [px] = proj((cc - COLS / 2) * CELL, 0);
  const d = document.createElement('div');
  d.style.cssText = `position:absolute;left:${px}px;top:0;height:100%;width:1px;background:#2b3844`;
  ov.appendChild(d);
}
for (let r = 0; r <= ROWS; r++) {
  const [, py] = proj(0, (ROWS / 2 - r) * CELL);
  const d = document.createElement('div');
  d.style.cssText = `position:absolute;top:${py}px;left:0;width:100%;height:1px;background:#2b3844`;
  ov.appendChild(d);
}
for (const L of labels) {
  const [px, py] = proj(L.cx, L.cy);
  const cellW = VW / COLS, cellH = VH / ROWS;
  const d = document.createElement('div');
  d.style.cssText = `position:absolute;left:${px - cellW / 2 + 10}px;top:${py - cellH / 2 + (SHEET === 0 && Math.abs(py - cellH / 2) < 5 ? 26 : 16)}px;width:${cellW - 20}px;color:#dfe9f2;font-size:15px;line-height:1.35;text-shadow:0 1px 3px #000`;
  const rows = L.meshes.map(m => {
    const b = m.bbox, dz = m.dims;
    const ln = m.lanes ? ` · y(-10/0/+10)=${JSON.stringify([m.lanes['-10'], m.lanes['0'], m.lanes['10']])}` : '';
    return `<div style="color:#9fb4c6;font-size:11px">${m.mesh} ${m.tex} ${dz[0].toFixed(1)}×${dz[1].toFixed(1)}×${dz[2].toFixed(1)}u ymin ${b.min[1].toFixed(1)}${ln}</div>`;
  }).join('');
  d.innerHTML = `<b>${L.name.replace('_prefab', '')}</b> <span style="color:#e0b060">${L.role}</span>${rows}`;
  ov.appendChild(d);
}
const hdr = document.createElement('div');
hdr.style.cssText = 'position:absolute;left:10px;top:6px;color:#8fa6b8;font:10px ui-monospace,Menlo,monospace';
hdr.textContent = `obstacle prefabs · sheet ${SHEET} · ${page.length}/${items.length} · view ${VIEW} · corridor frame (ground y=0, +Z running, X across) · green lines = lane centres x=±10/0`;
document.body.appendChild(hdr);
window.__INFO__ = { sheet: SHEET, total: items.length, shown: page.length, names: page.map(e => e.prefab), view: VIEW };
window.__READY__ = true;
