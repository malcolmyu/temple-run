import { nativeInvincibilityDuration } from './nativeCoinBonus';
/** Both recorded effects last25s (145.6..170.6 and181.6..206.6): native levels5/6, indistinguishable here. */
export const REFERENCE_SHIELD_DURATION=nativeInvincibilityDuration(5);
import { referenceWorldDistance } from './referenceCoordinates';
import type { PickupKind } from './components';
import { referenceTurnDirection } from './referenceRoute';

/** 034–037: native pickupCoinBonus visible on the left; outside the visible view by 038 (325m).
 * Fitted position/height, not recovered Unity spawn parameters.
 */
export function referencePickupsForTurn(index: number, distance: number): Array<{
 kind: PickupKind; lane: number; distance: number; height: number;
}> {
 if(referenceTurnDirection(index,distance)===null)return [];
 if(index===3)return [{kind:'bonus',lane:0,distance:referenceWorldDistance(329),height:3}];
 if(index===20)return [{kind:'shield',lane:1,distance:referenceWorldDistance(1290),height:3}];
 if(index===24)return [{kind:'shield',lane:1,distance:referenceWorldDistance(1637),height:3}];
 if(index===30)return [{kind:'bonus',lane:1,distance:referenceWorldDistance(1937),height:3}];
 return [];
}
