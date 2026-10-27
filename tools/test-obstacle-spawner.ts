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
if (surfaceAt(168).kind !== 'wood') issues.push('surface 168 should be wood');
if (surfaceAt(312).kind !== 'stone') issues.push('surface 312 should be stone');
if (surfaceAt(456).kind !== 'wood') issues.push('surface 456 should be wood');
const graph = new TrackGraph();
const graphFork = graph.fork(30);
const leftPoint = graph.choose(graphFork, 'left').at(35);
const rightPoint = graph.choose(graphFork, 'right').at(35);
if (leftPoint.x === rightPoint.x && leftPoint.z === rightPoint.z) issues.push('TrackGraph fork produced identical branches');
const lateralFork = graph.forkLateral(40, 2.0);
const lateralLeft = graph.choose(lateralFork, 'left').at(45);
const lateralRight = graph.choose(lateralFork, 'right').at(45);
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
if (assets.length !== 23) issues.push(`expected 23 OBJ mappings, got ${assets.length}`);
if (PLAYABLE_DEFS.length !== 9) issues.push(`expected 9 playable definitions, got ${PLAYABLE_DEFS.length}`);
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
console.log('M1/M3 OK: 23 OBJ files present, all variants mapped, 9 playable defs, 10000 seeds');
