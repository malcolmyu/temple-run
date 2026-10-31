import assert from 'node:assert/strict';
import {courseCoinRun} from '../target/temple-run/web/src/game/courseCoins';
import {CoursePlan} from '../target/temple-run/web/src/game/coursePlan';
const f={kind:'fastTurn',from:100,to:148,surface:'stone' as const,generatedAtProgress:1500,fastTurn:true};
const short=courseCoinRun(f,null);assert.ok(short.length>0&&short.length<=5);
assert.ok(short.every(at=>at>=106&&at<=142));
assert.equal(courseCoinRun(f,short[0]).length,0,'strict > gate rejects equality even in fast mode');
assert.ok(courseCoinRun(f,short[0]-12).length>0);
const normal={...f,fastTurn:false,to:268,generatedAtProgress:0};const first=courseCoinRun(normal,null)[0];
assert.equal(courseCoinRun(normal,first-12*12).length,0);
assert.ok(courseCoinRun(normal,first-13*12).length>0);
for(let seed=1;seed<=100;seed++){
 const p=new CoursePlan(seed,489);p.ensureThrough(2000,1500,true);p.ensureThrough(5000,2000,false);
 let last:number|null=null,count=0;
 for(const feature of p.features){const run=courseCoinRun(feature,last);if(!run.length)continue;count++;assert.ok(run.every(at=>at>=feature.from+6&&at<=feature.to-6));assert.ok(run.length<=5);last=run.at(-1)!;}
 assert.ok(count>0);
}
console.log('Course coins: strict native spacing boundary, fast override,100 mixed courses, corner clearance and bounded run length pass.');
