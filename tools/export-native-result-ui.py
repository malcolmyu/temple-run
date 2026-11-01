"""Extract End Game GUI's paper sprites with their native atlas rectangles."""
import UnityPy,struct,json,sys,hashlib
from pathlib import Path
from PIL import Image
root=Path(__file__).resolve().parents[1];raw=Path(sys.argv[1]).read_bytes();obs={o.path_id:o for o in UnityPy.load(raw).objects};b=obs[1959].get_raw_data();im=Image.open(root/'target/temple-run/web/public/assets/ui/egUI_Buttons2x.png');records={}
for name,out in [('endGameBackground@2x.png','result-paper-bottom.png'),('endGameBackground_tile','result-paper-tile.png')]:
 i=b.index(name.encode());p=(i+len(name)+3)//4*4;r=struct.unpack_from('<8f',b,p);x,y,w,h=r[:4];assert w==490 and h in [400,534];im.crop((round(x),round(y),round(x+w),round(y+h))).save(root/f'target/temple-run/web/public/assets/ui/{out}');records[name]=dict(outerRect=list(r[:4]),innerRect=list(r[4:]),output=out)
im.crop((1005,353,1540,471)).save(root/'target/temple-run/web/public/assets/ui/result-ribbon-wide.png')
records['ribbon_button_wide']=dict(atlasPathID=1959,outerRect=[1005,353,535,118],output='result-ribbon-wide.png')
header=obs[77].read().image
for name,x in [('left',0),('right',520)]:
 header.crop((x,237,x+120,372)).save(root/f'target/temple-run/web/public/assets/ui/result-header-{name}.png')
records['header']=dict(atlasPathID=2250,texturePathID=77,left=[0,237,120,135],right=[520,237,120,135])
(root/'target/temple-run/analysis/native-result-paper-source.json').write_text(json.dumps(dict(sharedAssetsSHA256=hashlib.sha256(raw).hexdigest(),atlasPathID=1959,sprites=records,note='Native backdrop uses 3 un-stretched400px tile sprites and534px bottom sprite; do not stretch the entire atlas region to full screen height.'),indent=2)+'\n')
