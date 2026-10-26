import { DEFS, PLAYABLE_DEFS } from './catalog';
import type { ObstacleDef, ObstaclePlan } from './types';
import { SeededRandom } from './rng';

export interface SpawnContext {
  /** True within the protected turn approach/exit. */
  nearTurn: boolean;
  /** Narrow section data; only jump/slide are allowed here. */
  narrow: { safe: readonly number[] } | null;
  /** Left/right fork: both outer lanes are safe. */
  sidePath?: { safe: readonly number[] } | null;
}

export interface SpawnerConfig {
  minGap: number;
  gapJitter: number;
  /** Original sMaxBackToBackObstacles. */
  maxBackToBack: number;
  doubleChance: number;
}

export const ORIGINAL_SPAWNER_CONFIG: SpawnerConfig = {
  minGap: 72,
  gapJitter: 24,
  maxBackToBack: 2,
  doubleChance: 0,
};

/** Pick one legal obstacle group. No obstacle is allowed in a protected turn. */
export function pickObstacle(ctx: SpawnContext, rng: SeededRandom, config: SpawnerConfig = ORIGINAL_SPAWNER_CONFIG): ObstaclePlan | null {
  if (ctx.nearTurn) return null;
  const candidates = ctx.narrow
    ? PLAYABLE_DEFS.filter((d) => d.placement === 'straight' && (d.action === 'jump' || d.action === 'slide') && d.id !== 'fireWall')
    : ctx.sidePath
      ? PLAYABLE_DEFS.filter((d) => d.lanes !== 'one' && d.action !== 'dodge')
      : PLAYABLE_DEFS;
  if (!candidates.length) return null;
  const total = candidates.reduce((sum, def) => sum + def.weight, 0);
  let roll = rng.next() * total;
  let def = candidates[0];
  for (const candidate of candidates) {
    roll -= candidate.weight;
    if (roll <= 0) {
      def = candidate;
      break;
    }
  }
  const lane = def.lanes === 'one'
    ? rng.int(3)
    : ctx.narrow
      ? ctx.narrow.safe[rng.int(ctx.narrow.safe.length)]
      : ctx.sidePath
        ? ctx.sidePath.safe[rng.int(ctx.sidePath.safe.length)]
        : 1;
  const gap = config.minGap + rng.next() * config.gapJitter;
  return { def, lane, distance: 0, gap };
}

export function defForKind(kind: string): ObstacleDef {
  return kind === 'trip'
    ? DEFS.treeTrip
    : kind === 'arch'
      ? DEFS.treeSlide
      : kind === 'gap'
        ? DEFS.pit
        : kind === 'gapLong'
          ? DEFS.pitLongA
          : kind === 'fire'
            ? DEFS.flameTower
            : kind === 'block'
              ? DEFS.stonePedestal
              : DEFS.treeJump;
}
