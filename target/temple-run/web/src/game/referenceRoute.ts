import { referenceJunctionDistance } from './referenceCoordinates';

/** BV1ypuKzPErT's observed opening, not recovered Unity random-generation code.
 * Coordinates were fitted from score/20 before native progress was recovered.
 * Coordinates are now converted through the sampled physical calibration and snapped to the12m grid.
 * These remain estimates, not exact recovered scene positions.
 * Keep the unreviewed suffix unspecified rather than inventing a recorded route.
 */
export const REFERENCE_OPENING_TURNS: ReadonlyArray<{
  legacyDistance: number; distance: number; direction: 1 | -1; frames: readonly number[]; gate: 'exit' | 'forward' | null; junction: 'corner' | 'tee';
}> = ([
  { distance: 81, direction: 1, frames: [8, 9, 10], gate: 'exit', junction: 'corner' },
  { distance: 153, direction: 1, frames: [16, 17, 18], gate: 'forward', junction: 'corner' },
  { distance: 225, direction: -1, frames: [24,25,26], gate: null, junction: 'tee' },
  // 032: 280m approaching the tree; 034: 295m after the left turn.
  { distance: 285, direction: -1, frames: [32,33,34], gate: null, junction: 'tee' },
  // 044: 374m before the corner; 045: 383m on the outgoing arm.
  { distance: 381, direction: -1, frames: [43,44,45], gate: null, junction: 'corner' },
  // Subsecond 00:50.3 confirms right; distance remains a grid estimate.
  { distance: 441, direction: 1, frames: [51,52,53], gate: null, junction: 'tee' },
  // Subsecond 00:57.6 confirms right, followed immediately by a tall gate.
  { distance: 501, direction: 1, frames: [58,59,60], gate: 'exit', junction: 'tee' },
  // First wooden T: 01:13.2 intermediate frame confirms right.
  { distance: 621, direction: 1, frames: [74,75,76], gate: null, junction: 'tee' },
  { distance: 669, direction: 1, frames: [79,80,81], gate: null, junction: 'corner' },
  { distance: 837, direction: -1, frames: [96,97,98], gate: null, junction: 'corner' },
  { distance: 957, direction: -1, frames: [108,109,110], gate: null, junction: 'corner' },
  { distance: 1055, direction: -1, frames: [120,121], gate: 'forward', junction: 'tee' },
  { distance: 1081, direction: 1, frames: [123,124], gate: null, junction: 'corner' },
  { distance: 1103, direction: 1, frames: [125,126], gate: 'exit', junction: 'corner' },
  { distance: 1127, direction: 1, frames: [128,129], gate: null, junction: 'corner' },
  { distance: 1147, direction: -1, frames: [130,131], gate: null, junction: 'corner' },
  { distance: 1165, direction: 1, frames: [132,133], gate: null, junction: 'corner' },
  { distance: 1187, direction: 1, frames: [135,136], gate: null, junction: 'corner' },
  { distance: 1207, direction: 1, frames: [137,138], gate: null, junction: 'corner' },
  { distance: 1231, direction: 1, frames: [140,141], gate: null, junction: 'corner' },
  { distance: 1253, direction: -1, frames: [142,143], gate: null, junction: 'corner' },
  { distance: 1357, direction: -1, frames: [150,151,152], gate: null, junction: 'corner' },
  { distance: 1393, direction: 1, frames: [154,155,156], gate: null, junction: 'tee' },
  { distance: 1545, direction: 1, frames: [170,171,172], gate: null, junction: 'tee' },
  { distance: 1585, direction: 1, frames: [175,176,177], gate: null, junction: 'corner' },
  { distance: 1683, direction: 1, frames: [184,185,186], gate: null, junction: 'corner' },
  { distance: 1711, direction: 1, frames: [188,189,190], gate: null, junction: 'corner' },
  { distance: 1747, direction: 1, frames: [193,194], gate: null, junction: 'corner' },
  { distance: 1791, direction: 1, frames: [198,199,200], gate: null, junction: 'corner' },
  { distance: 1829, direction: 1, frames: [203,204,205], gate: null, junction: 'corner' },
  { distance: 1861, direction: 1, frames: [206,207,208], gate: null, junction: 'corner' },
  { distance: 1963, direction: 1, frames: [218,219,220], gate: null, junction: 'tee' },
  { distance: 2067, direction: -1, frames: [229,230,231], gate: null, junction: 'corner' },
  { distance: 2099, direction: 1, frames: [232,233,234], gate: null, junction: 'corner' },
  { distance: 2133, direction: 1, frames: [236,237,238], gate: null, junction: 'corner' },
  { distance: 2189, direction: 1, frames: [242,243,244], gate: null, junction: 'corner' },
  { distance: 2203, direction: 1, frames: [244,245], gate: null, junction: 'tee' },
  { distance: 2217, direction: -1, frames: [245,246,247], gate: null, junction: 'tee' },
  { distance: 2233, direction: 1, frames: [247,248,249], gate: null, junction: 'corner' },
  { distance: 2247, direction: 1, frames: [249,250], gate: null, junction: 'corner' },
  { distance: 2271, direction: 1, frames: [252,253], gate: null, junction: 'corner' },
  { distance: 2341, direction: 1, frames: [259,260,261], gate: null, junction: 'corner' },
] as const).map(turn=>({...turn,legacyDistance:turn.distance,distance:referenceJunctionDistance(turn.distance)}));

export function referenceTurnDirection(index: number, distance: number): 1 | -1 | null {
  const turn=REFERENCE_OPENING_TURNS[index];
  return turn && Math.abs(turn.distance-distance)<.001 ? turn.direction : null;
}

export function referenceNextTurnDistance(completedCount: number, previousDistance: number): number | null {
  const previous=REFERENCE_OPENING_TURNS[completedCount-1];
  const next=REFERENCE_OPENING_TURNS[completedCount];
  return previous && next && Math.abs(previous.distance-previousDistance)<.001 ? next.distance : null;
}

export function referenceGate(index: number, distance: number): 'exit' | 'forward' | null {
  return referenceTurnDirection(index,distance)===null ? null : REFERENCE_OPENING_TURNS[index].gate;
}

export function referenceJunction(index: number, distance: number): 'corner' | 'tee' {
  return referenceTurnDirection(index,distance)===null ? 'corner' : REFERENCE_OPENING_TURNS[index].junction;
}
