import assert from 'node:assert/strict';
import { openingChaseGap } from '../target/temple-run/web/src/game/chasePresentation';
assert.equal(openingChaseGap(0,11.5),3);
assert.equal(openingChaseGap(2,11.5),3);
assert.ok(openingChaseGap(3,11.5)>6);
assert.equal(openingChaseGap(4,11.5),11.5);
assert.equal(openingChaseGap(10,3),3,'stumble must bring pack back');
assert.equal(openingChaseGap(1,.5),.5,'opening must not push an already closer pack away');
let previous=0;
for(let t=0;t<5;t+=.01){const gap=openingChaseGap(t,11.5);assert.ok(gap>=previous);previous=gap;}
console.log('Opening pack retreats continuously by 4 s; later stumble gap remains authoritative');
