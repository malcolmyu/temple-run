import { referenceJunctionDistance as J,referenceTileDistance as T,referenceWorldDistance as W } from '../target/temple-run/web/src/game/referenceCoordinates';
import { REFERENCE_STRAIGHT_GATES, referenceStraightGate, referenceFullWidthAt, overlapsReferenceGate } from '../target/temple-run/web/src/game/referenceScenery';
import assert from 'node:assert/strict';
import { referenceTurnDirection, referenceNextTurnDistance, referenceGate, referenceJunction, REFERENCE_OPENING_TURNS } from '../target/temple-run/web/src/game/referenceRoute';
assert.equal(referenceTurnDirection(0,J(81)),1,'008/009: opening exits right');
assert.equal(referenceNextTurnDistance(1,J(81)),J(153),'016/017: next corner is near 153m, not 177–201m');
assert.equal(referenceTurnDirection(1,J(153)),1,'016/017: second exit is right');
assert.equal(referenceNextTurnDistance(2,J(153)),J(225));
assert.equal(referenceTurnDirection(2,J(225)),-1);
assert.equal(referenceJunction(2,J(225)),'tee');
assert.equal(referenceNextTurnDistance(3,J(225)),J(285));
assert.equal(referenceTurnDirection(3,J(285)),-1);
assert.equal(referenceJunction(3,J(285)),'tee');
assert.equal(referenceNextTurnDistance(4,J(285)),J(381));
assert.equal(referenceTurnDirection(4,J(381)),-1);
assert.equal(referenceJunction(4,J(381)),'corner');
assert.equal(referenceNextTurnDistance(5,J(381)),J(441));
assert.equal(referenceTurnDirection(5,J(441)),1);
assert.equal(referenceJunction(5,J(441)),'tee');
assert.equal(referenceNextTurnDistance(6,J(441)),J(501));
assert.equal(referenceTurnDirection(6,J(501)),1);
assert.equal(referenceGate(6,J(501)),'exit');
assert.equal(referenceNextTurnDistance(7,J(501)),J(621));
assert.equal(referenceTurnDirection(7,J(621)),1);
assert.equal(referenceJunction(7,J(621)),'tee');
assert.equal(referenceNextTurnDistance(8,J(621)),J(669));
assert.equal(referenceTurnDirection(8,J(669)),1);
assert.equal(referenceJunction(8,J(669)),'corner');
assert.equal(referenceNextTurnDistance(9,J(669)),J(837));
assert.equal(referenceTurnDirection(9,J(837)),-1);
assert.equal(referenceJunction(9,J(837)),'corner');
assert.equal(referenceNextTurnDistance(10,J(837)),J(957));
assert.equal(referenceTurnDirection(10,J(957)),-1);
assert.equal(referenceNextTurnDistance(11,J(957)),J(1055));
for(const [index,legacy,direction]of [[11,1055,-1],[12,1081,1],[13,1103,1],[14,1127,1],[15,1147,-1],[16,1165,1],[17,1187,1],[18,1207,1],[19,1231,1],[20,1253,-1]])assert.equal(referenceTurnDirection(index,J(legacy)),direction);
assert.equal(referenceNextTurnDistance(21,J(1253)),J(1357));
assert.equal(referenceGate(11,J(1055)),'forward');
assert.equal(referenceGate(13,J(1103)),'exit');
assert.equal(referenceTurnDirection(0,J(669)),null,'debug jump must not inherit opening direction');
assert.equal(referenceNextTurnDistance(1,10000),null,'debug/custom turn must not schedule a corner behind the runner');
assert.equal(referenceTurnDirection(10,J(81)),null,'distance alone cannot replay the opening later in the run');
for(const turn of REFERENCE_OPENING_TURNS)assert.equal((turn.distance-9)%12,0,'corners stay on authored tile centers');
console.log(`Reference route: ${REFERENCE_OPENING_TURNS.length} observed turns through frame261; grid conversion and custom-route separation pass.`);

assert.equal(referenceGate(0,J(81)),'exit');
assert.equal(referenceGate(1,J(153)),'forward');
assert.equal(referenceGate(0,J(669)),null);

assert.equal(referenceStraightGate(T(204)),'tower');
assert.equal(referenceStraightGate(276),null);
assert.equal(REFERENCE_STRAIGHT_GATES[0].distance,REFERENCE_STRAIGHT_GATES[0].tileDistance+6);

for(const d of [0,96,177,192,198,213,297,381])assert.equal(referenceFullWidthAt(d),true);
assert.equal(referenceFullWidthAt(W(2381)+96),false);

assert.equal(referenceStraightGate(T(420)),'tower');
assert.equal(referenceFullWidthAt(417),true);

assert.equal(overlapsReferenceGate(T(420)+24),true,'periodic low portal must not duplicate the recorded tower');
assert.equal(overlapsReferenceGate(T(564)),false);

assert.equal(overlapsReferenceGate(J(501)+24),true,'exit gate suppresses the following periodic duplicate');

assert.equal(REFERENCE_OPENING_TURNS[0].distance,153);
assert.equal(REFERENCE_OPENING_TURNS[1].distance,321);

for(const [i,d,dir]of [[21,1357,-1],[22,1393,1],[23,1545,1],[24,1585,1]])assert.equal(referenceTurnDirection(i,J(d)),dir);
assert.equal(referenceNextTurnDistance(25,J(1585)),J(1683));

for(const [i,d]of [[25,1683],[26,1711],[27,1747]])assert.equal(referenceTurnDirection(i,J(d)),1);
assert.equal(referenceNextTurnDistance(28,J(1747)),J(1791));

for(const [i,d]of [[28,1791],[29,1829],[30,1861]])assert.equal(referenceTurnDirection(i,J(d)),1);
assert.equal(referenceNextTurnDistance(31,J(1861)),J(1963));

for(const [i,d,dir]of [[31,1963,1],[32,2067,-1],[33,2099,1],[34,2133,1]])assert.equal(referenceTurnDirection(i,J(d)),dir);
assert.equal(referenceNextTurnDistance(35,J(2133)),J(2189));

for(const [i,d,dir]of [[35,2189,1],[36,2203,1],[37,2217,-1],[38,2233,1],[39,2247,1],[40,2271,1],[41,2341,1]])assert.equal(referenceTurnDirection(i,J(d)),dir);
assert.equal(referenceNextTurnDistance(42,J(2341)),null);

assert.equal(referenceStraightGate(T(192)),null,'first glyph tower remains ahead at source21, not the old periodic gate position');
