// Browser-side verification that the exported OBJs assemble into a corridor.
// Usage: /track-tools/preview.html?cam=run|top|iso&wall=15
import * as THREE from 'three';
import { OBJLoader } from 'three/addons/loaders/OBJLoader.js';

const q = new URLSearchParams(location.search);
const CAM = q.get('cam') || 'run';
const HALF = parseFloat(q.get('wall') || '15');   // corridor half width
const ASSET = '/assets/track/';

const hud = document.getElementById('hud');
const errBox = document.getElementById('err');

const renderer = new THREE.WebGLRenderer({ antialias: true });
renderer.setPixelRatio(1);
renderer.setSize(innerWidth, innerHeight);
renderer.outputColorSpace = THREE.SRGBColorSpace;
document.body.appendChild(renderer.domElement);

const scene = new THREE.Scene();
scene.background = new THREE.Color(0x8fb4cc);
scene.fog = new THREE.Fog(0x8fb4cc, 260, 620);

const cam = new THREE.PerspectiveCamera(58, innerWidth / innerHeight, 0.5, 4000);
if (CAM === 'run') { cam.position.set(0, 13, -34); cam.lookAt(0, 5, 90); }
else if (CAM === 'top') { cam.position.set(0, 210, 10); cam.lookAt(0, 0, 10); }
else { cam.position.set(-140, 90, -120); cam.lookAt(0, 10, 20); }

scene.add(new THREE.HemisphereLight(0xdfeaff, 0x4a4034, 2.0));
const sun = new THREE.DirectionalLight(0xfff2d4, 1.7);
sun.position.set(-120, 180, -80);
scene.add(sun);
// fill from the opposite side so the left-hand wall is not pitch black
const fill = new THREE.DirectionalLight(0xdfe8ff, 1.1);
fill.position.set(140, 90, 40);
scene.add(fill);

// --- ground reference: the procedural track this asset set has to dress ------
const road = new THREE.Mesh(
  new THREE.PlaneGeometry(HALF * 2, 420),
  new THREE.MeshLambertMaterial({ color: 0x9a8f74 })
);
road.rotation.x = -Math.PI / 2;
road.position.set(0, 0, 40);
scene.add(road);
const grid = new THREE.GridHelper(400, 40, 0x556677, 0x445566);
grid.position.set(0, 0.05, 40);
scene.add(grid);

// ---------------------------------------------------------------------------
const texLoader = new THREE.TextureLoader();
const wallTex = texLoader.load('/assets/apk/wallTexture.webp');
wallTex.colorSpace = THREE.SRGBColorSpace;
const treeTex = texLoader.load('/assets/apk/treeTexture.webp');
treeTex.colorSpace = THREE.SRGBColorSpace;

const matWall = new THREE.MeshLambertMaterial({ map: wallTex, side: THREE.DoubleSide });
const matTree = new THREE.MeshLambertMaterial({ map: treeTex, side: THREE.DoubleSide, alphaTest: 0.35 });

const loader = new OBJLoader();

function place(file, mat, pos, rotY = 0, scale = 1) {
  return new Promise((res, rej) => {
    loader.load(ASSET + file, (obj) => {
      const g = obj.children[0] || obj;
      g.material = mat;
      const holder = new THREE.Group();
      holder.add(g);
      holder.position.set(pos[0], pos[1], pos[2]);
      holder.rotation.y = rotY;
      holder.scale.setScalar(scale);
      holder.name = file;
      scene.add(holder);
      const bb = new THREE.Box3().setFromObject(holder);
      res({ file, box: bb, holder });
    }, undefined, rej);
  });
}

const asyncMain = async () => {
  const report = [];
  // two straight segments per side; straight-a length is 60.17 along +Z
  const LEN = 60.17;
  // face plane sits at local x = -11.36 pointing -X (verified by render):
  // so the LEFT wall needs rotY(PI) and the RIGHT wall rotY(0).
  const first = await place('track-wall-straight-a.obj', matWall, [-HALF - 11.36, 0, -60], Math.PI);
  report.push(['left wall A', first.box.min.toArray(), first.box.max.toArray()]);

  // Probe: which side does the decorated face point at? Render both and compare.
  await place('track-wall-straight-a.obj', matWall, [-HALF - 11.36, 0, -60 + LEN], Math.PI);
  await place('track-wall-straight-a.obj', matWall, [+HALF + 11.36, 0, -60], 0);
  await place('track-wall-straight-a.obj', matWall, [+HALF + 11.36, 0, -60 + LEN], 0);
  await place('track-wall-straight-b.obj', matWall, [-(HALF + 20), 0, 30], Math.PI);
  await place('track-gate-a.obj', matWall, [0, 0, 92], 0);
  await place('track-wall-corner-a.obj', matWall, [0, 0, 150], Math.PI);
  await place('decor-rock-a.obj', matWall, [-(HALF + 52), 0, -20], 0);
  await place('decor-tree-a.obj', matTree, [HALF + 55, 0, 105], 0);

  hud.innerHTML = `<b>track pieces preview</b> — 6 OBJ from /assets/track/, corridor half width ${HALF}<br>` +
    report.map(r => `${r[0]}: x ${r[1][0].toFixed(1)}..${r[2][0].toFixed(1)}  y ${r[1][1].toFixed(1)}..${r[2][1].toFixed(1)}  z ${r[1][2].toFixed(1)}..${r[2][2].toFixed(1)}`).join('<br>');

  window.__INFO__ = { cam: CAM, half: HALF, pieces: 8, loaded: true };
  window.__READY__ = true;
};

asyncMain().catch((e) => {
  errBox.textContent = String(e && e.stack || e);
  window.__READY__ = true;
  window.__INFO__ = { error: String(e) };
});

addEventListener('resize', () => {
  cam.aspect = innerWidth / innerHeight;
  cam.updateProjectionMatrix();
  renderer.setSize(innerWidth, innerHeight);
});

renderer.setAnimationLoop(() => renderer.render(scene, cam));
