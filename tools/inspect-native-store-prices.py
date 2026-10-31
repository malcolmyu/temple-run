"""Static default store price tables and enum routing; no APK code execution."""
import sys,struct,json,hashlib,subprocess,re
from pathlib import Path
reader=Path(__file__).with_name('inspect-native-runtime-methods.py');n={'__file__':str(reader)}
exec(compile(reader.read_text().split('for typeName,methodName in ')[0],str(reader),'exec'),n)
b,off=n['binary'],n['off']
asm=subprocess.check_output(['/usr/bin/objdump','-d','--start-address=0x12aa7d0','--stop-address=0x12abcc8',sys.argv[2]],text=True)
prices={};values=[]
for line in asm.splitlines():
 m=re.search(r'mov\s+w(?:12|10), #0x([0-9a-f]+)',line)
 if m:values.append(int(m[1],16))
 m=re.search(r'str\s+x20, \[x19, #0x([0-9a-f]+)\]',line)
 if m:prices[hex(int(m[1],16))]=values;values=[]
assert all(prices[hex(offset)]==[250,1000,2500,5000,7500,25000]for offset in [0x28,0x30,0x38,0x40,0x48]),prices
assert prices['0x50']==[500,10000,2500,10000],prices
checks={0x128de90:0xf9401900,0x128decc:0xf9401d00,0x128df08:0xf9401500,0x128df44:0xf9402500,0x128e5a4:0xf9402100,0x12d3b64:0x2a1403e2,0x12d3b6c:0x97fee843}
for address,value in checks.items():assert struct.unpack_from('<I',b,off(address))[0]==value,hex(address)
table=struct.unpack_from('<36H',b,off(0x6b790a));assert [0x128dd70+table[i]*4 for i in [0,1,2,3,5,6,7,8,9]]==[0x128dd90,0x128ddc4,0x128ddf8,0x128de2c,0x128de60,0x128de9c,0x128ded8,0x128df14,0x128df50]
ti,t=next((i,t)for i,t in enumerate(n['ts'])if n['st'](t[0])=='StoreConfigData');ptr=n['r'][n['r'][0x27d43f0]+ti*8];fields={}
for j,i in enumerate(range(t[8],t[8]+t[18])):
 name=n['st'](struct.unpack_from('<3i',n['m'],n['h'][24]+i*12)[0]);fields[name]=hex(struct.unpack_from('<i',b,off(ptr+j*4))[0])
assert {k:fields[k]for k in ['PowerupMegaCoinUpgradeCostByLevel','PowerupCoinMagnetUpgradeCostByLevel','PowerupInvisibilityUpgradeCostByLevel','PowerupBoostUpgradeCostByLevel','PowerupCoinValueUpgradeCostByLevel','UtilityCostList']}=={'PowerupMegaCoinUpgradeCostByLevel':'0x28','PowerupCoinMagnetUpgradeCostByLevel':'0x30','PowerupInvisibilityUpgradeCostByLevel':'0x38','PowerupBoostUpgradeCostByLevel':'0x40','PowerupCoinValueUpgradeCostByLevel':'0x48','UtilityCostList':'0x50'}
root=Path('target/temple-run/analysis/native-store');root.mkdir(exist_ok=True)
(root/'StoreConfigData.ctor.asm').write_text(asm)
result=dict(binarySHA256=hashlib.sha256(b).hexdigest(),defaultTablesByFieldOffset=prices,fieldOffsets=fields,upgradeRouting={'magnet':'0x30','shield':'0x38','bonus':'0x28','coinSpawn':'0x48','boost':'0x40'},utilities={'wings':500,'headStart':10000,'megaStart':2500,'permanentWings':10000},priceIndex='StoreItem.UpdatePrice passes current saved level to GetPriceForUpgradeType; no+1',instructionChecks={hex(a):hex(v)for a,v in checks.items()},limits=['StoreConfigData.FromDict can overwrite defaults; active remote configuration not recovered.','Web compact tiers bundle the sum of skipped native-tier costs. Native maximum tiers and complete effect mapping remain separate gaps.','Legacy web coin multiplier has no equivalent confirmed native item.','Permanent wings/headstart prices do not imply these mechanics are implemented.'])
(root/'prices.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result['defaultTablesByFieldOffset']))
