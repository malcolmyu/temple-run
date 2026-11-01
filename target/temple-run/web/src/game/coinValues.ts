import { referenceWorldDistance } from './referenceCoordinates';
export type CoinValue = 1 | 2 | 3;

/** Explicit reference replay/challenge adapter only; classic uses nativeCoinValues.
 * Video 160 (score 28740) is yellow; video 175 (31540) mixes yellow/red.
 * ~1500m is an estimate for this recording. Upgrade-specific remote thresholds
 * and triple-coin activation have not been recovered.
 */
export function referenceCoinValue(distance: number): CoinValue {
  if (distance < referenceWorldDistance(1500)) return 1;
  return Math.floor(distance / 2) % 4 < 2 ? 1 : 2;
}
