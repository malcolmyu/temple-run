/** Web player-facing names; collision action flags and death kinds stay in the
 * simulation. A fatal contact names the actual obstacle, not a guessed input. */
export function obstacleImpactReason(id:string):string {
 switch(id){
  case 'treeJump':return '撞上了树根';
  case 'treeSlide':return '撞上了树洞拱门';
  case 'flameTower':return '撞上了火塔';
  case 'fireWall':return '撞上了火墙';
  case 'plankBeam':return '撞上了木桥横梁';
  default:return '撞上了路障';
 }
}
