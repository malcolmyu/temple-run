"""Static candidate postprocessing audit. No native execution.
Usage: python3 tools/inspect-native-path-postprocess.py BASE.apk libil2cpp.so
"""
import struct,json,hashlib,subprocess,sys
from pathlib import Path
p=Path(__file__).with_name('inspect-native-runtime-methods.py');n={'__file__':str(p)}
exec(compile(p.read_text().split('for typeName,methodName in ')[0],str(p),'exec'),n)
b,m,h,r,off=n['binary'],n['m'],n['h'],n['r'],n['off']
start,end=0x12e3e48,0x12e4bf4;methodHash=hashlib.sha256(b[off(start):off(end)]).hexdigest()
assert methodHash=='a28aaefa8dbe9bddaaf3c8b4fa5cb7f4f033810181d3df1838cf22180f688f8f'
word=lambda a:struct.unpack_from('<I',b,off(a))[0]
checks={0x12e4910:0x11000d09,0x12e4930:0x71000d3f,0x12e4938:0x7100051f,0x12e4944:0x71003adf,0x12e4950:0x71002edf,0x12e4964:0x7100051f,0x12e496c:0x71003adf,0x12e4974:0x71002edf,0x12e497c:0x71002f1f,0x12e4984:0x71003b1f,0x12e4998:0x528001e9,0x12e49a8:0x52800218,0x12e49bc:0x52800189,0x12e49cc:0x528001b8,0x12e49d8:0x52800209,0x12e49e8:0x528001f8,0x12e49f4:0x528001a9,0x12e4a04:0x52800198,0x12e4ab0:0x2913601a}
for a,v in checks.items():assert word(a)==v,(hex(a),hex(word(a)))
def target(a):
 v=word(a)&0x3ffffff
 return a+4*(v-(1<<26)if v&(1<<25)else v)
assert all(target(a)==0x12e1c18 for a in [0x12e49a4,0x12e49c8,0x12e49e4,0x12e4a00])
assert [target(a)for a in [0x12e4a88,0x12e4ac8,0x12e4ae0,0x12e4aec,0x12e4b28,0x12e4b34,0x12e4b3c]]==[0x12e1958,0x12e2934,0x12e4bf4,0x12e5f14,0x12e6348,0x12e664c,0x12e681c]
ti,t=next((i,t)for i,t in enumerate(n['ts'])if n['st'](t[0])=='PathElement');ptr=r[r[0x27d43f0]+ti*8];fields={};methods={}
for j,i in enumerate(range(t[8],t[8]+t[18])):
 name=n['st'](struct.unpack_from('<3i',m,h[24]+i*12)[0]);fields[name]=struct.unpack_from('<i',b,off(ptr+j*4))[0]
assert {k:fields[k]for k in ['Type','Level','Obstacles','OriginalPick','FinalPick']}=={'Type':0x30,'Level':0x34,'Obstacles':0x38,'OriginalPick':0x98,'FinalPick':0x9c}
for i in range(t[9],t[9]+t[16]):
 d=struct.unpack_from('<7i4H',m,h[12]+i*36);a=r.get(n['methods']+8*((d[6]&0xffffff)-1))
 if a in [0x12e1958,0x12e1c18,0x12e2934,0x12e6348,0x12e664c,0x12e681c]:methods[hex(a)]=n['st'](d[0])
assert methods=={'0x12e1958':'Instantiate','0x12e1c18':'SetupTerrain','0x12e2934':'AddObstacle','0x12e6348':'AddSafteyNet','0x12e664c':'UpdatePathDescription','0x12e681c':'UpdateCachedComponents'}
defaults={struct.unpack_from('<3i',m,a)[0]:struct.unpack_from('<3i',m,a)[2]for a in range(h[16],h[16]+h[17],12)}
t=next(t for t in n['ts']if n['st'](t[0])=='ObstacleType');enums={}
for i in range(t[8],t[8]+t[18]):
 name=n['st'](struct.unpack_from('<3i',m,h[24]+i*12)[0])
 if name=='value__':continue
 v=m[h[18]+defaults[i]];assert v<128 and v%2==0;enums[name]=v//2
