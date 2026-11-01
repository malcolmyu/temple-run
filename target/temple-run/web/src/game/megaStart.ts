import {NATIVE_UTILITY_PRICES} from './nativeStorePrices';
/** Scene defaults:HeadStartBoostDistance950,HeadStartMegaBoostDistance2350.
 * UseHeadStart/UseHeadStartMega subtract current metric progress and both pass false
 * to CharacterPlayer.StartBoost. Store purchases inventory; activation uses the native window. */
export const HEAD_START_PRICE=NATIVE_UTILITY_PRICES.headStart;
export const HEAD_START_PROGRESS=950;
export const MEGA_START_PRICE=NATIVE_UTILITY_PRICES.megaStart;
export const MEGA_START_PROGRESS=2350;

export const headStartWindow=(distance:number):boolean=>distance>25&&distance<100;
