/** Cause is a stable simulation identifier, independent of localized text.
 * Presentation only; does not change collision, revive eligibility or audio kind. */
export type DeathKind='impact'|'fall'|'water'|'caught'|'missed';
export type DeathCause=DeathKind|'treeJump'|'treeSlide'|'flameTower'|'fireWall'|'plankBeam';
export function resultIllustration(kind:DeathKind|'',cause:DeathCause|''):string {
 if(cause==='flameTower'||cause==='fireWall')return 'deathIllustrationBurnt@2x.png';
 if(cause==='treeSlide'||cause==='plankBeam')return 'deathIllustrationSlide@2x.png';
 const files:Record<DeathKind,string>={impact:'deathIllustrationTree@2x.png',fall:'deathIllustrationFallA@2x.png',water:'deathIllustrationWater@2x.png',caught:'deathIllustrationEaten@2x.png',missed:'deathIllustrationWater@2x.png'};
 return (kind&&files[kind])||'deathIllustrationSlide@2x.png';
}
