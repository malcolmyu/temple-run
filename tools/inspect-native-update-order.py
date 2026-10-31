"""Read script execution order and native frame-limit callsites, never execute native code."""
import hashlib,json,struct,zipfile
from pathlib import Path
import UnityPy
root=Path(__file__).resolve().parents[1];z=zipfile.ZipFile('/tmp/com.imangi.templerun.apk');raw=z.read('assets/bin/Data/globalgamemanagers.assets');orders={}
for o in UnityPy.load(raw).objects:
 if o.type.name=='MonoScript':
  t=o.read_typetree()
  if t.get('m_ClassName')in['GameInput','PCInput','TouchInput','CharacterPlayer','GameController','GameCamera']:
   orders[t['m_ClassName']]=dict(pathID=o.path_id,executionOrder=t['m_ExecutionOrder'])
assert orders['TouchInput']['executionOrder']==-3 and orders['CharacterPlayer']['executionOrder']==220 and orders['GameController']['executionOrder']==280 and orders['GameCamera']['executionOrder']==300
result=dict(source='globalgamemanagers.assets MonoScript.m_ExecutionOrder',SHA256=hashlib.sha256(raw).hexdigest(),orders=orders,forceFlow='input actions -> CharacterPlayer consumes previous force and clears it -> GameController.HandleControls produces next force after action expiry',frameRate=dict(mainMenuTarget=60,call='0x12c92ec',valueInstruction='0x12c92e4',otherCaller='FTPSGraph.Start12fbe68 reads its configured field30; active status/value unverified'),webStatus='classic queues forward force across ticks; no fixed30Hz simulation introduced to fit video',limitations=['native achieved frame rate is not proved by encoded video fps','other callback/floor support ordering remains approximate'])
(root/'target/temple-run/analysis/native-update-order.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(orders))
