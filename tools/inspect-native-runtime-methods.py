"""Resolve native methods through IL2CPP CodeGenModule; disassemble, never execute the APK library."""
import sys,json,hashlib,subprocess
import struct,zipfile
from pathlib import Path
z=zipfile.ZipFile(sys.argv[1]);m=z.read('assets/bin/Data/Managed/Metadata/global-metadata.dat');h=struct.unpack_from('<50I',m);s=m[h[6]:h[6]+h[7]]
def st(i):return s[i:s.find(b'\0',i)].decode()
ts=[struct.unpack_from('<16i8H2I',m,p)for p in range(h[40],h[40]+h[41],88)]
binary=Path(sys.argv[2]).read_bytes();ph=struct.unpack_from('<Q',binary,32)[0];pe,pn=struct.unpack_from('<HH',binary,54);segments=[struct.unpack_from('<II6Q',binary,ph+i*pe)for i in range(pn)]
def off(a):
 p=next(p for p in segments if p[0]==1 and p[3]<=a<p[3]+p[5]);return p[2]+a-p[3]
r={};sh=struct.unpack_from('<Q',binary,40)[0];se,sn=struct.unpack_from('<HH',binary,58)
for i in range(sn):
 q=struct.unpack_from('<II4QII2Q',binary,sh+i*se)
 if q[1]==4:
  for p in range(q[4],q[4]+q[5],q[9]):
   a,k,d=struct.unpack_from('<QQq',binary,p)
   if k&0xffffffff==1027:r[a]=d
table=r[0x27d43d0]

nameOffset=binary.index(b'Assembly-CSharp.dll\0')
segment=next(p for p in segments if p[0]==1 and p[2]<=nameOffset<p[2]+p[5])
nameVA=segment[3]+nameOffset-segment[2]
module=next(a for a,v in r.items()if v==nameVA and 1000<struct.unpack_from('<I',binary,off(a+8))[0]<10000)
count=struct.unpack_from('<I',binary,off(module+8))[0];methods=r[module+16]
addresses=sorted(set(r.get(methods+i*8,0)for i in range(count))-{0})
root=Path(__file__).resolve().parents[1]/'target/temple-run/analysis/native-methods';root.mkdir(exist_ok=True)
records={}
for typeName,methodName in [('GameCamera','Shake'),('TouchInput','TouchMoved'),('ControlsConfigData','.ctor'),('CharacterPlayer','SlamDown'),('AudioManager','PreloadSounds'),('AudioManager','PlayFX'),('GameController','ComputeDistanceTraveled'),('CharacterPlayer','AddScore'),('CharacterPlayer','Stumble'),('GameCamera','Update'),('GameCamera','UpdateWater'),('GameController','HandlePacing'),('GameController','GetAccelerationCurveThreshold'),('GameController','GetAccelerationCurveForce'),('GameController','HandleBonusItemPickup'),('CharacterPlayer','Update'),('CharacterPlayer','StartCoinBonus'),('GameController','Update'),('GameController','ProcessPlayerConfigData'),('PlayerConfigData','.ctor'),('GameController','SimulateWorldElements'),('GameController','HandleControls'),('CharacterPlayer','GetRunVelocity'),('CharacterPlayer','GetMaxRunVelocity'),('GameController','GameStart'),('GameController','LoadLevelInformation'),('BonusItem','Instantiate'),('MovingObject','ApplyForce'),('MovingObject','Simulate'),('CharacterPlayer','Reset'),('CharacterPlayer','Jump'),('CharacterPlayer','Slide'),('GameController','HandleCollisionWithObstacles'),('GameController','SimulateEnemies'),('MovingObject','DoesSphereIntersectBoundingBox'),('CharacterPlayer','GetWorldSpaceBounds'),('MovingObject','Update'),('MovingObject','AddFollowingPathNode'),('MovingObject','StartFollowingPath'),('GameCamera','SnapStartGame'),('GameCamera','Reset'),('CommonPlayer','Update'),('CharacterPlayer','AdjustAnimationSpeed'),('CharacterPlayer','Kill'),('CharacterPlayer','SetGroundHeight'),('GameController','EndGame'),('GameInput','HandleAccelerometerForce'),('TouchInput','GetAccelerometerForceX'),('TouchInput','.ctor'),('PCInput','SimulateTilt'),('EndGameUI','SlideIn'),('EndGameUI','SlideInAnimation'),('EndGameUI','SetButtonState'),('<SlideInAnimation>d__61','MoveNext')]:
 typeIndex=next(i for i,t in enumerate(ts)if st(t[0])==typeName);t=ts[typeIndex]
 definitions=[struct.unpack_from('<7i4H',m,h[12]+i*36)for i in range(t[9],t[9]+t[16])]
 definition=next(d for d in definitions if st(d[0])==methodName);assert definition[1]==typeIndex
 token=definition[6];address=r[methods+8*((token&0xffffff)-1)];end=next(a for a in addresses if a>address)
 output=subprocess.run(['/usr/bin/objdump','-d','--start-address='+hex(address),'--stop-address='+hex(end),sys.argv[2]],check=True,capture_output=True,text=True).stdout
 key=typeName+'.'+methodName;(root/(key+'.asm')).write_text(output)
 records[key]=dict(token=hex(token),address=hex(address),end=hex(end),sha256=hashlib.sha256(binary[off(address):off(end)]).hexdigest())
