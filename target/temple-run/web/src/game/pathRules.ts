/**
 * Map-generation constants recovered from Temple Run 1.39 IL2CPP metadata.
 *
 * `PathElement` builds a 60-unit grid graph (one web tile = 12 m), and its static
 * constructor sets:
 *   sMinSpaceBetweenTurns        = 6
 *   sMaxBackToBackObstacles      = 2
 *   sMinSpaceBetweenObstacles    = 6
 *   sDoubleObstaclePercent       = 0
 *   sMinSpacesBetweenCoinRuns    = 6
 *   sMaxCoinsPerRun              = 5
 *   sMinSpacesBetweenBonusItems  = 50
 * A "space" is one path element / grid tile, so six spaces = 72 m in the web build.
 */
export const PATH_GRID_METERS = 12;
export const MIN_TURN_SPACING = 6 * PATH_GRID_METERS; // 72 m
export const MIN_OBSTACLE_SPACING = 6 * PATH_GRID_METERS; // 72 m
export const MAX_BACK_TO_BACK_OBSTACLES = 2;
export const MIN_COIN_RUN_SPACING = 6 * PATH_GRID_METERS; // 72 m
export const MAX_COINS_PER_RUN = 5;
export const DOUBLE_OBSTACLE_CHANCE = 0; // original default; no paired blockers
export const MIN_BONUS_ITEM_SPACING = 50 * PATH_GRID_METERS; // 600 m
