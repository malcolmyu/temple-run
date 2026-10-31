
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12775fc: f81e0ffe     	str	x30, [sp, #-0x20]!
 1277600: a9014ff4     	stp	x20, x19, [sp, #0x10]
 1277604: d000bdf4     	adrp	x20, 0x2a35000
 1277608: 395d6688     	ldrb	w8, [x20, #0x759]
 127760c: aa0003f3     	mov	x19, x0
 1277610: 37000128     	tbnz	w8, #0x0, 0x1277634 <__start_il2cpp+0xcfe70>
 1277614: f000af40     	adrp	x0, 0x2862000
 1277618: f944ac00     	ldr	x0, [x0, #0x958]
 127761c: 97f9222f     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1277620: f000af40     	adrp	x0, 0x2862000
 1277624: f944b000     	ldr	x0, [x0, #0x960]
 1277628: 97f9222c     	bl	0x10bfed8 <CloseNLSocket+0x410>
 127762c: 52800028     	mov	w8, #0x1                // =1
 1277630: 391d6688     	strb	w8, [x20, #0x759]
 1277634: 39437268     	ldrb	w8, [x19, #0xdc]
 1277638: 35000228     	cbnz	w8, 0x127767c <__start_il2cpp+0xcfeb8>
 127763c: 3947de68     	ldrb	w8, [x19, #0x1f7]
 1277640: 350001e8     	cbnz	w8, 0x127767c <__start_il2cpp+0xcfeb8>
 1277644: 39437a68     	ldrb	w8, [x19, #0xde]
 1277648: 350001a8     	cbnz	w8, 0x127767c <__start_il2cpp+0xcfeb8>
 127764c: 39441268     	ldrb	w8, [x19, #0x104]
 1277650: 35000168     	cbnz	w8, 0x127767c <__start_il2cpp+0xcfeb8>
 1277654: 39441a68     	ldrb	w8, [x19, #0x106]
 1277658: 35000128     	cbnz	w8, 0x127767c <__start_il2cpp+0xcfeb8>
 127765c: f9403a60     	ldr	x0, [x19, #0x70]
 1277660: b4000880     	cbz	x0, 0x1277770 <__start_il2cpp+0xcffac>
 1277664: 39436008     	ldrb	w8, [x0, #0xd8]
 1277668: 350000a8     	cbnz	w8, 0x127767c <__start_il2cpp+0xcfeb8>
 127766c: 3943c008     	ldrb	w8, [x0, #0xf0]
 1277670: 35000068     	cbnz	w8, 0x127767c <__start_il2cpp+0xcfeb8>
 1277674: 39458408     	ldrb	w8, [x0, #0x161]
 1277678: 34000088     	cbz	w8, 0x1277688 <__start_il2cpp+0xcfec4>
 127767c: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 1277680: f84207fe     	ldr	x30, [sp], #0x20
 1277684: d65f03c0     	ret
 1277688: bd416800     	ldr	s0, [x0, #0x168]
 127768c: 1e202008     	fcmp	s0, #0.0
 1277690: 54ffff61     	b.ne	0x127767c <__start_il2cpp+0xcfeb8>
 1277694: b9415c08     	ldr	w8, [x0, #0x15c]
 1277698: 7100051f     	cmp	w8, #0x1
 127769c: 54ffff0b     	b.lt	0x127767c <__start_il2cpp+0xcfeb8>
 12776a0: 1e27d000     	fmov	s0, #30.00000000
 12776a4: 2a1f03e1     	mov	w1, wzr
 12776a8: aa1f03e2     	mov	x2, xzr
 12776ac: 94008570     	bl	0x1298c6c <__start_il2cpp+0xf14a8>
 12776b0: f9412e60     	ldr	x0, [x19, #0x258]
 12776b4: b40005e0     	cbz	x0, 0x1277770 <__start_il2cpp+0xcffac>
 12776b8: 1e2e1000     	fmov	s0, #1.00000000
 12776bc: 52800041     	mov	w1, #0x2                // =2
 12776c0: aa1f03e2     	mov	x2, xzr
 12776c4: 940077be     	bl	0x12955bc <__start_il2cpp+0xeddf8>
 12776c8: f9412e60     	ldr	x0, [x19, #0x258]
 12776cc: b4000520     	cbz	x0, 0x1277770 <__start_il2cpp+0xcffac>
 12776d0: 1e2d1000     	fmov	s0, #0.75000000
 12776d4: 2a1f03e1     	mov	w1, wzr
 12776d8: aa1f03e2     	mov	x2, xzr
 12776dc: 940077b8     	bl	0x12955bc <__start_il2cpp+0xeddf8>
 12776e0: f9405e60     	ldr	x0, [x19, #0xb8]
 12776e4: b4000460     	cbz	x0, 0x1277770 <__start_il2cpp+0xcffac>
 12776e8: f9405a74     	ldr	x20, [x19, #0xb0]
 12776ec: aa1f03e1     	mov	x1, xzr
 12776f0: 9400bbc7     	bl	0x12a660c <__start_il2cpp+0xfee48>
 12776f4: f9403a68     	ldr	x8, [x19, #0x70]
 12776f8: b40003c8     	cbz	x8, 0x1277770 <__start_il2cpp+0xcffac>
 12776fc: b40003b4     	cbz	x20, 0x1277770 <__start_il2cpp+0xcffac>
 1277700: b9415d03     	ldr	w3, [x8, #0x15c]
 1277704: 2a0003e1     	mov	w1, w0
 1277708: aa1403e0     	mov	x0, x20
 127770c: 2a1f03e2     	mov	w2, wzr
 1277710: aa1f03e4     	mov	x4, xzr
 1277714: 9400582a     	bl	0x128d7bc <__start_il2cpp+0xe5ff8>
 1277718: f9405a60     	ldr	x0, [x19, #0xb0]
 127771c: b40002a0     	cbz	x0, 0x1277770 <__start_il2cpp+0xcffac>
 1277720: aa1f03e1     	mov	x1, xzr
 1277724: 94005894     	bl	0x128d974 <__start_il2cpp+0xe61b0>
 1277728: b940ea68     	ldr	w8, [x19, #0xe8]
 127772c: f9405a60     	ldr	x0, [x19, #0xb0]
 1277730: 52800029     	mov	w9, #0x1                // =1
 1277734: 3905b269     	strb	w9, [x19, #0x16c]
 1277738: 11000508     	add	w8, w8, #0x1
 127773c: b900ea68     	str	w8, [x19, #0xe8]
 1277740: b4000180     	cbz	x0, 0x1277770 <__start_il2cpp+0xcffac>
 1277744: f000af48     	adrp	x8, 0x2862000
 1277748: f000af49     	adrp	x9, 0x2862000
 127774c: f944b108     	ldr	x8, [x8, #0x960]
 1277750: f944ad29     	ldr	x9, [x9, #0x958]
 1277754: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 1277758: 52800021     	mov	w1, #0x1                // =1
 127775c: f9400102     	ldr	x2, [x8]
 1277760: f9400123     	ldr	x3, [x9]
 1277764: aa1f03e4     	mov	x4, xzr
 1277768: f84207fe     	ldr	x30, [sp], #0x20
 127776c: 1400440c     	b	0x128879c <__start_il2cpp+0xe0fd8>
 1277770: 97f92264     	bl	0x10c0100 <CloseNLSocket+0x638>
