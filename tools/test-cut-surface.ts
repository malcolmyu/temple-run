import assert from 'node:assert/strict';
import * as THREE from 'three';
import { cutSurfaceGeometry } from '../target/temple-run/web/src/game/cutSurface';
const original = new THREE.PlaneGeometry(7, 12).rotateX(-Math.PI / 2);
const before = Array.from(original.attributes.position.array);
const cut = cutSurfaceGeometry(original, -2, 2);
function area(geometry: THREE.BufferGeometry): number {
  const p = geometry.getAttribute('position');
  let sum = 0;
  for (let i = 0; i < p.count; i += 3) {
    const a = new THREE.Vector3().fromBufferAttribute(p, i);
    const b = new THREE.Vector3().fromBufferAttribute(p, i + 1);
    const c = new THREE.Vector3().fromBufferAttribute(p, i + 2);
    sum += b.sub(a).cross(c.sub(a)).length() / 2;
  }
  return sum;
}
assert.ok(Math.abs(area(cut) - 56) < 1e-5, 'remove only the four metre opening');
const positions = cut.attributes.position;
for (let i = 0; i < positions.count; i += 3) {
  const zs = [0, 1, 2].map(j => positions.getZ(i + j));
  assert.ok(Math.max(...zs) <= -2 + 1e-6 || Math.min(...zs) >= 2 - 1e-6, 'no triangle may bridge the opening');
}
for (const value of cut.attributes.uv.array) assert.ok(value >= 0 && value <= 1, 'UV interpolation stays within the source texture');
assert.deepEqual(Array.from(original.attributes.position.array), before, 'shared source prototype is untouched');
const edge = cutSurfaceGeometry(original, 4, 8);
assert.ok(Math.abs(area(edge) - 70) < 1e-5, 'a gap crossing a tile boundary cuts the correct portion');
const empty = cutSurfaceGeometry(original, -20, 20);
assert.equal(empty.attributes.position.count, 0);
console.log('Surface cuts OK: area, open triangles, UVs, immutable prototypes, tile boundaries, fully removed tiles');
const half = cutSurfaceGeometry(original, .55, 1000, 'x');
assert.ok(Math.abs(area(half) - 4.05 * 12) < 1e-4, 'half-road removes exactly the missing side');
for (let i = 0; i < half.attributes.position.count; i++) assert.ok(half.attributes.position.getX(i) <= .55 + 1e-6);
const { offNarrowSurface } = await import('../target/temple-run/web/src/game/terrain');
assert.equal(offNarrowSurface('left', .55), false);
assert.equal(offNarrowSurface('left', .551), true, 'collision begins at the visible broken edge, not at lane-index .65');
assert.equal(offNarrowSurface('right', -.55), false);
assert.equal(offNarrowSurface('right', -.551), true);
console.log('Half-road OK: shared visual/collision boundary, both sides, lateral geometry removal');
const partial = cutSurfaceGeometry(original, .55, 1000, 'x', [-3, 1]);
assert.ok(Math.abs(area(partial) - (84 - 2.95 * 4)) < 1e-4, 'half-road starts and ends at the exact longitudinal boundary inside a tile');
console.log('Partial half-road OK: unbroken approach/exit remains inside boundary tiles');
