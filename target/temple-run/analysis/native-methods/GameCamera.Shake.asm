
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12ac828: 1e202008     	fcmp	s0, #0.0
 12ac82c: 540002cd     	b.le	0x12ac884 <__start_il2cpp+0x1050c0>
 12ac830: 1e202028     	fcmp	s1, #0.0
 12ac834: 5400028d     	b.le	0x12ac884 <__start_il2cpp+0x1050c0>
 12ac838: 1e202068     	fcmp	s3, #0.0
 12ac83c: 540000ed     	b.le	0x12ac858 <__start_il2cpp+0x105094>
 12ac840: 52800028     	mov	w8, #0x1                // =1
 12ac844: bd010401     	str	s1, [x0, #0x104]
 12ac848: bd010802     	str	s2, [x0, #0x108]
 12ac84c: 3903e408     	strb	w8, [x0, #0xf9]
 12ac850: 2d1f8003     	stp	s3, s0, [x0, #0xfc]
 12ac854: d65f03c0     	ret
 12ac858: 3943e008     	ldrb	w8, [x0, #0xf8]
 12ac85c: 35000068     	cbnz	w8, 0x12ac868 <__start_il2cpp+0x1050a4>
 12ac860: 52800028     	mov	w8, #0x1                // =1
 12ac864: 3903e008     	strb	w8, [x0, #0xf8]
 12ac868: 1e211803     	fdiv	s3, s0, s1
 12ac86c: 3903e41f     	strb	wzr, [x0, #0xf9]
 12ac870: b9010c1f     	str	wzr, [x0, #0x10c]
 12ac874: bd011400     	str	s0, [x0, #0x114]
 12ac878: bd011801     	str	s1, [x0, #0x118]
 12ac87c: bd011003     	str	s3, [x0, #0x110]
 12ac880: bd011c02     	str	s2, [x0, #0x11c]
 12ac884: d65f03c0     	ret
