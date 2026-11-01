import assert from 'node:assert/strict';
import {REFERENCE_SURFACES,nativeGroundHeightAt,nativeMeshHeightAt} from '../target/temple-run/web/src/game/surface';
for(const section of REFERENCE_SURFACES){
 const d=section.from+12;assert.equal(nativeGroundHeightAt(d),section.kind==='wood'?-3:0);assert.equal(nativeMeshHeightAt(d),section.kind==='wood'?-3.05:0);
}
for(const section of REFERENCE_SURFACES.filter(s=>s.kind==='wood')){
 assert.equal(nativeGroundHeightAt(section.from-6-.001),0);assert.equal(nativeGroundHeightAt(section.from-6),-3);
 assert.equal(nativeGroundHeightAt(section.to),0);
}
console.log('Two reference plank sections share native ground-3 and authored mesh offset-3.05, preserving stone height0');
console.log(JSON.stringify(REFERENCE_SURFACES));
