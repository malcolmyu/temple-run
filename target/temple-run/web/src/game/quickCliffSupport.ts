import * as THREE from 'three';
import {NATIVE_CLIFF_HALF_WIDTH as w,NATIVE_CLIFF_GROUND_HEIGHT as y} from './nativeCliff';
export type QuickCliffKind='straight'|'left'|'right'|'tee'|'capA'|'capB';
/** Web low-detail adapter, not recovered mesh geometry. Keep the native1.3m
 * half-width/3m support plane and the web12m cell even without rocky decoration. */
export function buildQuickCliffSupport(kind:QuickCliffKind):THREE.Mesh {
 const regions:Record<QuickCliffKind,number[][]>={
  straight:[[-w,-6],[w,-6],[w,6],[-w,6]],
  left:[[-w,6],[w,6],[w,-w],[-6,-w],[-6,w],[-w,w]],
  right:[[-w,6],[w,6],[w,w],[6,w],[6,-w],[-w,-w]],
  tee:[[-w,6],[w,6],[w,w],[6,w],[6,-w],[-6,-w],[-6,w],[-w,w]],
  capA:[[-w,1],[w,1],[w,6],[-w,6]],capB:[[-w,-6],[w,-6],[w,-1],[-w,-1]],
 };
 const points=regions[kind].map(([x,z])=>new THREE.Vector2(x,z));
 const positions=THREE.ShapeUtils.triangulateShape(points,[]).flatMap(face=>face.flatMap(i=>[points[i].x,y+.025,points[i].y]));
 const geometry=new THREE.BufferGeometry();geometry.setAttribute('position',new THREE.Float32BufferAttribute(positions,3));geometry.computeVertexNormals();
 const mesh=new THREE.Mesh(geometry,new THREE.MeshBasicMaterial({color:0x827e70,side:THREE.DoubleSide}));mesh.name='quick-native-cliff-support';mesh.userData.walkableSurface=true;return mesh;
}

type CliffSlot='cliffTile'|'cliffCornerLeft'|'cliffCornerRight'|'cliffTJunction'|'cliffCapA'|'cliffCapB';
/** Shared constructor seam used by the real world factory and coverage tests. */
export function applyQuickCliffSupport(assets:Partial<Record<CliffSlot,THREE.Group|null>>):void {
 const slots:Array<[CliffSlot,QuickCliffKind]>=[['cliffTile','straight'],['cliffCornerLeft','left'],['cliffCornerRight','right'],['cliffTJunction','tee'],['cliffCapA','capA'],['cliffCapB','capB']];
 for(const [slot,kind]of slots){const group=assets[slot]??new THREE.Group();group.add(buildQuickCliffSupport(kind));assets[slot]=group;}
}
