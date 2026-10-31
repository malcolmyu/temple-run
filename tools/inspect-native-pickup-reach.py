"""Recover actual pickup sphere/AABB thresholds; parse/disassemble only, never execute native code."""
import contextlib,io,runpy,struct,json
from pathlib import Path
root=Path(__file__).resolve().parents[1]
with contextlib.redirect_stdout(io.StringIO()):d=runpy.run_path(str(root/'tools/inspect-native-runtime-methods.py'))
binary,off=d['binary'],d['off']
def word(a):return struct.unpack_from('<I',binary,off(a))[0]
assert word(0x12710c8)==0x9401bf33 # MovingObject.DoesSphereIntersectBoundingBox
assert word(0x12e0df4)==0x1e280901 # radius squared
assert word(0x12e0e08)==0x1a9f87e0 # <= squared distance
minimum=list(struct.unpack_from('<2f',binary,off(0x696f08)))+[struct.unpack_from('<f',binary,off(0x697658))[0]]
maximum=list(struct.unpack_from('<2f',binary,off(0x697388)))+[struct.unpack_from('<f',binary,off(0x6975e8))[0]]
radii=list(struct.unpack_from('<6f',binary,off(0x6b78a4)));assert radii==[3,2.25,2.25,2.25,3,3]
table=list(binary[off(0x6b78a0):off(0x6b78a0)+4]);assert [0x127119c+i*4 for i in table]==[0x127119c,0x1271208,0x1271264,0x12712c0] # bonus/shield/vacuum/boost
assert minimum==[-1.7469000816345215,-.16484999656677246,-1.7469000816345215]
assert maximum==[1.7469000816345215,9.586649894714355,1.7469000816345215]
world=dict(boundsMin=[x*.2 for x in minimum],boundsMax=[x*.2 for x in maximum],radii=dict(yellow=radii[0]*.2,red=radii[1]*.2,blue=radii[2]*.2,bonus=radii[3]*.2,shield=radii[4]*.2,magnet=radii[5]*.2,boost=2.25*.2))
(root/'target/temple-run/web/src/game/nativePickupCollision.json').write_text(json.dumps(world,indent=2)+'\n')
record=dict(binarySHA256=d['record']['binarySHA256'],boundsMethod=d['records']['CharacterPlayer.GetWorldSpaceBounds'],intersectionMethod=d['records']['MovingObject.DoesSphereIntersectBoundingBox'],nativeBoundsMin=minimum,nativeBoundsMax=maximum,nativeRadiusByTypes1Through6=radii,boostDefaultRadius=2.25,slidingChangesBounds=False,rule='pickup sphere versus fixed translated CharacterPlayer AABB; native Bounds.SqrDistance <= radius squared',magnetAttraction='separate; not recovered by this export',**world)
(root/'target/temple-run/analysis/native-pickup-collision-source.json').write_text(json.dumps(record,indent=2)+'\n');print(json.dumps(world,indent=2))
