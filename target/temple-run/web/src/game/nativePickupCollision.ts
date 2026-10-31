import source from './nativePickupCollision.json';
/** Relative point from runner transform to pickup. Native player bounds stay fixed while sliding. */
export function nativePickupWithinReach(kind:string,value:number,dx:number,dy:number,dz:number):boolean {
 const key=kind==='coin'?(value===1?'yellow':value===2?'red':'blue'):kind;
 const radius=source.radii[key as keyof typeof source.radii];
 if(radius===undefined)return false;
 const p=[dx,dy,dz];let squared=0;
 for(let i=0;i<3;i++){
  const outside=Math.max(source.boundsMin[i]-p[i],0,p[i]-source.boundsMax[i]);
  squared+=outside*outside;
 }
 return squared<=radius*radius;
}
