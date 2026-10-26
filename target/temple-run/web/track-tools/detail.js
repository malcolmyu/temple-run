import * as THREE from 'three';

const q = new URLSearchParams(location.search);
const NAMES = (q.get('names') || 'Object81-Pivot').split(',').map(s => s.trim()).filter(Boolean);
const VW = +(q.get('w') || 1920), VH = +(q.get('h') || 1080);
const perPiece = 4;
const MODE = q.get('mode') || 'tex';

const renderer = new THREE.WebGLRenderer({ antialias: true, preserveDrawingBuffer: true });
renderer.setPixelRatio(1);
renderer.setSize(VW, VH);
renderer.setClearColor(0x101418, 1);
renderer.autoClear = false;
document.body.appendChild(renderer.domElement);
renderer.domElement.style.cssText = 'position:absolute;left:0;top:0';

const tl = new THREE.TextureLoader();
const texWall = tl.load('/assets/apk/wallTexture.webp');
const texTree = tl.load('/assets/apk/treeTexture.webp');
for (const t of [texWall, texTree]) { t.colorSpace = THREE.SRGBColorSpace; t.anisotropy = 4; }
const data = await fetch('/track-tools/mesh-data.json').then(r => r.json());
const byName = new Map(data.map(d => [d.name, d]));

renderer.setScissorTest(true);
const labels = [];
const rowH = VH / NAMES.length;
NAMES.forEach((name, ri) => {
  const d = byName.get(name);
  if (!d) { console.warn('missing', name); return; }
  const geo = new THREE.BufferGeometry();
  geo.setAttribute('position', new THREE.Float32BufferAttribute(d.P, 3));
  if (d.hasUV) geo.setAttribute('uv', new THREE.Float32BufferAttribute(d.UV, 2));
  geo.setIndex(d.I);
  geo.computeVertexNormals();
  let mat;
  if (MODE === 'wire') mat = new THREE.MeshBasicMaterial({ color: 0x7fd0ff, wireframe: true });
  else if (MODE === 'clay') mat = new THREE.MeshLambertMaterial({ color: 0xb9ae9a, side: THREE.DoubleSide, flatShading: false });
  else mat = new THREE.MeshLambertMaterial({ map: d.tex === 'treeTexture' ? texTree : texWall, side: THREE.DoubleSide, alphaTest: 0.3 });
  const scene = new THREE.Scene();
  scene.add(new THREE.HemisphereLight(0xffffff, 0x4a4030, 1.05));
  const key = new THREE.DirectionalLight(0xfff0cf, 1.7); key.position.set(0.6, 1, 0.4); scene.add(key);
  const fill = new THREE.DirectionalLight(0x9fc0e0, 0.5); fill.position.set(-1, 0.2, -0.6); scene.add(fill);
  // centre on bbox, keep true proportions
  const c = new THREE.Vector3((d.wmin[0] + d.wmax[0]) / 2, (d.wmin[1] + d.wmax[1]) / 2, (d.wmin[2] + d.wmax[2]) / 2);
  const m = new THREE.Mesh(geo, mat);
  m.position.sub(c);
  scene.add(m);
  const sz = new THREE.Vector3(...d.wsize);
  const R = Math.max(sz.x, sz.y, sz.z) * 0.62;
  // ground grid at piece bottom
  const grid = new THREE.GridHelper(R * 4, Math.round(R * 4 / 10), 0x3b4b58, 0x243039);
  grid.position.y = d.wmin[1] - c.y;
  scene.add(grid);
  const axes = new THREE.AxesHelper(R * 0.9); axes.position.y = d.wmin[1] - c.y; scene.add(axes);

  const cw = VW / perPiece, ch = rowH;
  const views = [
    { t: 'front (-Z)', pos: [0, 0, -R * 3], w: sz.x, h: sz.y },
    { t: 'side (-X)', pos: [-R * 3, 0, 0], w: sz.z, h: sz.y },
    { t: 'top (+Y)', pos: [0, R * 3, 0], up: [0, 0, -1], w: sz.x, h: sz.z },
    { t: 'iso', pos: [R * 1.8, R * 1.5, R * 2.4] },
  ];
  views.forEach((v, vi) => {
    const aspect = cw / ch;
    const half = v.w ? Math.max(v.h / 2, (v.w / 2) / aspect) * 1.14 : R * 1.02;
    const cam = new THREE.OrthographicCamera(-half * aspect, half * aspect, half, -half, 0.01, R * 40);
    cam.position.set(...v.pos);
    if (v.up) cam.up.set(...v.up);
    cam.lookAt(0, 0, 0);
    const x = vi * cw, y = VH - (ri + 1) * ch;
    renderer.setViewport(x, y, cw, ch);
    renderer.setScissor(x, y, cw, ch);
    renderer.render(scene, cam);
    labels.push({ x: x + cw / 2, y: y + ch - 16, t: v.t });
  });
  labels.push({ x: 12, y: VH - ri * rowH - 12, t: `${name}  ${d.wsize[0].toFixed(1)} × ${d.wsize[1].toFixed(1)} × ${d.wsize[2].toFixed(1)} u  (X×Y×Z)  ${d.verts}v ${d.tris}t  tex=${d.tex}`, big: true });
});

const ov = document.createElement('div');
ov.style.cssText = 'position:absolute;inset:0;pointer-events:none;font-family:ui-monospace,Menlo,monospace;color:#cfe0ee;font-size:12px';
for (const L of labels) {
  const e = document.createElement('div');
  e.style.cssText = `position:absolute;left:${L.x}px;top:${L.y}px;transform:translate(-50%,-100%);font-size:${L.big ? 13 : 11}px;color:${L.big ? '#ffe9b8' : '#8fa6b8'};white-space:nowrap;text-shadow:0 1px 2px #000`;
  e.textContent = L.t;
  ov.appendChild(e);
}
document.body.appendChild(ov);
window.__READY__ = true;
window.__INFO__ = { names: NAMES };
