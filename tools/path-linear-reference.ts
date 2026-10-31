// Pre-optimization path evaluator retained solely for differential regression.
import {TURN_ARC} from '../target/temple-run/web/src/game/config';
import {normAngle,type TrackPath,type PathPoint} from '../target/temple-run/web/src/game/path';
export function linearPathPoint(path:TrackPath,distance:number,side=0,smooth=false):PathPoint {
    let index = 0;
    for (let i = 1; i < path.segments.length; i++) {
      if (distance >= path.segments[i].start) index = i;
      else break;
    }
    const segment = path.segments[index];
    const travel = distance - segment.start;
    const bx = segment.x - Math.sin(segment.heading) * travel;
    const bz = segment.z - Math.cos(segment.heading) * travel;
    if (smooth && index > 0) {
      const start = segment.start;
      const e = Math.min(1, Math.max(0, (distance - (start - TURN_ARC * 0.5)) / TURN_ARC));
      if (e < 1) {
        const prev = path.segments[index - 1];
        const pt = distance - prev.start;
        const px = prev.x - Math.sin(prev.heading) * pt;
        const pz = prev.z - Math.cos(prev.heading) * pt;
        const k = e * e * (3 - 2 * e);
        const heading = prev.heading + normAngle(segment.heading - prev.heading) * k;
        return {
          x: px + (bx - px) * k + Math.cos(heading) * (path.lateralAt(distance) + side),
          z: pz + (bz - pz) * k - Math.sin(heading) * (path.lateralAt(distance) + side),
          heading,
        };
      }
    }
    return {
      x: bx + Math.cos(segment.heading) * (path.lateralAt(distance) + side),
      z: bz - Math.sin(segment.heading) * (path.lateralAt(distance) + side),
      heading: segment.heading,
    };
  }