fieldTable=r[0x27d43f0];fields={}
for typeName,names in [('EndGameUI',[]),('CommonPlayer',['PreviousLocation']),('MovingObject',['Velocity']),('GameController',['DistanceRemainder','DistanceTraveled','DistanceTraveledSinceLastLevelChange','DistanceTraveledSinceLastTurnSection']),('CharacterPlayer',['IsJumping','Score','ScoreMultiplier']),('GameCamera',['NeedsToDuckCamera','GroundHeight','FollowHeightJump','FollowDistanceJump','FocusHeightJump'])]:
 ti=next(i for i,t in enumerate(ts)if st(t[0])==typeName);t=ts[ti];pointer=r[fieldTable+ti*8]
 for j,i in enumerate(range(t[8],t[8]+t[18])):
  n,ty,tok=struct.unpack_from('<3i',m,h[24]+i*12)
  if st(n)in names or typeName in ['EndGameUI','CharacterPlayer','GameCamera']:fields[typeName+'.'+st(n)]=hex(struct.unpack_from('<i',binary,off(pointer+j*4))[0])
assert fields['CharacterPlayer.Score']=='0x138' and fields['CharacterPlayer.ScoreMultiplier']=='0x13c'
coreName=binary.index(b'UnityEngine.CoreModule.dll\0');segment=next(p for p in segments if p[0]==1 and p[2]<=coreName<p[2]+p[5]);coreVA=segment[3]+coreName-segment[2]
core=next(a for a,v in r.items()if v==coreVA and 100<struct.unpack_from('<I',binary,off(a+8))[0]<20000);coreMethods=r[core+16]
timeType=next(t for t in ts if st(t[0])=='Time'and st(t[1])=='UnityEngine')
timeMethods=[struct.unpack_from('<7i4H',m,h[12]+i*36)for i in range(timeType[9],timeType[9]+timeType[16])]
timeMethod=next(d for d in timeMethods if st(d[0])=='get_smoothDeltaTime');timeAddress=r[coreMethods+8*((timeMethod[6]&0xffffff)-1)];assert timeAddress==0x24bf450
record=dict(binarySHA256=hashlib.sha256(binary).hexdigest(),metadataSHA256=hashlib.sha256(m).hexdigest(),metadataVersion=h[1],module=hex(module),methodCount=count,methods=records,fields=fields,distanceFormula=dict(timeSource='UnityEngine.Time.get_smoothDeltaTime',timeSourceAddress=hex(timeAddress),referenceStep=struct.unpack_from('<f',binary,off(0x6976b0))[0],divisor=20,formula='metricDelta = (rawHorizontalDistance/smoothDt)^2 * (1/60) * smoothDt /20',worldScale=.2,worldFormula='metricDelta = worldHorizontalDistance^2 /(48*smoothDt)'),scoreFormula='integer distance remainder is passed to AddScore; Score += integerDelta * ScoreMultiplier')
record['motion'] = dict(slideSpeedCoefficient=struct.unpack_from('<f',binary,off(0x697524))[0], slideMaxSeconds=.75, jumpRawVelocityClamp=[80,100], gravityRawMagnitude=250, forceIntegration='MovingObject.Simulate velocity += Force * smoothDeltaTime; clears Force after application')
assert struct.unpack_from('<I',binary,off(0x126cc1c))[0]==0x3903311f
assert struct.unpack_from('<I',binary,off(0x1271544))[0]==0x3903311a
assert struct.unpack_from('<I',binary,off(0x1271560))[0]==0x3903311a
record['cameraDuckTrigger']=dict(resetAddress='0x126cc1c',setAddresses=['0x1271544','0x1271560'],nearestElementOffset='0x88',mustJumpOverOffset='0x20',mustSlideUnderOffset='0x21',slidingOffset='0x100',invincibilityOffset='0x154',rule='reset when not sliding; nearest element active overhead obstacle sets for slide or invincibility without MustJumpOver; retains while sliding',webElementApproximation='native12m obstacle floor footprint')
assert struct.unpack_from('<I',binary,off(0x1298478))[0]==0xb9011e68
assert struct.unpack_from('<I',binary,off(0x127191c))[0]==0x52a852c9
assert struct.unpack_from('<I',binary,off(0x1271920))[0]==0x52a88f4a
record['enemyFollow']=dict(method='GameController.SimulateEnemies',timeSinceStumbleReset=7,timeSinceStumbleOffset='0x11c',formulaRaw='s=t/10*46-23; base=s<11.5?11.5:s<=25?s:75',duckExtraRaw=75,introExtraRaw=10,normalRateRaw=100,duckOutwardRateRaw=1000,worldScale=.2,webIntroFlag='current3s intro timer approximation')
assert struct.unpack_from('<I',binary,off(0x1297a4c))[0]==0x1e249001 # fmov10, not serialized reset age7
assert struct.unpack_from('<I',binary,off(0x1297a60))[0]==0x540001a5 # age>=10 takes safe stumble branch
record['stumbleRules']=dict(resetAge=7,fatalWindowSeconds=10,rule='Stumble kills when TimeSinceStumbleStart <10; reset age7 is a separate serialized value',compareAddress='0x1297a4c',safeBranchAddress='0x1297a60')
assert struct.unpack_from('<I',binary,off(0x126cb8c))[0]==0x1e2e1001 # fmov1s intro gate
assert struct.unpack_from('<I',binary,off(0x12983dc))[0]==0x3906c268 # Reset Hold=true
assert struct.unpack_from('<I',binary,off(0x126cba0))[0]==0x3906c11f # Update Hold=false after intro gate
record['introHold']=dict(controllerIntroOffset='0x106',timeSinceGameStartOffset='0xd0',playerHoldOffset='0x1b0',holdSeconds=1,introFlagSeconds=3,gateAddress='0x126cb80',releaseAddress='0x126cba0',status='native1s Hold integrated in classic motion/input/stumble age; opening animation and exact video-clock alignment remain unresolved')


