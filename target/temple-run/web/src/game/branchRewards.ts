import {SeededRandom} from './obstacles/rng';
export interface BranchReward {kind:'coin'|'gem';branch:'left'|'right';distance:number;side:number;}
/** Web reward choice,not a recovered native distribution. Rewards stay in the
 * fully separated middle12m of the current36m lateral fork. Both arms are safe;
 * no claim of an added hazard/risk difference between arms. */
export function branchRewards(seed:number,from:number,to:number):BranchReward[]{
 const rng=new SeededRandom(seed^Math.imul(Math.round(from),0x45d9f3b)^0x72657764);
 const special=rng.int(2)===0?'left':'right',gem=rng.int(3)===0;
 const mid=(from+to)/2,out:BranchReward[]=[];
 for(const branch of ['left','right'] as const){
  const side=branch==='left'?-1.9:1.9;
  if(branch===special&&gem)out.push({kind:'gem',branch,distance:mid,side});
  else{
   const count=branch===special?9:5;
   for(let i=0;i<count;i++)out.push({kind:'coin',branch,distance:mid-4+8*i/(count-1),side});
  }
 }
 return out;
}
