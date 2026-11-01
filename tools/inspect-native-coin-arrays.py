"""Static coin arrays/counter audit; never loads native executable code."""
import sys,struct,json,hashlib,subprocess
from pathlib import Path
reader=Path(__file__).with_name('inspect-native-runtime-methods.py');n={'__file__':str(reader)}
exec(compile(reader.read_text().split('for typeName,methodName in ')[0],str(reader),'exec'),n)
b,off=n['binary'],n['off']
checks={0x12e54a0:0x71000d1f,0x12e54b4:0x3868692b,0x12e54d8:0x1e373002,0x12e54fc:0x1e353002,0x12e55ec:0x1e2703e2,0x12e5608:0x1e253000,0x12e562c:0x1e273000,0x12e58d0:0x97fff3f8,0x12e58dc:0xb9404b68,0x12e58e0:0x7100051f,0x12e58e4:0x54000341,0x12e567c:0x7100191f,0x12e5684:0x52800041,0x12e5688:0x2a1f03e0,0x12e5690:0x94473a16,0x12e5694:0x34000120,0x12e56a4:0x7100191f,0x12e56d0:0x39405508,0x12e56d4:0x34fffe28,0x12e5670:0x54000200,0x12e5678:0x540001c0,0x12e56e0:0x1e265000,0x12e56e8:0x52a84189,0x12e5700:0x1e211002,0x12e570c:0x1e229000,0x12e5d88:0xbd402be0,0x12e5d98:0x4ea91d20,0x12e5da0:0xbd4023e0,0x12e5db0:0x4ea81d00,0x12e5dbc:0x4eac1d80,0x12e6730:0x3940f668,0x12e6738:0xb9408a88,0x12e6740:0x11000515,0x12e6744:0xb9008a75,0x12e6764:0xb9404108,0x12e676c:0x5400010a,0x12e6770:0xb9408688,0x12e677c:0xb9008a7f,0x12e6780:0x11000508,0x12e6784:0xb9008668,0x12e678c:0xb900867f,0x12e5348:0x1e373002,0x12e536c:0x1e353002,0x12e5390:0x1e2703e2,0x12e53b4:0x1e253002,0x12e53d8:0x1e273002,0x12e564c:0x1e265001,0x12e565c:0x1e351001}
for a,v in checks.items():assert struct.unpack_from('<I',b,off(a))[0]==v,(hex(a),hex(v))
ti,t=next((i,t)for i,t in enumerate(n['ts'])if n['st'](t[0])=='PathElement');ptr=n['r'][n['r'][0x27d43f0]+ti*8];fields={}
for j,i in enumerate(range(t[8],t[8]+t[18])):
 name=n['st'](struct.unpack_from('<3i',n['m'],n['h'][24]+i*12)[0]);v=struct.unpack_from('<i',b,off(ptr+j*4))[0]
 if v in [0x3d,0x44,0x48,0x84,0x88]:fields[name]=hex(v)
assert fields.get('HasCoins')=='0x3d',fields
out=Path('target/temple-run/analysis/native-coin-arrays');out.mkdir(exist_ok=True)
for name,a,e in [('UpdatePathDescription',0x12e664c,0x12e681c),('AddCoins',0x12e4bf4,0x12e5f14)]:
 (out/(name+'.asm')).write_text(subprocess.run(['/usr/bin/objdump','-d','--start-address='+hex(a),'--stop-address='+hex(e),sys.argv[2]],capture_output=True,text=True,check=True).stdout)
tables={hex(a):list(struct.unpack_from('<7f',b,off(a)))for a in [0x6b7ca8,0x6b7cc4,0x6b7ce0,0x6b7cfc,0x6b7d18]}
for values in tables.values():assert values[:3]==[0,7,-7]
cliffScale=struct.unpack_from('<f',b,off(0x69755c))[0];assert abs(cliffScale-.8)<1e-6
starts=list(struct.unpack_from('<7i',b,off(0x6b7c70)));ends=list(struct.unpack_from('<7i',b,off(0x6b7c8c)))
assert starts==[1,2,3,1,3,1,2]and ends==[1,2,3,2,1,3,1]
rows=[dict(id=i,start=starts[i],end=ends[i],rawX=[-tables[hex(a)][i]for a in [0x6b7d18,0x6b7cfc,0x6b7ce0,0x6b7cc4,0x6b7ca8]])for i in range(7)]
assert json.loads(Path('target/temple-run/web/src/game/nativeCoinRows.json').read_text())==rows
cornerDispatch=list(b[off(0x6b7c55):off(0x6b7c55)+4]);assert cornerDispatch==[0,17,34,51]
record=dict(cornerTypes=[3,4,5,6],cornerDispatch=cornerDispatch,cornerPathOffsetsWorld=[-5,-2.5,0,2.5,5],cornerGate='IsTurn requires previous CoinRowEnd1;otherwise created coins are removed;counter/spacing gates still apply',cornerAdapter='Runtime merges turn node with straight stream;overlapping web grid cells within11m omitted;T geometry incomplete',coinRows=rows,parallelRowsRaw=[0,-7,7],cliffSideScale=cliffScale,sideTables=tables,sideMode='Web enables all7 rows and links adjacent emitted cells by native start/end enums;special predicates and remote enables incomplete',binarySHA256=hashlib.sha256(b).hexdigest(),fields=fields,straightOffsetsRaw=[-25,-12.5,0,12.5,25],worldOffsets=[-5,-2.5,0,2.5,5],flatRootRaw={'temple':3,'wood':-12,'cliff':18},treeJumpTripRelativeRoots=[3.6,4,4,4,3.6],treeJumpTripRawLowHigh={"temple":[18,20],"wood":[3,5],"cliff":[33,35]},treeSlideRelativeRoots=[.6]*5,worldScale=.2,flameRule="Obstacle6 Range(0,2):0 low;1 high only if sAllowJumpCoins;web enables jump coins,remote enable unknown",counterRule='HasCoins increments previous CoinRunCount;below maximum preserves SpacesSinceLastCoinRun;maximum resets spaces0.No coins resets count0 and increments spaces.',limits=['Eligibility,cell grid and obstacle exclusion use a web adapter.','Native tree jump/trip high row and slide low row integrated;all7 side rows integrated;corner,special predecessor/obstacle predicates and native random sequence incomplete.','Remote config may alter static defaults.'],instructionChecks={hex(a):hex(v)for a,v in checks.items()})
(out/'source.json').write_text(json.dumps(record,indent=2));print(json.dumps(record,indent=2))