# MovingObject.Update is a tail branch into Simulate, not an empty method.
assert struct.unpack_from('<I',binary,off(0x12e0050))[0]==0x14000001
introLast=struct.unpack_from('<4f',binary,off(0x698110))
assert introLast==(2.75,-20.0,45.0,210.0)
record['introPath']=dict(
 sourceMethods=['GameController.GameStart','GameCamera.SnapStartGame','MovingObject.Update','MovingObject.Simulate'],
 nodes=[dict(time=0,positionRaw=[0,10,100],ease=False),dict(time=.25,positionRaw=[0,10,100],ease=True),dict(time=introLast[0],positionRaw=list(introLast[1:]),ease=True)],
 coordinateSpace='absolute Unity world positions; scale .2; browser basis and actor origin require integration verification',
 nodeFlagMeaning='endpoint easing, not relative coordinates',
 easing=dict(neither='u',startOnly='u^3',endOnly='1+(u-1)^3',both='u<.5 ? 4*u^3 : 1-4*(1-u)^3'),
 constantAddress='0x698110',easingBranchAddress='0x12e0554',baseUpdateTailBranch='0x12e0050 -> 0x12e0054',
 initialPlayerPositionRaw=[0,0,-10],initialPlayerRotationEuler=[0,0,0],
 initialPlayerPositionAddress='0x126a714',
 updateOrder='GameCamera.Update first calls MovingObject.Update/Simulate; IsIntroScene skips normal position follow but focus/look-at continues',
 status='absolute path integrated in classic camera, canonicalX retained and UnityZ reflected; visual/source-version and exact clock/focus alignment remain unverified')

