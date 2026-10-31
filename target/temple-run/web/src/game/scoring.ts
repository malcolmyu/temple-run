// BV1ypuKzPErT's result screen explicitly shows a 20x score multiplier.
// Kept for explicit reference replay and the existing challenge distance rule.
// Default classic takes its multiplier from nativeScoreMultiplier at run start.
export const REFERENCE_SCORE_MULTIPLIER = 20;

export function distanceScoreDelta(previous: number, current: number): number {
  if (!Number.isFinite(previous) || !Number.isFinite(current)) return 0;
  return Math.max(0, Math.floor(current) - Math.floor(Math.max(0, previous))) * REFERENCE_SCORE_MULTIPLIER;
}

/** RecordManager.GetScoreMulitplier 0x128b788: completed achievements +10. */
export function nativeScoreMultiplier(completed: number): number {
  return 10 + (Number.isFinite(completed) ? Math.max(0, Math.trunc(completed)) : 0);
}
