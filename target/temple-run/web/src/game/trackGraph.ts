import { TrackPath } from './path';

export type BranchSide = 'left' | 'right';

export interface GraphNode { id: number; at: number; edges: GraphEdge[] }
export interface GraphEdge { side: BranchSide; path: TrackPath; mergeAt: number }

export interface TrackGraphFork {
  at: number;
  left: TrackPath;
  right: TrackPath;
  chosen: BranchSide | null;
  mergeAt: number;
  node: GraphNode;
  edges: GraphEdge[];
}

/**
 * Four-way path graph foundation. A fork owns two independent TrackPath branches;
 * the game chooses one, then continues on that branch. This is the seam where the
 * old single-polyline model is replaced without rewriting every caller at once.
 */
export class TrackGraph {
  active: TrackPath;
  readonly forks: TrackGraphFork[] = [];
  readonly nodes: GraphNode[] = [];
  private nextNodeId = 1;

  constructor(active = new TrackPath()) {
    this.active = active;
  }

  reset(active = new TrackPath()): void {
    this.active=active;
    this.forks.length=0;
    this.nodes.length=0;
    this.nextNodeId=1;
  }

  fork(at: number): TrackGraphFork {
    const left = this.active.clone();
    const right = this.active.clone();
    left.turn(at, -1);
    right.turn(at, 1);
    const node: GraphNode = { id: this.nextNodeId++, at, edges: [] };
    const edges: GraphEdge[] = [
      { side: 'left', path: left, mergeAt: at },
      { side: 'right', path: right, mergeAt: at },
    ];
    node.edges.push(...edges);
    this.nodes.push(node);
    const fork = { at, left, right, chosen: null, mergeAt: at, node, edges };
    this.forks.push(fork);
    return fork;
  }

  /** Parallel left/right branches at the same distance; used by a T side-road fork. */
  forkLateral(at: number, separation: number, mergeAt = at + 24): TrackGraphFork {
    const left = this.active.clone();
    const right = this.active.clone();
    left.lateral = -separation;
    right.lateral = separation;
    const node: GraphNode = { id: this.nextNodeId++, at, edges: [] };
    const edges: GraphEdge[] = [
      { side: 'left', path: left, mergeAt },
      { side: 'right', path: right, mergeAt },
    ];
    node.edges.push(...edges);
    this.nodes.push(node);
    const fork = { at, left, right, chosen: null, mergeAt, node, edges };
    this.forks.push(fork);
    return fork;
  }

  /** Explicit branch->base distance remap at a merge node (branch length is same today). */
  remapAfterMerge(fork: TrackGraphFork, branchDistance: number): number {
    if (branchDistance <= fork.mergeAt) return branchDistance;
    return fork.mergeAt + (branchDistance - fork.mergeAt);
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
