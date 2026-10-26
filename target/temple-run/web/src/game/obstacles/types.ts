export type ObstacleAction = 'jump' | 'slide' | 'dodge' | 'run';
export type LaneMask = 'all' | 'one' | readonly number[];
export type ObstaclePlacement = 'straight' | 'narrow' | 'scenery';

export interface Hitbox {
  x: readonly [number, number];
  y: readonly [number, number];
  z: readonly [number, number];
}

export interface ObstacleDef {
  id: string;
  /** Legacy kind used by HUD/save/debug; new code switches on action. */
  kind: string;
  action: ObstacleAction;
  lanes: LaneMask;
  hitbox: Hitbox;
  kill: boolean;
  /** APK OBJ prefabs; first is the preferred straight variant. */
  prefabs: readonly string[];
  placement: ObstaclePlacement;
  weight: number;
  note: string;
}

export interface ObstaclePlan {
  def: ObstacleDef;
  lane: number;
  distance: number;
  gap: number;
}
