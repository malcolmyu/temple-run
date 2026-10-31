"""Audit canonical road against full authored TRS, without modifying production assets."""
import math,json,hashlib
from pathlib import Path
root=Path(__file__).resolve().parents[1]
a=root/'target/temple-run/analysis/native-straight-authored.obj';b=root/'target/temple-run/web/public/assets/track/temple-road-tile.obj'
def read(p):
 out={'v':[],'vt':[],'f':[]}
 for line in p.read_text().splitlines():
  parts=line.split()
  if not parts or parts[0]not in out:continue
  out[parts[0]].append(parts[1:]if parts[0]=='f'else list(map(float,parts[1:])))
 return out
native,current=read(a),read(b);assert len(native['v'])==len(current['v'])==691
candidates={}
for label,transform in [('identity',lambda c:c),('legacyY1.36Rotate180',lambda c:[-c[0],c[1]+1.36,-c[2]])]:
 rows=[[n[i]-transform(c)[i]for i in range(3)]for n,c in zip(native['v'],current['v'])]
 candidates[label]=dict(RMS=math.sqrt(sum(x*x for row in rows for x in row)/(len(rows)*3)),residual=rows)
best=min(candidates,key=lambda k:candidates[k]['RMS']);residual=candidates[best]['residual']
mean=[sum(v[i]for v in residual)/len(residual)for i in range(3)]
reverse=sum(x==list(reversed(y))for x,y in zip(native['f'],current['f']))
# After production replacement normal-index spelling differs; compare vertex order.
reversed_indices=sum([c.split('/')[0]for c in x]==[c.split('/')[0]for c in reversed(y)]for x,y in zip(native['f'],current['f']))
assert len(native['f'])==402
max_uv=max(abs(x-y)for n,c in zip(native['vt'],current['vt'])for x,y in zip(n,c))
record=dict(nativeSHA256=hashlib.sha256(a.read_bytes()).hexdigest(),currentSHA256=hashlib.sha256(b.read_bytes()).hexdigest(),vertices=691,triangles=402,comparison=best,candidateRMS={k:v['RMS']for k,v in candidates.items()},coordinateRMS=math.sqrt(sum(x*x for row in residual for x in row)/(len(residual)*3)),meanResidual=mean,maxUV0Difference=max_uv,reversedTriangleCount=reversed_indices,sameVertexOrderCount=sum([c.split('/')[0]for c in x]==[c.split('/')[0]for c in y]for x,y in zip(native['f'],current['f'])),productionUV1='regenerated in current authored face order by export-native-straight.py and export-native-lightmap.py',runtimeAudit='Instantiate12e1958 calls SetupTerrain12e1c18; no direct Transform rotation setter in these methods, nested prefab attachment/generator placement remains to verify',nextStep='Mesh-local positions/UV0/face order now match; runtime generator placement and full video pixel alignment remain to verify')
(root/'target/temple-run/analysis/native-straight-geometry-audit.json').write_text(json.dumps(record,indent=2)+'\n');print(json.dumps(record))
