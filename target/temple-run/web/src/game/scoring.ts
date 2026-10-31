// BV1ypuKzPErT's result screen explicitly shows a 20x score multiplier.
// Coin-meter and objective bonuses still need separate reference calibration.
export const REFERENCE_SCORE_MULTIPLIER = 20;

export function distanceScoreDelta(previous: number, current: number): number {
  if (!Number.isFinite(previous) || !Number.isFinite(current)) return 0;
  return Math.max(0, Math.floor(current) - Math.floor(Math.max(0, previous))) * REFERENCE_SCORE_MULTIPLIER;
}
