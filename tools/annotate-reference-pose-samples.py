"""Persist conservative human-reviewed source poses; these are NOT input events."""
from pathlib import Path
import json,hashlib,collections
root=Path(__file__).resolve().parents[1];analysis=root/'target/temple-run/analysis'
opening=json.loads((analysis/'reference-opening-pose-observations.json').read_text())
labels={r['videoSecond']:{'slide-visible':'prone-slide-visible','airborne-visible':'airborne-pose-visible','run-visible':'upright-visible','uncertain':'uncertain'}[r['pose']]for r in opening['observations']}
# Reviewed against labelled source contact sheets, not generated from sound/simulation.
blocks=[
(36,67,{'prone-slide-visible':'37 39 41 43 44 49 51 52 54 56 57 59 61 64 67','upright-visible':'40 42 45 47 48 66','lowering-or-rising-visible':'36 38 63','airborne-pose-visible':'46 58 60 62 65'}),
(68,99,{'prone-slide-visible':'68 70 71 72 73 75 79 80 82 83 84 85 88 90 91 93 95 97','upright-visible':'69 74 81 89','lowering-or-rising-visible':'78 87 94 99','airborne-pose-visible':'77 86 96'}),
(100,131,{'prone-slide-visible':'101 102 104 105 106 107 109 111 113 114 115 116 118 119 120 122 123 125 127 128 130','upright-visible':'110 112 117 121 126 129','airborne-pose-visible':'100 103 108 124 131'}),
(132,163,{'prone-slide-visible':'134 136 137 140 142 145 150 153 154 155 158 159 161 162 163','upright-visible':'132 139 141 146 147 148 151 160','lowering-or-rising-visible':'135 149 152 157','airborne-pose-visible':'133 138 143 144'}),
(164,195,{'prone-slide-visible':'167 171 173 174 175 178 180 183 184 185 188 191 193 195','upright-visible':'164 176 177 186 194','lowering-or-rising-visible':'166 181 187 190 192','airborne-pose-visible':'165 172 179 189'}),
(196,227,{'prone-slide-visible':'196 197 198 199 201 203 206 207 211 212 213 215 216 217 219 222 224','upright-visible':'208 210 214 226','airborne-pose-visible':'200 202 204 209 218 220 223 225'}),
(228,262,{'prone-slide-visible':'228 230 233 235 240 246 251 254 255 256 257','upright-visible':'239 241 250 252 258','lowering-or-rising-visible':'238 242','airborne-pose-visible':'229 231 232 234 236 237 243 244 245 247 248 249 253 260 261'})]
for start,end,groups in blocks:
 for t in range(start,end+1):labels[t]='uncertain'
 seen=set()
 for label,seconds in groups.items():
  for t in map(int,seconds.split()):
   assert start<=t<=end and t not in seen;seen.add(t);labels[t]=label
rows=[]
for t,label in sorted(labels.items()):
 file=root/f'docs/screenshots/BV1ypuKzPErT/{t:03}.jpg';rows.append(dict(videoSecond=t,image=str(file.relative_to(root)),imageSHA256=hashlib.sha256(file.read_bytes()).hexdigest(),pose=label,reviewed=True))
record=dict(source='BV1ypuKzPErT verified full-video 1fps frames',review='manual visual inspection of labelled body contact sheets; conservative labels',crop=[90,440,330,880],counts=dict(collections.Counter(r['pose']for r in rows)),observations=rows,limitations=['covers gameplay samples004..262; introduction/results/alternate opening excluded','one sample each second, not recovered touch timestamps','upright may be a transient slide-start/run restart, not sustained accelerating running','airborne is visible pose, not proof of a jump input or native IsJumping flag','uncertain includes enemies, scenery, crop and invincibility occlusion','crop can miss high airborne runner; no interpolation between samples'])
assert len(rows)==259
(analysis/'reference-gameplay-pose-observations.json').write_text(json.dumps(record,indent=2)+'\n');print(record['counts'])
