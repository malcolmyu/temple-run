import * as THREE from 'three';
import {nativeEnemyFormation} from './chasePresentation';
interface PursuitRig {object:THREE.Object3D;setTime:(t:number,loop:boolean)=>void;}
/** Replace children only: chase anchor, heading and scale belong to the current run. */
export function mountPursuitRigs(group:THREE.Group,rigs:readonly PursuitRig[],elapsed:number,jumps:readonly {y:number}[],syncPhase=false):void {
 group.clear();
 if(rigs.length!==8)return; // No geometric stand-in, including after a failed request.
 const pack=new THREE.Group();pack.name='native-pursuit-pack';
 rigs.forEach((rig,i)=>{
  const monkey=new THREE.Group(),formation=nativeEnemyFormation(i);
  monkey.name=`native-pursuer-${i}`;monkey.position.set(formation.side,jumps[i]?.y??0,formation.behind);
  monkey.visible=i<3||elapsed<3;
  if(syncPhase)rig.setTime(elapsed+i*.11,true);
  monkey.add(rig.object);pack.add(monkey);
 });
 group.add(pack);
}
