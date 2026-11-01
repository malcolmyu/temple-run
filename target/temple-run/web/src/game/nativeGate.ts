import * as THREE from 'three';

/** Separate original portal faces from the bundled roadway, retaining UV1.
 * Object84: road y=30; side portal spans z near x=18.
 * Object01 tower: obstacle-export road y=0; keep the original pillar bases.
 * Face selection is geometry-derived, not a recovered Unity submesh boundary.
 */
export function extractNativeGate(source: THREE.Group | null, variant: 'side' | 'tower' = 'side'): THREE.Group | null {
  if(!source)return null;
  const result=new THREE.Group();result.name=variant==='tower'?'original-tower-gate':'original-stone-gate';
  source.traverse(object=>{
    const mesh=object as THREE.Mesh;if(!mesh.isMesh)return;
    const geometry=mesh.geometry.index?mesh.geometry.toNonIndexed():mesh.geometry;
    const position=geometry.getAttribute('position');const names=Object.keys(geometry.attributes);
    const arrays=names.map(()=>[] as number[]);
    for(let i=0;i<position.count;i+=3){
      const ys=[0,1,2].map(j=>position.getY(i+j));
      const high=Math.max(...ys)>(variant==='tower'?15:40);
      // Native lower support faces span |x|9.3..15.9, |z|5.2..18.7.
      // The former |x|>=12 / |z|<14.1 filter retained only fragments, leaving
      // the carved upper pillars visibly suspended. Keep the full low supports
      // above the floor while excluding the roadway slab at y=0.
      const pillarBase=variant==='tower' && Math.min(...ys)>=.01 && Math.max(...ys)>0
        && [0,1,2].every(j=>Math.abs(position.getX(i+j))>=8 && Math.abs(position.getZ(i+j))<19);
      if(!high && !pillarBase)continue;
      names.forEach((name,n)=>{
        const attribute=geometry.getAttribute(name);
        for(let j=0;j<3;j++)for(let k=0;k<attribute.itemSize;k++)arrays[n].push(attribute.array[(i+j)*attribute.itemSize+k]);
      });
    }
    if(!arrays[0]?.length)return;
    const portal=new THREE.BufferGeometry();
    names.forEach((name,n)=>portal.setAttribute(name,new THREE.Float32BufferAttribute(arrays[n],geometry.getAttribute(name).itemSize)));
    if(variant==='tower'){
      // Full authored Horz TRS + path quarter-turn: legacy OBJ has mirrored X.
      portal.rotateY(Math.PI);portal.scale(-.2,.2,.2);
    }
    else {portal.translate(-18,-30,-.67);portal.rotateY(Math.PI/2);portal.scale(.2,.2,.2);}
    portal.computeVertexNormals();
    const arch=new THREE.Mesh(portal,mesh.material);result.add(arch);
    if(geometry!==mesh.geometry)geometry.dispose();
  });
  return result;
}
