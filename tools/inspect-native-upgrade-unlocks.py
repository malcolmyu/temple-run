"""Static native upgrade maxima and first-tier spawn unlock audit."""
import sys,struct,json,subprocess,hashlib
from pathlib import Path
p=Path(__file__).with_name('inspect-native-runtime-methods.py');n={'__file__':str(p)};exec(compile(p.read_text().split('for typeName,methodName in ')[0],str(p),'exec'),n)
b,off=n['binary'],n['off'];table=list(struct.unpack_from('<36i',b,off(0x6b7954)));assert table[5:10]==[6,6,6,5,6]
checks={0x128dc68:0xb861d900,0x126a1a8:0xb9001d1f,0x126a244:0xb9001d09,0x126a25c:0xb900211f,0x126a300:0xb9002109,0x126a318:0xb900251f,0x126a3cc:0xb9002509,0x126a3e4:0xb900291f,0x126a494:0xb9002909,0x126a1d8:0x51000408,0x126a1dc:0x7100151f,0x126a1e0:0x540006c8,0x126a414:0x51000408,0x126a418:0x7100151f,0x126a41c:0x540003e8}
for a,v in checks.items():assert struct.unpack_from('<I',b,off(a))[0]==v
out=Path('target/temple-run/analysis/native-upgrade-unlocks');out.mkdir(exist_ok=True)
for name,a,e in [('GetMaxUpgrade',0x128dc58,0x128dc78),('LoadLevelInformation',0x1269ea0,0x126a9f4),('StoreItem.UpdatePrice',0x12d39bc,0x12d3e8c)]:
 (out/(name+'.asm')).write_text(subprocess.run(['/usr/bin/objdump','-d','--start-address='+hex(a),'--stop-address='+hex(e),sys.argv[2]],capture_output=True,text=True,check=True).stdout)
record=dict(binarySHA256=hashlib.sha256(b).hexdigest(),maxTableAddress='0x6b7954',maxima={'magnet':table[5],'shield':table[6],'bonus':table[7],'coinSpawn':table[8],'boost':table[9]},spawnUnlock='LoadLevelInformation writes probability0 then processes levels1..6 and enables .2;level0 skips the enable block.',prices=[250,1000,2500,5000,7500,25000],limits=['Remote price overrides unknown.','Native magnet strength differences and level6 completion rewards remain incomplete.','Web legacy coin multiplier is separate.'],instructionChecks={hex(a):hex(v)for a,v in checks.items()})
(out/'source.json').write_text(json.dumps(record,indent=2));print(json.dumps(record,indent=2))
