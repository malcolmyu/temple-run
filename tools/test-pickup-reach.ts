import assert from 'node:assert/strict';
import { coinHeightWithinReach, pickupHeightAt } from '../target/temple-run/web/src/game/pickupReach';
assert.equal(coinHeightWithinReach(3.7,0,false),false,'grounded actor cannot collect the high reference arc');
assert.equal(coinHeightWithinReach(3.7,1.5,false),true,'jump reaches the high arc');
assert.equal(coinHeightWithinReach(3.7,0,true),false,'sliding cannot reach high coins');
for(let t=0;t<10;t+=.05){
 assert.equal(coinHeightWithinReach(pickupHeightAt(1.3,t,86),0,false),true,'ordinary coins remain in reach throughout bobbing');
 assert.equal(coinHeightWithinReach(pickupHeightAt(1.3,t,86),0,true),true,'sliding can still collect the low coin run');
}
assert.equal(coinHeightWithinReach(.1,1.5,false),false,'jumping does not collect coins far below the feet');
assert.equal(coinHeightWithinReach(3.7,0,false,true),true,'magnet may attract the arc without jumping');
console.log('Coin reach: low run/slide, high arc jump, below-feet rejection and magnet bypass checked.');
