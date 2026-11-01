import rows from './nativeCoinRows.json';
/** Static native start/end tables and X coordinates for canonical side1.
 * Web mode enables centre,side,slant. Special predecessor predicates remain
 * in the web course eligibility adapter, not claimed as a full native port. */
export function nativeCoinRowCandidates(previousEnd:number|null,slants=true):number[]{
 return rows.filter(r=>(slants||r.id<3)&&(previousEnd===null||r.start===previousEnd)).map(r=>r.id);
}
export function nativeCoinRowEnd(row:number):number{return rows[row].end;}
export function nativeCoinRowSides(row:number,level:number):number[]{
 return rows[row].rawX.map(x=>x*.2*(level===3?.8:1));
}
