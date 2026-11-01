import assert from 'node:assert/strict';
import {routeDirection,type DirectionalContext} from '../target/temple-run/web/src/game/inputRouter';
import {TurnIntentBuffer,nativeTurnQueryRadius} from '../target/temple-run/web/src/game/turnInput';
const base:DirectionalContext={playing:true,held:false,falling:false,lane:1,junction:'corner',turnDirection:1,remaining:80,queued:false,autoQueued:false,alternateBranchAvailable:true};
assert.equal(routeDirection({...base,remaining:14},1).kind,'buffer','a nearby early turn must retain intent instead of silently becoming a lane change');
for(const direction of [-1,1] as const){
 assert.deepEqual(routeDirection(base,direction),{kind:'lane',index:1+direction},'distant cue never steals lane input');
 for(const remaining of [6,0,-2,-2.7,-4])assert.deepEqual(routeDirection({...base,remaining,turnDirection:direction},direction),{kind:'turn',direction,selectAlternateBranch:false});
 for(const remaining of [6.01,14,19.8])assert.equal(routeDirection({...base,remaining,turnDirection:direction},direction).kind,'buffer');
 for(const remaining of [19.8001,-4.01,NaN])assert.equal(routeDirection({...base,remaining},direction).kind,'lane');
 assert.equal(routeDirection({...base,remaining:0,turnDirection:-direction},direction).kind,'lane');
 assert.equal(routeDirection({...base,remaining:0,queued:true},direction).kind,'lane');
 assert.equal(routeDirection({...base,remaining:0,junction:'tee',autoQueued:true,queued:true},direction).kind,'turn','manual T choice overrides boost automatic choice');
 assert.equal(routeDirection({...base,remaining:0,junction:'tee',queued:true},direction).kind,'lane','committed manual choice is not consumed twice');
 for(const blocked of [{playing:false},{held:true},{falling:true}])assert.equal(routeDirection({...base,remaining:0,...blocked},direction).kind,'ignore');
}
let lane=1;
for(const direction of [-1,-1,-1,1,1,1] as const){const result=routeDirection({...base,lane},direction);assert.equal(result.kind,'lane');if(result.kind==='lane')lane=result.index;assert.ok(lane>=0&&lane<=2);}
assert.equal(lane,2);
assert.equal(routeDirection({...base,junction:'tee',remaining:0,alternateBranchAvailable:false},-1).kind,'lane','missing alternate exit cannot be committed');
assert.deepEqual(routeDirection({...base,junction:'tee',remaining:0},-1),{kind:'turn',direction:-1,selectAlternateBranch:true});
assert.equal(routeDirection({...base,junction:'tee',remaining:14},-1).kind,'buffer');
assert.equal(routeDirection({...base,junction:'tee',remaining:14,alternateBranchAvailable:false},-1).kind,'lane');
assert.equal(routeDirection({...base,remaining:19.79,side:1.9},1).kind,'lane','use radial rather than along-path search distance');
assert.equal(nativeTurnQueryRadius(),19.8);
const intent=new TurnIntentBuffer();intent.offer(153,-1);intent.step(.5,153);intent.step(.5,153);
assert.equal(intent.snapshot()?.elapsed,1,'one second equality survives');intent.step(.001,153);assert.equal(intent.snapshot(),null);
intent.offer(153,-1);intent.step(.75,153);intent.offer(153,1);assert.equal(intent.snapshot()?.elapsed,0,'new input refreshes intent');
intent.step(.01,321);assert.equal(intent.snapshot(),null,'old target cannot leak into next junction');
intent.offer(321,1);intent.clear();assert.equal(intent.snapshot(),null);
console.log('InputRouter:ordinary lanes,edge clamping,both turn windows,T exits/boost override,duplicate/manual input,inactive/held/falling guards pass');
