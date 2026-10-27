import { TrackPath } from './path';

export type BranchSide = 'left' | 'right';

export interface TrackGraphFork {
  at: number;
  left: TrackPath;
  right: TrackPath;
  chosen: BranchSide | null;
}

/**
 * Four-way path graph foundation. A fork owns two independent TrackPath branches;
 * the game chooses one, then continues on that branch. This is the seam where the
 * old single-polyline model is replaced without rewriting every caller at once.
 */
export class TrackGraph {
  active: TrackPath;
  readonly forks: TrackGraphFork[] = [];

  constructor(active = new TrackPath()) {
    this.active = active;
  }

  fork(at: number): TrackGraphFork {
    const left = this.active.clone();
    const right = this.active.clone();
    left.turn(at, -1);
    right.turn(at, 1);
    const fork = { at, left, right, chosen: null };
    this.forks.push(fork);
    return fork;
  }

  choose(fork: TrackGraphFork, side: BranchSide): TrackPath {
    fork.chosen = side;
    this.active = side === 'left' ? fork.left : fork.right;
    return this.active;
  }

  /** Merge back to a branch at the fork distance; caller supplies the destination. */
  merge(destination: TrackPath): void {
    this.active = destination;
  }
}
