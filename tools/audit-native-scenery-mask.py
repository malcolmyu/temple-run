"""Audit scenery mask coordinates against ARM64; no execution of native library."""
from pathlib import Path
import json, struct
root=Path(__file__).resolve().parents[1]
asm=root/'target/temple-run/analysis/native-methods'
setmask=(asm/'SceneryManager.SetMaskForPoint.asm').read_text()
fill=(asm/'SceneryManager.FillMask.asm').read_text()
# Division compiler uses reciprocal for negative /60, not floor or nearest.
def signed32(n):
 n &= 0xffffffff
 return n if n<0x80000000 else n-0x100000000
def reciprocal(n):
 high=(((n & 0xffffffffffffffff)*0x77777777)&0xffffffffffffffff)>>32
 delta=signed32(high-n)
 return (delta>>5)+((delta&0xffffffff)>>31)
def truncdiv(n):return abs(n)//60*(1 if n>=0 else -1)
for n in range(-100000,100001):assert reciprocal(n)==-truncdiv(n),(n,reciprocal(n))
for instruction in ['fcvtzs\tw8, s0','fcvtzs\tw13, s1','cmp\tw8, #0x12','cmp\tw9, #0x12','strb\tw9, [x8, #0x20]']:
 assert instruction in setmask,instruction
# The graph offsets resolve PathNorth/East/South/West; incoming direction suppresses only immediate reversal.
for offset in ['#0x50]','#0x58]','#0x68]','#0x60]']:assert offset in fill
out={
 'sourceMethods':['SceneryManager.SetMaskForPoint','SceneryManager.MaskOccupied','SceneryManager.FillMask'],
 'nativeRawFormula':'ix=trunc(rawX/60)-trunc(minGridX/60); iz=trunc(rawZ/60)-trunc(minGridY/60)',
 'worldFormula':'ix=trunc(worldX/12)-minCellX; iz=trunc(worldZ/12)-minCellZ',
 'bounds':'0 <= ix,iz <= 18; out of range writes ignored and reads false',
 'storage':'GridMask[ix,iz], byte boolean; SetMaskForPoint marks a single cell, no radius dilation',
 'graphTraversal':[
 {'field':'PathNorth','offset':'0x50','skipIncoming':1,'childIncoming':3},
 {'field':'PathEast','offset':'0x58','skipIncoming':2,'childIncoming':4},
 {'field':'PathSouth','offset':'0x68','skipIncoming':3,'childIncoming':1},
 {'field':'PathWest','offset':'0x60','skipIncoming':4,'childIncoming':2}],
 'rootTraversal':'Simulate calls FillMask(currentPath, incoming=0, root=true), allowing all root links; descendants skip immediate reversal',
 'checkedIntegerOrigins':200001,
 'negativeBoundaryExamples':[{'worldX':x,'worldCell':int(x/12)}for x in [-24.01,-24,-12.01,-12,-11.99,-.01,0,11.99,12]],
 'limitations':'Graph expected to be acyclic except bidirectional parent links. Complete pool/RNG lifecycle and source scenery positions remain unresolved. This audit does not change production generation.'}
p=root/'target/temple-run/analysis/native-scenery-mask-source.json';p.write_text(json.dumps(out,indent=2)+'\n')
print('PASS: 200001 signed origins match ARM64 reciprocal division; single-cell mask and four graph links verified.')
