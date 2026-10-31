import { referenceJunctionDistance as J } from '../target/temple-run/web/src/game/referenceCoordinates';
import { surfaceAt } from '../target/temple-run/web/src/game/surface';
import assert from 'node:assert/strict';
import { REFERENCE_OPENING_OBSTACLES, REFERENCE_RANDOM_OBSTACLES_FROM, overlapsReferenceTree } from '../target/temple-run/web/src/game/referenceObstacles';
import { REFERENCE_OPENING_TURNS } from '../target/temple-run/web/src/game/referenceRoute';
import { DEFS } from '../target/temple-run/web/src/game/obstacles/catalog';
for(const obstacle of REFERENCE_OPENING_OBSTACLES){
 const def=DEFS[obstacle.defId];
 assert.ok((def.prefabs as readonly string[]).includes(obstacle.prefab));
 assert.ok(obstacle.legacyDistance>=obstacle.distanceBracket[0]&&obstacle.legacyDistance<=obstacle.distanceBracket[1]);
 const corner=REFERENCE_OPENING_TURNS.find(turn=>turn.distance>obstacle.distance)?.distance;
 if(corner!==undefined)assert.ok(obstacle.distance+def.hitbox.z[1]<=corner-6,'native collision interval clears the upcoming junction deck');
}
assert.equal(DEFS[REFERENCE_OPENING_OBSTACLES[0].defId].action,'jump');
assert.equal(DEFS[REFERENCE_OPENING_OBSTACLES[1].defId].action,'jump');
const lastObstacle=REFERENCE_OPENING_OBSTACLES.at(-1)!;
assert.ok(REFERENCE_RANDOM_OBSTACLES_FROM>=lastObstacle.distance+48,'random suffix cannot replace/overlap the recorded opening');
assert.equal(lastObstacle.distance,J(2367));
assert.equal(lastObstacle.defId,'narrowWallLeft');
const previousTurn=REFERENCE_OPENING_TURNS.filter(turn=>turn.distance<lastObstacle.distance).at(-1)!;
assert.ok(lastObstacle.distance-6>=previousTurn.distance+6,'replacement tile starts after the prior junction deck');
assert.equal(overlapsReferenceTree(J(63)),true);
assert.equal(overlapsReferenceTree(J(141)),true);
assert.equal(overlapsReferenceTree(J(177)),true,'new recorded trunk suppresses duplicate ambient tree');
assert.equal(REFERENCE_OPENING_OBSTACLES[2].defId,'treeJump');
assert.equal(DEFS[REFERENCE_OPENING_OBSTACLES[2].defId].action,'jump');
console.log('Opening trees fit observed frame brackets, correct prefabs/actions and clear both corner decks.');

assert.ok(REFERENCE_OPENING_OBSTACLES.some(o=>o.legacyDistance===393&&o.defId==='pit'));
assert.ok(REFERENCE_OPENING_OBSTACLES.some(o=>o.legacyDistance===417&&o.defId==='pit'));

const finalStone=REFERENCE_OPENING_OBSTACLES.find(o=>o.legacyDistance===549)!;
assert.equal(surfaceAt(finalStone.distance).kind,'stone');
assert.equal(surfaceAt(J(937)).kind,'wood');
assert.ok(finalStone.distance+6<=surfaceAt(finalStone.distance).to,'last native pit replacement does not cut the wood entry');

for(const legacy of [745,777,857,887])assert.ok(REFERENCE_OPENING_OBSTACLES.some(o=>o.legacyDistance===legacy&&o.defId==='plankBeam'));
for(const legacy of [817,937])assert.ok(REFERENCE_OPENING_OBSTACLES.some(o=>o.legacyDistance===legacy&&o.defId==='plankPit'));

const expectedNarrow:Record<number,string>={1627:'narrowBeamLeft',1697:'narrowBeamLeft',1719:'narrowWallLeftB',1725:'narrowWallLeftA',1765:'narrowWallRightB',1771:'narrowWallRight',1777:'narrowWallRightA',1801:'narrowWallRightB',1807:'narrowWallRight',1813:'narrowWallRightA',1897:'narrowBeamRight',2327:'narrowBeamRight',2359:'narrowWallLeftB',2363:'narrowWallLeft',2367:'narrowWallLeft'};
for(const [legacy,id]of Object.entries(expectedNarrow))assert.equal(REFERENCE_OPENING_OBSTACLES.find(o=>o.legacyDistance===Number(legacy))?.defId,id,'source short notches, tapered long-hole caps and surviving sides must agree');
for(const[a,b,c]of [[1765,1771,1777],[1801,1807,1813],[2359,2363,2367]]){
 const tiles=[a,b,c].map(legacy=>REFERENCE_OPENING_OBSTACLES.find(o=>o.legacyDistance===legacy)!);
 assert.equal(tiles[1].distance-tiles[0].distance,12);assert.equal(tiles[2].distance-tiles[1].distance,12);
}

assert.equal(REFERENCE_OPENING_OBSTACLES[0].distance,108,'first trunk center fits source006/007 projections and visible first stumble');
