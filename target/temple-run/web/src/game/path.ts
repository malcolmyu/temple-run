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
  /** Number of discarded prefix segments; authored turn ordinals stay stable. */
  segmentOffset=0;
  /** Lateral offset of a branch path from the main centerline. */
  lateral = 0;
  branchSpan: {from:number;to:number}|null=null;
  lateralAt(distance:number):number {
    if(!this.branchSpan)return this.lateral;
    const {from,to}=this.branchSpan;
    const edge=Math.min(12,(to-from)/2);
    const t=Math.max(0,Math.min(1,(distance-from)/edge,(to-distance)/edge));
    return this.lateral*t*t*(3-2*t);
  }

  /** Upper-bound search preserves historical segment numbering and duplicate
   * starts. Keep index0 for pre-start/NaN distances,matching the old scan. */
  private indexAt(distance:number):number {
    let lo=1,hi=this.segments.length;
    while(lo<hi){const mid=lo+Math.floor((hi-lo)/2);if(distance>=this.segments[mid].start)lo=mid+1;else hi=mid;}
    return lo-1;
  }

  /** World position and heading at a distance. `smooth` rounds the corner for actors. */
  at(distance: number, side = 0, smooth = false): PathPoint {
    const index=this.indexAt(distance);
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
          x: px + (bx - px) * k + Math.cos(heading) * (this.lateralAt(distance) + side),
          z: pz + (bz - pz) * k - Math.sin(heading) * (this.lateralAt(distance) + side),
          heading,
        };
      }
    }
    return {
      x: bx + Math.cos(segment.heading) * (this.lateralAt(distance) + side),
      z: bz - Math.sin(segment.heading) * (this.lateralAt(distance) + side),
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

  /** Deep copy; used by TrackGraph branches so a fork can own its own segments. */
  clone(): TrackPath {
    const copy = new TrackPath();
    copy.segmentOffset=this.segmentOffset;
    copy.lateral = this.lateral;
    copy.branchSpan=this.branchSpan?{...this.branchSpan}:null;
    copy.segments.length = 0;
    for (const segment of this.segments) copy.segments.push({ ...segment });
    return copy;
  }

  /** Keep the segment containing the retained horizon plus its predecessor,
   * so smoothing and junction heading queries retain their incoming geometry.
   * Positions before this horizon are intentionally no longer historical queries. */
  compactBefore(distance:number):void {
    if(!Number.isFinite(distance))return;
    const remove=Math.max(0,this.indexAt(distance)-1);
    if(remove){this.segments.splice(0,remove);this.segmentOffset+=remove;}
  }

  /** Segment that contains a distance (used by scenery systems). */
  segmentAt(distance: number): PathSegment {
    return this.segments[this.indexAt(distance)];
  }

  /** True when a distance is within `margin` metres of any corner. */
  nearTurn(distance: number, margin = 22): boolean {
    const index=this.indexAt(distance);
    return (index>0&&Math.abs(distance-this.segments[index].start)<margin)
      || (index+1<this.segments.length&&Math.abs(distance-this.segments[index+1].start)<margin);
  }
}
