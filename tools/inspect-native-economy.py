"""Static IL2CPP lookup for score growth/coin meter; never loads the library."""
from pathlib import Path
import sys,json,subprocess,hashlib
# Reuse the already verified metadata/ELF relocation reader, stopping before its exports.
reader=Path(__file__).with_name('inspect-native-runtime-methods.py').read_text().split('for typeName,methodName in ')[0]
ns={'__file__':str(Path(__file__).with_name('inspect-native-runtime-methods.py'))}
exec(compile(reader,'static-il2cpp-reader','exec'),ns)
m,h,ts,st,r,methods,addresses,binary,off=[ns[k] for k in ['m','h','ts','st','r','methods','addresses','binary','off']]
import struct
out=Path(__file__).resolve().parents[1]/'target/temple-run/analysis/native-economy';out.mkdir(exist_ok=True)
records=[]
images=[struct.unpack_from('<10I',m,p) for p in range(h[42],h[42]+h[43],40)]
image=next(image for image in images if st(image[0])=='Assembly-CSharp.dll')
for old in out.glob('*.asm'):old.unlink()
for t in ts[image[2]:image[2]+image[3]]:
 for i in range(t[9],t[9]+t[16]):
  d=struct.unpack_from('<7i4H',m,h[12]+i*36)
  address=r.get(methods+8*((d[6]&0xffffff)-1),0)
  name=st(t[0])+'.'+st(d[0])
  if address not in [0x128b788,0x12a660c,0x12a6548,0x128d1b4,0x1298aa8] and not (st(t[0]) in ['CharacterPlayer','GameController','ObjectivesManager'] and any(k in name.lower() for k in ['meter','multiplier','coinspawn','coinbonus','addcoins'])):continue
  if not address or address not in addresses:continue
  end=next((a for a in addresses if a>address),address)
  asm=subprocess.run(['/usr/bin/objdump','-d','--start-address='+hex(address),'--stop-address='+hex(end),sys.argv[2]],check=True,capture_output=True,text=True).stdout
  (out/(name+'.asm')).write_text(asm)
  records.append(dict(name=name,address=hex(address),end=hex(end),sha256=hashlib.sha256(binary[off(address):off(end)]).hexdigest()))
(out/'source.json').write_text(json.dumps(dict(binarySHA256=hashlib.sha256(binary).hexdigest(),metadataSHA256=hashlib.sha256(m).hexdigest(),assembly='Assembly-CSharp.dll',scoreMultiplier='10 + count of achievements with completion percentage >=100',snapshot='CharacterPlayer.Reset stores GetScoreMulitplier result at0x13c',coinMeter=dict(threshold=100,scoreValue=500,initialLevel=1,clearOnStumble=True,source=['CharacterPlayer.Start1296e98..1296ea4','CharacterPlayer.AddCoins1298aa8..1298b08','CharacterPlayer.Stumble1297aec..1297af0'])),indent=2))
(out/'methods.json').write_text(json.dumps(records,indent=2))
print(json.dumps(records,indent=2))
