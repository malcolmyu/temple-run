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
  alternateAction?: 'jump' | 'slide';
  strictActionTiming?: boolean;
  lanes: LaneMask;
  hitbox: Hitbox;
  /** Native Region2D swept point rectangle, without invented body padding. */
  nativeRegion?: boolean;
  variantHitboxes?: Readonly<Record<string,Hitbox>>;
  /** Road replaced by an authored obstacle tile; may include safe approach/exit rims. */
  surfaceCut?: readonly [number, number];
  /** Native Region2D polygon in local [X,Z]; grounded feet outside it fall. */
  groundSupportRegion?: readonly (readonly [number,number])[];
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
