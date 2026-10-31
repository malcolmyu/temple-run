import assert from 'node:assert/strict';
import {REFERENCE_OPENING_OBSTACLES,REFERENCE_FINAL_NARROW_CONTINUATION,REFERENCE_VISIBLE_OBSTACLES,REFERENCE_RANDOM_OBSTACLES_FROM} from '../target/temple-run/web/src/game/referenceObstacles';
import {DEFS} from '../target/temple-run/web/src/game/obstacles/catalog';
import {insideGroundSupport} from '../target/temple-run/web/src/game/obstacles/collision';
const last=REFERENCE_OPENING_OBSTACLES.at(-1)!;
const row=[last,...REFERENCE_FINAL_NARROW_CONTINUATION];
assert.equal(last.distance,5373);assert.equal(REFERENCE_FINAL_NARROW_CONTINUATION.length,8);
row.forEach((tile,i)=>{
 assert.equal(tile.distance,last.distance+12*i);assert.equal(tile.defId,'narrowWallLeft');
 assert.deepEqual(DEFS[tile.defId].surfaceCut,[-6,6]);
 const region=DEFS[tile.defId].groundSupportRegion!;
 assert.equal(insideGroundSupport(region,-1.3,0),false,'video final narrow has no floor to runner left');
 assert.equal(insideGroundSupport(region,1.3,0),true,'video final narrow retains the right floor');
});
assert.equal(REFERENCE_VISIBLE_OBSTACLES.at(-1)!.distance,5469);
assert.ok(REFERENCE_RANDOM_OBSTACLES_FROM>=row.at(-1)!.distance+48,'random suffix cannot replace the visible narrow continuation');
console.log('Final narrow remains continuous beyond three tiles through native fog visibility; original unseen endpoint not asserted.');
