import assert from 'node:assert/strict';
import {RunDiagnostics,DIAGNOSTIC_KEY} from '../target/temple-run/web/src/game/runDiagnostics';
const data=new Map<string,string>(),storage={getItem:(k:string)=>data.get(k)??null,setItem:(k:string,v:string)=>{data.set(k,v);}};
const log=new RunDiagnostics(storage);log.start({runId:'one',seed:42});
for(let i=0;i<200;i++){log.sample(i/4,{distance:i});log.input(i/4,'left','tick');log.event(i/4,'branch-selected',{choice:'left',sound:'branchChime'});}
log.death({cause:'missed',worldDistance:100},{tiles:[{cuts:'center-hole'}]});
let records=log.read();assert.equal(records[0].recent.length,80);assert.equal(records[0].inputs.length,100);assert.equal(records[0].events?.length,32);assert.equal(records[0].header.seed,42);assert.equal((records[0].scene as any).tiles[0].cuts,'center-hole');
records[0].header.seed=99;assert.equal(log.read()[0].header.seed,42,'read snapshot is isolated');
log.start({runId:'two'});log.death({cause:'fall'},{});assert.equal(log.read()[1].recent.length,0);assert.equal(log.read()[1].inputs.length,0);assert.equal(log.read()[1].events?.length,0);assert.equal(log.read()[0].header.runId,'one','new run preserves past death');
const reload=new RunDiagnostics(storage);assert.equal(reload.read().length,2,'reload preserves records');reload.start({runId:'three'});reload.death({cause:'root'},{});reload.death({cause:'fire'},{});assert.equal(reload.read().length,3);assert.equal(reload.read()[0].header.runId,'two');assert.ok(data.has(DIAGNOSTIC_KEY));
const denied=new RunDiagnostics({getItem:()=>{throw Error('denied')},setItem:()=>{throw Error('quota')}});denied.start({runId:'memory'});denied.death({cause:'fall'},{});assert.equal(denied.read().length,1,'storage failure does not lose in-memory death or throw');
const corrupt=new RunDiagnostics({getItem:()=>'{bad',setItem:()=>{}});assert.deepEqual(corrupt.read(),[]);
let builds=0;const lazy=new RunDiagnostics(null);lazy.sample(0,()=>{builds++;return {};});lazy.sample(.1,()=>{builds++;return {};});lazy.sample(.25,()=>{builds++;return {};});assert.equal(builds,2,'geometry snapshots constructed only on sample intervals');
console.log('Default death diagnostics: bounded samples/inputs/history, reset isolation, persistence, corrupt storage and quota fallback pass');
