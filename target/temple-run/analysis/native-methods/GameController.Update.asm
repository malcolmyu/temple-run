
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 126c60c: fc1a0fec     	str	d12, [sp, #-0x60]!
 126c610: 6d00abeb     	stp	d11, d10, [sp, #0x8]
 126c614: 6d01a3e9     	stp	d9, d8, [sp, #0x18]
 126c618: f90017fe     	str	x30, [sp, #0x28]
 126c61c: a9035ff8     	stp	x24, x23, [sp, #0x30]
 126c620: a90457f6     	stp	x22, x21, [sp, #0x40]
 126c624: a9054ff4     	stp	x20, x19, [sp, #0x50]
 126c628: b000be54     	adrp	x20, 0x2a35000
 126c62c: 395cfe88     	ldrb	w8, [x20, #0x73f]
 126c630: aa0003f3     	mov	x19, x0
 126c634: 37000608     	tbnz	w8, #0x0, 0x126c6f4 <__start_il2cpp+0xc4f30>
 126c638: b000af80     	adrp	x0, 0x285d000
 126c63c: f943dc00     	ldr	x0, [x0, #0x7b8]
 126c640: 97f94e26     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126c644: d000af80     	adrp	x0, 0x285e000
 126c648: f9414c00     	ldr	x0, [x0, #0x298]
 126c64c: 97f94e23     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126c650: d000afa0     	adrp	x0, 0x2862000
 126c654: f942f800     	ldr	x0, [x0, #0x5f0]
 126c658: 97f94e20     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126c65c: d000af80     	adrp	x0, 0x285e000
 126c660: f9479400     	ldr	x0, [x0, #0xf28]
 126c664: 97f94e1d     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126c668: d000afa0     	adrp	x0, 0x2862000
 126c66c: f942fc00     	ldr	x0, [x0, #0x5f8]
 126c670: 97f94e1a     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126c674: d000afa0     	adrp	x0, 0x2862000
 126c678: f9430000     	ldr	x0, [x0, #0x600]
 126c67c: 97f94e17     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126c680: d000afa0     	adrp	x0, 0x2862000
 126c684: f9430400     	ldr	x0, [x0, #0x608]
 126c688: 97f94e14     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126c68c: d000af80     	adrp	x0, 0x285e000
 126c690: f9414000     	ldr	x0, [x0, #0x280]
 126c694: 97f94e11     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126c698: 9000af80     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 126c69c: f9456000     	ldr	x0, [x0, #0xac0]
 126c6a0: 97f94e0e     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126c6a4: d000afa0     	adrp	x0, 0x2862000
 126c6a8: f9430800     	ldr	x0, [x0, #0x610]
 126c6ac: 97f94e0b     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126c6b0: d000afa0     	adrp	x0, 0x2862000
 126c6b4: f9430c00     	ldr	x0, [x0, #0x618]
 126c6b8: 97f94e08     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126c6bc: d000afa0     	adrp	x0, 0x2862000
 126c6c0: f9431000     	ldr	x0, [x0, #0x620]
 126c6c4: 97f94e05     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126c6c8: d000afa0     	adrp	x0, 0x2862000
 126c6cc: f9431400     	ldr	x0, [x0, #0x628]
 126c6d0: 97f94e02     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126c6d4: d000af80     	adrp	x0, 0x285e000
 126c6d8: f940d400     	ldr	x0, [x0, #0x1a8]
 126c6dc: 97f94dff     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126c6e0: d000afa0     	adrp	x0, 0x2862000
 126c6e4: f9431800     	ldr	x0, [x0, #0x630]
 126c6e8: 97f94dfc     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126c6ec: 52800028     	mov	w8, #0x1                // =1
 126c6f0: 391cfe88     	strb	w8, [x20, #0x73f]
 126c6f4: 394a4668     	ldrb	w8, [x19, #0x291]
 126c6f8: 34000188     	cbz	w8, 0x126c728 <__start_il2cpp+0xc4f64>
 126c6fc: f9403a60     	ldr	x0, [x19, #0x70]
 126c700: b4006aa0     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126c704: 39455008     	ldrb	w8, [x0, #0x154]
 126c708: 350000c8     	cbnz	w8, 0x126c720 <__start_il2cpp+0xc4f5c>
 126c70c: 1e211000     	fmov	s0, #3.00000000
 126c710: aa1f03e1     	mov	x1, xzr
 126c714: 9400b144     	bl	0x1298c24 <__start_il2cpp+0xf1460>
 126c718: f9403a60     	ldr	x0, [x19, #0x70]
 126c71c: b40069c0     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126c720: 52a80808     	mov	w8, #0x40400000         // =1077936128
 126c724: b9015808     	str	w8, [x0, #0x158]
 126c728: 394a4268     	ldrb	w8, [x19, #0x290]
 126c72c: 34000168     	cbz	w8, 0x126c758 <__start_il2cpp+0xc4f94>
 126c730: 390a427f     	strb	wzr, [x19, #0x290]
 126c734: aa1303e0     	mov	x0, x19
 126c738: a9454ff4     	ldp	x20, x19, [sp, #0x50]
 126c73c: a94457f6     	ldp	x22, x21, [sp, #0x40]
 126c740: a9435ff8     	ldp	x24, x23, [sp, #0x30]
 126c744: f94017fe     	ldr	x30, [sp, #0x28]
 126c748: 6d41a3e9     	ldp	d9, d8, [sp, #0x18]
 126c74c: 6d40abeb     	ldp	d11, d10, [sp, #0x8]
 126c750: fc4607ec     	ldr	d12, [sp], #0x60
 126c754: 17fffcc3     	b	0x126ba60 <__start_il2cpp+0xc429c>
 126c758: f9403a68     	ldr	x8, [x19, #0x70]
 126c75c: b40067c8     	cbz	x8, 0x126d454 <__start_il2cpp+0xc5c90>
 126c760: 39449109     	ldrb	w9, [x8, #0x124]
 126c764: 34000169     	cbz	w9, 0x126c790 <__start_il2cpp+0xc4fcc>
 126c768: b9416a69     	ldr	w9, [x19, #0x168]
 126c76c: 5280002a     	mov	w10, #0x1               // =1
 126c770: 3905926a     	strb	w10, [x19, #0x164]
 126c774: 11000529     	add	w9, w9, #0x1
 126c778: b9016a69     	str	w9, [x19, #0x168]
 126c77c: 3904911f     	strb	wzr, [x8, #0x124]
 126c780: 39441268     	ldrb	w8, [x19, #0x104]
 126c784: 34000068     	cbz	w8, 0x126c790 <__start_il2cpp+0xc4fcc>
 126c788: aa1303e0     	mov	x0, x19
 126c78c: 97ffeadd     	bl	0x1267300 <__start_il2cpp+0xbfb3c>
 126c790: 39438268     	ldrb	w8, [x19, #0xe0]
 126c794: 340000c8     	cbz	w8, 0x126c7ac <__start_il2cpp+0xc4fe8>
 126c798: aa1303e0     	mov	x0, x19
 126c79c: 9400032f     	bl	0x126d458 <__start_il2cpp+0xc5c94>
 126c7a0: aa1303e0     	mov	x0, x19
 126c7a4: 97fffcaf     	bl	0x126ba60 <__start_il2cpp+0xc429c>
 126c7a8: 1400000c     	b	0x126c7d8 <__start_il2cpp+0xc5014>
 126c7ac: 39477268     	ldrb	w8, [x19, #0x1dc]
 126c7b0: 35000068     	cbnz	w8, 0x126c7bc <__start_il2cpp+0xc4ff8>
 126c7b4: 39477669     	ldrb	w9, [x19, #0x1dd]
 126c7b8: 34000429     	cbz	w9, 0x126c83c <__start_il2cpp+0xc5078>
 126c7bc: 39477e69     	ldrb	w9, [x19, #0x1df]
 126c7c0: 350000a9     	cbnz	w9, 0x126c7d4 <__start_il2cpp+0xc5010>
 126c7c4: 39478669     	ldrb	w9, [x19, #0x1e1]
 126c7c8: 35000069     	cbnz	w9, 0x126c7d4 <__start_il2cpp+0xc5010>
 126c7cc: 39478269     	ldrb	w9, [x19, #0x1e0]
 126c7d0: 34000789     	cbz	w9, 0x126c8c0 <__start_il2cpp+0xc50fc>
 126c7d4: 7903ba7f     	strh	wzr, [x19, #0x1dc]
 126c7d8: 39437a68     	ldrb	w8, [x19, #0xde]
 126c7dc: 34002f08     	cbz	w8, 0x126cdbc <__start_il2cpp+0xc55f8>
 126c7e0: 39437e68     	ldrb	w8, [x19, #0xdf]
 126c7e4: 35002ec8     	cbnz	w8, 0x126cdbc <__start_il2cpp+0xc55f8>
 126c7e8: bd40da68     	ldr	s8, [x19, #0xd8]
 126c7ec: aa1f03e0     	mov	x0, xzr
 126c7f0: 94494b18     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 126c7f4: bd411e61     	ldr	s1, [x19, #0x11c]
 126c7f8: 1e202900     	fadd	s0, s8, s0
 126c7fc: bd00da60     	str	s0, [x19, #0xd8]
 126c800: 1e212000     	fcmp	s0, s1
 126c804: 54002dcd     	b.le	0x126cdbc <__start_il2cpp+0xc55f8>
 126c808: 39446268     	ldrb	w8, [x19, #0x118]
 126c80c: 34000268     	cbz	w8, 0x126c858 <__start_il2cpp+0xc5094>
 126c810: aa1303e0     	mov	x0, x19
 126c814: 97fffb69     	bl	0x126b5b8 <__start_il2cpp+0xc3df4>
 126c818: aa1303e0     	mov	x0, x19
 126c81c: a9454ff4     	ldp	x20, x19, [sp, #0x50]
 126c820: a94457f6     	ldp	x22, x21, [sp, #0x40]
 126c824: a9435ff8     	ldp	x24, x23, [sp, #0x30]
 126c828: f94017fe     	ldr	x30, [sp, #0x28]
 126c82c: 6d41a3e9     	ldp	d9, d8, [sp, #0x18]
 126c830: 6d40abeb     	ldp	d11, d10, [sp, #0x8]
 126c834: fc4607ec     	ldr	d12, [sp], #0x60
 126c838: 17fffa8d     	b	0x126b26c <__start_il2cpp+0xc3aa8>
 126c83c: 39477a68     	ldrb	w8, [x19, #0x1de]
 126c840: 35002be8     	cbnz	w8, 0x126cdbc <__start_il2cpp+0xc55f8>
 126c844: 3947de68     	ldrb	w8, [x19, #0x1f7]
 126c848: 34000a08     	cbz	w8, 0x126c988 <__start_il2cpp+0xc51c4>
 126c84c: aa1303e0     	mov	x0, x19
 126c850: 940005e0     	bl	0x126dfd0 <__start_il2cpp+0xc680c>
 126c854: 17ffffd3     	b	0x126c7a0 <__start_il2cpp+0xc4fdc>
 126c858: 39477668     	ldrb	w8, [x19, #0x1dd]
 126c85c: 35002b08     	cbnz	w8, 0x126cdbc <__start_il2cpp+0xc55f8>
 126c860: 39477a68     	ldrb	w8, [x19, #0x1de]
 126c864: 35002ac8     	cbnz	w8, 0x126cdbc <__start_il2cpp+0xc55f8>
 126c868: d000af88     	adrp	x8, 0x285e000
 126c86c: f9479508     	ldr	x8, [x8, #0xf28]
 126c870: f9400100     	ldr	x0, [x8]
 126c874: b940e008     	ldr	w8, [x0, #0xe0]
 126c878: 35000048     	cbnz	w8, 0x126c880 <__start_il2cpp+0xc50bc>
 126c87c: 97f94dd9     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126c880: d000afa8     	adrp	x8, 0x2862000
 126c884: f9431908     	ldr	x8, [x8, #0x630]
 126c888: aa1f03e1     	mov	x1, xzr
 126c88c: f9400100     	ldr	x0, [x8]
 126c890: 9401074c     	bl	0x12ae5c0 <__start_il2cpp+0x106dfc>
 126c894: 36002900     	tbz	w0, #0x0, 0x126cdb4 <__start_il2cpp+0xc55f0>
 126c898: 39477e68     	ldrb	w8, [x19, #0x1df]
 126c89c: 91077674     	add	x20, x19, #0x1dd
 126c8a0: 35000068     	cbnz	w8, 0x126c8ac <__start_il2cpp+0xc50e8>
 126c8a4: 39478269     	ldrb	w9, [x19, #0x1e0]
 126c8a8: 34002409     	cbz	w9, 0x126cd28 <__start_il2cpp+0xc5564>
 126c8ac: 39477269     	ldrb	w9, [x19, #0x1dc]
 126c8b0: 35002669     	cbnz	w9, 0x126cd7c <__start_il2cpp+0xc55b8>
 126c8b4: 39400289     	ldrb	w9, [x20]
 126c8b8: 35002629     	cbnz	w9, 0x126cd7c <__start_il2cpp+0xc55b8>
 126c8bc: 1400013e     	b	0x126cdb4 <__start_il2cpp+0xc55f0>
 126c8c0: 39478a69     	ldrb	w9, [x19, #0x1e2]
 126c8c4: 34000fc9     	cbz	w9, 0x126cabc <__start_il2cpp+0xc52f8>
 126c8c8: 52800021     	mov	w1, #0x1                // =1
 126c8cc: aa1303e0     	mov	x0, x19
 126c8d0: 7903ba7f     	strh	wzr, [x19, #0x1dc]
 126c8d4: 940002ff     	bl	0x126d4d0 <__start_il2cpp+0xc5d0c>
 126c8d8: 36000160     	tbz	w0, #0x0, 0x126c904 <__start_il2cpp+0xc5140>
 126c8dc: b941e668     	ldr	w8, [x19, #0x1e4]
 126c8e0: f9405260     	ldr	x0, [x19, #0xa0]
 126c8e4: 39037a7f     	strb	wzr, [x19, #0xde]
 126c8e8: 11000508     	add	w8, w8, #0x1
 126c8ec: b901e668     	str	w8, [x19, #0x1e4]
 126c8f0: b4005b20     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126c8f4: f9400008     	ldr	x8, [x0]
 126c8f8: 52800021     	mov	w1, #0x1                // =1
 126c8fc: a9588909     	ldp	x9, x2, [x8, #0x188]
 126c900: d63f0120     	blr	x9
 126c904: d000af88     	adrp	x8, 0x285e000
 126c908: f9414d08     	ldr	x8, [x8, #0x298]
 126c90c: f9400100     	ldr	x0, [x8]
 126c910: b940e008     	ldr	w8, [x0, #0xe0]
 126c914: 35000048     	cbnz	w8, 0x126c91c <__start_il2cpp+0xc5158>
 126c918: 97f94db2     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126c91c: aa1f03e0     	mov	x0, xzr
 126c920: 97ffb9b2     	bl	0x125afe8 <__start_il2cpp+0xb3824>
 126c924: 9000af88     	adrp	x8, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 126c928: f9456108     	ldr	x8, [x8, #0xac0]
 126c92c: aa0003f4     	mov	x20, x0
 126c930: f9400108     	ldr	x8, [x8]
 126c934: b940e109     	ldr	w9, [x8, #0xe0]
 126c938: 35000069     	cbnz	w9, 0x126c944 <__start_il2cpp+0xc5180>
 126c93c: aa0803e0     	mov	x0, x8
 126c940: 97f94da8     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126c944: aa1403e0     	mov	x0, x20
 126c948: aa1f03e1     	mov	x1, xzr
 126c94c: aa1f03e2     	mov	x2, xzr
 126c950: 94492fbe     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 126c954: 3607f420     	tbz	w0, #0x0, 0x126c7d8 <__start_il2cpp+0xc5014>
 126c958: b40057f4     	cbz	x20, 0x126d454 <__start_il2cpp+0xc5c90>
 126c95c: d000af89     	adrp	x9, 0x285e000
 126c960: f9400288     	ldr	x8, [x20]
 126c964: f940d529     	ldr	x9, [x9, #0x1a8]
 126c968: 528000a3     	mov	w3, #0x5                // =5
 126c96c: aa1403e0     	mov	x0, x20
 126c970: f9415904     	ldr	x4, [x8, #0x2b0]
 126c974: f9400122     	ldr	x2, [x9]
 126c978: f9415509     	ldr	x9, [x8, #0x2a8]
 126c97c: 2a1f03e1     	mov	w1, wzr
 126c980: d63f0120     	blr	x9
 126c984: 17ffff95     	b	0x126c7d8 <__start_il2cpp+0xc5014>
 126c988: 39437268     	ldrb	w8, [x19, #0xdc]
 126c98c: 35fff268     	cbnz	w8, 0x126c7d8 <__start_il2cpp+0xc5014>
 126c990: 39437668     	ldrb	w8, [x19, #0xdd]
 126c994: 340002e8     	cbz	w8, 0x126c9f0 <__start_il2cpp+0xc522c>
 126c998: bd40d268     	ldr	s8, [x19, #0xd0]
 126c99c: aa1f03e0     	mov	x0, xzr
 126c9a0: 94494aac     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 126c9a4: bd40d669     	ldr	s9, [x19, #0xd4]
 126c9a8: 1e202900     	fadd	s0, s8, s0
 126c9ac: aa1f03e0     	mov	x0, xzr
 126c9b0: bd00d260     	str	s0, [x19, #0xd0]
 126c9b4: 94494aa7     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 126c9b8: bd424a68     	ldr	s8, [x19, #0x248]
 126c9bc: 1e202920     	fadd	s0, s9, s0
 126c9c0: aa1f03e0     	mov	x0, xzr
 126c9c4: bd00d660     	str	s0, [x19, #0xd4]
 126c9c8: 94494aa2     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 126c9cc: 39441268     	ldrb	w8, [x19, #0x104]
 126c9d0: 1e202900     	fadd	s0, s8, s0
 126c9d4: bd024a60     	str	s0, [x19, #0x248]
 126c9d8: 340000c8     	cbz	w8, 0x126c9f0 <__start_il2cpp+0xc522c>
 126c9dc: bd411668     	ldr	s8, [x19, #0x114]
 126c9e0: aa1f03e0     	mov	x0, xzr
 126c9e4: 94494a9b     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 126c9e8: 1e202900     	fadd	s0, s8, s0
 126c9ec: bd011660     	str	s0, [x19, #0x114]
 126c9f0: 39441a68     	ldrb	w8, [x19, #0x106]
 126c9f4: 340000c8     	cbz	w8, 0x126ca0c <__start_il2cpp+0xc5248>
 126c9f8: bd40d260     	ldr	s0, [x19, #0xd0]
 126c9fc: 1e211001     	fmov	s1, #3.00000000
 126ca00: 1e212000     	fcmp	s0, s1
 126ca04: 5400004d     	b.le	0x126ca0c <__start_il2cpp+0xc5248>
 126ca08: 39041a7f     	strb	wzr, [x19, #0x106]
 126ca0c: 9000af98     	adrp	x24, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 126ca10: f9456318     	ldr	x24, [x24, #0xac0]
 126ca14: f9403a74     	ldr	x20, [x19, #0x70]
 126ca18: f9400300     	ldr	x0, [x24]
 126ca1c: b940e008     	ldr	w8, [x0, #0xe0]
 126ca20: 35000048     	cbnz	w8, 0x126ca28 <__start_il2cpp+0xc5264>
 126ca24: 97f94d6f     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126ca28: aa1403e0     	mov	x0, x20
 126ca2c: aa1f03e1     	mov	x1, xzr
 126ca30: aa1f03e2     	mov	x2, xzr
 126ca34: 94493299     	bl	0x24b9498 <__start_il2cpp+0x1311cd4>
 126ca38: 36000a00     	tbz	w0, #0x0, 0x126cb78 <__start_il2cpp+0xc53b4>
 126ca3c: aa1303e0     	mov	x0, x19
 126ca40: 94000610     	bl	0x126e280 <__start_il2cpp+0xc6abc>
 126ca44: aa1303e0     	mov	x0, x19
 126ca48: 94000748     	bl	0x126e768 <__start_il2cpp+0xc6fa4>
 126ca4c: f9403660     	ldr	x0, [x19, #0x68]
 126ca50: b4005020     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126ca54: aa1f03e1     	mov	x1, xzr
 126ca58: 944925ad     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126ca5c: b4004fc0     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126ca60: aa1f03e1     	mov	x1, xzr
 126ca64: 94495704     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126ca68: f9403660     	ldr	x0, [x19, #0x68]
 126ca6c: b4004f40     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126ca70: aa1f03e1     	mov	x1, xzr
 126ca74: 4ea01c08     	mov	v8.16b, v0.16b
 126ca78: 944925a5     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126ca7c: b4004ec0     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126ca80: aa1f03e1     	mov	x1, xzr
 126ca84: 944956fc     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126ca88: f9401660     	ldr	x0, [x19, #0x28]
 126ca8c: b4004e40     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126ca90: b9403261     	ldr	w1, [x19, #0x30]
 126ca94: 52800022     	mov	w2, #0x1                // =1
 126ca98: 52800063     	mov	w3, #0x3                // =3
 126ca9c: 4ea81d00     	mov	v0.16b, v8.16b
 126caa0: 4ea21c41     	mov	v1.16b, v2.16b
 126caa4: aa1f03e4     	mov	x4, xzr
 126caa8: 9401ec23     	bl	0x12e7b34 <__start_il2cpp+0x140370>
 126caac: f9004660     	str	x0, [x19, #0x88]
 126cab0: aa1303e0     	mov	x0, x19
 126cab4: 940009e2     	bl	0x126f23c <__start_il2cpp+0xc7a78>
 126cab8: 14000264     	b	0x126d448 <__start_il2cpp+0xc5c84>
 126cabc: 34ffe8e8     	cbz	w8, 0x126c7d8 <__start_il2cpp+0xc5014>
 126cac0: 39477668     	ldrb	w8, [x19, #0x1dd]
 126cac4: 35ffe8a8     	cbnz	w8, 0x126c7d8 <__start_il2cpp+0xc5014>
 126cac8: d000afa8     	adrp	x8, 0x2862000
 126cacc: f9430d08     	ldr	x8, [x8, #0x618]
 126cad0: b000af97     	adrp	x23, 0x285d000
 126cad4: f9400108     	ldr	x8, [x8]
 126cad8: f9405d08     	ldr	x8, [x8, #0xb8]
 126cadc: f943def7     	ldr	x23, [x23, #0x7b8]
 126cae0: f9400114     	ldr	x20, [x8]
 126cae4: f94002e0     	ldr	x0, [x23]
 126cae8: 97f94d83     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 126caec: d000afa8     	adrp	x8, 0x2862000
 126caf0: f9430508     	ldr	x8, [x8, #0x608]
 126caf4: aa1303e1     	mov	x1, x19
 126caf8: aa1f03e3     	mov	x3, xzr
 126cafc: aa0003f5     	mov	x21, x0
 126cb00: f9400102     	ldr	x2, [x8]
 126cb04: 942eedf3     	bl	0x1e282d0 <__start_il2cpp+0xc80b0c>
 126cb08: f94002e0     	ldr	x0, [x23]
 126cb0c: 97f94d7a     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 126cb10: d000afa8     	adrp	x8, 0x2862000
 126cb14: f9430108     	ldr	x8, [x8, #0x600]
 126cb18: aa1303e1     	mov	x1, x19
 126cb1c: aa1f03e3     	mov	x3, xzr
 126cb20: aa0003f6     	mov	x22, x0
 126cb24: f9400102     	ldr	x2, [x8]
 126cb28: 942eedea     	bl	0x1e282d0 <__start_il2cpp+0xc80b0c>
 126cb2c: f94002e0     	ldr	x0, [x23]
 126cb30: 97f94d71     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 126cb34: d000afa8     	adrp	x8, 0x2862000
 126cb38: f942fd08     	ldr	x8, [x8, #0x5f8]
 126cb3c: aa1303e1     	mov	x1, x19
 126cb40: aa1f03e3     	mov	x3, xzr
 126cb44: aa0003f7     	mov	x23, x0
 126cb48: f9400102     	ldr	x2, [x8]
 126cb4c: 942eede1     	bl	0x1e282d0 <__start_il2cpp+0xc80b0c>
 126cb50: b4004834     	cbz	x20, 0x126d454 <__start_il2cpp+0xc5c90>
 126cb54: aa1403e0     	mov	x0, x20
 126cb58: aa1503e1     	mov	x1, x21
 126cb5c: aa1603e2     	mov	x2, x22
 126cb60: aa1703e3     	mov	x3, x23
 126cb64: aa1f03e4     	mov	x4, xzr
 126cb68: 94018b8f     	bl	0x12cf9a4 <__start_il2cpp+0x1281e0>
 126cb6c: 52802008     	mov	w8, #0x100              // =256
 126cb70: 7903ba68     	strh	w8, [x19, #0x1dc]
 126cb74: 17ffff19     	b	0x126c7d8 <__start_il2cpp+0xc5014>
 126cb78: 39437668     	ldrb	w8, [x19, #0xdd]
 126cb7c: 34003fe8     	cbz	w8, 0x126d378 <__start_il2cpp+0xc5bb4>
 126cb80: 39441a68     	ldrb	w8, [x19, #0x106]
 126cb84: 340000a8     	cbz	w8, 0x126cb98 <__start_il2cpp+0xc53d4>
 126cb88: bd40d260     	ldr	s0, [x19, #0xd0]
 126cb8c: 1e2e1001     	fmov	s1, #1.00000000
 126cb90: 1e212000     	fcmp	s0, s1
 126cb94: 54003f2d     	b.le	0x126d378 <__start_il2cpp+0xc5bb4>
 126cb98: f9403a68     	ldr	x8, [x19, #0x70]
 126cb9c: b40045c8     	cbz	x8, 0x126d454 <__start_il2cpp+0xc5c90>
 126cba0: 3906c11f     	strb	wzr, [x8, #0x1b0]
 126cba4: f9403e74     	ldr	x20, [x19, #0x78]
 126cba8: b4004574     	cbz	x20, 0x126d454 <__start_il2cpp+0xc5c90>
 126cbac: 39408288     	ldrb	w8, [x20, #0x20]
 126cbb0: 340001a8     	cbz	w8, 0x126cbe4 <__start_il2cpp+0xc5420>
 126cbb4: bd402a88     	ldr	s8, [x20, #0x28]
 126cbb8: aa1f03e0     	mov	x0, xzr
 126cbbc: 94494a25     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 126cbc0: 1e202900     	fadd	s0, s8, s0
 126cbc4: bd002a80     	str	s0, [x20, #0x28]
 126cbc8: f9403e68     	ldr	x8, [x19, #0x78]
 126cbcc: b4004448     	cbz	x8, 0x126d454 <__start_il2cpp+0xc5c90>
 126cbd0: bd402900     	ldr	s0, [x8, #0x28]
 126cbd4: 1e2a1001     	fmov	s1, #0.25000000
 126cbd8: 1e212000     	fcmp	s0, s1
 126cbdc: 5400004d     	b.le	0x126cbe4 <__start_il2cpp+0xc5420>
 126cbe0: 3900811f     	strb	wzr, [x8, #0x20]
 126cbe4: aa1303e0     	mov	x0, x19
 126cbe8: 940009e4     	bl	0x126f378 <__start_il2cpp+0xc7bb4>
 126cbec: aa1303e0     	mov	x0, x19
 126cbf0: 94000c41     	bl	0x126fcf4 <__start_il2cpp+0xc8530>
 126cbf4: aa1303e0     	mov	x0, x19
 126cbf8: 94000cda     	bl	0x126ff60 <__start_il2cpp+0xc879c>
 126cbfc: aa1303e0     	mov	x0, x19
 126cc00: 94000cec     	bl	0x126ffb0 <__start_il2cpp+0xc87ec>
 126cc04: f9403a60     	ldr	x0, [x19, #0x70]
 126cc08: b4004260     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126cc0c: 39440008     	ldrb	w8, [x0, #0x100]
 126cc10: 35000088     	cbnz	w8, 0x126cc20 <__start_il2cpp+0xc545c>
 126cc14: f9402a68     	ldr	x8, [x19, #0x50]
 126cc18: b40041e8     	cbz	x8, 0x126d454 <__start_il2cpp+0xc5c90>
 126cc1c: 3903311f     	strb	wzr, [x8, #0xcc]
 126cc20: 2d4fa408     	ldp	s8, s9, [x0, #0x7c]
 126cc24: bd40840a     	ldr	s10, [x0, #0x84]
 126cc28: aa1f03e1     	mov	x1, xzr
 126cc2c: 94492538     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126cc30: b4004120     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126cc34: aa1f03e1     	mov	x1, xzr
 126cc38: 9449568f     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126cc3c: 4ea01c03     	mov	v3.16b, v0.16b
 126cc40: 4ea11c24     	mov	v4.16b, v1.16b
 126cc44: 4ea21c45     	mov	v5.16b, v2.16b
 126cc48: aa1303e0     	mov	x0, x19
 126cc4c: 4ea81d00     	mov	v0.16b, v8.16b
 126cc50: 4ea91d21     	mov	v1.16b, v9.16b
 126cc54: 4eaa1d42     	mov	v2.16b, v10.16b
 126cc58: 94000f11     	bl	0x127089c <__start_il2cpp+0xc90d8>
 126cc5c: aa1303e0     	mov	x0, x19
 126cc60: 94000fad     	bl	0x1270b14 <__start_il2cpp+0xc9350>
 126cc64: f9403a68     	ldr	x8, [x19, #0x70]
 126cc68: b4003f68     	cbz	x8, 0x126d454 <__start_il2cpp+0xc5c90>
 126cc6c: 39436108     	ldrb	w8, [x8, #0xd8]
 126cc70: 35003848     	cbnz	w8, 0x126d378 <__start_il2cpp+0xc5bb4>
 126cc74: aa1303e0     	mov	x0, x19
 126cc78: 94000582     	bl	0x126e280 <__start_il2cpp+0xc6abc>
 126cc7c: aa1303e0     	mov	x0, x19
 126cc80: 940006ba     	bl	0x126e768 <__start_il2cpp+0xc6fa4>
 126cc84: f9403a68     	ldr	x8, [x19, #0x70]
 126cc88: b4003e68     	cbz	x8, 0x126d454 <__start_il2cpp+0xc5c90>
 126cc8c: f9403660     	ldr	x0, [x19, #0x68]
 126cc90: b4003e20     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126cc94: 3944c517     	ldrb	w23, [x8, #0x131]
 126cc98: aa1f03e1     	mov	x1, xzr
 126cc9c: 9449251c     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126cca0: b4003da0     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126cca4: aa1f03e1     	mov	x1, xzr
 126cca8: 94495673     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126ccac: f9403660     	ldr	x0, [x19, #0x68]
 126ccb0: b4003d20     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126ccb4: aa1f03e1     	mov	x1, xzr
 126ccb8: 4ea01c08     	mov	v8.16b, v0.16b
 126ccbc: 94492514     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126ccc0: b4003ca0     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126ccc4: aa1f03e1     	mov	x1, xzr
 126ccc8: 9449566b     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126cccc: f9401660     	ldr	x0, [x19, #0x28]
 126ccd0: b4003c20     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126ccd4: b9403261     	ldr	w1, [x19, #0x30]
 126ccd8: 52800022     	mov	w2, #0x1                // =1
 126ccdc: 52800063     	mov	w3, #0x3                // =3
 126cce0: 4ea81d00     	mov	v0.16b, v8.16b
 126cce4: 4ea21c41     	mov	v1.16b, v2.16b
 126cce8: aa1f03e4     	mov	x4, xzr
 126ccec: 9401eb92     	bl	0x12e7b34 <__start_il2cpp+0x140370>
 126ccf0: f9004660     	str	x0, [x19, #0x88]
 126ccf4: aa0003f4     	mov	x20, x0
 126ccf8: f9400300     	ldr	x0, [x24]
 126ccfc: b940e008     	ldr	w8, [x0, #0xe0]
 126cd00: 35000048     	cbnz	w8, 0x126cd08 <__start_il2cpp+0xc5544>
 126cd04: 97f94cb7     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126cd08: aa1403e0     	mov	x0, x20
 126cd0c: aa1f03e1     	mov	x1, xzr
 126cd10: aa1f03e2     	mov	x2, xzr
 126cd14: 94492ecd     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 126cd18: 36000620     	tbz	w0, #0x0, 0x126cddc <__start_il2cpp+0xc5618>
 126cd1c: f9404674     	ldr	x20, [x19, #0x88]
 126cd20: f9004a74     	str	x20, [x19, #0x90]
 126cd24: 1400002f     	b	0x126cde0 <__start_il2cpp+0xc561c>
 126cd28: d000afa8     	adrp	x8, 0x2862000
 126cd2c: f9431108     	ldr	x8, [x8, #0x620]
 126cd30: f9400108     	ldr	x8, [x8]
 126cd34: f9405d08     	ldr	x8, [x8, #0xb8]
 126cd38: f9400108     	ldr	x8, [x8]
 126cd3c: b40000e8     	cbz	x8, 0x126cd58 <__start_il2cpp+0xc5594>
 126cd40: b9402908     	ldr	w8, [x8, #0x28]
 126cd44: 7100051f     	cmp	w8, #0x1
 126cd48: 5400008b     	b.lt	0x126cd58 <__start_il2cpp+0xc5594>
 126cd4c: b941e669     	ldr	w9, [x19, #0x1e4]
 126cd50: 6b08013f     	cmp	w9, w8
 126cd54: 5400030a     	b.ge	0x126cdb4 <__start_il2cpp+0xc55f0>
 126cd58: d000af88     	adrp	x8, 0x285e000
 126cd5c: f9414108     	ldr	x8, [x8, #0x280]
 126cd60: f9400100     	ldr	x0, [x8]
 126cd64: b940e008     	ldr	w8, [x0, #0xe0]
 126cd68: 35000048     	cbnz	w8, 0x126cd70 <__start_il2cpp+0xc55ac>
 126cd6c: 97f94c9d     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126cd70: 97fff250     	bl	0x12696b0 <__start_il2cpp+0xc1eec>
 126cd74: 36000200     	tbz	w0, #0x0, 0x126cdb4 <__start_il2cpp+0xc55f0>
 126cd78: 39477e68     	ldrb	w8, [x19, #0x1df]
 126cd7c: 35000208     	cbnz	w8, 0x126cdbc <__start_il2cpp+0xc55f8>
 126cd80: 39478268     	ldrb	w8, [x19, #0x1e0]
 126cd84: 350001c8     	cbnz	w8, 0x126cdbc <__start_il2cpp+0xc55f8>
 126cd88: 39478668     	ldrb	w8, [x19, #0x1e1]
 126cd8c: 35000188     	cbnz	w8, 0x126cdbc <__start_il2cpp+0xc55f8>
 126cd90: 39400288     	ldrb	w8, [x20]
 126cd94: 35000148     	cbnz	w8, 0x126cdbc <__start_il2cpp+0xc55f8>
 126cd98: 39477a68     	ldrb	w8, [x19, #0x1de]
 126cd9c: 35000108     	cbnz	w8, 0x126cdbc <__start_il2cpp+0xc55f8>
 126cda0: 52800028     	mov	w8, #0x1                // =1
 126cda4: 39077268     	strb	w8, [x19, #0x1dc]
 126cda8: b800329f     	stur	wzr, [x20, #0x3]
 126cdac: b900029f     	str	wzr, [x20]
 126cdb0: 14000003     	b	0x126cdbc <__start_il2cpp+0xc55f8>
 126cdb4: 52800028     	mov	w8, #0x1                // =1
 126cdb8: 39037e68     	strb	w8, [x19, #0xdf]
 126cdbc: a9454ff4     	ldp	x20, x19, [sp, #0x50]
 126cdc0: a94457f6     	ldp	x22, x21, [sp, #0x40]
 126cdc4: a9435ff8     	ldp	x24, x23, [sp, #0x30]
 126cdc8: f94017fe     	ldr	x30, [sp, #0x28]
 126cdcc: 6d41a3e9     	ldp	d9, d8, [sp, #0x18]
 126cdd0: 6d40abeb     	ldp	d11, d10, [sp, #0x8]
 126cdd4: fc4607ec     	ldr	d12, [sp], #0x60
 126cdd8: d65f03c0     	ret
 126cddc: f9404674     	ldr	x20, [x19, #0x88]
 126cde0: f9400300     	ldr	x0, [x24]
 126cde4: b940e008     	ldr	w8, [x0, #0xe0]
 126cde8: 35000048     	cbnz	w8, 0x126cdf0 <__start_il2cpp+0xc562c>
 126cdec: 97f94c7d     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126cdf0: aa1403e0     	mov	x0, x20
 126cdf4: aa1f03e1     	mov	x1, xzr
 126cdf8: aa1f03e2     	mov	x2, xzr
 126cdfc: 94492e93     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 126ce00: 36000b60     	tbz	w0, #0x0, 0x126cf6c <__start_il2cpp+0xc57a8>
 126ce04: f9403a68     	ldr	x8, [x19, #0x70]
 126ce08: b4003268     	cbz	x8, 0x126d454 <__start_il2cpp+0xc5c90>
 126ce0c: f9404660     	ldr	x0, [x19, #0x88]
 126ce10: b4003220     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126ce14: b9403261     	ldr	w1, [x19, #0x30]
 126ce18: bd41350c     	ldr	s12, [x8, #0x134]
 126ce1c: aa1f03e2     	mov	x2, xzr
 126ce20: 9401d9a9     	bl	0x12e34c4 <__start_il2cpp+0x13bd00>
 126ce24: f9404668     	ldr	x8, [x19, #0x88]
 126ce28: b4003168     	cbz	x8, 0x126d454 <__start_il2cpp+0xc5c90>
 126ce2c: b9403915     	ldr	w21, [x8, #0x38]
 126ce30: d000afa8     	adrp	x8, 0x2862000
 126ce34: f9430908     	ldr	x8, [x8, #0x610]
 126ce38: aa0003f4     	mov	x20, x0
 126ce3c: 52800061     	mov	w1, #0x3                // =3
 126ce40: f9400100     	ldr	x0, [x8]
 126ce44: 97f94c43     	bl	0x10bff50 <CloseNLSocket+0x488>
 126ce48: d000afa8     	adrp	x8, 0x2862000
 126ce4c: f9431508     	ldr	x8, [x8, #0x628]
 126ce50: aa1f03e2     	mov	x2, xzr
 126ce54: aa0003f6     	mov	x22, x0
 126ce58: f9400101     	ldr	x1, [x8]
 126ce5c: 942de35e     	bl	0x1de5bd4 <__start_il2cpp+0xc3e410>
 126ce60: d000afa8     	adrp	x8, 0x2862000
 126ce64: f942f908     	ldr	x8, [x8, #0x5f0]
 126ce68: 2a1503e0     	mov	w0, w21
 126ce6c: aa1603e1     	mov	x1, x22
 126ce70: f9400102     	ldr	x2, [x8]
 126ce74: 9405aacd     	bl	0x13d79a8 <__start_il2cpp+0x2301e4>
 126ce78: 36000800     	tbz	w0, #0x0, 0x126cf78 <__start_il2cpp+0xc57b4>
 126ce7c: f9402260     	ldr	x0, [x19, #0x40]
 126ce80: b4002ea0     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126ce84: aa1f03e1     	mov	x1, xzr
 126ce88: 944924a1     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126ce8c: f9404668     	ldr	x8, [x19, #0x88]
 126ce90: b4002e28     	cbz	x8, 0x126d454 <__start_il2cpp+0xc5c90>
 126ce94: aa0003f5     	mov	x21, x0
 126ce98: aa0803e0     	mov	x0, x8
 126ce9c: aa1f03e1     	mov	x1, xzr
 126cea0: 9449249b     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126cea4: b4002d80     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126cea8: aa1f03e1     	mov	x1, xzr
 126ceac: 944955f2     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126ceb0: f9404660     	ldr	x0, [x19, #0x88]
 126ceb4: b4002d00     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126ceb8: aa1f03e1     	mov	x1, xzr
 126cebc: 4ea01c08     	mov	v8.16b, v0.16b
 126cec0: 94492493     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126cec4: b4002c80     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126cec8: aa1f03e1     	mov	x1, xzr
 126cecc: 944955ea     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126ced0: b4002c35     	cbz	x21, 0x126d454 <__start_il2cpp+0xc5c90>
 126ced4: 1e2703e1     	fmov	s1, wzr
 126ced8: aa1503e0     	mov	x0, x21
 126cedc: 4ea81d00     	mov	v0.16b, v8.16b
 126cee0: aa1f03e1     	mov	x1, xzr
 126cee4: 9449560c     	bl	0x24c2714 <__start_il2cpp+0x131af50>
 126cee8: f9402260     	ldr	x0, [x19, #0x40]
 126ceec: b4002b40     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126cef0: aa1f03e1     	mov	x1, xzr
 126cef4: 94492486     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126cef8: f9404668     	ldr	x8, [x19, #0x88]
 126cefc: b4002ac8     	cbz	x8, 0x126d454 <__start_il2cpp+0xc5c90>
 126cf00: aa0003f5     	mov	x21, x0
 126cf04: aa0803e0     	mov	x0, x8
 126cf08: aa1f03e1     	mov	x1, xzr
 126cf0c: 94492480     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126cf10: b4002a20     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126cf14: aa1f03e1     	mov	x1, xzr
 126cf18: 94495653     	bl	0x24c2864 <__start_il2cpp+0x131b0a0>
 126cf1c: b40029d5     	cbz	x21, 0x126d454 <__start_il2cpp+0xc5c90>
 126cf20: aa1503e0     	mov	x0, x21
 126cf24: aa1f03e1     	mov	x1, xzr
 126cf28: 94495671     	bl	0x24c28ec <__start_il2cpp+0x131b128>
 126cf2c: f9404660     	ldr	x0, [x19, #0x88]
 126cf30: b4002920     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126cf34: aa1f03e1     	mov	x1, xzr
 126cf38: 9401d787     	bl	0x12e2d54 <__start_il2cpp+0x13b590>
 126cf3c: f9402268     	ldr	x8, [x19, #0x40]
 126cf40: b40028a8     	cbz	x8, 0x126d454 <__start_il2cpp+0xc5c90>
 126cf44: 2a0003f5     	mov	w21, w0
 126cf48: aa0803e0     	mov	x0, x8
 126cf4c: aa1f03e1     	mov	x1, xzr
 126cf50: 9449246f     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126cf54: 36000395     	tbz	w21, #0x0, 0x126cfc4 <__start_il2cpp+0xc5800>
 126cf58: b40027e0     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126cf5c: 52a85688     	mov	w8, #0x42b40000         // =1119092736
 126cf60: 1e2703e0     	fmov	s0, wzr
 126cf64: 1e270101     	fmov	s1, w8
 126cf68: 1400001a     	b	0x126cfd0 <__start_il2cpp+0xc580c>
 126cf6c: 2a1f03f6     	mov	w22, wzr
 126cf70: 2a1f03f4     	mov	w20, wzr
 126cf74: 140000ec     	b	0x126d324 <__start_il2cpp+0xc5b60>
 126cf78: f9400300     	ldr	x0, [x24]
 126cf7c: b940e008     	ldr	w8, [x0, #0xe0]
 126cf80: 35000048     	cbnz	w8, 0x126cf88 <__start_il2cpp+0xc57c4>
 126cf84: 97f94c17     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126cf88: aa1403e0     	mov	x0, x20
 126cf8c: aa1f03e1     	mov	x1, xzr
 126cf90: aa1f03e2     	mov	x2, xzr
 126cf94: 94492e2d     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 126cf98: 36000480     	tbz	w0, #0x0, 0x126d028 <__start_il2cpp+0xc5864>
 126cf9c: b40025d4     	cbz	x20, 0x126d454 <__start_il2cpp+0xc5c90>
 126cfa0: b9403a88     	ldr	w8, [x20, #0x38]
 126cfa4: 71001d1f     	cmp	w8, #0x7
 126cfa8: 54000401     	b.ne	0x126d028 <__start_il2cpp+0xc5864>
 126cfac: f9404668     	ldr	x8, [x19, #0x88]
 126cfb0: b4002528     	cbz	x8, 0x126d454 <__start_il2cpp+0xc5c90>
 126cfb4: b9403508     	ldr	w8, [x8, #0x34]
 126cfb8: 71000d1f     	cmp	w8, #0x3
 126cfbc: 54fff601     	b.ne	0x126ce7c <__start_il2cpp+0xc56b8>
 126cfc0: 1400001a     	b	0x126d028 <__start_il2cpp+0xc5864>
 126cfc4: b4002480     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126cfc8: 1e2703e0     	fmov	s0, wzr
 126cfcc: 1e2703e1     	fmov	s1, wzr
 126cfd0: 4ea01c02     	mov	v2.16b, v0.16b
 126cfd4: aa1f03e1     	mov	x1, xzr
 126cfd8: 94495639     	bl	0x24c28bc <__start_il2cpp+0x131b0f8>
 126cfdc: f9403a60     	ldr	x0, [x19, #0x70]
 126cfe0: b40023a0     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126cfe4: f9402275     	ldr	x21, [x19, #0x40]
 126cfe8: aa1f03e1     	mov	x1, xzr
 126cfec: 94492448     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126cff0: b4002320     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126cff4: aa1f03e1     	mov	x1, xzr
 126cff8: 9449559f     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126cffc: b40022d5     	cbz	x21, 0x126d454 <__start_il2cpp+0xc5c90>
 126d000: aa1503e0     	mov	x0, x21
 126d004: aa1f03e1     	mov	x1, xzr
 126d008: 94021eba     	bl	0x12f4af0 <__start_il2cpp+0x14d32c>
 126d00c: 360000e0     	tbz	w0, #0x0, 0x126d028 <__start_il2cpp+0xc5864>
 126d010: f9403a68     	ldr	x8, [x19, #0x70]
 126d014: b4002208     	cbz	x8, 0x126d454 <__start_il2cpp+0xc5c90>
 126d018: 39455108     	ldrb	w8, [x8, #0x154]
 126d01c: 52800036     	mov	w22, #0x1               // =1
 126d020: 35000208     	cbnz	w8, 0x126d060 <__start_il2cpp+0xc589c>
 126d024: 14000002     	b	0x126d02c <__start_il2cpp+0xc5868>
 126d028: 2a1f03f6     	mov	w22, wzr
 126d02c: f9403a60     	ldr	x0, [x19, #0x70]
 126d030: b4002120     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126d034: f9404675     	ldr	x21, [x19, #0x88]
 126d038: aa1f03e1     	mov	x1, xzr
 126d03c: 94492434     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126d040: b40020a0     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126d044: aa1f03e1     	mov	x1, xzr
 126d048: 9449558b     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126d04c: b4002055     	cbz	x21, 0x126d454 <__start_il2cpp+0xc5c90>
 126d050: aa1503e0     	mov	x0, x21
 126d054: aa1f03e1     	mov	x1, xzr
 126d058: 9401ee8e     	bl	0x12e8a90 <__start_il2cpp+0x1412cc>
 126d05c: 36000820     	tbz	w0, #0x0, 0x126d160 <__start_il2cpp+0xc599c>
 126d060: f9403a75     	ldr	x21, [x19, #0x70]
 126d064: b4001f95     	cbz	x21, 0x126d454 <__start_il2cpp+0xc5c90>
 126d068: 394552a8     	ldrb	w8, [x21, #0x154]
 126d06c: f9404660     	ldr	x0, [x19, #0x88]
 126d070: 6a16011f     	tst	w8, w22
 126d074: 540007a0     	b.eq	0x126d168 <__start_il2cpp+0xc59a4>
 126d078: b4001ee0     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126d07c: aa1f03e1     	mov	x1, xzr
 126d080: 9401d8f3     	bl	0x12e344c <__start_il2cpp+0x13bc88>
 126d084: f9400300     	ldr	x0, [x24]
 126d088: 4ea01c08     	mov	v8.16b, v0.16b
 126d08c: b940e008     	ldr	w8, [x0, #0xe0]
 126d090: 35000048     	cbnz	w8, 0x126d098 <__start_il2cpp+0xc58d4>
 126d094: 97f94bd3     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126d098: aa1403e0     	mov	x0, x20
 126d09c: aa1f03e1     	mov	x1, xzr
 126d0a0: aa1f03e2     	mov	x2, xzr
 126d0a4: 94492de9     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 126d0a8: 360006a0     	tbz	w0, #0x0, 0x126d17c <__start_il2cpp+0xc59b8>
 126d0ac: b4001d54     	cbz	x20, 0x126d454 <__start_il2cpp+0xc5c90>
 126d0b0: aa1403e0     	mov	x0, x20
 126d0b4: aa1f03e1     	mov	x1, xzr
 126d0b8: 9401d8e5     	bl	0x12e344c <__start_il2cpp+0x13bc88>
 126d0bc: f9404660     	ldr	x0, [x19, #0x88]
 126d0c0: b4001ca0     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126d0c4: aa1f03e1     	mov	x1, xzr
 126d0c8: 4ea01c08     	mov	v8.16b, v0.16b
 126d0cc: 9401d722     	bl	0x12e2d54 <__start_il2cpp+0x13b590>
 126d0d0: f9403a68     	ldr	x8, [x19, #0x70]
 126d0d4: b4001c08     	cbz	x8, 0x126d454 <__start_il2cpp+0xc5c90>
 126d0d8: 2a0003f5     	mov	w21, w0
 126d0dc: aa0803e0     	mov	x0, x8
 126d0e0: aa1f03e1     	mov	x1, xzr
 126d0e4: 9449240a     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126d0e8: b4001b60     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126d0ec: aa1f03e1     	mov	x1, xzr
 126d0f0: 94495561     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126d0f4: 36000495     	tbz	w21, #0x0, 0x126d184 <__start_il2cpp+0xc59c0>
 126d0f8: f9404660     	ldr	x0, [x19, #0x88]
 126d0fc: b4001ac0     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126d100: aa1f03e1     	mov	x1, xzr
 126d104: 4ea01c09     	mov	v9.16b, v0.16b
 126d108: 94492401     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126d10c: b4001a40     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126d110: aa1f03e1     	mov	x1, xzr
 126d114: 94495558     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126d118: aa1403e0     	mov	x0, x20
 126d11c: aa1f03e1     	mov	x1, xzr
 126d120: 4ea01c0a     	mov	v10.16b, v0.16b
 126d124: 944923fa     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126d128: b4001960     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126d12c: aa1f03e1     	mov	x1, xzr
 126d130: 94495551     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126d134: f9404660     	ldr	x0, [x19, #0x88]
 126d138: b40018e0     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126d13c: aa1f03e1     	mov	x1, xzr
 126d140: 4ea01c0b     	mov	v11.16b, v0.16b
 126d144: 944923f2     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126d148: b4001860     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126d14c: aa1f03e1     	mov	x1, xzr
 126d150: 94495549     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126d154: 1e2a3921     	fsub	s1, s9, s10
 126d158: 1e203960     	fsub	s0, s11, s0
 126d15c: 14000023     	b	0x126d1e8 <__start_il2cpp+0xc5a24>
 126d160: 2a1f03f4     	mov	w20, wzr
 126d164: 14000036     	b	0x126d23c <__start_il2cpp+0xc5a78>
 126d168: b4001760     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126d16c: aa1f03e1     	mov	x1, xzr
 126d170: 9401d8b7     	bl	0x12e344c <__start_il2cpp+0x13bc88>
 126d174: aa1503e0     	mov	x0, x21
 126d178: 1400002e     	b	0x126d230 <__start_il2cpp+0xc5a6c>
 126d17c: 1e2703ea     	fmov	s10, wzr
 126d180: 1400001d     	b	0x126d1f4 <__start_il2cpp+0xc5a30>
 126d184: f9404660     	ldr	x0, [x19, #0x88]
 126d188: b4001660     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126d18c: aa1f03e1     	mov	x1, xzr
 126d190: 4ea21c4a     	mov	v10.16b, v2.16b
 126d194: 944923de     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126d198: b40015e0     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126d19c: aa1f03e1     	mov	x1, xzr
 126d1a0: 94495535     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126d1a4: aa1403e0     	mov	x0, x20
 126d1a8: aa1f03e1     	mov	x1, xzr
 126d1ac: 4ea21c49     	mov	v9.16b, v2.16b
 126d1b0: 944923d7     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126d1b4: b4001500     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126d1b8: aa1f03e1     	mov	x1, xzr
 126d1bc: 9449552e     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126d1c0: f9404660     	ldr	x0, [x19, #0x88]
 126d1c4: b4001480     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126d1c8: aa1f03e1     	mov	x1, xzr
 126d1cc: 4ea21c4b     	mov	v11.16b, v2.16b
 126d1d0: 944923cf     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126d1d4: b4001400     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126d1d8: aa1f03e1     	mov	x1, xzr
 126d1dc: 94495526     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126d1e0: 1e293941     	fsub	s1, s10, s9
 126d1e4: 1e223960     	fsub	s0, s11, s2
 126d1e8: 1e201820     	fdiv	s0, s1, s0
 126d1ec: 1e2c1001     	fmov	s1, #0.50000000
 126d1f0: 1e21280a     	fadd	s10, s0, s1
 126d1f4: f9404660     	ldr	x0, [x19, #0x88]
 126d1f8: b40012e0     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126d1fc: f9403a74     	ldr	x20, [x19, #0x70]
 126d200: aa1f03e1     	mov	x1, xzr
 126d204: 9401d892     	bl	0x12e344c <__start_il2cpp+0x13bc88>
 126d208: f9404660     	ldr	x0, [x19, #0x88]
 126d20c: b4001240     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126d210: aa1f03e1     	mov	x1, xzr
 126d214: 4ea01c09     	mov	v9.16b, v0.16b
 126d218: 9401d88d     	bl	0x12e344c <__start_il2cpp+0x13bc88>
 126d21c: b40011d4     	cbz	x20, 0x126d454 <__start_il2cpp+0xc5c90>
 126d220: 1e203900     	fsub	s0, s8, s0
 126d224: 1e200940     	fmul	s0, s10, s0
 126d228: 1e202920     	fadd	s0, s9, s0
 126d22c: aa1403e0     	mov	x0, x20
 126d230: aa1f03e1     	mov	x1, xzr
 126d234: 9400ac22     	bl	0x12982bc <__start_il2cpp+0xf0af8>
 126d238: 52800034     	mov	w20, #0x1               // =1
 126d23c: f9403a60     	ldr	x0, [x19, #0x70]
 126d240: b40010a0     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126d244: bd413400     	ldr	s0, [x0, #0x134]
 126d248: 1e202180     	fcmp	s12, s0
 126d24c: 54000064     	b.mi	0x126d258 <__start_il2cpp+0xc5a94>
 126d250: 6a37029f     	bics	wzr, w20, w23
 126d254: 54000440     	b.eq	0x126d2dc <__start_il2cpp+0xc5b18>
 126d258: aa1f03e1     	mov	x1, xzr
 126d25c: 944923ac     	bl	0x24b610c <__start_il2cpp+0x130e948>
 126d260: b4000fa0     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126d264: aa1f03e1     	mov	x1, xzr
 126d268: 94495503     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 126d26c: f9403a60     	ldr	x0, [x19, #0x70]
 126d270: b4000f20     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126d274: bd413400     	ldr	s0, [x0, #0x134]
 126d278: 1e331002     	fmov	s2, #-6.00000000
 126d27c: 1e222800     	fadd	s0, s0, s2
 126d280: 1e202020     	fcmp	s1, s0
 126d284: 540002c5     	b.pl	0x126d2dc <__start_il2cpp+0xc5b18>
 126d288: 39436008     	ldrb	w8, [x0, #0xd8]
 126d28c: 35000288     	cbnz	w8, 0x126d2dc <__start_il2cpp+0xc5b18>
 126d290: 39455008     	ldrb	w8, [x0, #0x154]
 126d294: 35000248     	cbnz	w8, 0x126d2dc <__start_il2cpp+0xc5b18>
 126d298: 52800081     	mov	w1, #0x4                // =4
 126d29c: aa1f03e2     	mov	x2, xzr
 126d2a0: 9400ab04     	bl	0x1297eb0 <__start_il2cpp+0xf06ec>
 126d2a4: f9403a60     	ldr	x0, [x19, #0x70]
 126d2a8: b4000d60     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126d2ac: f9400008     	ldr	x8, [x0]
 126d2b0: 2a1f03e1     	mov	w1, wzr
 126d2b4: a9588909     	ldp	x9, x2, [x8, #0x188]
 126d2b8: d63f0120     	blr	x9
 126d2bc: f9402a60     	ldr	x0, [x19, #0x50]
 126d2c0: b4000ca0     	cbz	x0, 0x126d454 <__start_il2cpp+0xc5c90>
 126d2c4: 1e2e1000     	fmov	s0, #1.00000000
 126d2c8: 1e2e1001     	fmov	s1, #1.00000000
 126d2cc: 1e2e1002     	fmov	s2, #1.00000000
 126d2d0: 1e2703e3     	fmov	s3, wzr
 126d2d4: aa1f03e1     	mov	x1, xzr
 126d2d8: 9400fd54     	bl	0x12ac828 <__start_il2cpp+0x105064>
 126d2dc: aa1303e0     	mov	x0, x19
 126d2e0: 940007d7     	bl	0x126f23c <__start_il2cpp+0xc7a78>
 126d2e4: f9403a68     	ldr	x8, [x19, #0x70]
 126d2e8: b4000b68     	cbz	x8, 0x126d454 <__start_il2cpp+0xc5c90>
 126d2ec: b9413908     	ldr	w8, [x8, #0x138]
 126d2f0: b9414e69     	ldr	w9, [x19, #0x14c]
 126d2f4: d0ffa14a     	adrp	x10, 0x697000
 126d2f8: bd414a60     	ldr	s0, [x19, #0x148]
 126d2fc: bd45b541     	ldr	s1, [x10, #0x5b4]
 126d300: d0ffa14a     	adrp	x10, 0x697000
 126d304: bd460542     	ldr	s2, [x10, #0x604]
 126d308: 4b090109     	sub	w9, w8, w9
 126d30c: 1e210800     	fmul	s0, s0, s1
 126d310: 1e220121     	scvtf	s1, w9
 126d314: 1e220821     	fmul	s1, s1, s2
 126d318: 1e212800     	fadd	s0, s0, s1
 126d31c: bd014a60     	str	s0, [x19, #0x148]
 126d320: b9014e68     	str	w8, [x19, #0x14c]
 126d324: 37000116     	tbnz	w22, #0x0, 0x126d344 <__start_il2cpp+0xc5b80>
 126d328: 370000f4     	tbnz	w20, #0x0, 0x126d344 <__start_il2cpp+0xc5b80>
 126d32c: f9403a68     	ldr	x8, [x19, #0x70]
 126d330: b4000928     	cbz	x8, 0x126d454 <__start_il2cpp+0xc5c90>
 126d334: 39436108     	ldrb	w8, [x8, #0xd8]
 126d338: 35000068     	cbnz	w8, 0x126d344 <__start_il2cpp+0xc5b80>
 126d33c: aa1303e0     	mov	x0, x19
 126d340: 94000e3f     	bl	0x1270c3c <__start_il2cpp+0xc9478>
 126d344: f9401661     	ldr	x1, [x19, #0x28]
 126d348: b9403262     	ldr	w2, [x19, #0x30]
 126d34c: 52800023     	mov	w3, #0x1                // =1
 126d350: 52800064     	mov	w4, #0x3                // =3
 126d354: aa1303e0     	mov	x0, x19
 126d358: 94000e88     	bl	0x1270d78 <__start_il2cpp+0xc95b4>
 126d35c: aa1303e0     	mov	x0, x19
 126d360: 94001021     	bl	0x12713e4 <__start_il2cpp+0xc9c20>
 126d364: f9403a68     	ldr	x8, [x19, #0x70]
 126d368: b4000768     	cbz	x8, 0x126d454 <__start_il2cpp+0xc5c90>
 126d36c: aa1303e0     	mov	x0, x19
 126d370: 3904c514     	strb	w20, [x8, #0x131]
 126d374: 940010fe     	bl	0x127176c <__start_il2cpp+0xc9fa8>
 126d378: f9403a68     	ldr	x8, [x19, #0x70]
 126d37c: b40006c8     	cbz	x8, 0x126d454 <__start_il2cpp+0xc5c90>
 126d380: 39436109     	ldrb	w9, [x8, #0xd8]
 126d384: 34000529     	cbz	w9, 0x126d428 <__start_il2cpp+0xc5c64>
 126d388: 39437a69     	ldrb	w9, [x19, #0xde]
 126d38c: 350004e9     	cbnz	w9, 0x126d428 <__start_il2cpp+0xc5c64>
 126d390: 39441269     	ldrb	w9, [x19, #0x104]
 126d394: 34000149     	cbz	w9, 0x126d3bc <__start_il2cpp+0xc5bf8>
 126d398: b9411268     	ldr	w8, [x19, #0x110]
 126d39c: aa1303e0     	mov	x0, x19
 126d3a0: 11000508     	add	w8, w8, #0x1
 126d3a4: b9011268     	str	w8, [x19, #0x110]
 126d3a8: 97ffe71e     	bl	0x1267020 <__start_il2cpp+0xbf85c>
 126d3ac: 1e201000     	fmov	s0, #2.00000000
 126d3b0: 52800021     	mov	w1, #0x1                // =1
 126d3b4: aa1303e0     	mov	x0, x19
 126d3b8: 1400001b     	b	0x126d424 <__start_il2cpp+0xc5c60>
 126d3bc: 39458509     	ldrb	w9, [x8, #0x161]
 126d3c0: 340002c9     	cbz	w9, 0x126d418 <__start_il2cpp+0xc5c54>
 126d3c4: 39458109     	ldrb	w9, [x8, #0x160]
 126d3c8: 34000069     	cbz	w9, 0x126d3d4 <__start_il2cpp+0xc5c10>
 126d3cc: 52a82e09     	mov	w9, #0x41700000         // =1097859072
 126d3d0: b9016909     	str	w9, [x8, #0x168]
 126d3d4: aa1303e0     	mov	x0, x19
 126d3d8: 2a1f03e1     	mov	w1, wzr
 126d3dc: 9400003d     	bl	0x126d4d0 <__start_il2cpp+0xc5d0c>
 126d3e0: 3945b269     	ldrb	w9, [x19, #0x16c]
 126d3e4: 7100013f     	cmp	w9, #0x0
 126d3e8: 1a9f17e8     	cset	w8, eq
 126d3ec: 34000069     	cbz	w9, 0x126d3f8 <__start_il2cpp+0xc5c34>
 126d3f0: 36000140     	tbz	w0, #0x0, 0x126d418 <__start_il2cpp+0xc5c54>
 126d3f4: 1400000d     	b	0x126d428 <__start_il2cpp+0xc5c64>
 126d3f8: f9403a69     	ldr	x9, [x19, #0x70]
 126d3fc: 5280002a     	mov	w10, #0x1               // =1
 126d400: 3905b26a     	strb	w10, [x19, #0x16c]
 126d404: b4000289     	cbz	x9, 0x126d454 <__start_il2cpp+0xc5c90>
 126d408: b9413929     	ldr	w9, [x9, #0x138]
 126d40c: 0a080008     	and	w8, w0, w8
 126d410: b9017269     	str	w9, [x19, #0x170]
 126d414: 370000a8     	tbnz	w8, #0x0, 0x126d428 <__start_il2cpp+0xc5c64>
 126d418: 1e2c1000     	fmov	s0, #0.50000000
 126d41c: aa1303e0     	mov	x0, x19
 126d420: 2a1f03e1     	mov	w1, wzr
 126d424: 94001349     	bl	0x1272148 <__start_il2cpp+0xca984>
 126d428: 39437a68     	ldrb	w8, [x19, #0xde]
 126d42c: 340000e8     	cbz	w8, 0x126d448 <__start_il2cpp+0xc5c84>
 126d430: 39437e68     	ldrb	w8, [x19, #0xdf]
 126d434: 340000a8     	cbz	w8, 0x126d448 <__start_il2cpp+0xc5c84>
 126d438: 39467268     	ldrb	w8, [x19, #0x19c]
 126d43c: 35000068     	cbnz	w8, 0x126d448 <__start_il2cpp+0xc5c84>
 126d440: aa1303e0     	mov	x0, x19
 126d444: 94001373     	bl	0x1272210 <__start_il2cpp+0xcaa4c>
 126d448: aa1303e0     	mov	x0, x19
 126d44c: 940013a5     	bl	0x12722e0 <__start_il2cpp+0xcab1c>
 126d450: 17fffcd4     	b	0x126c7a0 <__start_il2cpp+0xc4fdc>
 126d454: 97f94b2b     	bl	0x10c0100 <CloseNLSocket+0x638>
