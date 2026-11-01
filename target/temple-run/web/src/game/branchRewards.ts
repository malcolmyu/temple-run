import {SeededRandom} from './obstacles/rng';
export interface BranchReward {kind:'coin'|'gem';branch:'left'|'right';distance:number;side:number;}
export function branchRewardChoice(seed:number,from:number){
 const rng=new SeededRandom(seed^Math.imul(Math.round(from),0x45d9f3b)^0x72657764);
 return {special:rng.int(2)===0?'left' as const:'right' as const,gem:rng.int(3)===0};
}
/** Web reward choice,not a recovered native distribution. Rewards stay in the
 * fully separated middle of a lateral fork. Long normal forks put rewards
 * after the risky arm jump; short opening/fixture forks retain safe choices. */
export function branchRewards(seed:number,from:number,to:number):BranchReward[]{
 const {special,gem}=branchRewardChoice(seed,from);
 const mid=(from+to)/2+(to-from>=132?36:0),out:BranchReward[]=[];
 for(const branch of ['left','right'] as const){
  const side=branch==='left'?-1.3:1.3;
  if(branch===special&&gem)out.push({kind:'gem',branch,distance:mid,side});
  else{
   const count=branch===special?9:5;
   for(let i=0;i<count;i++)out.push({kind:'coin',branch,distance:mid-4+8*i/(count-1),side});
  }
 }
 return out;
}
