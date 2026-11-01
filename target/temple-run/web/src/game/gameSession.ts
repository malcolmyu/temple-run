import type {Phase} from './components';

type Run = {id:string;committed:boolean;gemReviveUsed:boolean;deaths:number;wingRevives:number;gemRevives:number};
/** Owns one run's lifecycle;presentation and world reset do not create identities.
 * Settlement is synchronous and guarded before invoking the ledger (reentry safe).
 * Persistence/unfinished-run recovery is deliberately owned by Progression. */
export class GameSession {
  private phaseValue:Phase='menu';
  private run:Run|null=null;
  private lastCommittedId:string|null=null;
  constructor(private readonly createId:()=>string=()=>crypto.randomUUID()){}
  get phase():Phase{return this.phaseValue;}
  get gemReviveAvailable():boolean{return this.phaseValue==='ended'&&!!this.run&&!this.run.committed&&!this.run.gemReviveUsed;}
  get wingRevives():number{return this.run?.wingRevives??0;}
  snapshot(){return {phase:this.phaseValue,runId:this.run?.id??null,committed:this.run?.committed??false,gemReviveUsed:this.run?.gemReviveUsed??false,deaths:this.run?.deaths??0,wingRevives:this.wingRevives,gemRevives:this.run?.gemRevives??0,lastCommittedRunId:this.lastCommittedId};}
  start():void {
    this.run={id:this.createId(),committed:false,gemReviveUsed:false,deaths:0,wingRevives:0,gemRevives:0};
    this.phaseValue='playing';
  }
  pause():boolean {if(this.phaseValue!=='playing')return false;this.phaseValue='paused';return true;}
  resume():boolean {if(this.phaseValue!=='paused')return false;this.phaseValue='playing';return true;}
  die():boolean {
    if(this.phaseValue!=='playing'||!this.run)return false;
    this.run.deaths++;this.phaseValue='dying';return true;
  }
  finishDeath():boolean {if(this.phaseValue!=='dying')return false;this.phaseValue='ended';return true;}
  revive(kind:'wing'|'gem'):boolean {
    if(!this.run||this.run.committed)return false;
    if(kind==='wing'){
      if(this.phaseValue!=='dying')return false;
      this.run.wingRevives++;
    }else{
      if(!this.gemReviveAvailable)return false;
      this.run.gemReviveUsed=true;this.run.gemRevives++;
    }
    this.phaseValue='playing';return true;
  }
  commit(distance:number,apply:(runId:string)=>void):boolean {
    const run=this.run;
    if(this.phaseValue!=='ended'||!run||run.committed||!Number.isFinite(distance)||distance<=0)return false;
    run.committed=true;
    try{apply(run.id);this.lastCommittedId=run.id;return true;}
    catch(error){run.committed=false;throw error;}
  }
  toMenu():void {this.phaseValue='menu';this.run=null;}
}
