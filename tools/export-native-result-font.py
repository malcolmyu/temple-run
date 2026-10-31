"""Export actual End Game GUI Score Label5012 UIFont5729, including comma."""
import json,re,struct,sys,zipfile,hashlib
from pathlib import Path
import UnityPy
from PIL import ImageChops,Image
root=Path(__file__).resolve().parents[1];z=zipfile.ZipFile(sys.argv[1]);raw=z.read('assets/bin/Data/level0');obs={o.path_id:o for o in UnityPy.load(raw).objects};shared={o.path_id:o for o in UnityPy.load(Path(sys.argv[2]).read_bytes()).objects};font=obs[5729].get_raw_data();label=obs[5012].get_raw_data();assert struct.pack('<iq',0,5729)in label
textRaw=z.read('assets/bin/Data/f862806eb31a1144898deea1b1875769');text=next(o.read()for o in UnityPy.load(textRaw).objects if o.type.name=='TextAsset').m_Script
uv=struct.unpack_from('<4f',font,44);atlas=shared[71].read().image.convert('RGBA');px=round(uv[0]*atlas.width);py=round((1-uv[1]-uv[3])*atlas.height);color=struct.unpack_from('<4f',label,44);tint=tuple(round(c*255)for c in color);glyphs={}
for line in text.splitlines():
 if not line.startswith('char '):continue
 d={k:int(v)for k,v in re.findall(r'(\w+)=(-?\d+)',line)};i=d['id'];assert struct.pack('<9i',i,d['x'],d['y'],d['width'],d['height'],d['xoffset'],d['yoffset'],d['xadvance'],0)in font
 if i not in [44,*range(48,58)]:continue
 char=chr(i);name='comma'if i==44 else char;x,y=px+d['x'],py+d['y'];crop=atlas.crop((x,y,x+d['width'],y+d['height']));crop=ImageChops.multiply(crop,Image.new('RGBA',crop.size,tint));path=root/f'target/temple-run/web/public/assets/ui/result-{name}.png';crop.save(path);glyphs[char]=dict(width=d['width'],height=d['height'],xOffset=d['xoffset'],yOffset=d['yoffset'],advance=d['xadvance'],asset=f'result-{name}.png')
record=dict(font='Cheboygan_White2x',fontPathID=5729,labelPathID=5012,lineHeight=82,fontSize=64,color=list(color),glyphs=glyphs)
(root/'target/temple-run/web/src/game/nativeResultFont.json').write_text(json.dumps(record,indent=2)+'\n');record.update(levelSHA256=hashlib.sha256(raw).hexdigest(),BMFontSHA256=hashlib.sha256(textRaw).hexdigest(),pageOrigin=[px,py],source='End Game GUI/Top/Offset/Content/Text/Score Label');(root/'target/temple-run/analysis/native-result-font-source.json').write_text(json.dumps(record,indent=2)+'\n');print(json.dumps(record))
