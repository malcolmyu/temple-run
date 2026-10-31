/** PathLevel enum:1 plank,2 temple,3 cliff. HandlePacing126eb24..58,
 * ChangeLevel1272cc8..2d64. Thresholds are metric progress, not physical metres. */
export type NativePathLevel=1|2|3;
export function nativeThemeThresholds(progress:number):{temple:number;other:number} {
 return progress>=4500?{temple:375,other:300}:progress>=1000?{temple:450,other:250}:{temple:500,other:200};
}
export function nextNativeTheme(level:NativePathLevel,roll:()=>number):NativePathLevel {
 if(level===1)return 2;
 return level===2?(roll()===0?1:3):(roll()===0?2:1);
}
export class NativeThemePacing {
 level:NativePathLevel=2;
 elapsed=0;
 advance(delta:number,progress:number,roll:(limit:number)=>number):NativePathLevel|null {
  this.elapsed=Math.fround(this.elapsed+Math.fround(delta));
  const thresholds=nativeThemeThresholds(progress);
  if(this.elapsed<=(this.level===2?thresholds.temple:thresholds.other))return null;
  this.elapsed=0;
  if(roll(4)>2)return null;
  this.level=nextNativeTheme(this.level,()=>roll(2));return this.level;
 }
}
