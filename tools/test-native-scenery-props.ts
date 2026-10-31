import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import {createHash} from 'node:crypto';
import * as THREE from 'three';
import {OBJLoader} from 'three/addons/loaders/OBJLoader.js';
import {buildNativeScenery,type Assets} from '../target/temple-run/web/src/game/render';
import {attachNativeLightmapUV} from '../target/temple-run/web/src/game/nativeLightmap';
const source=JSON.parse(readFileSync('target/temple-run/analysis/native-scenery-props/source.json','utf8'));
const templates:Record<string,THREE.Group>={};
for(const [name,record] of Object.entries(source.records) as [string,any][]){
 const base=`target/temple-run/web/public/assets/track/decor-scenery-${name.toLowerCase()}`;
 const raw=readFileSync(base+'.obj');assert.equal(createHash('sha256').update(raw).digest('hex'),record.objSHA256);
 const object=new OBJLoader().parse(raw.toString());attachNativeLightmapUV(object,JSON.parse(readFileSync(base+'.uv1.json','utf8')));
 assert.equal(source.resourceProof[name].prefab,record.prefab);
 const bounds=new THREE.Box3().setFromObject(object);
 for(let axis=0;axis<3;axis++){
  assert.ok(Math.abs(bounds.min.getComponent(axis)-record.bounds[axis][0])<1e-5);
  assert.ok(Math.abs(bounds.max.getComponent(axis)-record.bounds[axis][1])<1e-5);
 }
 const resource='Trees/'+name;templates[resource]=object;
 const clone=buildNativeScenery({sceneryTemplates:templates} as unknown as Assets,resource)!;
 assert.notEqual(clone,object);assert.deepEqual(clone.scale.toArray(),[1,1,1]);assert.deepEqual(clone.position.toArray(),[0,0,0]);
 assert.equal(clone.userData.nativeSceneryResource,resource);
 assert.equal(record.materials[0].name,['templeHead','groundPatchTemple'].includes(name)?'Temple Run Material':'Temple Run Trees Material');
}
assert.equal(Object.keys(templates).length,9);
assert.equal(buildNativeScenery({sceneryTemplates:templates} as unknown as Assets,'Trees/missing'),null);
console.log('Nine native scenery props: resource table identity, exported hashes, authored bounds/UV1, material family and clone pivot verified.');