assert enums['kObstacleHole']==1 and enums['kObstacleNarrow']==2
reverse=struct.unpack_from('<4i',b,off(0x698130));assert reverse==(3,4,1,2)
# ACertainTypeCheck is exactly same long-narrow family membership, with four
# 3-member groups. Decode the table; do not guess a broader semantic name.
assert [word(a)for a in [0x12e3df4,0x12e3df8,0x12e3e18,0x12e3e20,0x12e3e28,0x12e3e30,0x12e3e34,0x12e3e38]]==[0x51004c48,0x71002d1f,0x51004c28,0x51005828,0x51006428,0x51007028,0x71000d1f,0x1a9f27e0]
familyHash=hashlib.sha256(b[off(0x12e3df4):off(0x12e3e48)]).hexdigest()
assert familyHash=='51624f70c11c7a1beed6ac173164571c72a97b5c7e435c97bb77f6d8d3f6675b'
familyTargets=[0x12e3e18+4*v for v in b[off(0x6b7c49):off(0x6b7c49)+12]]
assert familyTargets==[0x12e3e18]*3+[0x12e3e20]*3+[0x12e3e28]*3+[0x12e3e30]*3
record={'binarySHA256':hashlib.sha256(b).hexdigest(),'metadataSHA256':hashlib.sha256(m).hexdigest(),'method':{'start':hex(start),'end':hex(end),'sha256':methodHash},'fieldOffsets':{k:hex(fields[k])for k in ['Type','Level','Obstacles','OriginalPick','FinalPick']},'resolvedMethods':methods,'obstacleEnums':enums,
 'longHoleRewrite':{'conditions':['parent.Obstacles==kObstacleHole(1)','parent.Type is single hole11 or14','final candidate is single hole11 or14; level3 additionally forces final candidate to parent single-hole orientation before this check'], 'validSides':[{'side':1,'orientation':'north','mutatedParentType':12,'newType':13},{'side':2,'orientation':'east','mutatedParentType':15,'newType':16},{'side':3,'orientation':'south','mutatedParentType':13,'newType':12},{'side':4,'orientation':'west','mutatedParentType':16,'newType':15}], 'effect':'parent Type+Level rewritten and SetupTerrain called before new final prefab Instantiate'},
 'traceFields':'new element stores OriginalPick=w26 candidate pool result and FinalPick=w24 postprocessed type at0x12e4ab0',
 'publicationCalls':['Instantiate(finalType,level)','assign obstacle category directly or AddObstacle','conditionally AddCoins/AddBonusItems','AddSafteyNet(oppositeSide)','UpdatePathDescription(parent)','UpdateCachedComponents'],
 'ACertainTypeCheck':{'groups':[[19,20,21],[22,23,24],[25,26,27],[28,29,30]],'meaning':'true exactly when both integer arguments fall in the same listed family; false otherwise','tableAddress':'0x6b7c49','methodSHA256':familyHash},'oppositeSides':reverse,'instructionChecks':{hex(a):hex(v)for a,v in checks.items()},
 'limits':['The complete method is hash-checked; only the described branches have recovered semantics.','This does not yield unconditional long-hole probability; state/theme and candidate eligibility are upstream.','Other obstacle promotion, level transitions, fallback and configuration branches remain partly undecoded.','Web full-feature long holes remain an explicit adapter; no runtime rule changed by this audit.']}
out=Path(__file__).resolve().parents[1]/'target/temple-run/analysis/native-generation'
(out/'path-postprocess.json').write_text(json.dumps(record,indent=2)+'\n')
(out/'PathElement.Postprocess.asm').write_text(subprocess.check_output(['/usr/bin/objdump','-d','--start-address=0x12e491c','--stop-address=0x12e4b40',sys.argv[2]],text=True))
print(json.dumps({'longHoleRewrite':record['longHoleRewrite'],'traceFields':record['traceFields'],'ACertainTypeCheck':record['ACertainTypeCheck'],'limits':record['limits']},indent=2))
