import { COIN_Y } from './config';
import { referenceTurnDirection,REFERENCE_OPENING_TURNS } from './referenceRoute';
import { referenceWorldDistance } from './referenceCoordinates';

export interface ReferenceCoin { lane: 0 | 1 | 2; distance: number; height: number }

/** BV1ypuKzPErT 010–013: left-side run after the first corner, gone by ~114m.
 * Count/spacing/height are fitted estimates; this is not the recovered coin generator.
 * null = unreviewed turn; [] = observed turn without an automatic coin cue.
 */
export function referenceCoinsForTurn(index: number, turnDistance: number): ReferenceCoin[] | null {
  if(referenceTurnDirection(index,turnDistance)===null)return null;
  return legacyReferenceCoinsForTurn(index,REFERENCE_OPENING_TURNS[index].legacyDistance).map(coin=>({...coin,distance:referenceWorldDistance(coin.distance)}));
}

function legacyReferenceCoinsForTurn(index: number, turnDistance: number): ReferenceCoin[] {
  // 032–037: left arc over the outgoing pit, followed by a low tail.
  // Count and positions are fitted, not recovered generator parameters.
  if(index===3)return Array.from({length:16},(_,i)=>({
    lane:0, distance:turnDistance+3+i*2,
    height:COIN_Y+(i<=13?Math.sin(i/13*Math.PI)*2.4:0),
  }));
  // 019–022: low left-side row beyond the transverse root; gone by023.
  if(index===1)return Array.from({length:20},(_,i)=>({lane:0,distance:177+i*1.5,height:COIN_Y}));
  // 045–047: left jump arc, gone by048 (406m).
  if(index===4)return Array.from({length:16},(_,i)=>({
    lane:0,distance:turnDistance+1+i*1.5,
    height:COIN_Y+(i<=11?Math.sin(i/11*Math.PI)*2.4:0),
  }));
  // 054–057: jump arc and low left tail before the second pit.
  if(index===5)return Array.from({length:20},(_,i)=>({
    lane:0,distance:turnDistance+3+i*1.5,
    height:COIN_Y+(i<=13?Math.sin(i/13*Math.PI)*2.4:0),
  }));
  // 062–066: low left row followed by an arc over the final stone pit.
  if(index===6)return Array.from({length:24},(_,i)=>{
    const distance=525+i*1.5;
    return {lane:0,distance,height:COIN_Y+(distance>=537&&distance<=555?Math.sin((distance-537)/18*Math.PI)*2.4:0)};
  });
  // 072–075: low left approach row to the first wooden T.
  if(index===7)return [
    ...Array.from({length:14},(_,i)=>({lane:0 as const,distance:600+i*1.5,height:COIN_Y})),
    ...Array.from({length:16},(_,i)=>({lane:0 as const,distance:624+i*1.5,height:COIN_Y+Math.sin(i/15*Math.PI)*2.4})),
    ...Array.from({length:6},(_,i)=>({lane:0 as const,distance:648+i*1.5,height:COIN_Y})),
  ];
  if(index===8)return [
    ...Array.from({length:20},(_,i)=>({lane:0 as const,distance:700+i*1.5,height:COIN_Y})),
    // 092..095: right-side low run beyond the fourth wooden beam.
    ...Array.from({length:20},(_,i)=>({lane:2 as const,distance:778+i*1.5,height:COIN_Y})),
  ];
  // 100..103: left low run between/beyond the next pair of beams.
  if(index===9)return Array.from({length:22},(_,i)=>({lane:0,distance:856+i*1.5,height:COIN_Y}));
  if(index===10)return Array.from({length:22},(_,i)=>({lane:2,distance:960+i*1.5,height:COIN_Y}));
  if(index===21)return Array.from({length:22},(_,i)=>({lane:2,distance:1360+i*1.5,
    height:COIN_Y+Math.sin(i/21*Math.PI)*2.4}));
  if(index===22)return [
    ...Array.from({length:20},(_,i)=>({lane:0 as const,distance:1428+i*1.5,height:COIN_Y})),
    ...Array.from({length:26},(_,i)=>({lane:2 as const,distance:1500+i*1.5,height:COIN_Y+(i>=17?Math.sin((i-17)/8*Math.PI)*2.4:0)})),
  ];
  if(index===23)return Array.from({length:13},(_,i)=>({lane:0,distance:1565+i*1.5,height:COIN_Y}));
  if(index===24)return Array.from({length:14},(_,i)=>({lane:2,distance:1588+i*1.5,height:COIN_Y}));
  if(index===25)return Array.from({length:17},(_,i)=>({lane:0,distance:1686+i*1.5,
    height:COIN_Y+(i<=10?Math.sin(i/10*Math.PI)*2.4:0)}));
  if(index===26)return Array.from({length:13},(_,i)=>({lane:0,distance:1714+i*1.5,height:COIN_Y}));
  if(index===27)return Array.from({length:26},(_,i)=>{const distance=1750+i*1.5;
    return{lane:0,distance,height:COIN_Y+(distance>=1775?Math.sin((distance-1775)/12.5*Math.PI)*2.4:0)};});
  if(index===28)return Array.from({length:22},(_,i)=>{const distance=1794+i*1.5;
    return{lane:0,distance,height:COIN_Y+(distance>=1813?Math.sin((distance-1813)/12.5*Math.PI)*2.4:0)};});
  if(index===29)return Array.from({length:18},(_,i)=>({lane:0,distance:1833+i*1.5,height:COIN_Y+Math.sin(i/17*Math.PI)*2.4}));
  if(index===30)return Array.from({length:18},(_,i)=>({lane:2,distance:1896+i*1.5,height:COIN_Y}));
  if(index===31)return Array.from({length:20},(_,i)=>({lane:0,distance:1967+i*1.5,height:COIN_Y+Math.sin(i/19*Math.PI)*2.4}));
  if(index===32)return Array.from({length:26},(_,i)=>{const distance=2027+i*1.5;
    return{lane:0,distance,height:COIN_Y+(distance>=2045?Math.sin((distance-2045)/19*Math.PI)*2.4:0)};});
  if(index===33)return Array.from({length:19},(_,i)=>({lane:0,distance:2102+i*1.5,height:COIN_Y+Math.sin(i/18*Math.PI)*2.4}));
  if(index===34)return Array.from({length:29},(_,i)=>({lane:0,distance:2146+i*1.5,height:COIN_Y}));
  if(index===35)return Array.from({length:7},(_,i)=>({lane:0,distance:2192+i*1.5,height:COIN_Y}));
  if(index===36)return Array.from({length:8},(_,i)=>({lane:2,distance:2205+i*1.5,height:COIN_Y}));
  if(index===37)return Array.from({length:9},(_,i)=>({lane:2,distance:2219+i*1.5,height:COIN_Y}));
  if(index===38)return Array.from({length:7},(_,i)=>({lane:2,distance:2235+i*1.5,height:COIN_Y}));
  if(index===40)return Array.from({length:22},(_,i)=>({lane:0,distance:2274+i*1.5,height:COIN_Y}));
  if(index===41)return Array.from({length:30},(_,i)=>({lane:2,distance:2344+i*1.5,height:COIN_Y}));
  const shortRuns:Record<number,{from:number;count:number;lane:0|2}>={
    11:{from:1058,count:12,lane:2},12:{from:1084,count:11,lane:2},
    13:{from:1106,count:11,lane:0},14:{from:1130,count:10,lane:2},
    15:{from:1150,count:9,lane:2},16:{from:1168,count:11,lane:2},
    17:{from:1190,count:10,lane:2},18:{from:1210,count:12,lane:0},
    19:{from:1234,count:11,lane:0},20:{from:1256,count:19,lane:0},
  };
  const run=shortRuns[index];
  if(run)return Array.from({length:run.count},(_,i)=>({lane:run.lane,distance:run.from+i*1.5,
    height:COIN_Y+(index===20?Math.sin(i/(run.count-1)*Math.PI)*2.4:0)}));
  if(index!==0)return [];
  return Array.from({length:14},(_,i)=>({
    lane:0, distance:turnDistance+3+i*2,
    height:COIN_Y+Math.sin(i/13*Math.PI)*2.4,
  }));
}
