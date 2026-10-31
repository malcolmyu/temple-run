"""Prepare raw Vert OBJ/UV assets; renderer applies documented height normalization."""
from pathlib import Path
import json,hashlib
root=Path(__file__).resolve().parents[1]/'target/temple-run';source=root/'analysis/native-cliff-road';target=root/'web/public/assets/track';record=json.loads((source/'source.json').read_text())['records']['Vert'];hashes={}
for suffix,key in [('.obj','objSHA256'),('.uv1.json','uv1SHA256')]:
 data=(source/('cliff-straight-vert'+suffix)).read_bytes();digest=hashlib.sha256(data).hexdigest();assert digest==record[key];(target/('cliff-road-tile'+suffix)).write_bytes(data);hashes[suffix]=digest
result=dict(sourcePrefab=record['prefab'],hashes=hashes,sourceGroundHeight=3,runtimeGroundHeight=0,meshLocalTranslationY=-3,material='Temple Run Trees Material / nativeTreeMaterial',straightHalfWidth=1.3,limits=['Only straight mesh integrated. Native dedicated corners,T junctions and caps remain absent.','Current stone/cliff relative height is normalized; original3m relative elevation and corresponding connections are not restored.','Branch,half-road and obstacles still use existing stone-compatible web adapters.'])
(source/'runtime.json').write_text(json.dumps(result,indent=2)+'\n');print('Prepared native cliff Vert geometry and UVs; documented-3m normalization and1.3m support half-width')
