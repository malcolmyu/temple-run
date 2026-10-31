import { SeededRandom } from './obstacles/rng';
import { MIN_BONUS_ITEM_SPACING, PATH_GRID_METERS } from './pathRules';
export const BONUS_KINDS = ['bonus','shield','magnet','boost'] as const;
export type BonusKind = typeof BONUS_KINDS[number];
export type BonusAvailability = Record<BonusKind,number>;
/** Runtime config has not been recovered. Enable all requested mechanics in the web game. */
export const WEB_BONUS_AVAILABILITY: BonusAvailability = {bonus:1,shield:1,magnet:1,boost:1};
/** PathElement.AddBonusItems12e6100..62b0: positive values enable candidates;
 * a Range(0,2)==0 gate precedes a uniform Range(0,candidateCount).
 * Numeric magnitudes are NOT weights in this method.
 */
export function selectNativeBonus(config:BonusAvailability,rng:Pick<SeededRandom,'int'>):BonusKind|null {
 const enabled=BONUS_KINDS.filter(kind=>config[kind]>0);
 if(!enabled.length||rng.int(2)!==0)return null;
 return enabled[rng.int(enabled.length)];
}
export class BonusSpawnDirector {
 next=MIN_BONUS_ITEM_SPACING+PATH_GRID_METERS;
 last=0;
 constructor(readonly rng:SeededRandom,readonly config=WEB_BONUS_AVAILABILITY){}
 /** Consume one grid opportunity. Unsafe cells consume no random draws. */
 attempt(safe:boolean):{distance:number;kind:BonusKind}|null {
  const distance=this.next;this.next+=PATH_GRID_METERS;
  if(!safe||distance-this.last<=MIN_BONUS_ITEM_SPACING)return null;
  const kind=selectNativeBonus(this.config,this.rng);
  if(!kind)return null;
  this.last=distance;return {distance,kind};
 }
 skipTo(distance:number):void {
  this.last=distance;
  this.next=PATH_GRID_METERS*Math.ceil((distance+MIN_BONUS_ITEM_SPACING+PATH_GRID_METERS)/PATH_GRID_METERS);
 }
}
