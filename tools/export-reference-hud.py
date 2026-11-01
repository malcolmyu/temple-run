"""Export classic HUD sprites using native UIAtlas 1969 rectangles."""
import json,sys,struct,hashlib
from pathlib import Path
import UnityPy
root=Path(__file__).resolve().parents[1];raw=Path(sys.argv[1]).read_bytes();objects={o.path_id:o for o in UnityPy.load(raw).objects};atlas=objects[1969].get_raw_data();texture=objects[72].read();assert texture.m_Name=='InterfaceTexture2x';image=texture.image
mapping={'hud-vines':'jungleA.png','hud-left':'totem.png','hud-right':'scoreboard.png','hud-score':'scoreboardPanelScore.png','bag':'idol.png','hud-pause':'pause.png','hud-coin':'coin.png','hud-milestone':'messageBoard.png'};result={}
for output,name in mapping.items():
 start=atlas.index(name.encode());offset=(start+len(name)+3)//4*4;rect=struct.unpack_from('<4f',atlas,offset);x,y,w,h=map(int,rect);assert tuple(map(float,(x,y,w,h)))==rect
 path=root/'target/temple-run/web/public/assets/ui'/f'{output}.png';image.crop((x,y,x+w,y+h)).save(path);result[output]=dict(sprite=name,rect=[x,y,w,h],SHA256=hashlib.sha256(path.read_bytes()).hexdigest())
(root/'target/temple-run/analysis/hud-atlas-source.json').write_text(json.dumps(dict(sharedAssetsSHA256=hashlib.sha256(raw).hexdigest(),atlasPathID=1969,texturePathID=72,texture='InterfaceTexture2x',sprites=result),indent=2)+'\n');print(json.dumps(result,indent=2))
