"""Build labelled source-pose contact sheet; no pose labels are inferred by this script."""
from PIL import Image,ImageDraw
from pathlib import Path
import argparse
p=argparse.ArgumentParser();p.add_argument('--start',type=int,default=4);p.add_argument('--end',type=int,default=35);a=p.parse_args()
root=Path(__file__).resolve().parents[1];times=list(range(a.start,a.end+1));cols=8;rows=(len(times)+cols-1)//cols
out=Image.new('RGB',(cols*140,rows*285),(24,24,24));draw=ImageDraw.Draw(out)
for i,t in enumerate(times):
 im=Image.open(root/f'docs/screenshots/BV1ypuKzPErT/{t:03}.jpg').crop((90,440,330,880));im.thumbnail((140,260));x=(i%cols)*140;y=(i//cols)*285;out.paste(im,(x,y+22));draw.text((x+4,y+4),f'{t:03}s',fill='white')
path=root/f'target/temple-run/analysis/reference-pose-{a.start:03}-{a.end:03}.png';out.save(path);print(path)
