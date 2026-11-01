"""Decode SetupAchievements string-literal arguments, statically only."""
import sys,struct,json,subprocess,re,hashlib
from pathlib import Path
reader=Path(__file__).with_name('inspect-native-runtime-methods.py');n={'__file__':str(reader)}
exec(compile(reader.read_text().split('for typeName,methodName in ')[0],str(reader),'exec'),n)
b,off=n['binary'],n['off'];start,end=0x1289770,0x128af58
asm=subprocess.check_output(['/usr/bin/objdump','-d','--start-address='+hex(start),'--stop-address='+hex(end),sys.argv[2]],text=True)
regs={};records=[]
def memory(addr):
 if addr in n['r']:return n['r'][addr]
 value=struct.unpack_from('<Q',b,off(addr))[0]
 if value>>29==5:
  index=(value>>1)&0xfffffff;length,data=struct.unpack_from('<II',n['m'],n['h'][2]+8*index)
  return n['m'][n['h'][4]+data:n['h'][4]+data+length].decode()
 return value
for line in asm.splitlines():
 a=re.match(r'\s*([0-9a-f]+):\s+[0-9a-f]+\s+adrp\s+x(\d+), 0x([0-9a-f]+)',line)
 if a:regs[int(a[2])]=int(a[3],16);continue
 a=re.match(r'\s*([0-9a-f]+):\s+[0-9a-f]+\s+ldr\s+x(\d+), \[x(\d+)(?:, #0x([0-9a-f]+))?\]',line)
 if a:
  base=regs.get(int(a[3]));value=None
  if isinstance(base,int):
   try:value=memory(base+int(a[4] or '0',16))
   except (StopIteration,struct.error):pass
  regs[int(a[2])]=value;continue
 a=re.match(r'\s*([0-9a-f]+):\s+[0-9a-f]+\s+bl\s+0x([0-9a-f]+)',line)
 if a:
  if int(a[2],16)==0x128cb48:
   args=[regs.get(i)for i in range(1,5)];assert all(isinstance(x,str)for x in args),(line,args)
   records.append(dict(call=hex(int(a[1],16)),id=args[0],name=args[1],before=args[2],after=args[3]))
  for i in range(19):regs.pop(i,None)
assert len(records)>20 and len({r['id']for r in records})==len(records)
assert memory(n['r'][0x2862818])=='distance1000'
for address,word in {0x1273c14:0xbd412780,0x1273c18:0x52a88f48,0x1273c24:0x1e211800,0x1273c2c:0x1e210800}.items():assert struct.unpack_from('<I',b,off(address))[0]==word
result=dict(distance1000Condition=dict(idGOT='0x2862818',distanceLoad='0x1273c14',field='GameController.DistanceTraveled0x124',threshold=1000,percent='current distance /1000 *100'),binarySHA256=hashlib.sha256(b).hexdigest(),methodRange=[hex(start),hex(end)],records=records,limits=['Descriptions are catalogue evidence, not independent proof of each completion condition.','Native reward/economic and session stat checks require further recovery.'])
root=Path('target/temple-run/analysis/native-objectives');root.mkdir(exist_ok=True);(root/'SetupAchievements.asm').write_text(asm);(root/'catalog.json').write_text(json.dumps(result,indent=2));print(json.dumps(records,indent=2))
