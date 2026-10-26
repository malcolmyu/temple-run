import type { ObstacleDef } from './types';

export interface RunnerCollisionState {
  prevDistance: number;
  distance: number;
  laneIndex: number;
  jumpY: number;
  jumpV: number;
  slideRemaining: number;
  lastJumpAt: number;
  lastSlideAt: number;
  now: number;
}

export interface ObstacleCollisionState {
  def: ObstacleDef;
  lane: number;
  distance: number;
}

/** Original Obstacle uses a 2D region; lane is the web equivalent of that region. */
export function laneIsBlocked(def: ObstacleDef, obstacleLane: number, runnerLane: number): boolean {
  if (def.lanes === 'all') return true;
  if (def.lanes === 'one') return runnerLane === obstacleLane;
  return def.lanes.includes(runnerLane);
}

/** Swept z interval: prev..current must overlap the obstacle's local z interval. */
export function crossedObstacle(obstacle: ObstacleCollisionState, prev: number, current: number, padding = 0.25): boolean {
  const start = obstacle.distance + obstacle.def.hitbox.z[0] - padding;
  const end = obstacle.distance + obstacle.def.hitbox.z[1] + padding;
  if (current < prev) return current <= end && prev >= start;
  return current >= start && prev <= end;
}

export function actionEscapes(def: ObstacleDef, state: RunnerCollisionState): boolean {
  const top = def.hitbox.y[1];
  switch (def.action) {
    case 'jump':
      // Gaps need any positive clearance; roots need the feet above the root top.
      return top <= 0.1
        ? state.jumpY > 0.1 || state.jumpV > 0 || state.now - state.lastJumpAt < 1.0
        : state.jumpY > top - 0.04 || state.now - state.lastJumpAt < 1.0;
    case 'slide':
      return state.slideRemaining > 0.02 || state.now - state.lastSlideAt < 0.75;
    case 'dodge':
      return false; // a blocked lane is a hit; free lanes are filtered by the caller
    case 'run':
      return true;
  }
}

export function collisionWouldHit(
  obstacle: ObstacleCollisionState,
  state: RunnerCollisionState,
): boolean {
  if (!crossedObstacle(obstacle, state.prevDistance, state.distance)) return false;
  if (!laneIsBlocked(obstacle.def, obstacle.lane, state.laneIndex)) return false;
  if (obstacle.def.action === 'dodge' || obstacle.def.action === 'run') return true;
  return !actionEscapes(obstacle.def, state);
}
