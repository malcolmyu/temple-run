import * as THREE from 'three';
import { OBJLoader } from 'three/addons/loaders/OBJLoader.js';
import { loadRunnerRig } from './runnerRig.js';
const scene = new THREE.Scene();
scene.background = new THREE.Color(0x5a7264);
scene.fog = new THREE.Fog(0x5a7264, 26, 90);
const camera = new THREE.PerspectiveCamera(62, innerWidth / innerHeight, 0.1, 200);
camera.position.set(0, 5.1, 14); camera.lookAt(0, 1.2, -10);
const renderer = new THREE.WebGLRenderer({ antialias: true });
renderer.setSize(innerWidth, innerHeight); renderer.setPixelRatio(Math.min(devicePixelRatio, 2));
document.body.append(renderer.domElement);
scene.add(new THREE.HemisphereLight(0xffffff, 0x6d604c, 2.4));
const sun = new THREE.DirectionalLight(0xffe2a7, 2.9); sun.position.set(-12, 24, 10); scene.add(sun);
const fill = new THREE.DirectionalLight(0xbfd8c0, 1.1); fill.position.set(14, 10, -18); scene.add(fill);
scene.add(new THREE.GridHelper(60, 30, 0x6b8f74, 0x35503f));
const texture = new THREE.TextureLoader().load('/assets/apk/wallTexture.png');
texture.colorSpace = THREE.SRGBColorSpace;
const mat = new THREE.MeshStandardMaterial({ map: texture, roughness: .95, metalness: 0, side: THREE.DoubleSide });
new OBJLoader().load('/assets/track/temple-road-tile.obj', (obj) => {
  obj.traverse((p) => { if (p.isMesh) { p.material = mat; p.receiveShadow = true; } });
  obj.position.y = -0.02;
  // three tiles along -Z like the game
  for (let i = 0; i < 3; i++) { const c = obj.clone(true); c.position.z = -i * 12 + 4; scene.add(c); }
  window.__tileBounds = new THREE.Box3().setFromObject(obj).getSize(new THREE.Vector3()).toArray().map(v => +v.toFixed(2));
});
loadRunnerRig('/assets/apk/runner-rig.json', '/assets/apk/texture-63-playerTexture.png', { scale: 0.27, yOffset: 0 }).then((rig) => {
  rig.object.position.set(0, 0, 6); rig.object.rotation.y = Math.PI; scene.add(rig.object); window.__rig = rig;
});
new OBJLoader().load('/assets/track/track-gate-a.obj', (gate) => {
  gate.traverse((p) => { if (p.isMesh) { p.material = mat; p.castShadow = true; } });
  gate.scale.setScalar(0.2); gate.position.set(0, 0, -14); scene.add(gate);
  window.__gateBounds = new THREE.Box3().setFromObject(gate).getSize(new THREE.Vector3()).toArray().map(v => +v.toFixed(2));
});
new OBJLoader().load('/assets/track/track-wall-corner-a.obj', (corner) => {
  corner.traverse((p) => { if (p.isMesh) { p.material = mat; p.castShadow = true; } });
  corner.scale.setScalar(0.2); corner.position.set(10, 0, -26); scene.add(corner);
});
const clock = new THREE.Clock();
renderer.setAnimationLoop(() => { const dt = Math.min(clock.getDelta(), .05); if (window.__rig) window.__rig.update(dt); renderer.render(scene, camera); });
window.__cam = (x, y, z, tx, ty, tz) => { camera.position.set(x, y, z); camera.lookAt(tx ?? 0, ty ?? 1.2, tz ?? -10); };