assert struct.unpack_from('<I',binary,off(0x12afebc))[0]==0x1e2e9001 # fmov1.25
record['cameraFollowStep']=dict(velocityMultiplier=1.25,address='0x12afebc',rule='clamped Euclidean step of |Velocity|*1.25*smoothDeltaTime',focusRule='copy player position/rotation; replace focusY with GroundHeight+FocusHeight',introRule='MovingObject path before focus update; skip ordinary follow position during IsIntroScene',webLimitations='velocity uses forward speed and jump velocity; lateral physics, ground height on falling terrain, roll and forced-snap flag remain approximate')

assert struct.unpack_from('<I',binary,off(0x12bf2fc))[0]==0x1e2d1000 # fmov.75
assert struct.unpack_from('<I',binary,off(0x12be9ac))[0]==0x1e2a1000 # RunAgain TweenPosition .25
record['resultButtonEntrance']=dict(method='<SlideInAnimation>d__61.MoveNext',owner='EndGameUI',initialWait=.75,runAgainDuration=.25,initialWaitAddress='0x12bf2fc',runAgainTweenAddress='0x12be9ac',mainMenuTweenAddress='0x12bea70',webStatus='buttons restored to viewport with native first delay and duration; native final responsive layout/easing and full coroutine branches remain unverified')

assert struct.unpack_from('<I',binary,off(0x12978b8))[0]==0x540001cd # b.le keeps IsSliding on equality
record['slideTimer']=dict(elapsedOffset='0x104',durationOffset='0x108',isSlidingOffset='0x100',comparisonAddress='0x12978b4',keepActiveBranchAddress='0x12978b8',clearAddress='0x12978c0',rule='float32 elapsed += smoothDeltaTime; clear IsSliding only when elapsed>duration',webRepresentation='elapsed nativefloat32; positive remaining encodes active, EPSILON only at exact equality')

assert struct.unpack_from('<f',binary,off(0x69761c))[0]==0.06666667014360428
record['jumpIntegration']=dict(gravityRaw=250,worldScale=.2,forceAddress='0x1297614',baseUpdateCall='0x1297648',groundCheckAfterMove='0x1297664',commonUpdateAddress='0x1297e40',positionStepMaxAddress='0x69761c',positionStepMax=struct.unpack_from('<f',binary,off(0x69761c))[0],rule='float32 force/velocity; min(smoothDeltaTime,positionStepMax) position translation; then ground clamp',adjustAnimationSpeedAddress='0x1297f68')

assert struct.unpack_from('<I',binary,off(0x12abddc))[0]==0x52a82449
assert struct.unpack_from('<I',binary,off(0x12abdf4))[0]==0x1e339002
record['tiltSteering']=dict(playerXOffset='0x190',nativeAccelerationGain=10.125,maxOffsetRaw=7,worldScale=.2,offsetWriteAddress='0x12abe00',defaultSensitivity=.5,sensitivityConstructorAddress='0x12ad578',filterIntervals=list(struct.unpack_from('<2f',binary,off(0x696f10))),filterMethod='TouchInput.GetAccelerometerForceX',positionGain='dtClamp*50*(sensitivity*1.75+.25)*.1',positionGainAddress='0x126f6e8',positionScaleAddress='0x126f970',introSkipAddress='0x12abda0',introSeconds=3,browserMappingStatus='classic analog position dynamics and intro gate restored; gamma neutral/dead-zone adapter still approximate; native accelerometer/filter helpers not wired to browser sensor')

assert struct.unpack_from('<f',binary,off(0x6975f0))[0]==0.6499999761581421
# Resolve AnimationModule independently: only90 methods, not the5306-row game table.
animName=binary.index(b'UnityEngine.AnimationModule.dll\0');seg=next(p for p in segments if p[0]==1 and p[2]<=animName<p[2]+p[5]);animVA=seg[3]+animName-seg[2]
animModule=next(a for a,v in r.items()if v==animVA and struct.unpack_from('<I',binary,off(a+8))[0]==90);animTable=r[animModule+16]
animType=next(t for t in ts if st(t[0])=='AnimationState'and st(t[1])=='UnityEngine');animDefs=[struct.unpack_from('<7i4H',m,h[12]+i*36)for i in range(animType[9],animType[9]+animType[16])];speedDef=next(d for d in animDefs if st(d[0])=='set_speed');assert r[animTable+8*((speedDef[6]&0xffffff)-1)]==0x248d3cc
record['animationSpeed']=dict(method='CharacterPlayer.AdjustAnimationSpeed',formula='all AnimationState.speed = length(rawVelocityXYZ)/100 * .6499999761581421',constantAddress='0x6975f0',coefficient=struct.unpack_from('<f',binary,off(0x6975f0))[0],speedSetter='0x248d3cc',animationModule=hex(animModule),animationModuleMethodCount=90,nativeWorldScale=.2,webLimitations='full lateral/boost velocity and native Unity queued-animation blending remain approximate')

