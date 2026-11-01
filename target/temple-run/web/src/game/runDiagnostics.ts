/** Local, bounded death diagnostics. Recording is on by default; no network traffic. */
export const DIAGNOSTIC_KEY='temple.v2.death-diagnostics';
export interface DiagnosticDeath {schema:1;recordedAt:string;header:Record<string,unknown>;death:Record<string,unknown>;recent:unknown[];inputs:unknown[];events?:unknown[];scene:unknown;}
interface StoragePort {getItem(key:string):string|null;setItem(key:string,value:string):void;}
const clone=<T>(value:T):T=>JSON.parse(JSON.stringify(value));
function localStore():StoragePort|null {try{return globalThis.localStorage??null;}catch{return null;}}
export class RunDiagnostics {
 private header:Record<string,unknown>={};
 private samples:unknown[]=[];
 private inputs:unknown[]=[];
 private events:unknown[]=[];
 private nextSample=0;
 private saved:DiagnosticDeath[]=[];
 constructor(private storage:StoragePort|null=localStore()) {
  try {const raw=storage?.getItem(DIAGNOSTIC_KEY);if(raw&&raw.length<2000000){const d=JSON.parse(raw);if(Array.isArray(d))this.saved=d.filter(x=>x?.schema===1&&Array.isArray(x.recent)&&Array.isArray(x.inputs)).slice(-3);}}catch{/* A corrupt or unavailable diagnostic store must not affect gameplay. */}
 }
 start(header:Record<string,unknown>):void {this.header=clone(header);this.samples=[];this.inputs=[];this.events=[];this.nextSample=0;}
 event(time:number,name:string,details:unknown):void {this.events.push({time,name,details:clone(details)});if(this.events.length>32)this.events.shift();}
 input(time:number,action:string,stage:string):void {this.inputs.push({time,action,stage});if(this.inputs.length>100)this.inputs.shift();}
 sample(time:number,state:unknown|(()=>unknown)):void {if(time<this.nextSample)return;this.nextSample=time+.25;this.samples.push(clone(typeof state==='function'?state():state));if(this.samples.length>80)this.samples.shift();}
 death(death:Record<string,unknown>,scene:unknown):void {
  try {const record:DiagnosticDeath={schema:1,recordedAt:new Date().toISOString(),header:clone(this.header),death:clone(death),recent:clone(this.samples),inputs:clone(this.inputs),events:clone(this.events),scene:clone(scene)};this.saved.push(record);this.saved=this.saved.slice(-3);let encoded=JSON.stringify(this.saved);while(encoded.length>1500000&&this.saved.length>1){this.saved.shift();encoded=JSON.stringify(this.saved);}if(encoded.length<=1500000)try{this.storage?.setItem(DIAGNOSTIC_KEY,encoded);}catch{/* Keep the in-memory log when storage is full. */}}catch{/* Diagnostics never prevent the death/settlement flow. */}
 }
 read():DiagnosticDeath[]{return clone(this.saved);}
}
