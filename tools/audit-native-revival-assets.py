"""Read native actor animation references and resurrection call targets; never run APK code.
Usage: UnityPy-python tools/audit-native-revival-assets.py base.apk libil2cpp.so
"""
import hashlib,json,struct,sys,zipfile
from pathlib import Path
import UnityPy
apk,library=sys.argv[1:3]
z=zipfile.ZipFile(apk)
parts=sorted((n for n in z.namelist() if '/sharedassets0.assets.split' in n),key=lambda n:int(n.rsplit('split',1)[1]))
raw=b''.join(z.read(n) for n in parts)
objects={o.path_id:o for o in UnityPy.load(raw).objects}
owner=next(o for o in objects.values() if o.type.name=='GameObject' and o.read().m_Name=='Jhony_Export3')
anim=next(objects[c['component']['m_PathID']] for c in owner.read_typetree()['m_Component'] if objects[c['component']['m_PathID']].type.name=='Animation')
refs=[]
for ref in anim.read_typetree()['m_Animations']:
 if ref['m_PathID']:
  c=objects[ref['m_PathID']].read_typetree();refs.append({'pathID':ref['m_PathID'],'name':c['m_Name']})
allclips=[{'pathID':o.path_id,'name':o.read().m_Name} for o in objects.values() if o.type.name=='AnimationClip']
reader=Path(__file__).with_name('inspect-native-runtime-methods.py');ns={'__file__':str(reader)}
exec(compile(reader.read_text().split('for typeName,methodName in ')[0],str(reader),'exec'),ns)
st,ts,m,h,r,methods=[ns[k] for k in ['st','ts','m','h','r','methods']]
t=next(t for t in ts if st(t[0])=='CharacterPlayer');resolved={}
for i in range(t[9],t[9]+t[16]):
 d=struct.unpack_from('<7i4H',m,h[12]+i*36);a=r.get(methods+8*((d[6]&0xffffff)-1),0)
 if a in [0x1297c78,0x1296ee4,0x1298d60]:resolved[hex(a)]='CharacterPlayer.'+st(d[0])
assert resolved['0x1297c78']=='CharacterPlayer.ApplyPlayerTexture'
assert resolved['0x1296ee4']=='CharacterPlayer.SetAlpha'
binary=Path(library).read_bytes();off=ns['off']
# Verify actual direct call words in this binary, not just an old disassembly label.
assert struct.unpack_from('<I',binary,off(0x1298dc0))[0]==0x97fff849
assert struct.unpack_from('<I',binary,off(0x1298dc8))[0]==0x97fffbac
out=Path(__file__).resolve().parents[1]/'target/temple-run/analysis/gameplay-revive-clip-audit.json'
data={'binarySHA256':hashlib.sha256(binary).hexdigest(),'sharedAssetsSHA256':hashlib.sha256(raw).hexdigest(),'owner':owner.read().m_Name,'animationPathID':anim.path_id,'allActorReferences':refs,'allShared0Clips':allclips,'resolvedMethods':resolved,'verifiedDirectCalls':[{'instruction':'0x1298dc0','target':'0x1296ee4'},{'instruction':'0x1298dc8','target':'0x1297c78'}],'scope':'Complete Animation.m_Animations references for Jhony_Export3 and all AnimationClip objects in sharedassets0 only; does not exclude procedural effects or other bundles. No new animation is inferred from missing clip names.'}
out.write_text(json.dumps(data,indent=2)+'\n')
print(json.dumps({'actorClips':refs,'shared0ClipCount':len(allclips),'resolvedMethods':resolved,'output':str(out)},indent=2))
