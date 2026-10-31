import assert from 'node:assert/strict';
import {TrackPath} from '../target/temple-run/web/src/game/path';
import {linearPathPoint} from './path-linear-reference';
const path=new TrackPath();for(let i=1;i<=2000;i++)path.turn(i*120,i%3?1:-1);
const distances=[-100,0,1,Infinity,-Infinity,NaN];
for(let i=1;i<=2000;i+=7)for(const delta of [-22,-3,0,1,3,22])distances.push(i*120+delta);
for(const span of [null,{from:1200,to:1332}]){
 path.branchSpan=span;path.lateral=span?1.9:0;
 for(const d of distances){
  const expected=[...path.segments].reverse().find(s=>d>=s.start)??path.segments[0];assert.equal(path.segmentAt(d),expected);
  for(const side of [-1.9,0,1.9])for(const smooth of [false,true])assert.deepEqual(path.at(d,side,smooth),linearPathPoint(path,d,side,smooth));
  for(const margin of [0,3,22,Infinity,NaN])assert.equal(path.nearTurn(d,margin),path.segments.some((s,i)=>i>0&&Math.abs(d-s.start)<margin));
 }
}
const duplicate=new TrackPath();duplicate.turn(120,1);duplicate.turn(120,-1);assert.equal(duplicate.segmentAt(120),duplicate.segments[2]);assert.deepEqual(duplicate.at(120),linearPathPoint(duplicate,120));
let reads=0;const list=path.segments;
Object.defineProperty(path,'segments',{value:new Proxy(list,{get(t,k,r){if(typeof k==='string'&&/^\d+$/.test(k))reads++;return Reflect.get(t,k,r);}})});
path.at(239950,0,true);assert.ok(reads<=16,`logarithmic lookup used ${reads} segment reads`);
console.log('Path lookup:2000 turns,legacy coordinates/smoothing/branch ramps/edge distances/near-turn and logarithmic access pass',{reads,queries:distances.length*24});
