"""Local production measurement server; MIME compression mirrors Pages; no-store guarantees cold measurement."""
from http.server import SimpleHTTPRequestHandler,ThreadingHTTPServer
from pathlib import Path
from functools import lru_cache
import argparse,gzip,io
parser=argparse.ArgumentParser();parser.add_argument('root');parser.add_argument('--port',type=int,default=5181);args=parser.parse_args()
@lru_cache(maxsize=512)
def payload(path,stamp,compress):
 data=Path(path).read_bytes();return gzip.compress(data,mtime=0) if compress else data
class Handler(SimpleHTTPRequestHandler):
 def __init__(self,*a,**kw):super().__init__(*a,directory=args.root,**kw)
 def send_head(self):
  p=Path(self.translate_path(self.path))
  if p.is_dir():p=p/'index.html'
  if not p.is_file():self.send_error(404);return None
  compressed=p.suffix in ['.html','.json','.js','.css'] and 'gzip' in self.headers.get('Accept-Encoding','')
  data=payload(str(p),p.stat().st_mtime_ns,compressed)
  self.send_response(200);self.send_header('Content-Type',self.guess_type(str(p)));self.send_header('Content-Length',str(len(data)))
  self.send_header('Cache-Control','no-store');self.send_header('Vary','Accept-Encoding')
  if compressed:self.send_header('Content-Encoding','gzip')
  self.end_headers();return io.BytesIO(data)
 def log_message(self,*a):pass
print(f'Production measurement server http://127.0.0.1:{args.port}/',flush=True)
ThreadingHTTPServer(('127.0.0.1',args.port),Handler).serve_forever()
