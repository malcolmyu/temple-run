import assert from 'node:assert/strict';
import {routeDirection,type DirectionalContext} from '../target/temple-run/web/src/game/inputRouter';
const base:DirectionalContext={playing:true,held:false,falling:false,lane:1,junction:'corner',turnDirection:1,remaining:80,queued:false,autoQueued:false,alternateBranchAvailable:true};
for(const direction of [-1,1] as const){
 assert.deepEqual(routeDirection(base,direction),{kind:'lane',index:1+direction},'distant cue never steals lane input');
 for(const remaining of [6,0,-2])assert.deepEqual(routeDirection({...base,remaining,turnDirection:direction},direction),{kind:'turn',direction,selectAlternateBranch:false});
 for(const remaining of [6.01,-2.01,NaN])assert.equal(routeDirection({...base,remaining},direction).kind,'lane');
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
console.log('InputRouter:ordinary lanes,edge clamping,both turn windows,T exits/boost override,duplicate/manual input,inactive/held/falling guards pass');
