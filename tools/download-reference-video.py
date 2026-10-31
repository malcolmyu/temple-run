"""Retrieve user-requested public Bilibili video stream from API-returned CDN URLs."""
from pathlib import Path
import json,urllib.request,hashlib,subprocess
root=Path(__file__).resolve().parents[1];out=root/'target/temple-run/analysis/reference-media';out.mkdir(exist_ok=True)
api='https://api.bilibili.com/x/player/playurl?bvid=BV1ypuKzPErT&cid=30965762531&qn=16&fnval=16&fnver=0&fourk=0'
headers={'User-Agent':'Mozilla/5.0','Referer':'https://www.bilibili.com/video/BV1ypuKzPErT/'}
with urllib.request.urlopen(urllib.request.Request(api,headers=headers),timeout=30)as r:result=json.load(r)
assert result['code']==0,result.get('message');dash=result['data']['dash'];candidates=[v for v in dash['video']if v['id']==16 and v.get('codecs','').startswith('avc')];video=min(candidates,key=lambda v:v['bandwidth'])
urls=(video.get('backupUrl')or video.get('backup_url')or[])+[video.get('baseUrl')or video.get('base_url')]
path=out/'BV1ypuKzPErT-video.m4s';temp=path.with_suffix('.partial');errors=[]
for url in urls:
 try:
  with urllib.request.urlopen(urllib.request.Request(url,headers=headers),timeout=30)as r:
   declared=r.headers.get('Content-Length');status=r.status
   assert status==200,('Incomplete HTTP response',status,r.headers.get('Content-Range'))
   total=0
   with temp.open('wb')as f:
    while True:
     chunk=r.read(1024*1024)
     if not chunk:break
     total+=len(chunk);f.write(chunk)
   if declared:assert total==int(declared),(total,declared)
  probe=subprocess.run(['/opt/homebrew/bin/ffprobe','-v','error','-select_streams','v:0','-count_frames','-show_entries','stream=width,height,r_frame_rate,nb_read_frames,duration','-of','json',str(temp)],capture_output=True,text=True,check=True)
  assert not probe.stderr,probe.stderr
  stream=json.loads(probe.stdout)['streams'][0];frames=int(stream['nb_read_frames']);assert frames>8000,frames
  temp.replace(path);record=dict(bvid='BV1ypuKzPErT',cid=30965762531,sourceAPI=api,streamID=video['id'],codec=video['codecs'],bandwidth=video['bandwidth'],HTTPStatus=status,declaredBytes=int(declared)if declared else None,bytes=total,SHA256=hashlib.sha256(path.read_bytes()).hexdigest(),decodedStream=stream,status='Full video stream byte length and complete frame decode verified; audio stored separately')
  (out/'video-source.json').write_text(json.dumps(record,indent=2)+'\n');print(json.dumps(record));break
 except Exception as e:errors.append(str(e));print('CDN attempt failed:',str(e),flush=True)
else:raise RuntimeError(errors)
