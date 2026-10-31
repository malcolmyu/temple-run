
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12ac888: 6dbe23e9     	stp	d9, d8, [sp, #-0x20]!
 12ac88c: a9014ffe     	stp	x30, x19, [sp, #0x10]
 12ac890: aa0003f3     	mov	x19, x0
 12ac894: 52800f40     	mov	w0, #0x7a               // =122
 12ac898: aa1f03e1     	mov	x1, xzr
 12ac89c: 94490cec     	bl	0x24efc4c <__start_il2cpp+0x1348488>
 12ac8a0: 360001e0     	tbz	w0, #0x0, 0x12ac8dc <__start_il2cpp+0x105118>
 12ac8a4: bd405a68     	ldr	s8, [x19, #0x58]
 12ac8a8: bd406269     	ldr	s9, [x19, #0x60]
 12ac8ac: aa1f03e0     	mov	x0, xzr
 12ac8b0: 94484ae8     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 12ac8b4: 1e200920     	fmul	s0, s9, s0
 12ac8b8: 1e203900     	fsub	s0, s8, s0
 12ac8bc: 1e3e1001     	fmov	s1, #-1.00000000
 12ac8c0: 1e214800     	fmax	s0, s0, s1
 12ac8c4: 52800f00     	mov	w0, #0x78               // =120
 12ac8c8: aa1f03e1     	mov	x1, xzr
 12ac8cc: bd005a60     	str	s0, [x19, #0x58]
 12ac8d0: 94490cdf     	bl	0x24efc4c <__start_il2cpp+0x1348488>
 12ac8d4: 370000c0     	tbnz	w0, #0x0, 0x12ac8ec <__start_il2cpp+0x105128>
 12ac8d8: 14000029     	b	0x12ac97c <__start_il2cpp+0x1051b8>
 12ac8dc: 52800f00     	mov	w0, #0x78               // =120
 12ac8e0: aa1f03e1     	mov	x1, xzr
 12ac8e4: 94490cda     	bl	0x24efc4c <__start_il2cpp+0x1348488>
 12ac8e8: 360001c0     	tbz	w0, #0x0, 0x12ac920 <__start_il2cpp+0x10515c>
 12ac8ec: bd405a68     	ldr	s8, [x19, #0x58]
 12ac8f0: bd406269     	ldr	s9, [x19, #0x60]
 12ac8f4: aa1f03e0     	mov	x0, xzr
 12ac8f8: 94484ad6     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 12ac8fc: 1e200920     	fmul	s0, s9, s0
 12ac900: 1e202900     	fadd	s0, s8, s0
 12ac904: 1e2e1001     	fmov	s1, #1.00000000
 12ac908: 1e212000     	fcmp	s0, s1
 12ac90c: bd005a60     	str	s0, [x19, #0x58]
 12ac910: 5400036d     	b.le	0x12ac97c <__start_il2cpp+0x1051b8>
 12ac914: 52a7f008     	mov	w8, #0x3f800000         // =1065353216
 12ac918: b9005a68     	str	w8, [x19, #0x58]
 12ac91c: 14000018     	b	0x12ac97c <__start_il2cpp+0x1051b8>
 12ac920: bd405a68     	ldr	s8, [x19, #0x58]
 12ac924: 1e202108     	fcmp	s8, #0.0
 12ac928: 54000165     	b.pl	0x12ac954 <__start_il2cpp+0x105190>
 12ac92c: bd405e69     	ldr	s9, [x19, #0x5c]
 12ac930: aa1f03e0     	mov	x0, xzr
 12ac934: 94484ac7     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 12ac938: 1e200920     	fmul	s0, s9, s0
 12ac93c: 1e202908     	fadd	s8, s8, s0
 12ac940: 1e202108     	fcmp	s8, #0.0
 12ac944: bd005a68     	str	s8, [x19, #0x58]
 12ac948: 5400006d     	b.le	0x12ac954 <__start_il2cpp+0x105190>
 12ac94c: b9005a7f     	str	wzr, [x19, #0x58]
 12ac950: 1400000b     	b	0x12ac97c <__start_il2cpp+0x1051b8>
 12ac954: 1e202108     	fcmp	s8, #0.0
 12ac958: 5400012d     	b.le	0x12ac97c <__start_il2cpp+0x1051b8>
 12ac95c: bd405e69     	ldr	s9, [x19, #0x5c]
 12ac960: aa1f03e0     	mov	x0, xzr
 12ac964: 94484abb     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 12ac968: 1e200920     	fmul	s0, s9, s0
 12ac96c: 1e203900     	fsub	s0, s8, s0
 12ac970: 1e2703e1     	fmov	s1, wzr
 12ac974: 1e214800     	fmax	s0, s0, s1
 12ac978: bd005a60     	str	s0, [x19, #0x58]
 12ac97c: a9414ffe     	ldp	x30, x19, [sp, #0x10]
 12ac980: 6cc223e9     	ldp	d9, d8, [sp], #0x20
 12ac984: d65f03c0     	ret
