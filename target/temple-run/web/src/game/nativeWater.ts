import * as THREE from 'three';
import plane from './nativeWaterPlane.json';
export const NATIVE_WATER_HEIGHT=plane.height;
/** GameCamera.UpdateWater RVA0x12b02e4: truncate camera position /200,
 * multiply by200 in native units. World scale0.2 makes a40-unit grid.
 * Truncation toward zero is intentional, including negative coordinates.
 */
export function nativeWaterAnchor(position:number):number {
 return Math.trunc(position/40)*40 || 0;
}
export function nativeWaterGeometry(): THREE.BufferGeometry {
 const geometry=new THREE.BufferGeometry();
 geometry.setAttribute('position',new THREE.Float32BufferAttribute(plane.positions.flat(),3));
 geometry.setAttribute('uv',new THREE.Float32BufferAttribute(plane.uv.flat(),2));
 geometry.setIndex(plane.indices);
 geometry.computeVertexNormals();
 geometry.computeBoundingBox();
 return geometry;
}
