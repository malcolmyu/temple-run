import { referenceJunctionDistance } from './referenceCoordinates';
/** Physical placement estimated from the recorded progress curve. */
export const FIRST_TURN_DISTANCE = referenceJunctionDistance(81);
export const openingSpeedFactor = (seconds: number): number => Math.max(0, Math.min(1, seconds));