assert struct.unpack_from('<I',binary,off(0x129794c))[0]==0x5400004d
record['stumbleAction']=dict(isStumblingOffset='0x10c',elapsedOffset='0x114',durationOffset='0x118',durationCoefficient=struct.unpack_from('<f',binary,off(0x6976ac))[0],durationRule='min(post-stumble raw forward speed*.005,.5)',durationCap=.5,expiryRule='float32 elapsed>duration',jumpRejectAddress='0x1297bbc',tiltRejectAddress='0x12abdc4',playAddress='0x1297b50',queueRunAddress='0x1297b78',clipPathID=143,wrapMode=1,webLimitations='default native stumble clip restored; exact callback order and queued animation state across all skins remains approximate')

assert struct.unpack_from('<I',binary,off(0x126d418))[0]==0x1e2c1000
assert struct.unpack_from('<I',binary,off(0x126d278))[0]==0x1e331002
record['deathSequence']=dict(normalDelay=.5,normalDelayAddress='0x126d418',endGameMethod='GameController.EndGame',elapsedResetAddress='0x1272198',delayStoreAddress='0x127219c',comparisonAddress='0x126c800',waitWhile='float32 elapsed<=delay',ledgeDeathRawDepth=6,ledgeDepthAddress='0x126d278',ledgeKillAddress='0x126d2a0',ledgeDeathType=4,waterDeathRawDepth=35,waterDepthAddress='0x1297994',waterKillAddress='0x12979ac',waterDeathType=1,worldScale=.2,killStopsVelocityAddress='0x1297ed8',webStatus='normal timer and separate unsupported water/ledge-reentry thresholds integrated; XZ progress counted before Kill; varied ground height/callback order remain approximate',ledgeDeathTypeName='Ledge',progressBeforeKillAddress='0x126cc78')

assert struct.unpack_from('<I',binary,off(0x12987a8))[0]==0x3943e268
assert struct.unpack_from('<I',binary,off(0x1297bb4))[0]==0x3943e268
record['actionGuards']=dict(jumpAirborneRead='0x1297bb4',slideAirborneRead='0x12987a8',jumpRejects=['IsJumping','IsStumbling','IsFalling'],slideRejects=['IsSliding','IsJumping','IsFalling'],airSlideEffect='Slide itself returns false; TouchMoved can call separate SlamDown when AllowSwipeToSlamDown is true',webStatus='classic uses native constructor default AllowSwipeToSlamDown=false; conditional SlamDown remote mode not integrated; challenge retains its prior fast descent')

assert struct.unpack_from('<I',binary,off(0x1297b1c))[0]==0x52800201
assert struct.unpack_from('<I',binary,off(0x1297b30))[0]==0x52800281
record['stumbleAudio']=dict(primary=dict(effect=16,name='gruntTrip',address='0x1297b1c'),secondary=dict(effect=20,name='monkeys',address='0x1297b30'),volume=1,preload='AudioManager.PreloadSounds uses Effects enum names to load resources',sourceAudioMatches=dict(firstTripMonkeys=dict(videoSecond=7.454125,ncc=.9415658054),postSecondRootMonkeys=dict(videoSecond=20.2114375,ncc=.9376203346)),webStatus='classic nonfatal stumble plays both effects; exact native gain/mixing/skin variants remain approximate')

controlIndex=next(i for i,t in enumerate(ts)if st(t[0])=='ControlsConfigData');controlType=ts[controlIndex];controlOffsets={};controlPointer=r[fieldTable+controlIndex*8]
for j,i in enumerate(range(controlType[8],controlType[8]+controlType[18])):
 n,ty,tok=struct.unpack_from('<3i',m,h[24]+i*12);controlOffsets[st(n)]=hex(struct.unpack_from('<i',binary,off(controlPointer+j*4))[0])
