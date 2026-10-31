import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import * as THREE from 'three';
import { OBJLoader } from 'three/examples/jsm/loaders/OBJLoader.js';
import { attachNativeLightmapUV, nativeLightmapMaterial } from '../target/temple-run/web/src/game/nativeLightmap';
import { cutSurfaceGeometry } from '../target/temple-run/web/src/game/cutSurface';
const root='target/temple-run/web/public/assets/';
const environment=JSON.parse(readFileSync('target/temple-run/analysis/environment-lightmap-source.json','utf8'));
const models=['temple-road-tile','plank-road-tile','plank-corner','track-wall-corner-a'].map(name=>'track/'+name).concat(Object.keys(environment.meshes),['track/plank-t-junction','obstacles/plank-pit','obstacles/plank-beam']);
for(const name of models){
 const obj=new OBJLoader().parse(readFileSync(root+name+'.obj','utf8'));
 const uv=JSON.parse(readFileSync(root+name+'.uv1.json','utf8'));
 attachNativeLightmapUV(obj,uv);
 obj.updateMatrixWorld(true);
 obj.traverse(object=>{
  const mesh=object as THREE.Mesh;if(!mesh.isMesh)return;
  assert.equal(mesh.geometry.getAttribute('uv1').count,mesh.geometry.getAttribute('position').count);
  const source=mesh.geometry.getAttribute('uv1');
  for(let i=0;i<source.count;i++){assert.ok(Number.isFinite(source.getX(i)));assert.ok(Number.isFinite(source.getY(i)));}
 });
 assert.throws(()=>attachNativeLightmapUV(obj,[0,0]),/UV count/);
}
// A planar UV1 gradient must remain tied to position after clipping a hole.
const plane=new THREE.PlaneGeometry(8,12).rotateX(-Math.PI/2).toNonIndexed();
const position=plane.getAttribute('position');const gradient=[];
for(let i=0;i<position.count;i++)gradient.push((position.getX(i)+4)/8,(position.getZ(i)+6)/12);
plane.setAttribute('uv1',new THREE.Float32BufferAttribute(gradient,2));
const cut=cutSurfaceGeometry(plane,-1.3,2.7);
const points=cut.getAttribute('position'),mapped=cut.getAttribute('uv1');
assert.equal(points.count,mapped.count);
for(let i=0;i<points.count;i++){
 assert.ok(Math.abs(mapped.getX(i)-(points.getX(i)+4)/8)<1e-6);
 assert.ok(Math.abs(mapped.getY(i)-(points.getZ(i)+6)/12)<1e-6);
}
const texture=new THREE.Texture();const material=nativeLightmapMaterial(texture,texture);
assert.equal(material.toneMapped,false);
assert.equal(material.transparent,false);
assert.equal(material.uniforms.mainTexture.value,texture);
assert.equal(material.uniforms.fogEnabled.value,1,'roads keep native vertex fog');
const entrance=nativeLightmapMaterial(texture,texture,false);
assert.equal(entrance.uniforms.fogEnabled.value,0,'entrance black triangles remain unlifted by fog');
assert.equal(entrance.uniforms.bakedTexture.value,texture,'no-fog variant still uses the original baked light');
console.log(`Native lightmaps: ${models.length} OBJ face streams match UV1 counts; mismatches rejected; cut UVs interpolate correctly.`);

const srgb=new THREE.Texture();srgb.colorSpace=THREE.SRGBColorSpace;
const gammaMaterial=nativeLightmapMaterial(srgb,srgb);
assert.equal(srgb.colorSpace,THREE.SRGBColorSpace,'fallback materials retain shared texture color space');
assert.notEqual(gammaMaterial.uniforms.mainTexture.value,srgb);
assert.equal(gammaMaterial.uniforms.mainTexture.value.colorSpace,THREE.NoColorSpace);
assert.equal(gammaMaterial.uniforms.mainTexture.value,gammaMaterial.uniforms.bakedTexture.value,'same source shares one encoded texture');
assert.equal(nativeLightmapMaterial(srgb,srgb,false).uniforms.mainTexture.value,gammaMaterial.uniforms.mainTexture.value,'fog variants reuse encoded texture');
assert.deepEqual(gammaMaterial.uniforms.fogColor.value.toArray(),[50/255,82/255,86/255]);
assert.ok(!gammaMaterial.fragmentShader.includes('#include <colorspace_fragment>'),'Gamma output is not encoded twice');
