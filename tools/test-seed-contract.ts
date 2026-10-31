import assert from 'node:assert/strict';
import {CoursePlan} from '../target/temple-run/web/src/game/coursePlan';
import {writeFileSync} from 'node:fs';
function generate(progress:(d:number)=>number){const course=new CoursePlan(1,0);for(let d=0;d<=12000;d+=60)course.ensureThrough(d+360,progress(d));return course;}
const a=generate(d=>d*.8),b=generate(d=>d*.8),novice=generate(()=>0),experienced=generate(()=>2000);
assert.deepEqual(a.features,b.features);assert.deepEqual(a.turns,b.turns);assert.deepEqual(a.obstacles,b.obstacles);
assert.deepEqual(novice.features.slice(0,3),experienced.features.slice(0,3),'seeded opening is independent of later progress');
const topology=(p:CoursePlan)=>({turns:p.turns,obstacles:p.obstacles,features:p.features.map(({kind,from,to,combo,pathLevel})=>({kind,from,to,combo,pathLevel}))});
assert.notDeepEqual(topology(novice),topology(experienced),'same seed is not a complete course replay contract');
const other=new CoursePlan(2,0);assert.notDeepEqual(other.features.slice(0,3),a.features.slice(0,3));
const mismatch=novice.features.findIndex((f,i)=>{const g=experienced.features[i];return !g||f.kind!==g.kind||f.to!==g.to||f.combo!==g.combo;});
assert.ok(mismatch>=3);
const report={seed:1,rulesVersion:a.rulesVersion,distance:12000,sameSeedSameProgressScheduleExact:true,openingIndependentOfLaterProgress:true,sameSeedDifferentProgressChangesCourse:true,firstDifferentFeatureIndex:mismatch,novice:novice.features[mismatch],experienced:experienced.features[mismatch],scope:'Pure course generation; not a gameplay replay or a claim of a live UI bug.'};
writeFileSync('target/temple-run/analysis/gameplay-seed-contract.json',JSON.stringify(report,null,2)+'\n');
console.log('Seed contract:same inputs exact,opening stable,different progress diverges after opening',report);
