import {SeededRandom} from './obstacles/rng';
import type {CourseFeature,CourseObstacle,CourseTurn} from './coursePlan';

/** Product design,not native probability recovery:three readable stone groups,
 * independent seeded order/length/turns,one simple action per group.
 * Opening RNG never consumes the suffix/coin/power streams. */
export function generateCourseOpening(seed:number){
 const rng=new SeededRandom(seed^0x6f70656e);
 const kinds=['treeTrip','treeJump','pit'] as const;
 const order=[...kinds];for(let i=order.length-1;i>0;i--){const j=rng.int(i+1);[order[i],order[j]]=[order[j],order[i]];}
 const turns:CourseTurn[]=[],obstacles:CourseObstacle[]=[],features:CourseFeature[]=[];
 let from=0;
 for(let i=0;i<3;i++){
  const to=(i===0?9:from)+12*(12+rng.int(4));
  const kind=order[i],mid=12*Math.round((from+to)/24),right=rng.int(2)===1;
  const prefab=kind==='pit'?'pit':kind==='treeTrip'?(right?'tree-trip-right':'tree-trip-left'):(right?'tree-jump-right':'tree-jump-left');
  obstacles.push({distance:mid,defId:kind,prefab});
  features.push({kind,from,to,surface:'stone',pathLevel:2,generatedAtProgress:0,minTurnSpaces:12,nativeStageKnown:false});
  turns.push({distance:to,direction:right?1:-1,junction:i>0&&rng.int(3)===0?'tee':'corner'});
  from=to;
 }
 return {turns,obstacles,features,extent:from};
}
