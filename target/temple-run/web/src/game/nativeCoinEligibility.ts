import source from './nativeCoinEligibility.json';
/** AddCoins12e4dd4..4e10,metadata private fieldF4E93B...:all four T types. */
export function nativePathTypeAllowsCoins(type:number):boolean {
 return !source.excludedPathTypes.includes(type);
}
