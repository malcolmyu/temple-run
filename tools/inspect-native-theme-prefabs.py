"""Decode direct native prefab-name jump tables for plank/cliff;no native execution."""
import sys,struct,re,json,hashlib,subprocess
from pathlib import Path
reader=Path(__file__).with_name('inspect-native-runtime-methods.py');n={'__file__':str(reader)}
exec(compile(reader.read_text().split('for typeName,methodName in ')[0],str(reader),'exec'),n)
b,off=n['binary'],n['off'];asm=subprocess.check_output(['/usr/bin/objdump','-d','--start-address=0x12e1edc','--stop-address=0x12e2870',sys.argv[2]],text=True)
lines={int(m[1],16):(m[2],m[3])for line in asm.splitlines()if(m:=re.match(r'\s*([0-9a-f]+): [0-9a-f]+\s+(\S+)\s*(.*)',line))}
def literal(got):
 v=struct.unpack_from('<Q',b,off(n['r'][got]))[0];assert v>>29==5
 length,data=struct.unpack_from('<II',n['m'],n['h'][2]+8*((v>>1)&0xfffffff));return n['m'][n['h'][4]+data:n['h'][4]+data+length].decode()
records={}
for level,table,base,count in [(1,0x6b7bd6,0x12e22f0,32),(3,0x6b7b5c,0x12e2320,36)]:
 rows=[]
 for i,entry in enumerate(struct.unpack_from('<'+str(count)+'B',b,off(table))):
  a=base+4*entry;op,args=lines[a];assert op=='adrp';register,page=args.split(', ');op,args=lines[a+4];assert op=='ldr';match=re.search(r'#0x([0-9a-f]+)',args);got=int(page.split(' ')[0],16)+(int(match[1],16)if match else 0)
  rows.append(dict(type=i+1,target=hex(a),resource=literal(got)))
 records[str(level)]=rows
cliff={r['type']:r['resource']for r in records['3']}
assert all(cliff[t]==''for t in [11,14,*range(17,33)])
assert cliff[12]==cliff[35]=='Walls/cliffToTempleCapAVert' and cliff[13]==cliff[36]=='Walls/cliffToTempleCapBVert'
assert struct.unpack_from('<I',b,off(0x12e49bc))[0]==0x52800189 and struct.unpack_from('<I',b,off(0x12e49cc))[0]==0x528001b8
assert literal(0x28661a8)=='Walls/cliffStraightTreeVert' and literal(0x28661e0)=='Walls/templeStraightTreeSlideVert'
root=Path('target/temple-run/analysis/native-generation');(root/'PathElement.GetPrefabNameForType.asm').write_text(asm)
result=dict(binarySHA256=hashlib.sha256(b).hexdigest(),prefabs=records,verified=dict(cliffHole='one-cell holes11/14 have no prefab;long types12/13 and15/16 alias cliff caps',cliffUnsupported='narrow17..30 and flame31/32 return empty',longHoleAssembly='12e49bc sets old type12,12e49cc sets new type13 for canonical side1',treeSlide='AddObstacle chooses cliffStraightTreeVert for non-temple level;standalone child transform exported separately'),limits=['Prefab lookup alone does not prove candidate probability/enable rules.','Web shuffled feature bag and grouped placement remain adapters.','Temple table contains random resource variations and is not decoded by this direct-table inspector.'])
(root/'theme-prefabs.json').write_text(json.dumps(result,indent=2)+'\n');print('Verified plank/cliff prefab tables,cliff unsupported types,long-cap aliases and slide variant')
