"""Read native formation coefficients, never execute native code."""
from pathlib import Path
import sys,json,struct,hashlib
root=Path(__file__).resolve().parents[1]
p=root/'tools/inspect-native-runtime-methods.py';source=p.read_text();scope={'__file__':str(p)}
exec(source[:source.index('records={}')],scope)
binary=scope['binary'];off=scope['off']
scene=json.loads((root/'target/temple-run/analysis/game-controller-scene-source.json').read_text())
fields={f['name']:f for f in scene['fields']}
assert fields['EnemyCount']['offset']==588
result=dict(nativeBinarySHA256=hashlib.sha256(binary).hexdigest(),componentSHA256=scene['componentSHA256'],componentPathID=6396,
 count=fields['EnemyCount']['value'],spreadLeftRight=fields['EnemySpreadLeftRight']['value'],spreadFrontBack=fields['EnemySpreadFrontBack']['value'],
 backTableAddress='0x6b78bc',sideTableAddress='0x6b78d8',backTable=list(struct.unpack_from('<7f',binary,off(0x6b78bc))),sideTable=list(struct.unpack_from('<7f',binary,off(0x6b78d8))),
 method='GameController.SimulateEnemies',tableLookup='0x1271ad8..0x1271af0; slot=index-1, first enemy has zero offsets',worldScale=.2,
 introCount=8,normalCount=3,trimBranch='0x1271828..0x12718b4 removes indices3+ once IsIntroScene false',limitations=['enemy rig dimensions and animation speed not verified here','base anchor through corners remains approximate','initial animation phase remains fitted'])
assert result['count']==8 and result['spreadLeftRight']==12 and result['spreadFrontBack']==6
(root/'target/temple-run/analysis/native-enemy-formation-source.json').write_text(json.dumps(result,indent=2)+'\n')
print('Preserved 7 offset rows + centre, native intro8 / normal3.')
