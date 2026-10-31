import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import {CoursePlan} from '../target/temple-run/web/src/game/coursePlan';
import {validateEncounterLayout} from '../target/temple-run/web/src/game/encounterSafety';
const native=JSON.parse(readFileSync('target/temple-run/analysis/native-generation/path-compatibility.json','utf8')).helperCandidatesBySideAndParent['3'];
const types:Record<string,number>={narrowWallLeft:19,narrowWallLeftA:20,narrowWallLeftB:21,narrowWallRight:22,narrowWallRightA:23,narrowWallRightB:24};
const seen=new Set<string>();let count=0;
for(let seed=1;seed<=100;seed++){
 const course=new CoursePlan(seed,0);course.ensureThrough(20000,2500);
 assert.equal(course.rejectedEncounters.length,0,'variants retain generation safety budgets');
 for(const feature of course.features.filter(f=>f.kind==='narrowLong')){
  const span=course.narrows.find(s=>s.from>=feature.from&&s.to<=feature.to)!;
  const parts=course.obstacles.filter(o=>o.distance>=feature.from&&o.distance<feature.to).sort((a,b)=>a.distance-b.distance);
  assert.ok(span);assert.ok([36,48,60].includes(span.to-span.from));
  assert.equal(parts.length,(span.to-span.from)/12);
  assert.ok(parts[0].defId.endsWith('B'));assert.ok(parts.at(-1)!.defId.endsWith('A'));
  assert.equal(parts[0].distance-6,span.from);assert.equal(parts.at(-1)!.distance+6,span.to);
  const body=span.side==='left'?'narrowWallRight':'narrowWallLeft';
  for(const part of parts.slice(1,-1))assert.equal(part.defId,body);
  for(let i=1;i<parts.length;i++){
   assert.equal(parts[i].distance-parts[i-1].distance,12,'native grid');
   assert.ok(native[types[parts[i-1].defId]].includes(types[parts[i].defId]),'canonical B/body*/A sequence follows audited native southward compatibility');
  }
  assert.deepEqual(validateEncounterLayout({...feature,obstacles:parts,narrows:[span],branches:[]}),[]);
  seen.add(`${span.side}:${span.to-span.from}`);count++;
 }
}
assert.equal(seen.size,6,'both safe sides and all three lengths generated');
const fixture=new CoursePlan(1,20000,'fixture');
assert.ok(fixture.narrows.filter(n=>n.to-n.from>12).every(n=>n.to-n.from===36),'reference fixture remains fixed');
console.log('Long narrow:100 seeds, B/body*/A native compatibility,12m grid, entry/exit safety, both sides/three lengths and fixture pass',{count,variants:[...seen].sort()});
