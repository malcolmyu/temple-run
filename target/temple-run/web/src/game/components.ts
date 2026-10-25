import type { Object3D } from 'three';
import { defineComponent } from './ecs/world';

export type ObstacleKind = 'hurdle' | 'arch' | 'gap' | 'fire' | 'block';
export type PickupKind = 'coin' | 'gem' | 'magnet' | 'shield' | 'boost' | 'bonus';
export type Phase = 'menu' | 'playing' | 'paused' | 'dying' | 'ended';

/** Position of an object along the track (and its lane offset). */
export const TrackPos = defineComponent<{ distance: number; side: number; smooth: boolean }>('TrackPos', () => ({
  distance: 0,
  side: 0,
  smooth: false,
}));

/** Which lane the runner is in and where it is between lanes (damped). */
export const Lane = defineComponent<{ index: number; x: number }>('Lane', () => ({ index: 1, x: 0 }));

export const Jump = defineComponent<{ y: number; v: number; airborne: boolean; lastJumpAt: number }>('Jump', () => ({
  y: 0,
  v: 0,
  airborne: false,
  lastJumpAt: -10,
}));

export const Slide = defineComponent<{ remaining: number; lastSlideAt: number }>('Slide', () => ({
  remaining: 0,
  lastSlideAt: -10,
}));

export const Speed = defineComponent<{ value: number }>('Speed', () => ({ value: 0 }));

export const Turn = defineComponent<{
  next: number;
  direction: 0 | 1 | -1;
  queued: boolean;
  cueShown: boolean;
  prebuilt: boolean;
  count: number;
  lastDirection: 0 | 1 | -1;
  lastTurnDistance: number;
  forced: 0 | 1 | -1;
}>('Turn', () => ({
  next: 57,
  direction: 0,
  queued: false,
  cueShown: false,
  prebuilt: false,
  count: 0,
  lastDirection: 0,
  lastTurnDistance: 0,
  forced: 0,
}));

export const Obstacle = defineComponent<{
  kind: ObstacleKind;
  lane: number;
  distance: number;
  full: boolean;
  passed: boolean;
  warned: boolean;
  object: Object3D | null;
}>('Obstacle', () => ({
  kind: 'hurdle',
  lane: 1,
  distance: 0,
  full: true,
  passed: false,
  warned: false,
  object: null,
}));

export const Pickup = defineComponent<{
  kind: PickupKind;
  lane: number;
  distance: number;
  baseY: number;
  taken: boolean;
  object: Object3D | null;
}>('Pickup', () => ({
  kind: 'coin',
  lane: 1,
  distance: 0,
  baseY: 1.3,
  taken: false,
  object: null,
}));

/** One generated track tile (12 m of road + walls + scenery). */
export const Tile = defineComponent<{ index: number; distance: number; object: Object3D | null }>('Tile', () => ({
  index: 0,
  distance: 0,
  object: null,
}));

export const Chase = defineComponent<{ gap: number; cooldown: number; lunge: number }>('Chase', () => ({
  gap: 11.5,
  cooldown: 0,
  lunge: 0,
}));

export const RunStats = defineComponent<{ distance: number; coins: number; gems: number; multiplier: number }>('RunStats', () => ({
  distance: 0,
  coins: 0,
  gems: 0,
  multiplier: 1,
}));

export const Power = defineComponent<{ kind: PickupKind | null; until: number; shield: boolean }>('Power', () => ({
  kind: null,
  until: 0,
  shield: false,
}));

export const Runner = defineComponent<{ rig: unknown }>('Runner', () => ({ rig: null }));
export const Chaser = defineComponent<{ object: Object3D | null }>('Chaser', () => ({ object: null }));

export type Vec3 = [number, number, number];
