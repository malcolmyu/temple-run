/** Tunables shared by the systems. Values match the original web build. */
export const TILE = 12;
export const TILE_COUNT = 14;
export const LANES = [-1.3, 0, 1.3] as const;
export const PLAYER_Z = 3;
export const TURN_ARC = 3.6;
export const RUN_SPEED = 16;
export const RUN_SPEED_MIN = 12;
export const RUN_SPEED_MAX = 20;
export const SPEED_GROWTH = 0.012;
export const JUMP_VELOCITY = 8.8;
export const GRAVITY = 24;
export const TURN_CUE_DISTANCE = 48;
export const TURN_PREBUILD_DISTANCE = 72;
export const CHASE_GAP_MAX = 11.5;
export const COIN_Y = 1.3;

/** Horizontal offset for a lane index (0..2). */
export const laneX = (lane: number): number => LANES[Math.max(0, Math.min(2, lane))];

/** Main Camera / level0 / pathID3873 in the reference APK. */
export const CAMERA_FOV = 50;

/** Main Camera3873 clip planes converted from raw Unity units at world scale.2. */
export const NATIVE_CAMERA_NEAR=1;
export const NATIVE_CAMERA_FAR=100;
