"""Static evidence for actor alpha vs magnet state; never executes native code.
Usage: python3 tools/inspect-native-power-appearance.py APK LIB [OUTPUT_DIR]
"""
import hashlib,json,struct,subprocess,sys
from pathlib import Path
reader=Path(__file__).with_name('inspect-native-runtime-methods.py')
n={'__file__':str(reader)}
exec(compile(reader.read_text().split('for typeName,methodName in ')[0],str(reader),'exec'),n)
b,off=n['binary'],n['off']
checks={
 0x129733c:0x39455268, # HasInvincibility field
 0x1297340:0x34000ea8, # false -> opaque alpha1 path
 0x1297388:0x1e209001, # final2.5 seconds
 0x129738c:0x1e2c1008, # normal protected alpha .5
 0x12974fc:0x3905527f, # expire invincibility
 0x1297500:0x940001de, # restore player texture
 0x1297514:0x1e2e1008, # unprotected alpha1
 0x1297520:0x97fffe71, # call SetAlpha
 0x12975b0:0x3945b268, # independent vacuum branch
 0x12975cc:0xbd017260, # own vacuum timer
 0x12975d4:0x3905b27f, # own vacuum expiry flag
 0x1298c9c:0x52800028,
 0x1298ca0:0xbd017000,
 0x1298ca4:0x3905b008,
 0x1298ca8:0xb901841f,
 0x1298cac:0xd65f03c0,
 0x1297e2c:0x1e2e1000, # ApplyPlayerTexture tail SetAlpha(1)
 0x1297e34:0x17fffc2c,
}
for a,v in checks.items():
 assert struct.unpack_from('<I',b,off(a))[0]==v, 'instruction mismatch '+hex(a)
ti,t=next((i,t)for i,t in enumerate(n['ts']) if n['st'](t[0])=='CharacterPlayer')
ptr=n['r'][n['r'][0x27d43f0]+ti*8]
fields={}
for j,i in enumerate(range(t[8],t[8]+t[18])):
 name=n['st'](struct.unpack_from('<3i',n['m'],n['h'][24]+i*12)[0])
 address=struct.unpack_from('<i',b,off(ptr+j*4))[0]
 if address in [0x154,0x158,0x16c,0x170]:fields[name]=hex(address)
assert fields.get('HasInvincibility')=='0x154',fields
assert fields.get('HasVacuum')=='0x16c',fields
out=Path(sys.argv[3]) if len(sys.argv)>3 else Path('target/temple-run/analysis/native-power-appearance')
methods={}
for i in range(t[9],t[9]+t[16]):
 d=struct.unpack_from('<7i4H',n['m'],n['h'][12]+i*36)
 name=n['st'](d[0])
 if name not in ['Update','StartVacuum','SetAlpha','ApplyPlayerTexture']:continue
 a=n['r'][n['methods']+8*((d[6]&0xffffff)-1)]
 end=next(x for x in n['addresses'] if x>a)
 methods[name]={'start':hex(a),'end':hex(end),'sha256':hashlib.sha256(b[off(a):off(end)]).hexdigest()}
assert methods['StartVacuum']['start']=='0x1298c9c'
assert methods['SetAlpha']['start']=='0x1296ee4'
assert methods['ApplyPlayerTexture']['start']=='0x1297c78'
expected={
 'SetAlpha':'f34312466e99a9b4eb0f1e5c2b51c8ca5e890f8ada6aeb3a2324c17c53c57140',
 'Update':'fc51d2575ed2597e5a5c209b58c45f50c3922f98f1afaec96c5078f7a4a6583f',
 'StartVacuum':'a60c5337fe5e4c32b9583917f53df5b6c854627ee9f5d74084f72d5e762e845a',
 'ApplyPlayerTexture':'643a8e1a1d659792ba0f682b5dba22a99d8d60ce7f50f3583e379db80133c1df',
}
for name,digest in expected.items():
 assert methods[name]['sha256']==digest,'audited method changed: '+name
out.mkdir(parents=True,exist_ok=True)
for name,d in methods.items():
 asm=subprocess.run(['/usr/bin/objdump','-d','--start-address='+d['start'],'--stop-address='+d['end'],sys.argv[2]],capture_output=True,text=True,check=True).stdout
 (out/(name+'.asm')).write_text(asm)
record={'binarySHA256':hashlib.sha256(b).hexdigest(),'fields':fields,'methods':methods,'instructionChecks':{hex(a):hex(v)for a,v in checks.items()},'findings':['StartVacuum is five instructions: own timer, flag, pickup age reset, return. No material or alpha call.','CharacterPlayer.Update selects normal alpha1 if HasInvincibility is false; protected path uses .5 and a final2.5-second fade cycle. It calls SetAlpha before the independent HasVacuum timer branch.','Invincibility expiry restores ApplyPlayerTexture; its tail calls SetAlpha(1).','Magnet-only actor transparency is not supported by these audited native paths. Web keeps magnet independent from invincibility.'],'limits':['This binary has not been proved identical to either video build.','Does not identify video active flags, remote configuration, modified clients, or every other caller that can set invincibility.','Does not infer invincibility from star particles or magnet adjacency.']}
(out/'source.json').write_text(json.dumps(record,indent=2)+'\n')
print(json.dumps({'methods':methods,'fields':fields,'checks':len(checks),'output':str(out)},indent=2))
