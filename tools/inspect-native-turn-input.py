"""Audit turn search/intent separately from execution; never execute native code."""
import hashlib,json,struct,subprocess,sys
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
reader=ROOT/'tools/inspect-native-runtime-methods.py'
n={'__file__':str(reader)}
exec(compile(reader.read_text().split('for typeName,methodName in ')[0],str(reader),'exec'),n)
b,off=n['binary'],n['off']
expected={
 0x12abccc:(0x12abd80,'7e5979d5edd0f3e475e352cc733705a48505ddec4fb4cad67eede5b0edc011b0'),
 0x12abe18:(0x12abe38,'2e6f609701e5a78817e8c0cecd78f4e896c7308ef6c915fc688eec65bf23c655'),
 0x12acbd4:(0x12acbd8,'110f46b5b35c069160560c6ad6786f647dd44e8760a52a46fc22dbbcd7630b91'),
 0x12acc7c:(0x12ad500,'af5d3ec324d4b08a6545cb2158e485ce8f29d81fb058212df93763f7ab05c8e8'),
 0x12ad570:(0x12ad61c,'4c9f39a8d422c638f253431586de1efd92db74d6adcb8d7a353fbd58ef2d563e'),
 0x12e7e08:(0x12e7e18,'017af6d276d5caa882e4459dfde41f5613b4287fe901136209f39e96d4f4215b'),
 0x12e7e18:(0x12e8180,'63e3415ce9ea1498337d21adab96f7cf10c2deaad0b8c3209e54d6bd93e5b409'),
 0x12e8180:(0x12e818c,'3fb5d56085236051bbe2f495829f6f04572be3279059979ba56a34a6b291a7ac'),
 0x12e818c:(0x12e828c,'7ce9dc03c73466f1ed1701edc79d2d822e7f614778c77abfdeaf5d9c298d1d82'),
 0x126ffb0:(0x127089c,'9b94d356a2dc3ea9e634daa57529d136b6613a12e535def92500b370b676b535'),
}
words={
 0x12abcdc:0x39408a68,0x12abce4:0x39408668,0x12abcec:0xbd402668,
 0x12abcf8:0x1e202900,0x12abcfc:0x1e2e1001,0x12abd00:0x1e212000,
 0x12abd04:0xbd002660,0x12abd08:0x5400006d,0x12abd0c:0x7802127f,
 0x12abd10:0xb900267f,0x12acbd4:0xd65f03c0,
 0x12ad578:0x52a7e008,0x12ad57c:0xb9006008,
 0x12acd44:0x1e2e1000,0x12acd4c:0x1e2a3800,
 0x12acd58:0x1e2f9001,0x12acd5c:0x1e210800,0x12acd60:0x1e2a1001,
 0x12acd64:0x52a84609,0x12acd68:0x1e21280b,0x12acd90:0x1e2d096d,
 0x12acdbc:0x1e2d2140,0x12aced8:0x52a85609,0x12acee4:0x1e230968,
 0x12ad0d4:0x39008a68,0x12ad2b0:0x39008668,
 0x12e7e08:0x4ea21c41,0x12e7e0c:0x12000042,0x12e7e10:0x4ea31c62,
 0x12e7edc:0x1e2b394d,0x12e7ee0:0x1e2c392b,
 0x12e7ef4:0x1e2d09a0,0x12e7ef8:0x1e2b0961,0x12e7efc:0x1e212800,
 0x12e7f00:0x1e21c000,0x12e7f04:0x1e282000,0x12e7f08:0x54000569,
 0x12e7f0c:0x510006d6,0x12e7fb4:0xaa1303f7,
 0x12e823c:0x1e232120,0x12e8248:0x5400016b,
 0x12e8250:0x1e222120,0x12e8254:0x54000105,
 0x12e8258:0x1e202100,0x12e825c:0x540000cb,
 0x12e8264:0x1e202100,0x12e8268:0x1a9f57e0,
 0x1270688:0x39408509,0x12706c4:0x39408908,
 0x1270704:0x3900891f,0x1270708:0x79004109,
}
def word(a):return struct.unpack_from('<I',b,off(a))[0]
for a,value in words.items():assert word(a)==value,f'instruction mismatch at {a:#x}'
def target(a):
 w=word(a);assert w>>26 in [0b100101,0b000101]
 imm=w&0x3ffffff
 if imm&(1<<25):imm-=1<<26
 return a+imm*4
