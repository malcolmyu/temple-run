/** GameController.LoadLevelInformation RVA0x126a178..0x126a220.
 * Base50; native upgrade levels1..6 map through the original jump table.
 * This native upgrade is distinct from the web's existing coin-value upgrade.
 */
export function nativeCoinBonusValue(nativeUpgradeLevel=0):number {
 return [50,50,75,100,125,150,150][Math.trunc(nativeUpgradeLevel)] ?? 50;
}
/** BonusItem.Instantiate assigns Value25 to native power types4..7.
 * CharacterPlayer.AddScore multiplies this by the run's score multiplier.
 */
export const NATIVE_POWER_SCORE_VALUE=25;
/** BonusItem.Instantiate: yellow/red/blue Value5/10/15. */
export const NATIVE_COIN_SCORE_VALUE=5;
/** LoadLevelInformation stores15 into VacuumDuration and InvincibilityDuration. */
export const NATIVE_BASE_POWER_DURATION=15;

/** Native LoadLevelInformation upgrade switches; level0 uses the base value. */
export function nativeInvincibilityDuration(level=0):number {
 return [15,15,17.5,20,22.5,25,25][Math.trunc(level)]??15;
}
export function nativeVacuumDuration(level=0):number {
 return [15,15,20,20,25,25,25][Math.trunc(level)]??15;
}
