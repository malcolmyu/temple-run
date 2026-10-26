import * as THREE from 'three';

const q = new URLSearchParams(location.search);
const COLS = +(q.get('cols') || 8);
const ROWS = +q.get('rows') || 4;
const SHEET = +(q.get('sheet') || 0);
const FILTER = q.get('filter') || 'temple';
const MODE = q.get('mode') || 'solid';
const LAYOUT = q.get('layout') === '1';
const VIEW = q.get('view') || 'iso';
const SHIFT = +(q.get('shift') || 0);
const RX = (+(q.get('rx') || -22)) * Math.PI / 180;
const RY = (+(q.get('ry') || 38)) * Math.PI / 180;
const FIT = +(q.get('fit') || 0.86);
const CELL = 1.2;
const VW = 1920, VH = 960;

const renderer = new THREE.WebGLRenderer({ antialias: true, preserveDrawingBuffer: true });
renderer.setPixelRatio(1);
renderer.setSize(VW, VH);
renderer.setClearColor(0x14181c, 1);
document.body.appendChild(renderer.domElement);
renderer.domElement.style.cssText = 'position:absolute;left:0;top:0';

const scene = new THREE.Scene();
scene.add(new THREE.HemisphereLight(0xffffff, 0x4a4030, 1.15));
const key = new THREE.DirectionalLight(0xfff2d0, 1.5); key.position.set(0.5, 0.8, 1); scene.add(key);
const fill = new THREE.DirectionalLight(0x9fb8d0, 0.55); fill.position.set(-1, -0.4, 0.6); scene.add(fill);

const tl = new THREE.TextureLoader();
const texWall = tl.load('/assets/apk/wallTexture.webp');
const texTree = tl.load('/assets/apk/treeTexture.webp');
for (const t of [texWall, texTree]) { t.colorSpace = THREE.SRGBColorSpace; t.anisotropy = 4; t.wrapS = t.wrapT = THREE.RepeatWrapping; }
texTree.premultiplyAlpha = false;

const matWall = new THREE.MeshLambertMaterial({ map: texWall, side: THREE.DoubleSide });
const matTree = new THREE.MeshLambertMaterial({ map: texTree, side: THREE.DoubleSide, alphaTest: 0.35 });

const data = await fetch('/track-tools/mesh-data.json').then(r => r.json());
const num = s => { const m = /(\d+)/.exec(s); return m ? +m[1] : 0; };

let items = data.filter(d => d.verts > 0 && (d.tex === 'wallTexture' || d.tex === 'treeTexture'));
if (FILTER === 'wall') items = items.filter(d => d.tex === 'wallTexture');
if (FILTER === 'tree') items = items.filter(d => d.tex === 'treeTexture');
items.sort((a, b) => num(a.name) - num(b.name) || a.name.localeCompare(b.name));

