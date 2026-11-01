
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1277774: f81e0ffe     	str	x30, [sp, #-0x20]!
 1277778: a9014ff4     	stp	x20, x19, [sp, #0x10]
 127777c: d000bdf4     	adrp	x20, 0x2a35000
 1277780: 395d6a88     	ldrb	w8, [x20, #0x75a]
 1277784: aa0003f3     	mov	x19, x0
 1277788: 37000128     	tbnz	w8, #0x0, 0x12777ac <__start_il2cpp+0xcffe8>
 127778c: f000af40     	adrp	x0, 0x2862000
 1277790: f944b400     	ldr	x0, [x0, #0x968]
 1277794: 97f921d1     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1277798: f000af40     	adrp	x0, 0x2862000
 127779c: f944b800     	ldr	x0, [x0, #0x970]
 12777a0: 97f921ce     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12777a4: 52800028     	mov	w8, #0x1                // =1
 12777a8: 391d6a88     	strb	w8, [x20, #0x75a]
 12777ac: 39437268     	ldrb	w8, [x19, #0xdc]
 12777b0: 35000948     	cbnz	w8, 0x12778d8 <__start_il2cpp+0xd0114>
 12777b4: 3947de68     	ldrb	w8, [x19, #0x1f7]
 12777b8: 35000908     	cbnz	w8, 0x12778d8 <__start_il2cpp+0xd0114>
 12777bc: 39437a68     	ldrb	w8, [x19, #0xde]
 12777c0: 350008c8     	cbnz	w8, 0x12778d8 <__start_il2cpp+0xd0114>
 12777c4: 39441268     	ldrb	w8, [x19, #0x104]
 12777c8: 35000888     	cbnz	w8, 0x12778d8 <__start_il2cpp+0xd0114>
 12777cc: 39441a68     	ldrb	w8, [x19, #0x106]
 12777d0: 35000848     	cbnz	w8, 0x12778d8 <__start_il2cpp+0xd0114>
 12777d4: f9403a60     	ldr	x0, [x19, #0x70]
 12777d8: b4000860     	cbz	x0, 0x12778e4 <__start_il2cpp+0xd0120>
 12777dc: 39436008     	ldrb	w8, [x0, #0xd8]
 12777e0: 350007c8     	cbnz	w8, 0x12778d8 <__start_il2cpp+0xd0114>
 12777e4: bd412660     	ldr	s0, [x19, #0x124]
 12777e8: bd418e61     	ldr	s1, [x19, #0x18c]
 12777ec: 1e212000     	fcmp	s0, s1
 12777f0: 5400074d     	b.le	0x12778d8 <__start_il2cpp+0xd0114>
 12777f4: bd419261     	ldr	s1, [x19, #0x190]
 12777f8: 1e212000     	fcmp	s0, s1
 12777fc: 540006e5     	b.pl	0x12778d8 <__start_il2cpp+0xd0114>
 1277800: 1e27d000     	fmov	s0, #30.00000000
 1277804: 52800021     	mov	w1, #0x1                // =1
 1277808: aa1f03e2     	mov	x2, xzr
 127780c: 94008518     	bl	0x1298c6c <__start_il2cpp+0xf14a8>
 1277810: f9412e60     	ldr	x0, [x19, #0x258]
 1277814: b4000680     	cbz	x0, 0x12778e4 <__start_il2cpp+0xd0120>
 1277818: 1e2e1000     	fmov	s0, #1.00000000
 127781c: 52800041     	mov	w1, #0x2                // =2
 1277820: aa1f03e2     	mov	x2, xzr
 1277824: 94007766     	bl	0x12955bc <__start_il2cpp+0xeddf8>
 1277828: f9412e60     	ldr	x0, [x19, #0x258]
 127782c: b40005c0     	cbz	x0, 0x12778e4 <__start_il2cpp+0xd0120>
 1277830: 1e2d1000     	fmov	s0, #0.75000000
 1277834: 2a1f03e1     	mov	w1, wzr
 1277838: aa1f03e2     	mov	x2, xzr
 127783c: 94007760     	bl	0x12955bc <__start_il2cpp+0xeddf8>
 1277840: f9405e60     	ldr	x0, [x19, #0xb8]
 1277844: b4000500     	cbz	x0, 0x12778e4 <__start_il2cpp+0xd0120>
 1277848: f9405a74     	ldr	x20, [x19, #0xb0]
 127784c: aa1f03e1     	mov	x1, xzr
 1277850: 9400bb6f     	bl	0x12a660c <__start_il2cpp+0xfee48>
 1277854: b4000494     	cbz	x20, 0x12778e4 <__start_il2cpp+0xd0120>
 1277858: 2a0003e1     	mov	w1, w0
 127785c: 52800062     	mov	w2, #0x3                // =3
 1277860: 12800003     	mov	w3, #-0x1               // =-1
 1277864: aa1403e0     	mov	x0, x20
 1277868: aa1f03e4     	mov	x4, xzr
 127786c: 9400589c     	bl	0x128dadc <__start_il2cpp+0xe6318>
 1277870: f9405a60     	ldr	x0, [x19, #0xb0]
 1277874: b4000380     	cbz	x0, 0x12778e4 <__start_il2cpp+0xd0120>
 1277878: aa1f03e1     	mov	x1, xzr
 127787c: 9400583e     	bl	0x128d974 <__start_il2cpp+0xe61b0>
 1277880: b940ee68     	ldr	w8, [x19, #0xec]
 1277884: f9405a60     	ldr	x0, [x19, #0xb0]
 1277888: 11000508     	add	w8, w8, #0x1
 127788c: b900ee68     	str	w8, [x19, #0xec]
 1277890: b40002a0     	cbz	x0, 0x12778e4 <__start_il2cpp+0xd0120>
 1277894: f000af48     	adrp	x8, 0x2862000
 1277898: f000af49     	adrp	x9, 0x2862000
 127789c: f944b508     	ldr	x8, [x8, #0x968]
 12778a0: f944b929     	ldr	x9, [x9, #0x970]
 12778a4: 52800021     	mov	w1, #0x1                // =1
 12778a8: aa1f03e4     	mov	x4, xzr
 12778ac: f9400102     	ldr	x2, [x8]
 12778b0: f9400123     	ldr	x3, [x9]
 12778b4: 52800034     	mov	w20, #0x1               // =1
 12778b8: 940043b9     	bl	0x128879c <__start_il2cpp+0xe0fd8>
 12778bc: 3945b268     	ldrb	w8, [x19, #0x16c]
 12778c0: 350000c8     	cbnz	w8, 0x12778d8 <__start_il2cpp+0xd0114>
 12778c4: f9403a68     	ldr	x8, [x19, #0x70]
 12778c8: 3905b274     	strb	w20, [x19, #0x16c]
 12778cc: b40000c8     	cbz	x8, 0x12778e4 <__start_il2cpp+0xd0120>
 12778d0: b9413908     	ldr	w8, [x8, #0x138]
 12778d4: b9017268     	str	w8, [x19, #0x170]
 12778d8: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 12778dc: f84207fe     	ldr	x30, [sp], #0x20
 12778e0: d65f03c0     	ret
 12778e4: 97f92207     	bl	0x10c0100 <CloseNLSocket+0x638>
