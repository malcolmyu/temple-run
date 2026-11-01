import type {Action} from './input';
export type TraceCommand='pause'|'resume'|'menu'|'headStart'|'permaWings'|'angelWings'|'revive';
export type TraceEvent=
 | {kind:'frame';dt:number;frameDt:number}
 | {kind:'tick';dt:number;axis:number|null}
 | {kind:'death';dt:number}
 | {kind:'input';stage:'frame'|'tick';actions:Action[]}
 | {kind:'command';name:TraceCommand;via:'input'|'external';args?:string};
export interface RunTraceData {schema:1;header:Record<string,unknown>;events:TraceEvent[];truncated:boolean;stopReason:string;finalState:unknown;}
const copy=<T>(value:T):T=>JSON.parse(JSON.stringify(value));
const actions=new Set(['left','right','jump','slide','pause','start']);
const commands=new Set(['pause','resume','menu','headStart','permaWings','angelWings','revive']);
const delta=(n:unknown)=>typeof n==='number'&&Number.isFinite(n)&&n>0&&n<=3600;
function valid(e:TraceEvent):boolean {
 if(!e||typeof e!=='object')return false;
 if(e.kind==='frame')return delta(e.dt)&&e.dt<=.05&&delta(e.frameDt);
 if(e.kind==='tick')return delta(e.dt)&&e.dt<=.05&&(e.axis===null||typeof e.axis==='number'&&Number.isFinite(e.axis)&&Math.abs(e.axis)<=1);
 if(e.kind==='death')return delta(e.dt)&&e.dt<=.05;
 if(e.kind==='input')return ['frame','tick'].includes(e.stage)&&Array.isArray(e.actions)&&e.actions.length<=64&&e.actions.every(a=>actions.has(a));
 if(e.kind==='command')return commands.has(e.name)&&['input','external'].includes(e.via)&&(e.args===undefined||e.name==='headStart'&&['normal','mega'].includes(e.args));
 return false;
}
export function parseRunTrace(json:string):RunTraceData {
 if(json.length>8000000)throw Error('Trace too large');
 const d=JSON.parse(json) as RunTraceData;
 if(d?.schema!==1||!d.header||typeof d.header!=='object'||Array.isArray(d.header)||!Array.isArray(d.events)||d.events.length>100000||!d.events.every(valid)||typeof d.truncated!=='boolean'||typeof d.stopReason!=='string')throw Error('Invalid trace');
 return d;
}
/** Opt-in diagnostics. No automatic profile writes or playback/ledger actions. */
export class RunTrace {
 private data:RunTraceData;
 private bytes=0;
 private readonly limit:number;
 constructor(header:Record<string,unknown>,limit=50000){this.limit=Number.isFinite(limit)?Math.max(0,Math.min(100000,Math.trunc(limit))):50000;this.data={schema:1,header:copy(header),events:[],truncated:false,stopReason:'recording',finalState:null};}
 append(event:TraceEvent):void {
  if(this.data.stopReason!=='recording'||this.data.truncated)return;
  if(this.data.events.length>=this.limit||!valid(event)){this.data.truncated=true;return;}
  const encoded=JSON.stringify(event);if(this.bytes+encoded.length>2000000){this.data.truncated=true;return;}
  this.bytes+=encoded.length;this.data.events.push(JSON.parse(encoded));
 }
 finish(reason:string,state:unknown):RunTraceData {if(this.data.stopReason==='recording'){this.data.stopReason=reason;this.data.finalState=copy(state);}return this.snapshot();}
 snapshot():RunTraceData {return copy(this.data);}
}
