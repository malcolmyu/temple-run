import { distanceScoreDelta } from '../target/temple-run/web/src/game/scoring';
import assert from 'node:assert/strict';
let distance=0,score=0;
for(let i=0;i<1000;i++){const next=distance+.025;score+=distanceScoreDelta(distance,next);distance=next;}
assert.equal(score,Math.floor(distance)*20);
const bonus=100;score+=bonus;
score+=distanceScoreDelta(distance,distance+.1);
assert.ok(score>=Math.floor(distance)*20+bonus);
assert.equal(distanceScoreDelta(12,11),0);
assert.equal(distanceScoreDelta(0,7),140);
assert.equal(distanceScoreDelta(7,18),220);
console.log('Score checks passed: frame subdivision, retained bonuses, 20x distance, no reverse award');
