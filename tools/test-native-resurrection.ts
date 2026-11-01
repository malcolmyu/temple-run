import assert from 'node:assert/strict';
import {resurrectionSpeed,RESURRECTION_BOOST_PROGRESS,RESURRECTION_STUMBLE_AGE} from '../target/temple-run/web/src/game/nativeResurrection';
import {createNativeBoost,startNativeBoost} from '../target/temple-run/web/src/game/nativeBoost';
assert.equal(resurrectionSpeed(0),20);assert.equal(resurrectionSpeed(20),20);
assert.ok(Math.abs(resurrectionSpeed(40)-34)<.00001);
assert.equal(RESURRECTION_STUMBLE_AGE,10);
const boost=createNativeBoost();startNativeBoost(boost,resurrectionSpeed(40),RESURRECTION_BOOST_PROGRESS);
assert.equal(boost.left,200);assert.ok(Math.abs(boost.speedBefore-34)<.00001);
console.log('Native resurrection: floor20, death velocity*.85, age10, fixed150+50 budget independent of pickup upgrades pass.');
