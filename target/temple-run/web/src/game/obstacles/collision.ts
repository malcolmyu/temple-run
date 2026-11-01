import { laneX } from '../config';
import type { ObstacleDef } from './types';

export interface RunnerCollisionState {
  prevDistance: number;
  distance: number;
  laneIndex: number;
  /** Actual lateral position. Optional for legacy callers that only provide lanes. */
  side?: number;
  prevSide?:number;
  jumpY: number;
  jumpV: number;
  slideRemaining: number;
  lastJumpAt: number;
  lastSlideAt: number;
  now: number;
  jumpWindow: number;
  slideWindow: number;
}

export interface ObstacleCollisionState {
  def: ObstacleDef;
  lane: number;
  distance: number;
}

/** Region2D point support, including its boundary; no invented character-radius inset. */
export function insideGroundSupport(points:readonly (readonly [number,number])[],x:number,z:number):boolean {
  let inside=false;
  for(let i=0,j=points.length-1;i<points.length;j=i++) {
    const [ax,az]=points[j], [bx,bz]=points[i];
    const cross=(x-ax)*(bz-az)-(z-az)*(bx-ax);
    if(Math.abs(cross)<1e-7&&x>=Math.min(ax,bx)-1e-7&&x<=Math.max(ax,bx)+1e-7&&z>=Math.min(az,bz)-1e-7&&z<=Math.max(az,bz)+1e-7)return true;
    if((az>z)!==(bz>z)&&x<(bx-ax)*(z-az)/(bz-az)+ax)inside=!inside;
  }
  return inside;
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
  const jumped=def.strictActionTiming?state.jumpY>=top:state.jumpY>top-.04||state.now-state.lastJumpAt<state.jumpWindow;
  const slid=def.strictActionTiming?state.slideRemaining>0:state.slideRemaining>.02||state.now-state.lastSlideAt<state.slideWindow;
  if(def.alternateAction==='jump'&&jumped)return true;
  if(def.alternateAction==='slide'&&slid)return true;
  switch (def.action) {
    case 'jump':
      // Gaps need any positive clearance; roots need the feet above the root top.
      return top <= 0.1
        ? state.jumpY > 0 || state.jumpV > 0
        : jumped;
    case 'slide':
      return slid;
    case 'dodge':
      return false; // a blocked lane is a hit; free lanes are filtered by the caller
    case 'run':
      return true;
  }
}

function nativeSegmentHits(obstacle:ObstacleCollisionState,state:RunnerCollisionState):boolean {
  const side=state.side??laneX(state.laneIndex);
  const start=[state.prevSide??side,state.prevDistance-obstacle.distance],end=[side,state.distance-obstacle.distance];
  const bounds=[obstacle.def.hitbox.x,obstacle.def.hitbox.z];let enter=0,exit=1;
  for(let i=0;i<2;i++){
    const delta=end[i]-start[i],[min,max]=bounds[i];
    if(Math.abs(delta)<1e-10){if(start[i]<min||start[i]>max)return false;continue;}
    const a=(min-start[i])/delta,b=(max-start[i])/delta;
    enter=Math.max(enter,Math.min(a,b));exit=Math.min(exit,Math.max(a,b));
    if(enter>exit)return false;
  }
  return true;
}

export function collisionWouldHit(
  obstacle: ObstacleCollisionState,
  state: RunnerCollisionState,
): boolean {
  if(obstacle.def.action==='run')return false;
  const gap=obstacle.def.kind==='gap'||obstacle.def.kind==='gapLong';
  if(gap) {
    // Native holes test current ground support. Landing beyond the far rim is
    // safe even when the prior airborne position was inside the gap.
    const start=obstacle.distance+obstacle.def.hitbox.z[0],end=obstacle.distance+obstacle.def.hitbox.z[1];
    if(obstacle.def.groundSupportRegion ? state.distance<start||state.distance>end : state.distance<=start||state.distance>=end)return false;
  } else if (obstacle.def.nativeRegion ? !nativeSegmentHits(obstacle,state) : !crossedObstacle(obstacle, state.prevDistance, state.distance)) return false;
  if(obstacle.def.groundSupportRegion && insideGroundSupport(obstacle.def.groundSupportRegion,state.side??laneX(state.laneIndex),obstacle.distance-state.distance))return false;
  if (state.side === undefined) {
    if (!laneIsBlocked(obstacle.def, obstacle.lane, state.laneIndex)) return false;
  } else if (obstacle.def.lanes !== 'all') {
    const radius = 0.2;
    const overlaps = (left: number, right: number): boolean => state.side! + radius > left && state.side! - radius < right;
    const blocked = obstacle.def.lanes === 'one'
      ? overlaps(laneX(obstacle.lane) + obstacle.def.hitbox.x[0], laneX(obstacle.lane) + obstacle.def.hitbox.x[1])
      : obstacle.def.lanes.some(lane => overlaps(laneX(lane) - .65, laneX(lane) + .65));
    if (!blocked) return false;
  }
  if (obstacle.def.action === 'dodge') return true;
  return !actionEscapes(obstacle.def, state);
}