assert controlOffsets['AllowSwipeToSlamDown']=='0x2c'
assert struct.unpack_from('<I',binary,off(0x129e47c))[0]==0x79005008
assert struct.unpack_from('<I',binary,off(0x129e480))[0]==0x3900a809
record['controlsDefaults']=dict(constructor='0x129e470',fieldOffsets=controlOffsets,allowFallOnCliffs=True,allowFallOnNarrows=True,allowSwipeStumbleDeath=True,allowSwipeToStrafe=False,allowSwipeToSlamDown=False,allowTiltToTurn=False,status='constructor writes true to offsets28/29/2a; other zero-initialized booleans remain false; remote overrides unverified',slamDown=dict(method='0x129884c',inputCall='0x12acfac',enabledGetter='0x1278194',rawVerticalVelocity=-60,worldVerticalVelocity=-12),flatRejectedTurn=dict(delay=.25,leftCall='0x12ad190',rightCall='0x12ad35c',rawOffsetMagnitude=9.5,worldOffsetMagnitude=1.9,requires='not jumping/sliding/HasBoost174; AllowSwipeStumbleDeath; no valid turn',webStatus='flat classic rejected-turn delay and1.9m offset integrated; A/D continuous lean provides desktop tilt adapter; native camera shake, varied ground and remote control overrides remain approximate'))

assert struct.unpack_from('<I',binary,off(0x1297994))[0]==0x52b84188
assert struct.unpack_from('<I',binary,off(0x1297f2c))[0]==0x52800381
assert struct.unpack_from('<I',binary,off(0x1297f40))[0]==0x528003a1
record['fallSupportGate']=dict(previousGroundHeight='0x126ce18',previousSupport='0x126cc94',newSupportFlag='w20',hasSupport='0x126d238',noSupport='0x126d160',ledgeGate='0x126d244..0x126d254',rule='ledge check only if ground height rose or new support recovered from unsupported; flat missing support does not reach ledge Kill',waterKill=dict(rawY=-35,worldY=-7,deathType=1),deathEffects=dict(Fall1='splash28',Ledge4='splat29'))

assert fields['GameCamera.IsCameraShaking']=='0xf8' and fields['GameCamera.ShakeAfterDelay']=='0xf9'
assert struct.unpack_from('<I',binary,off(0x12affc0))[0]==0x1e203900
assert struct.unpack_from('<I',binary,off(0x12b0014))[0]==0x52a84908
assert struct.unpack_from('<I',binary,off(0x12b002c))[0]==0x52a84188
record['cameraShake']=dict(startMethod='0x12ac828',update='0x12affb0..0x12b0058',phaseRule='float32 phase-=smoothDt',magnitudeRule='float32 magnitude-=smoothDt*(initialMagnitude/duration)',rawLocalX='magnitude*sin(phase*35*frequency)',rawLocalY='magnitude*sin(phase*50*frequency)',worldScale=.2,apply=dict(method='UnityEngine.Transform.Translate(float,float,float)',address='0x24c3214',space='local camera XY; not rotation'),obstacleTrip=dict(magnitude=1,duration=1.5,frequency=1,call='0x12716d8'),obstacleDeath=dict(magnitude=1,duration=1,frequency=1,call='0x1271730'),ledgeDeath=dict(magnitude=1,duration=1,frequency=1,call='0x126d2d8'),delayedBadTurn=dict(parameters=list(struct.unpack_from('<4f',binary,off(0x698010))),status='field writes found, but no GameCamera.Update consumption of ShakeAfterDelayf9; not fabricated in web'),webStatus='direct obstacle/ledge shake restored, legacy classic lane-error roll removed; full visual alignment remains unverified')

record['waterFollow'] = dict(method='GameCamera.UpdateWater', nativeGrid=200, worldGrid=40, rounding='truncate toward zero', preserveHeight=True)
record['playerConfigDefaults'] = dict(sourceAddress='0x697dc0', startRunVelocity=struct.unpack_from('<f',binary,off(0x697dc0))[0], maxRunVelocity=struct.unpack_from('<f',binary,off(0x697dc4))[0], stumbleSlowDownPercent=struct.unpack_from('<f',binary,off(0x697dc8))[0], accelerationThresholdPercent=[50,65,85], accelerationForceHundredths=[3000,1000,150,50], status='constructor defaults; remote config and live integration still require validation')
(root/'source.json').write_text(json.dumps(record,indent=2)+'\n');print(json.dumps(records,indent=2))
