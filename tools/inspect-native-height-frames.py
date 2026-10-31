"""Audit terrain/water coordinate frames from persisted static source evidence."""
import json,hashlib
from pathlib import Path
root=Path(__file__).resolve().parents[1];analysis=root/'target/temple-run/analysis'
region_path=analysis/'transition-region-source.json';water_path=analysis/'native-water-plane-source.json'
regions=json.loads(region_path.read_text());water=json.loads(water_path.read_text())
wood=regions['plankStraight']['regions'][0]['heightOriginalUnits']*.2;stone=regions['stoneStraight']['regions'][0]['heightOriginalUnits']*.2
assert wood==-3 and stone==0 and water['height']==-6.1
record=dict(sourceHashes={p.name:hashlib.sha256(p.read_bytes()).hexdigest()for p in [region_path,water_path]},native=dict(stoneGroundY=stone,woodGroundY=wood,waterY=water['height'],woodGroundAboveWater=wood-water['height'],normalWoodCameraY=wood+7,normalWoodCameraAboveWater=wood+7-water['height']),currentFlatFrame=dict(woodGroundY=0,waterY=-6.1,normalWoodCameraY=7,woodGroundAboveWater=6.1,normalWoodCameraAboveWater=13.1),nativeWaterUpdate='GameCamera.UpdateWater12b02e4 preserves existing water Y; only camera XZ are truncated to200raw grid',exportNormalization='plank exports add15.25raw before scale.2, shifting authored deck+3.05m; native ground Height is-15raw, deck is-.05m below it',migrationConsumers=['terrain tile/obstacle meshes','runner/enemy base height','coin/power world heights','camera follow/focus/ground height','safety net height','transition cap geometry and floor contact','death thresholds in absolute versus relative frame'],scope='Evidence only; no isolated water patch. Exact source boundary timing and transition mechanics need integration audit')
(analysis/'native-height-frame-audit.json').write_text(json.dumps(record,indent=2)+'\n');print(json.dumps(record))
