import assert from 'node:assert/strict';
import { terrainAt, narrowAt } from '../target/temple-run/web/src/game/terrain';
import { surfaceAt, REFERENCE_SURFACES } from '../target/temple-run/web/src/game/surface';

// Audio, obstacle placement and rendering must agree even beside a turn.
const besideTurn = { nearTurn: () => true } as any;
for (let distance = 0; distance < 3000; distance += 0.5) {
  const expected = surfaceAt(distance).kind === 'wood' ? 'bridge' : 'temple';
  assert.equal(terrainAt(distance), expected);
  assert.equal(terrainAt(distance, besideTurn), expected);
  const narrow = narrowAt(distance);
  if (narrow) {
    assert.equal(surfaceAt(narrow.from).kind, 'stone');
    assert.equal(surfaceAt(narrow.to - 0.001).kind, 'stone');
  }
}
for (const section of REFERENCE_SURFACES.filter(section => section.kind === 'wood')) {
  assert.equal(terrainAt(section.from - 0.001), 'temple');
  assert.equal(terrainAt(section.from), 'bridge');
  assert.equal(terrainAt(section.to - 0.001), 'bridge');
  assert.equal(terrainAt(section.to), 'temple');
}
console.log('Reference terrain: shared boundaries and stone-only narrow sections passed.');
