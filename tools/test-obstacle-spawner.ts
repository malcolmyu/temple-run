import { ASSET_DEFS, DEFS, PLAYABLE_DEFS } from '../target/temple-run/web/src/game/obstacles/catalog';
import { ORIGINAL_SPAWNER_CONFIG, pickObstacle } from '../target/temple-run/web/src/game/obstacles/spawner';
import { SeededRandom } from '../target/temple-run/web/src/game/obstacles/rng';

const issues: string[] = [];
const assets = Object.keys(ASSET_DEFS);
if (assets.length !== 23) issues.push(`expected 23 OBJ mappings, got ${assets.length}`);
if (PLAYABLE_DEFS.length !== 8) issues.push(`expected 8 playable definitions, got ${PLAYABLE_DEFS.length}`);

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

if (issues.length) {
  console.error(issues.slice(0, 20).join('\n'));
  console.error(`${issues.length} issues`);
  process.exit(1);
}
console.log('spawner OK: 10000 seeds, 23 OBJ mappings, 8 playable defs');
