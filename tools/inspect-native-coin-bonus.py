"""Verify native reward instructions and upgrade switch without executing native code."""
import contextlib,io,json,runpy,struct,sys
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
with contextlib.redirect_stdout(io.StringIO()):
 d=runpy.run_path(str(ROOT/'tools/inspect-native-runtime-methods.py'))
binary,off=d['binary'],d['off']
def instruction(address):return struct.unpack_from('<I',binary,off(address))[0]
def branch_target(address):
 word=instruction(address);assert word&0xfc000000==0x94000000
 value=word&0x3ffffff
 if value&(1<<25):value-=1<<26
 return address+value*4
def mov_w8(address):
 word=instruction(address);assert word&0xffe0001f==0x52800008
 return word>>5&0xffff
assert instruction(0x126a17c)==0x0f01f5c0 # fmov v0.2s,15
assert instruction(0x126a188)==0xfd00ae60 # store pair at158/15c
assert instruction(0x126a180)==0x52800649 # mov w9,50
assert instruction(0x126a18c)==0xb9015669 # str w9,[x19,0x154]
table=list(binary[off(0x6b7876):off(0x6b7876)+6])
upgrades=[mov_w8(0x126a1fc+i*4)for i in table]
assert upgrades==[50,75,100,125,150,150]
def duration_switch(table,base):
 result=[]
 for index in binary[off(table):off(table)+6]:
  word=instruction(base+index*4);assert word&0xff80001f==0x52800008
  constant=(word>>5&0xffff)<<(16*(word>>21&3))
  result.append(struct.unpack('<f',struct.pack('<I',constant))[0])
 return result
invincibility=duration_switch(0x6b787c,0x126a2b0)
vacuum=duration_switch(0x6b7882,0x126a36c)
assert invincibility==[15,17.5,20,22.5,25,25]
assert vacuum==[15,20,20,25,25,25]
assert instruction(0x126a2dc)==0xb9015e68 # str to InvincibilityDuration15c
assert instruction(0x126a3a4)==0xb9015a68 # str to VacuumDuration158

assert instruction(0x12711d8)==0xb94156a1 # ldr w1,[x21,0x154]
assert branch_target(0x12711e0)==0x1298cb0 # StartCoinBonus
assert branch_target(0x1298cb8)==0x1298aa8 # AddCoins, argument unchanged
assert instruction(0x1298cbc)==0xb901867f # runtime coin bonus counter cleared
assert branch_target(0x12710ec)==0x1298a8c # separately adds BonusItem.Value score
assert instruction(0x12961ec)==0x51000675 # switch index=BonusType-1
value_table=list(binary[off(0x6b7a7f):off(0x6b7a7f)+7])
assert value_table==[3,5,7,0,0,0,0]
assert [mov_w8(0x1296534+i*4)for i in [3,5,7]]==[5,10,15]
assert mov_w8(0x1296534)==25
assert instruction(0x1296538)==0xb9007e68 # str w8,[x19,0x7c]
output=dict(binarySHA256=d['record']['binarySHA256'],
 baseCoins=50,upgradeLevels1Through6=upgrades,jumpTableAddress='0x6b7876',
 configFieldOffset='0x154',startCoinBonus='0x1298cb0',addCoins='0x1298aa8',
 behavior='instant AddCoins; existing timed powers are preserved',
 powerPickupScoreValue=25,referenceScoreMultiplier=20,referencePowerPickupScore=500,
 baseTimedPowers=dict(VacuumDuration=15,InvincibilityDuration=15),
 timedPowerUpgradeLevels1Through6=dict(VacuumDuration=vacuum,InvincibilityDuration=invincibility),coinScoreValues=[5,10,15],referenceCoinScores=[100,200,300],
 separatePickupScore='BonusItem.Instantiate assigns25 for types4..7; AddScore multiplies by run multiplier')
path=ROOT/'target/temple-run/analysis/native-coin-bonus-source.json'
path.write_text(json.dumps(output,indent=2)+'\n');print(json.dumps(output,indent=2))
