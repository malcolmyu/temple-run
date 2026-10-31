import type {NativePathLevel} from './nativeThemePacing';
export type NativeTransitionCap='stoneA'|'stoneB'|'cliffA'|'cliffB';
/** GetRandomPathElementForSide12e486c..12e4a88.
 * Plank uses ordinary full tiles;temple/cliff cap pairs depend on both levels. */
export function nativeThemeCaps(from:NativePathLevel,to:NativePathLevel):{departure:NativeTransitionCap|null;arrival:NativeTransitionCap|null} {
 if(from===2&&to===1)return {departure:'stoneA',arrival:null};
 if(from===1&&to===2)return {departure:null,arrival:'stoneB'};
 if(from===2&&to===3)return {departure:'stoneA',arrival:'cliffB'};
 if(from===3&&to===2)return {departure:'cliffA',arrival:'stoneB'};
 if(from===3&&to===1)return {departure:'cliffA',arrival:null};
 return {departure:null,arrival:null};
}
/** Offsets follow the existing web12m cell centres and native support polygons. */
export function transitionSupportOffsets(from:NativePathLevel,to:NativePathLevel):{oldEnd:number;newStart:number} {
 const caps=nativeThemeCaps(from,to);
 return {oldEnd:caps.departure==='cliffA'?-13:caps.departure==='stoneA'?-12:-6,
  newStart:caps.arrival==='cliffB'?1:caps.arrival==='stoneB'?0:-6};
}