if (LAYOUT) {
  // true temple layout, viewed from above (X right, Z down mapped through Y-rotation)
  const all = items;
  let lo = [1e9, 1e9, 1e9], hi = [-1e9, -1e9, -1e9];
  for (const d of all) for (let i = 0; i < 3; i++) { lo[i] = Math.min(lo[i], d.wmin[i]); hi[i] = Math.max(hi[i], d.wmax[i]); }
  const cx = (lo[0] + hi[0]) / 2, cz = (lo[2] + hi[2]) / 2;
  const spanX = hi[0] - lo[0], spanZ = hi[2] - lo[2];
  const halfW = Math.max(spanX, spanZ * VW / VH) * 0.55;
  const cam = new THREE.OrthographicCamera(-halfW, halfW, halfW * VH / VW, -halfW * VH / VW, 0.1, 100000);
  cam.position.set(cx, 5000, cz);
  cam.up.set(0, 0, -1);
  cam.lookAt(cx, 0, cz);
  scene.add(cam);
  for (const d of all) {
    const g = new THREE.BufferGeometry();
    g.setAttribute('position', new THREE.Float32BufferAttribute(d.P, 3));
    if (d.hasUV) g.setAttribute('uv', new THREE.Float32BufferAttribute(d.UV, 2));
    g.setIndex(d.I);
    g.computeVertexNormals();
    scene.add(new THREE.Mesh(g, d.tex === 'treeTexture' ? matTree : matWall));
  }
  renderer.render(scene, cam);
  window.__INFO__ = { layout: true, count: all.length, spanX: spanX.toFixed(1), spanZ: spanZ.toFixed(1), lo, hi };
  window.__READY__ = true;
} else {
  const perSheet = COLS * ROWS;
  const page = items.slice(SHEET * perSheet + SHIFT, (SHEET + 1) * perSheet + SHIFT);
  const cam = new THREE.OrthographicCamera(-COLS * CELL / 2, COLS * CELL / 2, ROWS * CELL / 2, -ROWS * CELL / 2, 0.01, 100);
  cam.position.set(0, 0, 20);
  scene.add(cam);

  const labels = [];
  page.forEach((d, i) => {
    const col = i % COLS, row = Math.floor(i / COLS);
    const cx = (col - (COLS - 1) / 2) * CELL;
    const cy = ((ROWS - 1) / 2 - row) * CELL;
    const geo = new THREE.BufferGeometry();
    geo.setAttribute('position', new THREE.Float32BufferAttribute(d.P, 3));
    if (d.hasUV) geo.setAttribute('uv', new THREE.Float32BufferAttribute(d.UV, 2));
    geo.setIndex(d.I);
    geo.computeVertexNormals();
    const mat = MODE === 'wire'
      ? new THREE.MeshBasicMaterial({ color: 0x8fd6ff, wireframe: true })
      : (d.tex === 'treeTexture' ? matTree : matWall);
    const inner = new THREE.Group();
    inner.add(new THREE.Mesh(geo, mat));
    if (VIEW === 'top') inner.rotation.set(Math.PI / 2, 0, 0);
    else inner.rotation.set(RX, RY, 0);
    inner.updateMatrixWorld(true);
    const box = new THREE.Box3().setFromObject(inner);
    const c = box.getCenter(new THREE.Vector3());
    const s = box.getSize(new THREE.Vector3());
    const k = FIT / Math.max(s.x, s.y, s.z);
    inner.position.set(-c.x, -c.y, -c.z);
    const pivot = new THREE.Group();
    pivot.add(inner);
    pivot.scale.setScalar(k);
    pivot.position.set(cx, cy, 0);
    scene.add(pivot);
    labels.push({ i, name: d.name, cx, cy, dims: d.wsize, inst: d.instances, tex: d.tex, verts: d.verts, tris: d.tris });
  });

  renderer.render(scene, cam);

  // overlay: grid, labels
  const ov = document.createElement('div');
  ov.style.cssText = 'position:absolute;left:0;top:0;width:100%;height:100%;pointer-events:none;font-family:ui-monospace,Menlo,monospace';
  document.body.appendChild(ov);
  for (let c = 0; c <= COLS; c++) {
    const x = (c - COLS / 2) * CELL;
    const p = new THREE.Vector3(x, 0, 0).project(cam);
    const d = document.createElement('div');
    d.style.cssText = `position:absolute;left:${(p.x * 0.5 + 0.5) * 100}%;top:0;height:100%;width:1px;background:#2b3844`;
    ov.appendChild(d);
  }
  for (let r = 0; r <= ROWS; r++) {
    const y = ((ROWS / 2) - r) * CELL;
    const p = new THREE.Vector3(0, y, 0).project(cam);
    const d = document.createElement('div');
    d.style.cssText = `position:absolute;top:${(-p.y * 0.5 + 0.5) * 100}%;left:0;width:100%;height:1px;background:#2b3844`;
    ov.appendChild(d);
  }
  for (const L of labels) {
    const p = new THREE.Vector3(L.cx, L.cy, 0).project(cam);
    const px = (p.x * 0.5 + 0.5) * VW, py = (-p.y * 0.5 + 0.5) * VH;
    const d = document.createElement('div');
    d.style.cssText = `position:absolute;left:${px}px;top:${py}px;transform:translate(-50%,-50%);width:${VW / COLS - 8}px;text-align:center;color:#dfe9f2;font-size:11px;line-height:1.25;text-shadow:0 1px 2px #000`;
    const dm = L.dims;
    d.innerHTML = `<b style="font-size:11.5px">${L.name}</b><br><span style="color:#8fa6b8;font-size:9.5px">${dm[0].toFixed(1)}×${dm[1].toFixed(1)}×${dm[2].toFixed(1)} u · ${L.tris}t${L.inst > 1 ? ' · x' + L.inst : ''}</span>`;
    ov.appendChild(d);
  }
  const hdr = document.createElement('div');
  hdr.style.cssText = 'position:absolute;left:10px;top:8px;color:#8fa6b8;font:10px ui-monospace,Menlo,monospace';
  hdr.textContent = `sheet ${SHEET} · ${items.length} temple meshes · ${page.length} shown · dims = world W×H×D (units, Y up) · texture: ${FILTER} · view: ${VIEW}`;
  document.body.appendChild(hdr);
  window.__INFO__ = { sheet: SHEET, total: items.length, shown: page.length, names: page.map(d => d.name) };
  window.__READY__ = true;
}
