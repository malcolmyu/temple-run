import { referenceJunctionDistance as J,referenceWorldDistance as W } from '../target/temple-run/web/src/game/referenceCoordinates';
import { COIN_Y } from '../target/temple-run/web/src/game/config';
import assert from 'node:assert/strict';
import { REFERENCE_OPENING_TURNS } from '../target/temple-run/web/src/game/referenceRoute';
import { referenceCoinsForTurn } from '../target/temple-run/web/src/game/referenceCoins';
const coins=referenceCoinsForTurn(0,J(81))!;
assert.ok(coins.length>0);
assert.ok(coins.every(c=>c.lane===0&&c.distance>W(81)&&c.distance<W(114)),'observed first run stays left and ends before frame013');
assert.ok(coins.some(c=>c.distance>W(104)),'frame012 still shows the tail of this run');
assert.ok(Math.max(...coins.map(c=>c.height))>3,'frame011 has an airborne arc');
const second=referenceCoinsForTurn(1,J(153))!;
assert.ok(second.length>0&&second.every(c=>c.lane===0&&c.distance>=W(177)&&c.distance<W(207)&&c.height===COIN_Y),'019–022: low left row behind the transverse root, not a corner centre cue');
assert.equal(referenceCoinsForTurn(0,J(669)),null,'debug/custom turns retain their own rules');
assert.equal(referenceCoinsForTurn(3,321),null,'unknown suffix is not labeled reviewed');
console.log('Reference coin rows retain observed lanes/arcs and map source score coordinates to physical positions.');

const fourth=referenceCoinsForTurn(3,J(285))!;
assert.ok(fourth.every(c=>c.lane===0&&c.distance>W(285)&&c.distance<=W(318)));
assert.ok(fourth.some(c=>c.distance<W(297)&&c.height>2),'left arc rises toward the outgoing gap');
assert.ok(fourth.filter(c=>c.distance>W(314)).every(c=>c.height===COIN_Y),'low tail after the jump arc');

const fifth=referenceCoinsForTurn(4,J(381))!;
assert.ok(fifth.length>0&&fifth.every(c=>c.lane===0&&c.distance>W(381)&&c.distance<W(406)));
assert.ok(fifth.some(c=>c.height>3));

assert.ok(referenceCoinsForTurn(5,J(441))!.every(c=>c.lane===0&&c.distance>W(441)&&c.distance<W(477)));

const seventh=referenceCoinsForTurn(6,J(501))!;
assert.ok(seventh.length>0&&seventh.every(c=>c.lane===0&&c.distance>=W(525)&&c.distance<W(564)));
assert.ok(seventh.some(c=>c.distance>W(540)&&c.height>3));

assert.ok(referenceCoinsForTurn(7,J(621))!.every(c=>c.lane===0&&c.distance>=W(600)&&c.distance<W(660)));

const ninth=referenceCoinsForTurn(8,J(669))!;
assert.ok(ninth.some(c=>c.lane===2&&c.distance>=W(778)));
assert.ok(referenceCoinsForTurn(9,J(837))!.every(c=>c.lane===0&&c.distance>=W(856)&&c.distance<W(889)));
assert.ok(referenceCoinsForTurn(10,J(957))!.every(c=>c.lane===2&&c.distance>=W(960)&&c.distance<W(993)));

for(let index=11;index<=20;index++){const coins=referenceCoinsForTurn(index,REFERENCE_OPENING_TURNS[index].distance)!;assert.ok(coins.length>=8);assert.ok(coins.every(c=>c.lane!==1),'recorded short-segment rows never move to invented centre lane');}

for(let index=30;index<REFERENCE_OPENING_TURNS.length-1;index++){
 const next=REFERENCE_OPENING_TURNS[index+1].distance;
 assert.ok(referenceCoinsForTurn(index,REFERENCE_OPENING_TURNS[index].distance)!.every(c=>c.distance<next),'incoming coin run must not duplicate the next outgoing run beyond the corner');
}
