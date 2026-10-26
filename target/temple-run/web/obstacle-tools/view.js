// Temple Run obstacle prefab single view (corridor frame: Y up, +Z running, X across, ground y=0).
// ?only=<regex on prefab name>&cam=player|iso|side|front|back|top&box=1&grid=1
import * as THREE from 'three';

const q = new URLSearchParams(location.search);
const ONLY = q.get('only') || '';
const BOX = q.get('box') !== '0';
const GRID = q.get('grid') !== '0';
const W = window.innerWidth, H = window.innerHeight;

const renderer = new THREE.WebGLRenderer({ antialias: true });
renderer.setSize(W, H);
renderer.setPixelRatio(1);
renderer.domElement.style.position = 'fixed';
renderer.domElement.style.inset = '0';
renderer.domElement.style.width = '100%';
renderer.domElement.style.height = '100%';
document.body.appendChild(renderer.domElement);
const scene = new THREE.Scene();
scene.background = new THREE.Color(0x0e1216);

const texWall = new THREE.TextureLoader().load('/assets/apk/wallTexture.webp', () => { window.__READY__ = true; });
const texTree = new THREE.TextureLoader().load('/assets/apk/treeTexture.webp');
texTree.colorSpace = THREE.SRGBColorSpace;
texWall.colorSpace = THREE.SRGBColorSpace;
const matCache = new Map();
function matFor(tex) {
  if (matCache.has(tex)) return matCache.get(tex);
  const m = new THREE.MeshBasicMaterial({ map: tex === 'treeTexture' ? texTree : texWall, side: THREE.DoubleSide, alphaTest: tex === 'treeTexture' ? 0.35 : 0 });
  matCache.set(tex, m);
  return m;
}

const gridGroup = new THREE.Group();
scene.add(gridGroup);
if (GRID) {
  gridGroup.add(new THREE.GridHelper(120, 12, 0x2b3946, 0x1d2731));
  const laneMat = new THREE.LineBasicMaterial({ color: 0x3aa06a });
  for (const x of [-10, 0, 10]) {
    const g = new THREE.BufferGeometry().setFromPoints([new THREE.Vector3(x, 0.01, -30), new THREE.Vector3(x, 0.01, 30)]);
    gridGroup.add(new THREE.Line(g, laneMat));
  }
}
if (BOX) {
  const addBox = (sx, sy, sz, color) => {
    const g = new THREE.BoxGeometry(sx, sy, sz);
    g.translate(0, sy / 2, 0);
    gridGroup.add(new THREE.LineSegments(new THREE.EdgesGeometry(g), new THREE.LineBasicMaterial({ color })));
  };
  addBox(30, 36.8, 60, 0xffcc33);   // corridor volume: 30 wide, 36.8 high (wall top), 60 long
  addBox(30, 11, 60, 0xff4466);     // player height 11 u
}

const info = [];
const content = new THREE.Group();
scene.add(content);

const data = await (await fetch('/obstacle-tools/data.json')).json();
const entries = data.entries.filter(e => !ONLY || new RegExp(ONLY, 'i').test(e.prefab));
for (const e of entries) {
  for (const m of e.meshes) {
    const g = new THREE.BufferGeometry();
    g.setAttribute('position', new THREE.Float32BufferAttribute(m.P, 3));
    g.setAttribute('uv', new THREE.Float32BufferAttribute(m.UV, 2));
    g.setIndex(m.I);
    g.computeVertexNormals();
    content.add(new THREE.Mesh(g, matFor(m.tex)));
  }
  info.push(`${e.prefab} | ${e.role} | ` + e.meshes.map(m => `${m.mesh} ${m.tex} ${m.dims.map(v => v.toFixed(1)).join('x')}`).join(' + '));
}

// lights not needed (basic materials), but faint edges help reading the shape
for (const e of entries) for (const m of e.meshes) {
  const g = new THREE.BufferGeometry();
  g.setAttribute('position', new THREE.Float32BufferAttribute(m.P, 3));
  g.setIndex(m.I);
  const ls = new THREE.LineSegments(new THREE.WireframeGeometry(g), new THREE.LineBasicMaterial({ color: 0x1b2c3a, transparent: true, opacity: 0.55 }));
  content.add(ls);
}

const DIRS = {
  iso: new THREE.Vector3(0.62, 0.42, -0.66).normalize(),
  side: new THREE.Vector3(1, 0.18, -0.1).normalize(),
  front: new THREE.Vector3(0, 0.18, -1).normalize(),
  back: new THREE.Vector3(0, 0.12, 1).normalize(),
  top: new THREE.Vector3(0.001, 1, 0.02).normalize(),
};
const CAM = q.get('cam') || 'iso';
let camera;
if (CAM === 'player') {
  camera = new THREE.PerspectiveCamera(52, W / H, 0.5, 4000);
  camera.position.set(0, 6.5, -52);
  camera.lookAt(0, 9, 4);
} else {
  const dir = DIRS[CAM] || DIRS.iso;
  const box = new THREE.Box3().setFromObject(content);
  const sphere = box.getBoundingSphere(new THREE.Sphere());
  const fov = 34;
  const dist = (sphere.radius / Math.sin((fov / 2) * Math.PI / 180)) * 1.05;
  const target = sphere.center.clone();
  camera = new THREE.PerspectiveCamera(fov, W / H, 0.5, 8000);
  camera.position.copy(target).addScaledVector(dir, dist);
  camera.lookAt(target);
}
const hdr = document.createElement('div');
hdr.style.cssText = 'position:fixed;left:12px;top:10px;color:#dfe9f2;font:13px/1.45 ui-monospace,Menlo,monospace;text-shadow:0 1px 3px #000;max-width:96vw';
hdr.innerHTML = `<b>${CAM}</b> · corridor frame: ground y=0, +Z running, X across · yellow=corridor 30×36.8×60, red=player 30×11×60<br>` +
  info.map(s => `<span style="color:#9fb4c6">${s}</span>`).join('<br>');
document.body.appendChild(hdr);

let t0 = performance.now();
function loop() {
  requestAnimationFrame(loop);
  renderer.render(scene, camera);
  if (!window.__SHOT__ && performance.now() - t0 > 500) { window.__SHOT__ = performance.now(); }
}
loop();
