"""Static resurrection path audit; never loads/executes the APK library."""
import sys,struct,hashlib,json,subprocess
from pathlib import Path
reader=Path(__file__).with_name('inspect-native-runtime-methods.py');ns={'__file__':str(reader)}
exec(compile(reader.read_text().split('for typeName,methodName in ')[0],str(reader),'exec'),ns)
binary,off,addresses=ns['binary'],ns['off'],ns['addresses'];out=Path(__file__).resolve().parents[1]/'target/temple-run/analysis/native-resurrection';out.mkdir(exist_ok=True)
records={}
for name,start in [('GameController.HandleResurrecting',0x126d458),('GameController.ResurrectPlayer',0x126d4d0),('CharacterPlayer.Resurrect',0x1298d60),('GameController.get_ResurrectionSlowDownPercent',0x12725f8)]:
 end=next(a for a in addresses if a>start)
 text=subprocess.run(['/usr/bin/objdump','-d','--start-address='+hex(start),'--stop-address='+hex(end),sys.argv[2]],check=True,capture_output=True,text=True).stdout
 (out/(name+'.asm')).write_text(text);records[name]=dict(address=hex(start),end=hex(end),sha256=hashlib.sha256(binary[off(start):off(end)]).hexdigest())
assert struct.unpack_from('<I',binary,off(0x12a1df4))[0]==0x528012c8
assert struct.unpack_from('<I',binary,off(0x12a1df8))[0]==0xb9003a68
assert struct.unpack_from('<I',binary,off(0x1298dd0))[0]==0x52a82409
assert struct.unpack_from('<I',binary,off(0x1298e18))[0]==0xb9011e69
assert struct.unpack_from('<I',binary,off(0x126db34))[0]==0x9400ac65
(out/'source.json').write_text(json.dumps(dict(binarySHA256=hashlib.sha256(binary).hexdigest(),methods=records,configDefaultDistance=150,configDefaultSlowdown=struct.unpack_from('<f',binary,off(0x697dcc))[0],resurrectionAge=10,startBoostAgeAddition=10,source='PlayerConfigData..ctor12a1df4..12a1df8 writes150 at38; get_ResurrectionBoostDistance12725e4 reads38'),indent=2))
print(json.dumps(records,indent=2))
