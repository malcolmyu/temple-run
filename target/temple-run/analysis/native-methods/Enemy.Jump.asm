
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12ae1b4: 3941e408     	ldrb	w8, [x0, #0x79]
 12ae1b8: 34000048     	cbz	w8, 0x12ae1c0 <__start_il2cpp+0x1069fc>
 12ae1bc: d65f03c0     	ret
 12ae1c0: 3941e008     	ldrb	w8, [x0, #0x78]
 12ae1c4: 35ffffc8     	cbnz	w8, 0x12ae1bc <__start_il2cpp+0x1069f8>
 12ae1c8: 1e202008     	fcmp	s0, #0.0
 12ae1cc: 540000ad     	b.le	0x12ae1e0 <__start_il2cpp+0x106a1c>
 12ae1d0: 52800028     	mov	w8, #0x1                // =1
 12ae1d4: 3901e808     	strb	w8, [x0, #0x7a]
 12ae1d8: bd007c00     	str	s0, [x0, #0x7c]
 12ae1dc: d65f03c0     	ret
 12ae1e0: bd408000     	ldr	s0, [x0, #0x80]
 12ae1e4: 52800028     	mov	w8, #0x1                // =1
 12ae1e8: 78079008     	sturh	w8, [x0, #0x79]
 12ae1ec: bd003800     	str	s0, [x0, #0x38]
 12ae1f0: d65f03c0     	ret
