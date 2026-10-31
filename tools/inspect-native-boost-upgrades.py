"""Verify boost upgrade table statically; never execute APK code."""
import sys,struct,json,hashlib
from pathlib import Path
reader=Path(__file__).with_name('inspect-native-runtime-methods.py')
ns={'__file__':str(reader)};exec(compile(reader.read_text().split('for typeName,methodName in ')[0],str(reader),'exec'),ns)
binary,off=ns['binary'],ns['off']
w=lambda a:struct.unpack_from('<I',binary,off(a))[0]
table=list(binary[off(0x6b7888):off(0x6b7888)+6]);assert table==[10,12,5,7,0,0]
assert w(0x126a470)==0xb9016268 # store BoostDistance0x160
assert w(0x126a460)==0x52a86f48 #250
assert w(0x126a468)==0x52900008 and w(0x126a46c)==0x72a87768 #375
assert w(0x126a44c)==0x52a87f48 #500
assert w(0x126a454)==0x52880008 and w(0x126a458)==0x72a88388 #625
assert w(0x126a438)==0x52900008 and w(0x126a43c)==0x72a88768 #750
values={0x126a460:250,0x126a468:375,0x126a44c:500,0x126a454:625,0x126a438:750}
levels=[250]+[values[0x126a438+x*4] for x in table]
assert levels==[250,250,375,500,625,750,750]
out=Path(__file__).resolve().parents[1]/'target/temple-run/analysis/native-boost-upgrades.json'
result=dict(binarySHA256=hashlib.sha256(binary).hexdigest(),tableAddress='0x6b7888',branchBase='0x126a438',jumpTable=table,nativeLevels=levels,webNativeLevelMapping=[0,2,3,4,5],source='GameController.LoadLevelInformation126a414..126a470',priceSource='web assumption; native shop prices not decoded')
out.write_text(json.dumps(result,indent=2));print(json.dumps(result,indent=2))
