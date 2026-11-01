import assert from 'node:assert/strict';
import { FIRST_TURN_DISTANCE } from '../target/temple-run/web/src/game/pacing';
import { nativeForwardAcceleration,nativeJumpVelocity } from '../target/temple-run/web/src/game/nativeMotion';
import { nativeProgressDelta } from '../target/temple-run/web/src/game/nativeProgress';
import { referenceWorldDistance } from '../target/temple-run/web/src/game/referenceCoordinates';
assert.equal(FIRST_TURN_DISTANCE,153);
let physical=0,metric=0,speed=20;
for(let i=0;i<600;i++){
 const dt=1/120;speed+=nativeForwardAcceleration(speed)*dt;
 physical+=speed*dt;metric+=nativeProgressDelta(0,speed*dt,dt);
}
assert.ok(physical<FIRST_TURN_DISTANCE-20,'first corner is still ahead at5s in no-input baseline');
assert.ok(physical>metric*1.7,'physical travel and score progress must not share a distance field');
assert.ok(nativeJumpVelocity(20)*2/50*20>12,'native jump can span a complete physical hole tile');
assert.ok(referenceWorldDistance(564)>1300,'first bridge boundary must be physical, not old score564');
console.log('Native opening uses distinct physical/progress units, physical corner153, hole-spanning jump and converted bridge boundary.');

import calibration from '../target/temple-run/web/src/game/referenceWorldCalibration.json';
const anchor=calibration.initialAnchor;
assert.equal(anchor.spawnProgress,5,'initial100 points are reset-position metric, not road traversal');
assert.ok(anchor.activeSeconds>.29&&anchor.activeSeconds<.31);
assert.ok(referenceWorldDistance(7)>3&&referenceWorldDistance(7)<5,'first moving anchor uses active fraction and excludes spawn score');
assert.ok(anchor.physicalPositionBounds[0]<referenceWorldDistance(7)&&anchor.physicalPositionBounds[1]>referenceWorldDistance(7));
