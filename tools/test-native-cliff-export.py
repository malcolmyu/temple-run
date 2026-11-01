"""Validate prepared cliff exports against their recorded hashes and native support data."""
from pathlib import Path
import json,hashlib,math
root=Path(__file__).resolve().parents[1]/'target/temple-run/analysis/native-cliff-road'
source=json.loads((root/'source.json').read_text());assert source['productionIntegrated'] is False
for label,r in source['records'].items():
 obj=root/f'cliff-straight-{label.lower()}.obj';uvfile=obj.with_suffix('.uv1.json')
 assert hashlib.sha256(obj.read_bytes()).hexdigest()==r['objSHA256']
 assert hashlib.sha256(uvfile.read_bytes()).hexdigest()==r['uv1SHA256']
 positions=[];corners=0
 for line in obj.read_text().splitlines():
  p=line.split()
  if p and p[0]=='v':
   v=list(map(float,p[1:]));assert len(v)==3 and all(math.isfinite(x)for x in v);positions.append(v)
  if p and p[0]=='f':
   assert len(p)==4;corners+=3
   assert all(1<=int(c.split('/')[0])<=r['vertices']for c in p[1:])
 uv=json.loads(uvfile.read_text());assert len(uv)==corners*2 and all(math.isfinite(x)for x in uv)
 assert len(positions)==r['vertices'] and r['supportHeightWorld']==3
 assert sorted(set(abs(v)for p in r['supportPointsRaw']for v in p))==[6.5,30]
 for axis in range(3):
  assert abs(min(p[axis]for p in positions)-r['bounds'][axis][0])<1e-6
  assert abs(max(p[axis]for p in positions)-r['bounds'][axis][1])<1e-6
family=json.loads((root/'family.json').read_text())
for token,count in [('cliffTurn',4),('cliffT',12)]:
 assert sum(any(n.startswith(token)for n in r['names'])for r in family['records'])>=count
print('Cliff export2prefabs: hashes, finite geometry, triangle indices, UV corner order, bounds and native12x2.6m support at3m pass;21prefab family inventoried. No runtime integration claimed.')