calls={0x12acf04:0x12e7e08,0x12e7e14:0x12e7e18,0x12e7e74:0x12e28b0,
       0x12e81d0:0x12e28b0,0x1270144:0x12e7e08,
       0x12706b4:0x129899c,0x12706f0:0x1298a14}
for a,value in calls.items():assert target(a)==value,f'call mismatch at {a:#x}'
records=[]
for type_name in ['GameInput','TouchInput','PathElement','GameController']:
 t=next(t for t in n['ts'] if n['st'](t[0])==type_name)
 for i in range(t[9],t[9]+t[16]):
  d=struct.unpack_from('<7i4H',n['m'],n['h'][12]+i*36)
  a=n['r'].get(n['methods']+8*((d[6]&0xffffff)-1),0)
  if a not in expected:continue
  end,digest=expected[a];assert next(v for v in n['addresses'] if v>a)==end
  assert hashlib.sha256(b[off(a):off(end)]).hexdigest()==digest
  # Current metadata layout: slot3 is encoded return-type data; slot4 is
  # parameterStart. Do not interpret the former as a parameter table index.
  params=[]
  for j in range(d[4],d[4]+d[-1]):
   p=struct.unpack_from('<3I',n['m'],n['h'][22]+j*12);params.append(n['st'](p[0]))
  records.append(dict(type=type_name,method=n['st'](d[0]),address=hex(a),end=hex(end),sha256=digest,parameterNames=params))
assert len(records)==len(expected)
f=lambda v:struct.unpack('<f',struct.pack('<f',v))[0]
def values(sensitivity):
 factor=f(f(f(1-f(sensitivity))*f(1.75))+f(.25))
 return dict(sensitivity=sensitivity,factor=factor,minGesturePixels=f(44*factor),queryRadiusRaw=f(88*factor),queryRadiusWorld=f(88*factor)*.2)
out=ROOT/'target/temple-run/analysis/native-turn-input'
result=dict(binarySHA256=hashlib.sha256(b).hexdigest(),metadataSHA256=hashlib.sha256(n['m']).hexdigest(),
 methods=records,instructionChecks={hex(a):hex(v)for a,v in words.items()},callChecks={hex(a):hex(v)for a,v in calls.items()},
 defaults=values(.5),sensitivityExamples=[values(s)for s in [0,.5,1]],
 findings=[
  'TouchInput constructor defaults sensitivity to0.5. TouchMoved derives factor=(1-sensitivity)*1.75+0.25.',
  'Gesture recognition compares screen movement to44*factor; nearby turn lookup uses88*factor native world units. These are different units.',
  'GetPathElementIfPointOverTurn maps Vector3 to XZ and recurses through neighbouring graph nodes with bailOut. A candidate must be IsTurn and within a Euclidean radius, not a scalar6m-before-centre interval.',
  'IsPointOverTurnArea is a separate axis-aligned square test: lower bounds inclusive and upper bounds exclusive. Do not equate the turn search radius to this area or final rotation time.',
  'TouchMoved stores requested directions at GameInput offsets0x21/0x22. HandleDelayedTurning consumes those flags and conditionally invokes TurnLeft/TurnRight after further graph/position checks.',
  'GameInput.Update increments the separate float32 turn-intent age at0x24 while either direction flag is set. Age<=1 survives; age>1 clears both direction flags and resets age. TouchEnded is a bare return and does not cancel the buffered intent.',
 ],limits=[
  'Scene serialization, saved sensitivity and remote/version overrides may change the constructor default;19.8world units is a default calculation, not an observed video parameter.',
  'The delayed execution method has not been fully translated. This audit does not prove all input acceptance cases, exact commit timing, late bounds, or PCInput parity.',
  'The web adapter buffers a nearby direction for1second using the default radial query. Its6m confirmation/2m late bound and centre commit remain web geometry policy, not a full translation of HandleDelayedTurning.',
  'Native rejected-swipe stumble is intentionally not restored: the user requires ordinary Left/Right to change lane safely.',
 ])
# Validate completely before publishing evidence.
out.mkdir(exist_ok=True)
for row in records:
 asm=subprocess.run(['/usr/bin/objdump','-d','--start-address='+row['address'],'--stop-address='+row['end'],sys.argv[2]],capture_output=True,text=True,check=True).stdout
 (out/(row['type']+'.'+row['method']+'-'+row['address']+'.asm')).write_text(asm)
(out/'source.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
print(json.dumps(dict(methods=len(records),instructions=len(words),calls=len(calls),defaults=result['defaults'],limits=result['limits']),ensure_ascii=False))
