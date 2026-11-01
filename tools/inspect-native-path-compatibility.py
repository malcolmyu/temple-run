"""Decode WillPieceTypeConnectOnSide jump tables and metadata constant arrays.
Usage: python3 tools/inspect-native-path-compatibility.py BASE.apk libil2cpp.so
Static only; candidate compatibility is not a complete generation probability.
"""
import struct,json,hashlib,sys,subprocess
from pathlib import Path
p=Path(__file__).with_name('inspect-native-runtime-methods.py');n={'__file__':str(p)}
exec(compile(p.read_text().split('for typeName,methodName in ')[0],str(p),'exec'),n)
b,m,h,r,off=n['binary'],n['m'],n['h'],n['r'],n['off']
start,end=0x12e3994,0x12e3c50
methodHash=hashlib.sha256(b[off(start):off(end)]).hexdigest()
assert methodHash=='d66f0adc1beda77ce600121c57cfe8f5aeb0865fd3c66ac81ae80d318ca9a722'
tableHash=hashlib.sha256(b[off(0x6b7c0d):off(0x6b7c0d)+60]).hexdigest()
assert tableHash=='18bd2373f742f60c3b28adafa843ea5ec32cb9f6af4c4685134362d6f41f5e62'
root=Path(__file__).resolve().parents[1]/'target/temple-run/analysis/native-generation'
ports=json.loads((root/'path-connections.json').read_text());assert ports['binarySHA256']==hashlib.sha256(b).hexdigest()
# InitializeArray field refs point to raw int32 blobs, not enum-default varints.
def array(got,count):
 encoded=struct.unpack_from('<Q',b,off(r[got]))[0];assert encoded>>29==4
 ref=(encoded>>1)&0xfffffff;ti,local=struct.unpack_from('<2i',m,h[46]+ref*8)
 tp=r[n['table']+ti*8];definition,bits=struct.unpack_from('<QI',b,off(tp));assert bits>>16&255==0x12
 t=n['ts'][definition];assert n['st'](t[0])=='<PrivateImplementationDetails>'
 fi=t[8]+local;name=n['st'](struct.unpack_from('<3i',m,h[24]+fi*12)[0])
 default=next(struct.unpack_from('<3i',m,a)for a in range(h[16],h[16]+h[17],12)if struct.unpack_from('<i',m,a)[0]==fi)
 raw=m[h[18]+default[2]:h[18]+default[2]+4*count]
 assert hashlib.sha256(raw).hexdigest().upper()==name
 return list(struct.unpack('<'+'i'*count,raw)),{'got':hex(got),'field':name,'count':count,'sha256':hashlib.sha256(raw).hexdigest()}
arrays={};sources={}
for target,got,count in [(0x12e3b5c,0x2866240,15),(0x12e3b8c,0x2866238,14),(0x12e3bbc,0x2866248,15),(0x12e3c00,0x2866230,14)]:
 arrays[target],sources[hex(target)]=array(got,count)
assert arrays[0x12e3b5c]==[1,3,4,8,7,10,11,12,17,20,23,32,35,36,37]
assert arrays[0x12e3b8c]==[2,3,5,7,9,10,14,15,18,26,29,31,33,34]
assert arrays[0x12e3bbc]==[1,5,6,8,7,9,11,13,17,21,24,32,35,36,37]
assert arrays[0x12e3c00]==[2,4,6,8,9,10,14,16,18,27,30,31,33,34]
# Static predicate blocks: equality, two-element ranges, masked equality or OR.
# Whole-method hash protects both comparisons and their control-flow targets.
predicates={0x12e3a54:[19,21],0x12e3a8c:[25,27],0x12e3ac0:[1],0x12e3af0:[2],0x12e3b00:[22,24],0x12e3b10:[28,30],0x12e3b18:[19,20],0x12e3b20:[22,23],0x12e3b2c:[25,26],0x12e3b3c:[28,29],0x12e3b4c:[1,13],0x12e3b7c:[2,16],0x12e3bac:[1,12],0x12e3bdc:[2,15],**arrays}
def targets(address,count,base):return [base+4*v for v in b[off(address):off(address)+count]]
assert targets(0x6b7c0d,4,0x12e3a2c)==[0x12e3a2c,0x12e3a64,0x12e3a98,0x12e3ac8]
tables={};matrix={}
for side,address,count,base,first,fallback in [(1,0x6b7c3c,13,0x12e3a54,12,0x12e3b5c),(2,0x6b7c2c,16,0x12e3a8c,15,0x12e3b8c),(3,0x6b7c20,12,0x12e3ac0,13,0x12e3bbc),(4,0x6b7c11,15,0x12e3af0,16,0x12e3c00)]:
 table=targets(address,count,base);assert all(a in predicates for a in table)
 tables[side]={'address':hex(address),'firstParentType':first,'targets':[hex(a)for a in table],'fallback':hex(fallback)}
 matrix[side]={parent:sorted(predicates[table[parent-first]if first<=parent<first+count else fallback])for parent in range(39)}
# Fit adds the CURRENT tile's open-side gate before this helper. Keep both
# artifacts: raw helper can allow candidates for a side the parent cannot open.
fit={side:{parent:matrix[side][parent]if side in ports['portsByPathType'][str(parent)]else []for parent in range(39)}for side in range(1,5)}
assert matrix[1][12]==[1,13] and matrix[3][13]==[1,12]
assert matrix[2][15]==[2,16] and matrix[4][16]==[2,15]
assert matrix[1][19]==[19,21] and matrix[3][21]==[19,20]
assert fit[2][1]==[] and 3 in fit[1][1]
asymmetry=[{'side':side,'parent':parent,'candidate':child} for side in range(1,5)for parent in range(1,38)for child in fit[side][parent]if parent not in fit[(side+1)%4+1][child]]
assert len(asymmetry)==130
record={'binarySHA256':hashlib.sha256(b).hexdigest(),'metadataSHA256':hashlib.sha256(m).hexdigest(),'method':{'start':hex(start),'end':hex(end),'sha256':methodHash},'sourceArrays':sources,'branchTableSHA256':tableHash,'directionalAsymmetry':asymmetry,'branchTables':tables,'helperCandidatesBySideAndParent':matrix,'openPortFilteredCandidates':fit,'scope':'WillPieceTypeConnectOnSide for enum0..38 and side1..4; fit table additionally gates parent ports, assumes empty neighbour and candidate-check enabled','limits':['Fit is one ingredient of generation; pacing, state, theme, neighbours, candidate filtering and post-selection assembly still apply.','Raw helper is intentionally not claimed to reject invalid parent enums: outside special ranges it uses fallback arrays.','Open ports alone are insufficient: authored cap and narrow compatibility restrict candidate types.','Not installed as the web course selector; web aliases/orientation and grouped encounters require an explicit adapter.']}
(root/'path-compatibility.json').write_text(json.dumps(record,indent=2)+'\n')
(root/'PathElement.WillPieceTypeConnectOnSide.asm').write_text(subprocess.check_output(['/usr/bin/objdump','-d','--start-address='+hex(start),'--stop-address='+hex(end),sys.argv[2]],text=True))
print(json.dumps({'method':record['method'],'sourceArrays':sources,'auditedHelperRows':39*4,'examples':{'northFromLongA12':matrix[1][12],'southFromLongB13':matrix[3][13],'northFromNarrow19':matrix[1][19]},'limits':record['limits']},indent=2))
