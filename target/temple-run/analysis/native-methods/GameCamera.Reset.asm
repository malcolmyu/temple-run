
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12af628: fc1a0fee     	str	d14, [sp, #-0x60]!
 12af62c: 6d0133ed     	stp	d13, d12, [sp, #0x10]
 12af630: 6d022beb     	stp	d11, d10, [sp, #0x20]
 12af634: 6d0323e9     	stp	d9, d8, [sp, #0x30]
 12af638: a90457fe     	stp	x30, x21, [sp, #0x40]
 12af63c: a9054ff4     	stp	x20, x19, [sp, #0x50]
 12af640: d000bc34     	adrp	x20, 0x2a35000
 12af644: 39662688     	ldrb	w8, [x20, #0x989]
 12af648: aa0003f3     	mov	x19, x0
 12af64c: 370000c8     	tbnz	w8, #0x0, 0x12af664 <__start_il2cpp+0x107ea0>
 12af650: f000ad60     	adrp	x0, 0x285e000
 12af654: f9414000     	ldr	x0, [x0, #0x280]
 12af658: 97f84220     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12af65c: 52800028     	mov	w8, #0x1                // =1
 12af660: 39262688     	strb	w8, [x20, #0x989]
 12af664: aa1303e0     	mov	x0, x19
 12af668: aa1f03e1     	mov	x1, xzr
 12af66c: 9400c484     	bl	0x12e087c <__start_il2cpp+0x1390b8>
 12af670: 91043268     	add	x8, x19, #0x10c
 12af674: 91045269     	add	x9, x19, #0x114
 12af678: 3904a27f     	strb	wzr, [x19, #0x128]
 12af67c: 7901f27f     	strh	wzr, [x19, #0xf8]
 12af680: 90ff9f4b     	adrp	x11, 0x697000
 12af684: f900013f     	str	xzr, [x9]
 12af688: f900011f     	str	xzr, [x8]
 12af68c: fd41e960     	ldr	d0, [x11, #0x3d0]
 12af690: f9403e60     	ldr	x0, [x19, #0x78]
 12af694: 52a7f00a     	mov	w10, #0x3f800000        // =1065353216
 12af698: 52a82c08     	mov	w8, #0x41600000         // =1096810496
 12af69c: b9011e6a     	str	w10, [x19, #0x11c]
 12af6a0: fc09c260     	stur	d0, [x19, #0x9c]
 12af6a4: b900a668     	str	w8, [x19, #0xa4]
 12af6a8: b4001080     	cbz	x0, 0x12af8b8 <__start_il2cpp+0x1080f4>
 12af6ac: aa1f03e1     	mov	x1, xzr
 12af6b0: 94481a97     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12af6b4: f9404268     	ldr	x8, [x19, #0x80]
 12af6b8: b4001008     	cbz	x8, 0x12af8b8 <__start_il2cpp+0x1080f4>
 12af6bc: aa0003f4     	mov	x20, x0
 12af6c0: aa0803e0     	mov	x0, x8
 12af6c4: aa1f03e1     	mov	x1, xzr
 12af6c8: 94481a91     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12af6cc: b4000f60     	cbz	x0, 0x12af8b8 <__start_il2cpp+0x1080f4>
 12af6d0: aa1f03e1     	mov	x1, xzr
 12af6d4: 94484be8     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12af6d8: f9404260     	ldr	x0, [x19, #0x80]
 12af6dc: b4000ee0     	cbz	x0, 0x12af8b8 <__start_il2cpp+0x1080f4>
 12af6e0: bd40c269     	ldr	s9, [x19, #0xc0]
 12af6e4: aa1f03e1     	mov	x1, xzr
 12af6e8: 4ea01c08     	mov	v8.16b, v0.16b
 12af6ec: 94481a88     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12af6f0: b4000e40     	cbz	x0, 0x12af8b8 <__start_il2cpp+0x1080f4>
 12af6f4: aa1f03e1     	mov	x1, xzr
 12af6f8: 94484bdf     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12af6fc: b4000df4     	cbz	x20, 0x12af8b8 <__start_il2cpp+0x1080f4>
 12af700: f000ad75     	adrp	x21, 0x285e000
 12af704: f94142b5     	ldr	x21, [x21, #0x280]
 12af708: 4ea11c22     	mov	v2.16b, v1.16b
 12af70c: aa1403e0     	mov	x0, x20
 12af710: 4ea81d00     	mov	v0.16b, v8.16b
 12af714: 4ea91d21     	mov	v1.16b, v9.16b
 12af718: aa1f03e1     	mov	x1, xzr
 12af71c: 94484bfe     	bl	0x24c2714 <__start_il2cpp+0x131af50>
 12af720: f94002a0     	ldr	x0, [x21]
 12af724: b940e008     	ldr	w8, [x0, #0xe0]
 12af728: 35000068     	cbnz	w8, 0x12af734 <__start_il2cpp+0x107f70>
 12af72c: 97f8422d     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12af730: f94002a0     	ldr	x0, [x21]
 12af734: f9405c08     	ldr	x8, [x0, #0xb8]
 12af738: f9400108     	ldr	x8, [x8]
 12af73c: b4000be8     	cbz	x8, 0x12af8b8 <__start_il2cpp+0x1080f4>
 12af740: f9403e60     	ldr	x0, [x19, #0x78]
 12af744: b4000ba0     	cbz	x0, 0x12af8b8 <__start_il2cpp+0x1080f4>
 12af748: 39441915     	ldrb	w21, [x8, #0x106]
 12af74c: aa1f03e1     	mov	x1, xzr
 12af750: 94481a6f     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12af754: f9404268     	ldr	x8, [x19, #0x80]
 12af758: b4000b08     	cbz	x8, 0x12af8b8 <__start_il2cpp+0x1080f4>
 12af75c: aa0003f4     	mov	x20, x0
 12af760: aa0803e0     	mov	x0, x8
 12af764: aa1f03e1     	mov	x1, xzr
 12af768: 94481a69     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12af76c: b4000a60     	cbz	x0, 0x12af8b8 <__start_il2cpp+0x1080f4>
 12af770: aa1f03e1     	mov	x1, xzr
 12af774: 94484c3c     	bl	0x24c2864 <__start_il2cpp+0x131b0a0>
 12af778: b4000a14     	cbz	x20, 0x12af8b8 <__start_il2cpp+0x1080f4>
 12af77c: aa1403e0     	mov	x0, x20
 12af780: aa1f03e1     	mov	x1, xzr
 12af784: 94484c5a     	bl	0x24c28ec <__start_il2cpp+0x131b128>
 12af788: aa1303e0     	mov	x0, x19
 12af78c: aa1f03e1     	mov	x1, xzr
 12af790: 94481a5f     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12af794: aa0003f4     	mov	x20, x0
 12af798: 340000b5     	cbz	w21, 0x12af7ac <__start_il2cpp+0x107fe8>
 12af79c: b40008f4     	cbz	x20, 0x12af8b8 <__start_il2cpp+0x1080f4>
 12af7a0: 2d5c8a61     	ldp	s1, s2, [x19, #0xe4]
 12af7a4: bd40e260     	ldr	s0, [x19, #0xe0]
 12af7a8: 1400002b     	b	0x12af854 <__start_il2cpp+0x108090>
 12af7ac: f9403e60     	ldr	x0, [x19, #0x78]
 12af7b0: b4000840     	cbz	x0, 0x12af8b8 <__start_il2cpp+0x1080f4>
 12af7b4: aa1f03e1     	mov	x1, xzr
 12af7b8: 94481a55     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12af7bc: b40007e0     	cbz	x0, 0x12af8b8 <__start_il2cpp+0x1080f4>
 12af7c0: aa1f03e1     	mov	x1, xzr
 12af7c4: 94484bac     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12af7c8: f9403e60     	ldr	x0, [x19, #0x78]
 12af7cc: b4000760     	cbz	x0, 0x12af8b8 <__start_il2cpp+0x1080f4>
 12af7d0: aa1f03e1     	mov	x1, xzr
 12af7d4: 4ea01c08     	mov	v8.16b, v0.16b
 12af7d8: 4ea11c29     	mov	v9.16b, v1.16b
 12af7dc: 4ea21c4a     	mov	v10.16b, v2.16b
 12af7e0: 94481a4b     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12af7e4: b40006a0     	cbz	x0, 0x12af8b8 <__start_il2cpp+0x1080f4>
 12af7e8: aa1f03e1     	mov	x1, xzr
 12af7ec: 94484cd6     	bl	0x24c2b44 <__start_il2cpp+0x131b380>
 12af7f0: f9403e60     	ldr	x0, [x19, #0x78]
 12af7f4: b4000620     	cbz	x0, 0x12af8b8 <__start_il2cpp+0x1080f4>
 12af7f8: bd40b66e     	ldr	s14, [x19, #0xb4]
 12af7fc: aa1f03e1     	mov	x1, xzr
 12af800: 4ea01c0d     	mov	v13.16b, v0.16b
 12af804: 4ea11c2b     	mov	v11.16b, v1.16b
 12af808: 4ea21c4c     	mov	v12.16b, v2.16b
 12af80c: 94481a40     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12af810: b4000540     	cbz	x0, 0x12af8b8 <__start_il2cpp+0x1080f4>
 12af814: aa1f03e1     	mov	x1, xzr
 12af818: 94484cac     	bl	0x24c2ac8 <__start_il2cpp+0x131b304>
 12af81c: b40004f4     	cbz	x20, 0x12af8b8 <__start_il2cpp+0x1080f4>
 12af820: bd409e66     	ldr	s6, [x19, #0x9c]
 12af824: 1e2e09a3     	fmul	s3, s13, s14
 12af828: 1e2e0964     	fmul	s4, s11, s14
 12af82c: 1e2e0985     	fmul	s5, s12, s14
 12af830: 1e233903     	fsub	s3, s8, s3
 12af834: 1e243924     	fsub	s4, s9, s4
 12af838: 1e253945     	fsub	s5, s10, s5
 12af83c: 1e260842     	fmul	s2, s2, s6
 12af840: 1e260821     	fmul	s1, s1, s6
 12af844: 1e260800     	fmul	s0, s0, s6
 12af848: 1e2228a2     	fadd	s2, s5, s2
 12af84c: 1e212881     	fadd	s1, s4, s1
 12af850: 1e202860     	fadd	s0, s3, s0
 12af854: aa1403e0     	mov	x0, x20
 12af858: aa1f03e1     	mov	x1, xzr
 12af85c: 94484bae     	bl	0x24c2714 <__start_il2cpp+0x131af50>
 12af860: aa1303e0     	mov	x0, x19
 12af864: aa1f03e1     	mov	x1, xzr
 12af868: 94481a29     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12af86c: f9403e68     	ldr	x8, [x19, #0x78]
 12af870: b4000248     	cbz	x8, 0x12af8b8 <__start_il2cpp+0x1080f4>
 12af874: aa0003f3     	mov	x19, x0
 12af878: aa0803e0     	mov	x0, x8
 12af87c: aa1f03e1     	mov	x1, xzr
 12af880: 94481a23     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12af884: b40001a0     	cbz	x0, 0x12af8b8 <__start_il2cpp+0x1080f4>
 12af888: aa1f03e1     	mov	x1, xzr
 12af88c: 94484b7a     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12af890: b4000153     	cbz	x19, 0x12af8b8 <__start_il2cpp+0x1080f4>
 12af894: aa1303e0     	mov	x0, x19
 12af898: a9454ff4     	ldp	x20, x19, [sp, #0x50]
 12af89c: a94457fe     	ldp	x30, x21, [sp, #0x40]
 12af8a0: 6d4323e9     	ldp	d9, d8, [sp, #0x30]
 12af8a4: 6d422beb     	ldp	d11, d10, [sp, #0x20]
 12af8a8: 6d4133ed     	ldp	d13, d12, [sp, #0x10]
 12af8ac: aa1f03e1     	mov	x1, xzr
 12af8b0: fc4607ee     	ldr	d14, [sp], #0x60
 12af8b4: 14484f76     	b	0x24c368c <__start_il2cpp+0x131bec8>
 12af8b8: 97f84212     	bl	0x10c0100 <CloseNLSocket+0x638>
