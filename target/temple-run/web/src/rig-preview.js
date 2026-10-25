import * as THREE from 'three';
import { loadRunnerRig } from './runnerRig.js';

const q = new URLSearchParams(location.search);
const rigUrl = q.get('rig') || '/assets/apk/runner-rig.json';
const texUrl = q.get('tex') || '/assets/apk/texture-63-playerTexture.png';
const clip = q.get('clip') || 'run';
const view = q.get('view') || 'front';
const tParam = q.get('t');
// fb=1 discards the rig's own clip tracks so the default runner's clips get retargeted onto it.
const forceFb = q.get('fb') === '1';

const scene = new THREE.Scene();
scene.background = new THREE.Color(0x16241d);
const camera = new THREE.PerspectiveCamera(50, innerWidth / innerHeight, 0.1, 100);
const renderer = new THREE.WebGLRenderer({ antialias: true });
renderer.setSize(innerWidth, innerHeight);
renderer.setPixelRatio(Math.min(devicePixelRatio, 2));
document.body.append(renderer.domElement);
scene.add(new THREE.HemisphereLight(0xffffff, 0x445544, 2.2));
const sun = new THREE.DirectionalLight(0xffe2a7, 2.6); sun.position.set(-4, 8, 5); scene.add(sun);
const rim = new THREE.DirectionalLight(0x88aaff, 1.2); rim.position.set(3, 4, -6); scene.add(rim);
const grid = new THREE.GridHelper(8, 16, 0x4d7a5c, 0x2c4636); grid.position.y = 0.001; scene.add(grid);

window.__rigError = null;
window.rigReady = loadRunnerRig(rigUrl, texUrl, { clipFallbackUrl: '/assets/characters/rig-orig_02___Default.json', forceFallbackClips: forceFb })
  .then((rig) => {
    scene.add(rig.object);
    rig.setClip(clip);
    if (tParam) rig.update(parseFloat(tParam));
    window.rigDebug = rig;
    // auto frame
    const box = new THREE.Box3().setFromObject(rig.object);
    const size = new THREE.Vector3(); box.getSize(size);
    const center = new THREE.Vector3(); box.getCenter(center);
    const maxDim = Math.max(size.x, size.y, size.z, 0.001);
    const dist = maxDim * 1.9;
    if (view === 'side') camera.position.set(center.x + dist, center.y + maxDim * .1, center.z + dist * .2);
    else camera.position.set(center.x + maxDim * .18, center.y + maxDim * .18, center.z + dist);
    camera.lookAt(center.x, center.y, center.z);
    document.body.dataset.ready = '1';
    console.log(JSON.stringify({ rig: rigUrl, tex: texUrl, verts: rig.vertexCount, bones: rig.boneCount, size: [size.x.toFixed(2), size.y.toFixed(2), size.z.toFixed(2)] }));
    return rig;
  })
  .catch((err) => { window.__rigError = String(err); console.error('rig error', err); });

const clock = new THREE.Clock();
renderer.setAnimationLoop(() => {
  const dt = Math.min(clock.getDelta(), 0.05);
  if (window.rigDebug && !window.__pause) window.rigDebug.update(dt);
  renderer.render(scene, camera);
});
