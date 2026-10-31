/** The current junction extends six metres before its centre; cues do not accept input. */
export const TURN_INPUT_BEFORE = 6;
export const TURN_INPUT_AFTER = 2;

export function acceptsTurn(direction: number, requested: number, remaining: number, queued: boolean): boolean {
  return !queued && (requested === -1 || requested === 1) && direction === requested
    && Number.isFinite(remaining) && remaining <= TURN_INPUT_BEFORE && remaining >= -TURN_INPUT_AFTER;
}
