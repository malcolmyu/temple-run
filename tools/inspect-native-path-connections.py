"""Static native path ports/fit contract. No native code execution.
Usage: python3 tools/inspect-native-path-connections.py BASE.apk libil2cpp.so
"""
import struct,json,hashlib,subprocess,sys
from pathlib import Path
reader=Path(__file__).with_name('inspect-native-runtime-methods.py');n={'__file__':str(reader)}
exec(compile(reader.read_text().split('for typeName,methodName in ')[0],str(reader),'exec'),n)
b,m,h,off=n['binary'],n['m'],n['h'],n['off']
w=lambda a:struct.unpack_from('<I',b,off(a))[0]
checks={
 0x12e2d20:0x51000668,0x12e2d24:0x7100911f,0x12e2d28:0x540000e8,
 0x12e2d2c:0xd2838029,0x12e2d30:0xf2b01fa9,0x12e2d34:0xf2c00389,
 0x12e2d38:0x9ac82528,0x12e2d3c:0x12000100,
 0x12e2d9c:0x51000a68,0x12e2da0:0x7100811f,0x12e2da4:0x540000e8,
 0x12e2da8:0xd28e0029,0x12e2dac:0xf2b7f029,0x12e2db0:0xf2c00029,
 0x12e37e8:0x910142c9,0x12e37f8:0x910162c9,0x12e3800:0x9101a2c9,0x12e3808:0x910182c9,
 0x12e382c:0x94475407,0x12e3830:0x360000e0,0x12e3834:0x2a1f03e0,
 0x12e3854:0x9400000a,0x12e3858:0x3607ff00,0x12e385c:0x3607fef5,0x12e3878:0x14000047,
 0x12e388c:0x97fffd13,0x12e3894:0x321f0268,0x12e3898:0x71000d1f,
 0x12e38ac:0x97fffd2a,0x12e38b4:0x71000a7f,0x12e38c0:0x7100127f,
 0x12e38d0:0x51000d09,0x12e38d4:0x7100193f,
 0x12e38f4:0x51000e68,0x12e3914:0x121f7a68,0x12e3918:0x7100091f,
 0x12e3924:0x7100067f,0x12e392c:0x51000668,0x12e3930:0x7100091f,
 0x12e393c:0x51000668,0x12e394c:0x528001a9,
 0x12e3954:0x51000668,0x12e3958:0x71000d1f,
 0x12e3964:0x51000668,0x12e3974:0x52800169,
 0x12e3908:0x7100291f,0x12e38fc:0x51000a69,0x12e3900:0x7100093f,
}
for a,v in checks.items():assert w(a)==v,(hex(a),hex(w(a)))
def mask(addresses):
 result=0
 for a in addresses:
  v=w(a);result|=((v>>5)&65535)<<(((v>>21)&3)*16)
 return result
vertMask=mask([0x12e2d2c,0x12e2d30,0x12e2d34]);horzMask=mask([0x12e2da8,0x12e2dac,0x12e2db0])
assert vertMask==0x1c80fd1c01 and horzMask==0x1bf817001
vert=[i+1 for i in range(37)if vertMask>>i&1];horz=[i+2 for i in range(33)if horzMask>>i&1]
assert not set(vert)&set(horz)
sideTable=list(b[off(0x6b7bfe):off(0x6b7bfe)+4]);assert sideTable==[0,4,6,8]
cornerTable=list(b[off(0x6b7c06):off(0x6b7c06)+7]);assert cornerTable==[0,8,12,14,18,24,28]
ti,t=next((i,t)for i,t in enumerate(n['ts'])if n['st'](t[0])=='PathElement')
ptr=n['r'][n['r'][0x27d43f0]+ti*8];fields={};methods={}
for j,i in enumerate(range(t[8],t[8]+t[18])):
 name=n['st'](struct.unpack_from('<3i',m,h[24]+i*12)[0]);fields[name]=struct.unpack_from('<i',b,off(ptr+j*4))[0]
