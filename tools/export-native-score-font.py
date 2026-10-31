"""Export the actual Game GUI Score Label's UIFont1955, including BMFont metrics."""
import json,re,struct,sys,zipfile,hashlib
from pathlib import Path
import UnityPy
root=Path(__file__).resolve().parents[1];raw=Path(sys.argv[1]).read_bytes();s={o.path_id:o for o in UnityPy.load(raw).objects};z=zipfile.ZipFile(sys.argv[2]);textRaw=z.read('assets/bin/Data/439d27717fbf1af4b9a419d097ee0139');text=next(o.read()for o in UnityPy.load(textRaw).objects if o.type.name=='TextAsset').m_Script
font=s[1955].get_raw_data();assert b'Cheboygan_Arty2x'in font
uv=struct.unpack_from('<4f',font,44);image=s[71].read().image;assert image.size==(1024,1024)
pageX=round(uv[0]*image.width);pageY=round((1-uv[1]-uv[3])*image.height);assert(pageX,pageY)==(0,352)
glyphs={}
for line in text.splitlines():
 if not line.startswith('char '):continue
 d={k:int(v)for k,v in re.findall(r'(\w+)=(-?\d+)',line)};i=d['id']
 assert struct.pack('<9i',i,d['x'],d['y'],d['width'],d['height'],d['xoffset'],d['yoffset'],d['xadvance'],0)in font
 if not 48<=i<=57:continue
 digit=str(i-48);x,y=pageX+d['x'],pageY+d['y'];path=root/f'target/temple-run/web/public/assets/ui/score-arty-{digit}.png';image.crop((x,y,x+d['width'],y+d['height'])).save(path);glyphs[digit]=dict(width=d['width'],height=d['height'],xOffset=d['xoffset'],yOffset=d['yoffset'],advance=d['xadvance'],rect=[x,y,d['width'],d['height']],SHA256=hashlib.sha256(path.read_bytes()).hexdigest())
level=z.read('assets/bin/Data/level0');o={o.path_id:o for o in UnityPy.load(level).objects};label=o[4359].get_raw_data();assert struct.pack('<iq',2,1955)in label
record=dict(font='Cheboygan_Arty2x',fontPathID=1955,labelPathID=4359,gameObjectPathID=249,labelHierarchy=['Score Label','Score Text','Score','Top Right','Game GUI Root','GUI 2D'],labelTransformScale=65,lineHeight=82,fontSize=64,pageOrigin=[pageX,pageY],glyphs=glyphs)
(root/'target/temple-run/web/src/game/nativeScoreFont.json').write_text(json.dumps(record,indent=2)+'\n')
record.update(sharedAssetsSHA256=hashlib.sha256(raw).hexdigest(),levelSHA256=hashlib.sha256(level).hexdigest(),textAssetSHA256=hashlib.sha256(textRaw).hexdigest(),texturePathID=71,atlasPathID=1961,materialPathID=40,UVRect=list(uv),note='UIFont serialized glyph records match BMFont TextAsset; previous score images used a different font.')
(root/'target/temple-run/analysis/native-score-font-source.json').write_text(json.dumps(record,indent=2)+'\n');print('Native Score Label font exported:',len(glyphs),'digits, fixed advances',set(g['advance']for g in glyphs.values()))
