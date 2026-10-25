import * as THREE from 'three';

// The APK-exported OBJ files declare normal indices (`f v/vt/vn`) but ship no `vn` block.
// OBJLoader then looks up normal index 1 in an empty array, which fills the `normal`
// attribute with NaN, and every lit material that samples it renders pitch black — the
// road tile and the chaser mesh were the visible casualties. Rebuild the normals from the
// triangle positions instead: degenerate triangles are skipped, and any vertex left
// without a contribution falls back to pointing up so nothing can go NaN again.

const _a = new THREE.Vector3();
const _b = new THREE.Vector3();
const _c = new THREE.Vector3();
const _cb = new THREE.Vector3();
const _ab = new THREE.Vector3();

function needsRepair(geometry) {
  const position = geometry.attributes.position;
  if (!position) return false;
  const normal = geometry.attributes.normal;
  if (!normal || normal.count !== position.count) return true;
  const array = normal.array;
  for (let i = 0; i < array.length; i++) if (!Number.isFinite(array[i])) return true;
  return false;
}

export function repairObjNormals(root) {
  if (!root) return 0;
  let repaired = 0;
  root.traverse((part) => {
    if (!part.isMesh || !part.geometry) return;
    const geometry = part.geometry;
    const position = geometry.attributes.position;
    if (!position || !needsRepair(geometry)) return;

    const sums = new Float32Array(position.count * 3);
    const index = geometry.index;
    const triangles = Math.floor((index ? index.count : position.count) / 3);
    for (let t = 0; t < triangles; t++) {
      const i0 = index ? index.getX(t * 3) : t * 3;
      const i1 = index ? index.getX(t * 3 + 1) : t * 3 + 1;
      const i2 = index ? index.getX(t * 3 + 2) : t * 3 + 2;
      _a.fromBufferAttribute(position, i0);
      _b.fromBufferAttribute(position, i1);
      _c.fromBufferAttribute(position, i2);
      _cb.subVectors(_c, _b);
      _ab.subVectors(_a, _b);
      _cb.cross(_ab);
      const length = _cb.length();
      if (!(length > 1e-8)) continue; // zero-area triangle: contributes nothing
      _cb.divideScalar(length);
      sums[i0 * 3] += _cb.x; sums[i0 * 3 + 1] += _cb.y; sums[i0 * 3 + 2] += _cb.z;
      sums[i1 * 3] += _cb.x; sums[i1 * 3 + 1] += _cb.y; sums[i1 * 3 + 2] += _cb.z;
      sums[i2 * 3] += _cb.x; sums[i2 * 3 + 1] += _cb.y; sums[i2 * 3 + 2] += _cb.z;
    }

    const out = new Float32Array(position.count * 3);
    for (let i = 0; i < position.count; i++) {
      const x = sums[i * 3], y = sums[i * 3 + 1], z = sums[i * 3 + 2];
      const length = Math.hypot(x, y, z);
      if (length > 1e-8) {
        out[i * 3] = x / length; out[i * 3 + 1] = y / length; out[i * 3 + 2] = z / length;
      } else {
        out[i * 3] = 0; out[i * 3 + 1] = 1; out[i * 3 + 2] = 0;
      }
    }
    geometry.setAttribute('normal', new THREE.BufferAttribute(out, 3));
    geometry.attributes.normal.needsUpdate = true;
    repaired++;
  });
  return repaired;
}
