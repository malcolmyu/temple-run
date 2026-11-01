"""Verify head-start budgets and normal boost flag from original IL2CPP and scene."""
import struct,json,hashlib,subprocess,sys
from pathlib import Path
reader=Path(__file__).with_name('inspect-native-runtime-methods.py');n={'__file__':str(reader)}
exec(compile(reader.read_text().split('for typeName,methodName in ')[0],str(reader),'exec'),n)
b,off=n['binary'],n['off'];checks={0x1277a0c:0xbd419660,0x1277a10:0xbd412661,0x1277a14:0x2a1f03e1,0x1277a1c:0x1e213800,0x1277a20:0x940084aa,0x1277b7c:0xbd419a60,0x1277b80:0xbd412661,0x1277b84:0x2a1f03e1,0x1277b8c:0x1e213800,0x1277b90:0x9400844e,0x127796c:0x540006ed,0x1277978:0x54000685}
for address,value in checks.items():assert struct.unpack_from('<I',b,off(address))[0]==value,hex(address)
scene=json.loads(Path('target/temple-run/analysis/game-controller-scene-source.json').read_text());fields={f['name']:f['value']for f in scene['fields']};expected={'HeadStartStartDistance':25.,'HeadStartEndDistance':100.,'HeadStartBoostDistance':950.,'HeadStartMegaBoostDistance':2350.};assert {name:fields[name]for name in expected}==expected
root=Path('target/temple-run/analysis/native-store');root.mkdir(exist_ok=True)
for name,a,end in [('UseHeadStart',0x12778e8,0x1277a58),('UseHeadStartMega',0x1277a58,0x1277bc8)]:
 (root/(name+'.asm')).write_text(subprocess.check_output(['/usr/bin/objdump','-d','--start-address='+hex(a),'--stop-address='+hex(end),sys.argv[2]],text=True))
result=dict(binarySHA256=hashlib.sha256(b).hexdigest(),sceneComponentSHA256=scene['componentSHA256'],sceneDefaults=expected,rule='StartBoost(configured target-current metric distance,false); StartBoost separately adds50 braking allowance',instructionChecks={hex(a):hex(v)for a,v in checks.items()},limits=['Web inventory consumption now uses25<metric progress<100.99-stock cap and at most one kind per run are web adapters; full native state exclusions not fully ported.','Prices are constructor defaults; active remote configuration unknown.','Native special mega=true boost mode remains available for other mechanisms, but both head-start methods pass false.'])
(root/'head-start.json').write_text(json.dumps(result,indent=2)+'\n');print('Verified native head-start950/2350 budgets, normal flag and25..100 window')
