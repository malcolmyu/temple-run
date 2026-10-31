/** PlayerConfigData..ctor12a1df4 and get_ResurrectionBoostDistance12725e4. */
export const RESURRECTION_BOOST_PROGRESS=150;
/** CharacterPlayer.Resurrect1298dd0..1298e20; StartBoost adds another10. */
export const RESURRECTION_STUMBLE_AGE=10;
/** Default config literal697dcc; GameController.ResurrectPlayer126daf0..126daf8. */
export const RESURRECTION_SLOWDOWN=0.8500000238418579;
export function resurrectionSpeed(deathSpeed:number,startSpeed=20):number {
 return Math.max(startSpeed,deathSpeed*RESURRECTION_SLOWDOWN);
}
