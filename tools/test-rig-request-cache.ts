import assert from 'node:assert/strict';
import {loadRigData} from '../target/temple-run/web/src/runnerRig';
const originalFetch=globalThis.fetch;let calls=0,fail=false;
globalThis.fetch=async()=>{calls++;return new Response(JSON.stringify({bones:[],clips:{}}),{status:fail?503:200});};
try{
 const results=await Promise.all(Array.from({length:8},()=>loadRigData('/cache-test-enemy.json')));
 assert.equal(calls,1);assert.ok(results.every(r=>r===results[0]));
 await loadRigData('/cache-test-enemy.json');assert.equal(calls,1);
 fail=true;await assert.rejects(loadRigData('/cache-test-retry.json'));fail=false;
 await loadRigData('/cache-test-retry.json');assert.equal(calls,3,'failed requests can retry');
 console.log('Rig request cache: eight concurrent rigs share one fetch/parse; retained data and failed-request retry pass.');
}finally{globalThis.fetch=originalFetch;}
