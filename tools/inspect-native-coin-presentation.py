"""Native coin prefab/mesh/pivot and verified angular-velocity source capture."""
from pathlib import Path
import sys,json,struct,hashlib
import UnityPy,lz4.block
root=Path(__file__).resolve().parents[1];p=root/'tools/inspect-native-runtime-methods.py';s=p.read_text();d={'__file__':str(p)};exec(s[:s.index('records={}')],d)
b=d['binary'];off=d['off'];z=d['z'];word=lambda a:struct.unpack_from('<I',b,off(a))[0]
assert word(0x1296554)==0x52900009 and word(0x1296558)==0x72b87009
assert word(0x1296560)==0xb9004e69
angular=struct.unpack('<f',struct.pack('<I',0xc3808000))[0];assert angular==-257
switch=[hex(0x1296534+x*4)for x in b[off(0x6b7a7f):off(0x6b7a7f)+7]];assert switch[:3]==['0x1296540','0x1296548','0x1296550']
assert word(0x12e5404)==0x1e211001 # standard row localY3
coins=[]
for colour,asset in [('yellow','b1f5ad1631ff26b4698b6129b04fec5c'),('red','76fc3aaccc05c8c4a93af68ee5bb125e'),('blue','41032ccc54d48eb41ad14a378c1cf3b6')]:
 raw=z.read('assets/bin/Data/'+asset);env=UnityPy.load(raw);serialized=next(iter(env.files.values()));mf=next(o for o in env.objects if o.type.name=='MeshFilter').read_typetree()['m_Mesh'];meshPath=serialized.externals[mf['m_FileID']-1].path;meshRaw=z.read('assets/bin/Data/'+meshPath);mesh=next(o for o in UnityPy.load(meshRaw).objects if o.path_id==mf['m_PathID']).read()
 vertices=[list(map(float,l.split()[1:4]))for l in mesh.export().splitlines()if l.startswith('v ')]
 animations=[o.read_typetree()for o in env.objects if o.type.name=='Animation'];assert all(not a['m_Animations']and a['m_Animation']['m_PathID']==0 for a in animations)
 coins.append(dict(colour=colour,prefab=asset,prefabSHA256=hashlib.sha256(raw).hexdigest(),meshAsset=meshPath,meshSHA256=hashlib.sha256(meshRaw).hexdigest(),worldVertices=[[v*.2 for v in p]for p in vertices],worldBounds=[[min(p[i]for p in vertices)*.2,max(p[i]for p in vertices)*.2]for i in range(3)],animationClips=[]))
obs={o.path_id:o for o in UnityPy.load('/tmp/temple-sharedassets0.assets').objects};shader=obs[109].read_typetree();blob=bytes(shader['compressedBlob']);i=1;start=shader['offsets'][i][0];code=lz4.block.decompress(blob[start:start+shader['compressedLengths'][i][0]],uncompressed_size=shader['decompressedLengths'][i][0]);start=code.index(b'#ifdef VERTEX');end=code.index(b'\0',start);(root/'target/temple-run/analysis/coin-wp8-original.glsl').write_text(code[start:end].decode()+'\n')
result=dict(binarySHA256=hashlib.sha256(b).hexdigest(),angularVelocityNativeDegrees=angular,rendererRadiansPerSecond=-angular*3.141592653589793/180,switchTargets=switch,coinAngularStore='0x1296560',standardRootYRaw=3,standardRootYWorld=.6,standardRootYInstruction='0x12e5404',worldScale=.2,coins=coins,shader=dict(pathID=109,name=shader['m_ParsedForm']['m_Name'],status='original shader has directional Lambert/lightmap/fog; runtime light/global material selection still unresolved, no guessed lighting change'),limitations=['reference arc coin positions and initial yaw remain fitted','per-batch native spawn clock not reconstructed','exact f32 incremental angular integration not implemented'])
(root/'target/temple-run/analysis/native-coin-presentation-source.json').write_text(json.dumps(result,indent=2)+'\n');print('Captured 3 original pivots/meshes, native coin -257deg/s and standard rootY3.')
