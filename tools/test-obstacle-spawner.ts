import { referenceTileDistance as T } from '../target/temple-run/web/src/game/referenceCoordinates';
import { ASSET_DEFS, DEFS, PLAYABLE_DEFS } from '../target/temple-run/web/src/game/obstacles/catalog';
import { ORIGINAL_SPAWNER_CONFIG, pickObstacle } from '../target/temple-run/web/src/game/obstacles/spawner';
import { SeededRandom } from '../target/temple-run/web/src/game/obstacles/rng';
import { existsSync } from 'node:fs';
import { surfaceAt } from '../target/temple-run/web/src/game/surface';
import { sidePathAt, branchSurfaceOffsets } from '../target/temple-run/web/src/game/sidePath';
import { TrackGraph } from '../target/temple-run/web/src/game/trackGraph';
import { resolve } from 'node:path';

const issues: string[] = [];
if (surfaceAt(0).kind !== 'stone') issues.push('surface 0 should be stone');
if (surfaceAt(168).kind !== 'stone') issues.push('opening causeway must still be stone at 168m');
if (surfaceAt(T(564)).kind !== 'wood') issues.push('first bridge should begin at estimated 564m');
if (surfaceAt(T(976)).kind !== 'stone') issues.push('first bridge should end at estimated legacy976');
if (surfaceAt(T(1908)).kind !== 'wood') issues.push('second bridge should begin at estimated 1908m');
if (surfaceAt(T(2172)).kind !== 'stone') issues.push('second bridge should end at estimated 2172m');
for (const distance of [-36, -12, 0, 6]) {
  const surface = surfaceAt(distance);
  if (surface.kind !== 'stone' || surface.first || surface.last) issues.push(`entrance ${distance} has a spurious surface threshold`);
}
for (const boundary of [564,976,1908,2172].map(T)) {
  if (!surfaceAt(boundary).first || !surfaceAt(boundary-12).last || surfaceAt(boundary+12).first) issues.push(`surface threshold flags wrong at ${boundary}`);
  if (surfaceAt(boundary).from !== boundary) issues.push(`surface uses local rather than global boundary at ${boundary}`);
}
if (surfaceAt(3000).kind !== 'stone') issues.push('unobserved tail must not invent another short wooden cycle');
const graph = new TrackGraph();
const graphFork = graph.fork(30);
const leftPoint = graph.choose(graphFork, 'left').at(35);
const rightPoint = graph.choose(graphFork, 'right').at(35);
if (leftPoint.x === rightPoint.x && leftPoint.z === rightPoint.z) issues.push('TrackGraph fork produced identical branches');
const lateralFork = graph.forkLateral(40, 2.0);
const lateralLeft = graph.choose(lateralFork, 'left').at(52);
const lateralRight = graph.choose(lateralFork, 'right').at(52);
if (Math.hypot(lateralLeft.x - lateralRight.x, lateralLeft.z - lateralRight.z) < 3.5) issues.push('lateral fork separation too small');
const base = graph.active.clone();
base.lateral = 0;
graph.merge(base);
if (graph.active.lateral !== 0) issues.push('merge did not restore centerline');
const bothBranches = branchSurfaceOffsets(0);
if (bothBranches[0] !== -1.9 || bothBranches[1] !== 1.9) issues.push('both branch surfaces not exposed');
const remapFork = graph.forkLateral(40, 2.0, 64);
if (graph.remapAfterMerge(remapFork, 70) !== 70) issues.push('branch->base merge distance remap failed');
if (!existsSync('target/temple-run/web/public/assets/audio/branchChime.wav')) issues.push('branchChime audio missing');
const activeLeft = branchSurfaceOffsets(-1.9);
if (activeLeft[0] !== 0 || Math.abs(activeLeft[1] - 3.8) > 0.01) issues.push('inactive branch surface offset wrong');
const fork = sidePathAt(180);
if (!fork || fork.safe.join(',') !== '0,2') issues.push('side path at 180 should expose lanes 0 and 2');
const assets = Object.keys(ASSET_DEFS);
if (assets.length !== 29) issues.push(`expected 29 OBJ mappings, got ${assets.length}`);
if (PLAYABLE_DEFS.some(d=>d.kind==='gapLong'||d.id==='fireWall')) issues.push('standalone long-hole caps and invented fireWall cannot enter the native obstacle pool');
const assetRoot = resolve('target/temple-run/web/public/assets/obstacles');
for (const asset of assets) {
  if (!existsSync(resolve(assetRoot, `${asset}.obj`))) issues.push(`missing OBJ: ${asset}`);
}

for (let seed = 1; seed <= 10000; seed++) {
  const rng = new SeededRandom(seed);
  const normal = pickObstacle({ nearTurn: false, narrow: null }, rng);
  if (!normal) {
    issues.push(`seed ${seed}: no normal obstacle`);
    continue;
  }
  if (normal.gap < ORIGINAL_SPAWNER_CONFIG.minGap) issues.push(`seed ${seed}: gap ${normal.gap} < 72`);
  if (normal.gap > ORIGINAL_SPAWNER_CONFIG.minGap + ORIGINAL_SPAWNER_CONFIG.gapJitter) issues.push(`seed ${seed}: gap ${normal.gap} too large`);
  if (normal.def.action === 'dodge' && normal.def.lanes === 'one' && (normal.lane < 0 || normal.lane > 2)) issues.push(`seed ${seed}: bad lane`);

  const narrowRng = new SeededRandom(seed ^ 0x9e3779b9);
  const narrow = pickObstacle({ nearTurn: false, narrow: { safe: [0, 1] } }, narrowRng);
  if (narrow && narrow.def.action !== 'jump' && narrow.def.action !== 'slide') {
    issues.push(`seed ${seed}: narrow picked ${narrow.def.action}`);
  }
  if (narrow && !([0, 1].includes(narrow.lane))) issues.push(`seed ${seed}: narrow lane ${narrow.lane}`);
}

const ids = new Set(Object.values(DEFS).map((d) => d.id));
for (const [asset, mapping] of Object.entries(ASSET_DEFS)) {
  if (!ids.has(mapping.defId)) issues.push(`${asset}: missing def ${mapping.defId}`);
}
for (const def of Object.values(DEFS)) {
  for (const prefab of def.prefabs) {
    if (!existsSync(resolve(assetRoot, `${prefab}.obj`))) issues.push(`${def.id}: missing prefab ${prefab}`);
  }
}

if (issues.length) {
  console.error(issues.slice(0, 20).join('\n'));
  console.error(`${issues.length} issues`);
  process.exit(1);
}
console.log('M1/M3 OK: 29 OBJ files present, all variants mapped, native standalone obstacle pool, 10000 seeds');