assert {name:fields[name]for name in ['PathNorth','PathEast','PathSouth','PathWest']}=={'PathNorth':0x50,'PathEast':0x58,'PathSouth':0x68,'PathWest':0x60}
for i in range(t[9],t[9]+t[16]):
 d=struct.unpack_from('<7i4H',m,h[12]+i*36);a=n['r'].get(n['methods']+8*((d[6]&0xffffff)-1))
 if a in [0x12e2cd8,0x12e2d54,0x12e3780,0x12e387c,0x12e3994]:methods[hex(a)]=n['st'](d[0])
assert methods=={'0x12e2cd8':'IsStraightVert','0x12e2d54':'IsStraightHorz','0x12e3780':'DoesPieceTypeFitOnSide','0x12e387c':'CanPathExtendOnSide','0x12e3994':'WillPieceTypeConnectOnSide'}
# Resolve Unity object comparator from its module tokens, not its appearance.
idx=b.index(b'UnityEngine.CoreModule.dll\0');seg=next(p for p in n['segments']if p[0]==1 and p[2]<=idx<p[2]+p[5]);va=seg[3]+idx-seg[2]
module=next(a for a,v in n['r'].items()if v==va and 100<struct.unpack_from('<I',b,off(a+8))[0]<20000);mp=n['r'][module+16]
t=next(t for t in n['ts']if n['st'](t[0])=='Object'and n['st'](t[1])=='UnityEngine');comparison=None
for i in range(t[9],t[9]+t[16]):
 d=struct.unpack_from('<7i4H',m,h[12]+i*36)
 if n['r'].get(mp+8*((d[6]&0xffffff)-1))==0x24b8848:comparison=n['st'](d[0])
assert comparison=='op_Inequality'
ports={i:([1,3]if i in vert else [2,4]if i in horz else [])for i in range(39)}
ports.update({3:[3,4],4:[2,3],5:[1,4],6:[1,2],7:[1,3,4],8:[1,2,3],9:[1,2,4],10:[2,3,4]})
assert sum(bool(v)for v in ports.values())==37
record={'binarySHA256':hashlib.sha256(b).hexdigest(),'metadataSHA256':hashlib.sha256(m).hexdigest(),'methods':methods,
 'sideNumbers':{'1':'north','2':'east','3':'south','4':'west'},'sideJumpTable':sideTable,'cornerJumpTable':cornerTable,
 'straightVertTypes':vert,'straightHorzTypes':horz,'portsByPathType':ports,'objectComparator':comparison,
 'fitContract':['occupied neighbour on requested side => false','current CanPathExtendOnSide=false => false','if candidate-check argument is false, return current extension result','otherwise call WillPieceTypeConnectOnSide for candidate compatibility'],
 'instructionChecks':{hex(a):hex(v)for a,v in checks.items()},
 'limits':['Ports describe geometry openings, not permitted player turn inputs at arbitrary distance.','WillPieceTypeConnectOnSide has additional paired-cap/narrow compatibility; its full table is not decoded here.','Empty ports for invalid enum0/38 are CanPathExtend defaults, not complete invalid-input behaviour of every native helper.','Web graph uses local forward/left/right, so mapping requires orientation. This audit does not replace its runtime graph or add native probabilities.']}
out=Path(__file__).resolve().parents[1]/'target/temple-run/analysis/native-generation'
(out/'path-connections.json').write_text(json.dumps(record,indent=2)+'\n')
asm=subprocess.check_output(['/usr/bin/objdump','-d','--start-address=0x12e3780','--stop-address=0x12e3994',sys.argv[2]],text=True)
(out/'PathElement.SideConnection.asm').write_text(asm)
print(json.dumps({'sideNumbers':record['sideNumbers'],'portsByPathType':ports,'fitContract':record['fitContract'],'checkedInstructions':len(checks)},indent=2))
