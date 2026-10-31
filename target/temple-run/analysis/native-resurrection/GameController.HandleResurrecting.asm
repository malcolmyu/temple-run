
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 126d458: fc1e0fe8     	str	d8, [sp, #-0x20]!
 126d45c: a9014ffe     	stp	x30, x19, [sp, #0x10]
 126d460: bd40e408     	ldr	s8, [x0, #0xe4]
 126d464: aa0003f3     	mov	x19, x0
 126d468: aa1f03e0     	mov	x0, xzr
 126d46c: 944947f9     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 126d470: 1e202900     	fadd	s0, s8, s0
 126d474: 1e2e1001     	fmov	s1, #1.00000000
 126d478: 1e212000     	fcmp	s0, s1
 126d47c: bd00e660     	str	s0, [x19, #0xe4]
 126d480: 5400016b     	b.lt	0x126d4ac <__start_il2cpp+0xc5ce8>
 126d484: f9402a68     	ldr	x8, [x19, #0x50]
 126d488: b4000228     	cbz	x8, 0x126d4cc <__start_il2cpp+0xc5d08>
 126d48c: 39419108     	ldrb	w8, [x8, #0x64]
 126d490: 350000e8     	cbnz	w8, 0x126d4ac <__start_il2cpp+0xc5ce8>
 126d494: f9402e68     	ldr	x8, [x19, #0x58]
 126d498: b40001a8     	cbz	x8, 0x126d4cc <__start_il2cpp+0xc5d08>
 126d49c: 39419108     	ldrb	w8, [x8, #0x64]
 126d4a0: 35000068     	cbnz	w8, 0x126d4ac <__start_il2cpp+0xc5ce8>
 126d4a4: 39437268     	ldrb	w8, [x19, #0xdc]
 126d4a8: 34000088     	cbz	w8, 0x126d4b8 <__start_il2cpp+0xc5cf4>
 126d4ac: a9414ffe     	ldp	x30, x19, [sp, #0x10]
 126d4b0: fc4207e8     	ldr	d8, [sp], #0x20
 126d4b4: d65f03c0     	ret
 126d4b8: 3903827f     	strb	wzr, [x19, #0xe0]
 126d4bc: aa1303e0     	mov	x0, x19
 126d4c0: a9414ffe     	ldp	x30, x19, [sp, #0x10]
 126d4c4: fc4207e8     	ldr	d8, [sp], #0x20
 126d4c8: 14001465     	b	0x127265c <__start_il2cpp+0xcae98>
 126d4cc: 97f94b0d     	bl	0x10c0100 <CloseNLSocket+0x638>
