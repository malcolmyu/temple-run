import {SKINS} from './skins';
/** Native counts unlocked character flags,not purchases or current selection.
 * This web catalogue maps its nine available characters to that ownership rule. */
export function unlockedCharacterCount(owned:readonly string[]):number {
 const available=new Set(SKINS.map(s=>s.id));
 return new Set(owned.filter(id=>available.has(id))).size;
}
export const NATIVE_CHARACTER_OBJECTIVES = [
 {id:'character2',title:'超能双侠',detail:'解锁两个角色',target:2},
 {id:'character4',title:'奇妙四侠',detail:'解锁四个角色',target:4},
 {id:'character6',title:'火辣六人行',detail:'解锁六个角色',target:6},
] as const;
