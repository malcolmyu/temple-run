import { PLAYER_Z, TURN_ARC } from './config';

export interface PathPoint {
  x: number;
  z: number;
  heading: number;
}

export interface PathSegment {
  start: number;
  end: number;
  x: number;
  z: number;
  heading: number;
}

export const normAngle = (a: number): number => ((a + Math.PI) % (Math.PI * 2) + Math.PI * 2) % (Math.PI * 2) - Math.PI;

/**
 * The track is a list of straight segments joined by 90° corners. Distance is measured along
 * the path in metres; a segment stores its world origin (where it begins) and its heading.
 */
export class TrackPath {
  readonly segments: PathSegment[] = [{ start: 0, end: Infinity, x: 0, z: PLAYER_Z, heading: 0 }];

  /** World position and heading at a distance. `smooth` rounds the corner for actors. */
  at(distance: number, side = 0, smooth = false): PathPoint {
    let index = 0;
    for (let i = 1; i < this.segments.length; i++) {
      if (distance >= this.segments[i].start) index = i;
      else break;
    }
    const segment = this.segments[index];
    const travel = distance - segment.start;
    const bx = segment.x - Math.sin(segment.heading) * travel;
    const bz = segment.z - Math.cos(segment.heading) * travel;
    if (smooth && index > 0) {
      const start = segment.start;
      const e = Math.min(1, Math.max(0, (distance - (start - TURN_ARC * 0.5)) / TURN_ARC));
      if (e < 1) {
        const prev = this.segments[index - 1];
        const pt = distance - prev.start;
        const px = prev.x - Math.sin(prev.heading) * pt;
        const pz = prev.z - Math.cos(prev.heading) * pt;
        const k = e * e * (3 - 2 * e);
        const heading = prev.heading + normAngle(segment.heading - prev.heading) * k;
        return {
          x: px + (bx - px) * k + Math.cos(heading) * side,
          z: pz + (bz - pz) * k - Math.sin(heading) * side,
          heading,
        };
      }
    }
    return {
      x: bx + Math.cos(segment.heading) * side,
      z: bz - Math.sin(segment.heading) * side,
      heading: segment.heading,
    };
  }

  /** Append a 90° corner at `at`. Returns the new segment (spawners attach content to it). */
  turn(at: number, direction: 1 | -1): PathSegment {
    const last = this.segments[this.segments.length - 1];
    last.end = at;
    const point = this.at(at);
    const segment: PathSegment = {
      start: at,
      end: Infinity,
      x: point.x,
      z: point.z,
      heading: last.heading - direction * Math.PI / 2,
    };
    this.segments.push(segment);
    return segment;
  }

  /** Segment that contains a distance (used by scenery systems). */
  segmentAt(distance: number): PathSegment {
    for (let i = this.segments.length - 1; i >= 0; i--) {
      if (distance >= this.segments[i].start) return this.segments[i];
    }
    return this.segments[0];
  }

  /** True when a distance is within `margin` metres of any corner. */
  nearTurn(distance: number, margin = 22): boolean {
    return this.segments.some((segment, index) => index > 0 && Math.abs(distance - segment.start) < margin);
  }
}
