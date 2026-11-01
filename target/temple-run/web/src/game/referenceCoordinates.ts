import calibration from './referenceWorldCalibration.json';
/** Convert old score/20 authoring estimates to approximate physical length.
 * Source interval speeds are RMS estimates, not recovered exact path lengths.
 * This conversion is for authoring only; runtime scoring uses actual movement.
 */
export function referenceWorldDistance(legacy:number):number {
 if(!Number.isFinite(legacy)||legacy<=0)return legacy;
 const knots=calibration.knots;
 let low=1,high=knots.length-1;
 while(low<high){const middle=(low+high)>>1;if(knots[middle][0]<legacy)low=middle+1;else high=middle;}
 const a=knots[low-1],b=knots[low];
 return a[1]+(b[1]-a[1])*(legacy-a[0])/(b[0]-a[0]);
}
export const referenceJunctionDistance=(legacy:number):number=>9+12*Math.round((referenceWorldDistance(legacy)-9)/12);
export const referenceTileDistance=(legacy:number):number=>12*Math.round(referenceWorldDistance(legacy)/12);
