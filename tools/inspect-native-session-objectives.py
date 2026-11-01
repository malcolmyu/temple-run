"""Decode simple score/coin objective percent branches, without executing IL2CPP."""
import sys,struct,re,json,hashlib,subprocess
from pathlib import Path
reader=Path(__file__).with_name('inspect-native-runtime-methods.py');n={'__file__':str(reader)}
exec(compile(reader.read_text().split('for typeName,methodName in ')[0],str(reader),'exec'),n)
b,off=n['binary'],n['off'];start,end=0x12736cc,0x12775d8
asm=subprocess.check_output(['/usr/bin/objdump','-d','--start-address='+hex(start),'--stop-address='+hex(end),sys.argv[2]],text=True)
lines=asm.splitlines();blocks=[]
def literal(got):
 encoded=struct.unpack_from('<Q',b,off(n['r'][got]))[0]
 if encoded>>29!=5:return None
 length,data=struct.unpack_from('<II',n['m'],n['h'][2]+8*((encoded>>1)&0xfffffff))
 return n['m'][n['h'][4]+data:n['h'][4]+data+length].decode()
for index,line in enumerate(lines[:-1]):
 a=re.search(r'adrp\s+x19, 0x([0-9a-f]+)',line);q=re.search(r'ldr\s+x19, \[x19, #0x([0-9a-f]+)\]',lines[index+1])
 if not(a and q):continue
 got=int(a[1],16)+int(q[1],16)
 try:name=literal(got)
 except (KeyError,StopIteration):continue
 if name:blocks.append((index,name,got))
records=[]
for bi,(index,name,got) in enumerate(blocks):
 if not re.fullmatch(r'(coins|score)\d+',name):continue
 part=lines[index:blocks[bi+1][0] if bi+1<len(blocks) else len(lines)]
 source=None;page=None;bits=None;threshold=None
 for line in part:
  a=re.search(r'([0-9a-f]+):.*ldr\s+s0, \[x8, #0x(138|148)\]',line)
  if a:source=dict(loadAddress='0x'+a[1],fieldOffset='0x'+a[2]);continue
  if not source:continue
  a=re.search(r'adrp\s+x8, 0x([0-9a-f]+)',line)
  if a:page=int(a[1],16)
  a=re.search(r'ldr\s+s1, \[x8, #0x([0-9a-f]+)\]',line)
  if a:threshold=struct.unpack_from('<f',b,off(page+int(a[1],16)))[0]
  a=re.search(r'mov\s+w8, #0x([0-9a-f]+)',line)
  if a:bits=int(a[1],16)
  a=re.search(r'fmov\s+s1, w8',line)
  if a:threshold=struct.unpack('<f',struct.pack('<I',bits))[0]
  if re.search(r'fdiv\s+s0, s0, s1',line):
   assert threshold==int(re.search(r'\d+',name)[0]),(name,threshold)
   assert source['fieldOffset']==('0x148'if name.startswith('coins')else'0x138')
   records.append(dict(id=name,got=hex(got),threshold=threshold,**source));break
assert len(records)==16,(len(records),records)
fields={}
ti,t=next((i,t)for i,t in enumerate(n['ts'])if n['st'](t[0])=='CharacterPlayer');ptr=n['r'][n['r'][0x27d43f0]+ti*8]
for j,i in enumerate(range(t[8],t[8]+t[18])):
 name=n['st'](struct.unpack_from('<3i',n['m'],n['h'][24]+i*12)[0]);offset=struct.unpack_from('<i',b,off(ptr+j*4))[0]
 if name in ['Score','CoinCountTotal']:fields[name]=hex(offset)
assert fields=={'Score':'0x138','CoinCountTotal':'0x148'}
result=dict(fields=fields,binarySHA256=hashlib.sha256(b).hexdigest(),records=records,formula='current CharacterPlayer.Score or CoinCountTotal / target *100; completion at percentage>=100',limits=['Web persists best session score/coin total at settlement, not original runtime achievement-update timing.','These are16 simple branches only; no-power, no-coins and other compound objectives are excluded.'])
root=Path('target/temple-run/analysis/native-objectives');(root/'UpdateAchievementRecords.asm').write_text(asm);(root/'session-rules.json').write_text(json.dumps(result,indent=2));print(json.dumps(records,indent=2))
