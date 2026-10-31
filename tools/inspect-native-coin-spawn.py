"""Audit CoinSpawnConfigData defaults statically, with instruction checks."""
import sys,struct,hashlib,json,subprocess
from pathlib import Path
reader=Path(__file__).with_name('inspect-native-runtime-methods.py');n={'__file__':str(reader)};exec(compile(reader.read_text().split('for typeName,methodName in ')[0],str(reader),'exec'),n)
b,off=n['binary'],n['off'];w=lambda a:struct.unpack_from('<I',b,off(a))[0]
checks={0x129d3c0:0x52993ff6,0x129d3c4:0x72a77356,0x129d43c:0x5280bb8c,0x129d4a0:0x52807d0c,0x129d504:0x52807d0c,0x129d568:0x52807d0c,0x129d5cc:0x52807d0a,0x129d5f4:0xf9001674,0x129d76c:0x5281770c,0x129d7d0:0x5281388c,0x129d834:0x5280fa0a,0x129d860:0xf9001a74,0x126eb90:0x1a9fb7ea,0x126eba8:0x1a9fb7ea}
for a,word in checks.items():assert w(a)==word,(hex(a),hex(w(a)))
out=Path(__file__).resolve().parents[1]/'target/temple-run/analysis/native-coin-spawn';out.mkdir(exist_ok=True)
a=0x129d324;end=next(x for x in n['addresses']if x>a)
(out/'CoinSpawnConfigData..ctor.asm').write_text(subprocess.run(['/usr/bin/objdump','-d','--start-address='+hex(a),'--stop-address='+hex(end),sys.argv[2]],check=True,capture_output=True,text=True).stdout)
result=dict(binarySHA256=hashlib.sha256(b).hexdigest(),double=[999999999,1500,1000,1000,1000,1000],triple=[999999999,999999999,999999999,3000,2500,2000],distance='GameController.DistanceTraveled124, comparisons>= at126eb8c/126eba4',prefabPairs='PathElement.AddCoins12e4e2c..12e4eec: 1/1 then1/2 then2/3',limits=['Remote configuration can replace these constructor defaults.','Web alternates pair placements; full native path coin geometry not ported.','Web upgrade prices remain assumptions.'],instructionChecks={hex(a):hex(v)for a,v in checks.items()})
(out/'source.json').write_text(json.dumps(result,indent=2));print(json.dumps(result,indent=2))
