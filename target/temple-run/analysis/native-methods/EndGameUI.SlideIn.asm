
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12bb598: fc1b0fec     	str	d12, [sp, #-0x50]!
 12bb59c: 6d00abeb     	stp	d11, d10, [sp, #0x8]
 12bb5a0: 6d01a3e9     	stp	d9, d8, [sp, #0x18]
 12bb5a4: f90017fe     	str	x30, [sp, #0x28]
 12bb5a8: a90357f6     	stp	x22, x21, [sp, #0x30]
 12bb5ac: a9044ff4     	stp	x20, x19, [sp, #0x40]
 12bb5b0: d000bbd5     	adrp	x21, 0x2a35000
 12bb5b4: 3967aaa8     	ldrb	w8, [x21, #0x9ea]
 12bb5b8: aa0103f4     	mov	x20, x1
 12bb5bc: aa0003f3     	mov	x19, x0
 12bb5c0: 370002a8     	tbnz	w8, #0x0, 0x12bb614 <__start_il2cpp+0x113e50>
 12bb5c4: f000ad00     	adrp	x0, 0x285e000
 12bb5c8: f9414c00     	ldr	x0, [x0, #0x298]
 12bb5cc: 97f81243     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12bb5d0: f000ad00     	adrp	x0, 0x285e000
 12bb5d4: f9474c00     	ldr	x0, [x0, #0xe98]
 12bb5d8: 97f81240     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12bb5dc: b000ad40     	adrp	x0, 0x2864000
 12bb5e0: f940fc00     	ldr	x0, [x0, #0x1f8]
 12bb5e4: 97f8123d     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12bb5e8: f000ad20     	adrp	x0, 0x2862000
 12bb5ec: f9428c00     	ldr	x0, [x0, #0x518]
 12bb5f0: 97f8123a     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12bb5f4: f000ad20     	adrp	x0, 0x2862000
 12bb5f8: f941e800     	ldr	x0, [x0, #0x3d0]
 12bb5fc: 97f81237     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12bb600: f000ad00     	adrp	x0, 0x285e000
 12bb604: f9467c00     	ldr	x0, [x0, #0xcf8]
 12bb608: 97f81234     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12bb60c: 52800028     	mov	w8, #0x1                // =1
 12bb610: 3927aaa8     	strb	w8, [x21, #0x9ea]
 12bb614: aa1303e0     	mov	x0, x19
 12bb618: 940000df     	bl	0x12bb994 <__start_il2cpp+0x1141d0>
 12bb61c: 360002a0     	tbz	w0, #0x0, 0x12bb670 <__start_il2cpp+0x113eac>
 12bb620: f000ad08     	adrp	x8, 0x285e000
 12bb624: f9414d08     	ldr	x8, [x8, #0x298]
 12bb628: f9400100     	ldr	x0, [x8]
 12bb62c: b940e008     	ldr	w8, [x0, #0xe0]
 12bb630: 35000048     	cbnz	w8, 0x12bb638 <__start_il2cpp+0x113e74>
 12bb634: 97f8126b     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12bb638: aa1f03e0     	mov	x0, xzr
 12bb63c: 97fe7e6b     	bl	0x125afe8 <__start_il2cpp+0xb3824>
 12bb640: aa0003f5     	mov	x21, x0
 12bb644: aa1303e0     	mov	x0, x19
 12bb648: 97fffb4d     	bl	0x12ba37c <__start_il2cpp+0x112bb8>
 12bb64c: b4001a35     	cbz	x21, 0x12bb990 <__start_il2cpp+0x1141cc>
 12bb650: f94002a8     	ldr	x8, [x21]
 12bb654: aa0003e2     	mov	x2, x0
 12bb658: 52800021     	mov	w1, #0x1                // =1
 12bb65c: 528000a3     	mov	w3, #0x5                // =5
 12bb660: f9415509     	ldr	x9, [x8, #0x2a8]
 12bb664: f9415904     	ldr	x4, [x8, #0x2b0]
 12bb668: aa1503e0     	mov	x0, x21
 12bb66c: d63f0120     	blr	x9
 12bb670: f9400268     	ldr	x8, [x19]
 12bb674: f9001e74     	str	x20, [x19, #0x38]
 12bb678: b000ad55     	adrp	x21, 0x2864000
 12bb67c: 52800021     	mov	w1, #0x1                // =1
 12bb680: a9588909     	ldp	x9, x2, [x8, #0x188]
 12bb684: f940feb5     	ldr	x21, [x21, #0x1f8]
 12bb688: aa1303e0     	mov	x0, x19
 12bb68c: d63f0120     	blr	x9
 12bb690: f94002a0     	ldr	x0, [x21]
 12bb694: b940e008     	ldr	w8, [x0, #0xe0]
 12bb698: 35000068     	cbnz	w8, 0x12bb6a4 <__start_il2cpp+0x113ee0>
 12bb69c: 97f81251     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12bb6a0: f94002a0     	ldr	x0, [x21]
 12bb6a4: f9405c08     	ldr	x8, [x0, #0xb8]
 12bb6a8: f9400108     	ldr	x8, [x8]
 12bb6ac: b4000bc8     	cbz	x8, 0x12bb824 <__start_il2cpp+0x114060>
 12bb6b0: b940e009     	ldr	w9, [x0, #0xe0]
 12bb6b4: 350000c9     	cbnz	w9, 0x12bb6cc <__start_il2cpp+0x113f08>
 12bb6b8: 97f8124a     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12bb6bc: f94002a8     	ldr	x8, [x21]
 12bb6c0: f9405d08     	ldr	x8, [x8, #0xb8]
 12bb6c4: f9400108     	ldr	x8, [x8]
 12bb6c8: b4001648     	cbz	x8, 0x12bb990 <__start_il2cpp+0x1141cc>
 12bb6cc: f9401908     	ldr	x8, [x8, #0x30]
 12bb6d0: b4001608     	cbz	x8, 0x12bb990 <__start_il2cpp+0x1141cc>
 12bb6d4: f000ad34     	adrp	x20, 0x2862000
 12bb6d8: f941ea94     	ldr	x20, [x20, #0x3d0]
 12bb6dc: b9401116     	ldr	w22, [x8, #0x10]
 12bb6e0: f9400280     	ldr	x0, [x20]
 12bb6e4: b940e009     	ldr	w9, [x0, #0xe0]
 12bb6e8: 35000069     	cbnz	w9, 0x12bb6f4 <__start_il2cpp+0x113f30>
 12bb6ec: 97f8123d     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12bb6f0: f9400280     	ldr	x0, [x20]
 12bb6f4: f9405c08     	ldr	x8, [x0, #0xb8]
 12bb6f8: aa1f03e0     	mov	x0, xzr
 12bb6fc: f9400114     	ldr	x20, [x8]
 12bb700: 97ffab92     	bl	0x12a6548 <__start_il2cpp+0xfed84>
 12bb704: b4001460     	cbz	x0, 0x12bb990 <__start_il2cpp+0x1141cc>
 12bb708: aa1f03e1     	mov	x1, xzr
 12bb70c: 97ffabc0     	bl	0x12a660c <__start_il2cpp+0xfee48>
 12bb710: b4001414     	cbz	x20, 0x12bb990 <__start_il2cpp+0x1141cc>
 12bb714: 2a0003e1     	mov	w1, w0
 12bb718: aa1403e0     	mov	x0, x20
 12bb71c: aa1f03e2     	mov	x2, xzr
 12bb720: 97ff4dbc     	bl	0x128ee10 <__start_il2cpp+0xe764c>
 12bb724: 6b0002df     	cmp	w22, w0
 12bb728: 540007eb     	b.lt	0x12bb824 <__start_il2cpp+0x114060>
 12bb72c: f000ad16     	adrp	x22, 0x285e000
 12bb730: f9474ed6     	ldr	x22, [x22, #0xe98]
 12bb734: f94002c0     	ldr	x0, [x22]
 12bb738: b940e008     	ldr	w8, [x0, #0xe0]
 12bb73c: 35000048     	cbnz	w8, 0x12bb744 <__start_il2cpp+0x113f80>
 12bb740: 97f81228     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12bb744: aa1f03e0     	mov	x0, xzr
 12bb748: 942f2c06     	bl	0x1e86760 <__start_il2cpp+0xcdef9c>
 12bb74c: f94002a8     	ldr	x8, [x21]
 12bb750: aa0003f4     	mov	x20, x0
 12bb754: b940e109     	ldr	w9, [x8, #0xe0]
 12bb758: 35000089     	cbnz	w9, 0x12bb768 <__start_il2cpp+0x113fa4>
 12bb75c: aa0803e0     	mov	x0, x8
 12bb760: 97f81220     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12bb764: f94002a8     	ldr	x8, [x21]
 12bb768: f9405d08     	ldr	x8, [x8, #0xb8]
 12bb76c: f9400108     	ldr	x8, [x8]
 12bb770: b4001108     	cbz	x8, 0x12bb990 <__start_il2cpp+0x1141cc>
 12bb774: f9401908     	ldr	x8, [x8, #0x30]
 12bb778: b40010c8     	cbz	x8, 0x12bb990 <__start_il2cpp+0x1141cc>
 12bb77c: f9400d08     	ldr	x8, [x8, #0x18]
 12bb780: b4001088     	cbz	x8, 0x12bb990 <__start_il2cpp+0x1141cc>
 12bb784: f9400d01     	ldr	x1, [x8, #0x18]
 12bb788: aa1403e0     	mov	x0, x20
 12bb78c: aa1f03e2     	mov	x2, xzr
 12bb790: 942f329f     	bl	0x1e8820c <__start_il2cpp+0xce0a48>
 12bb794: 36000480     	tbz	w0, #0x0, 0x12bb824 <__start_il2cpp+0x114060>
 12bb798: f94002c0     	ldr	x0, [x22]
 12bb79c: b940e008     	ldr	w8, [x0, #0xe0]
 12bb7a0: 35000048     	cbnz	w8, 0x12bb7a8 <__start_il2cpp+0x113fe4>
 12bb7a4: 97f8120f     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12bb7a8: aa1f03e0     	mov	x0, xzr
 12bb7ac: 942f2bed     	bl	0x1e86760 <__start_il2cpp+0xcdef9c>
 12bb7b0: f94002a8     	ldr	x8, [x21]
 12bb7b4: aa0003f4     	mov	x20, x0
 12bb7b8: b940e109     	ldr	w9, [x8, #0xe0]
 12bb7bc: 35000089     	cbnz	w9, 0x12bb7cc <__start_il2cpp+0x114008>
 12bb7c0: aa0803e0     	mov	x0, x8
 12bb7c4: 97f81207     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12bb7c8: f94002a8     	ldr	x8, [x21]
 12bb7cc: f9405d08     	ldr	x8, [x8, #0xb8]
 12bb7d0: f9400108     	ldr	x8, [x8]
 12bb7d4: b4000de8     	cbz	x8, 0x12bb990 <__start_il2cpp+0x1141cc>
 12bb7d8: f9401908     	ldr	x8, [x8, #0x30]
 12bb7dc: b4000da8     	cbz	x8, 0x12bb990 <__start_il2cpp+0x1141cc>
 12bb7e0: f9400d08     	ldr	x8, [x8, #0x18]
 12bb7e4: b4000d68     	cbz	x8, 0x12bb990 <__start_il2cpp+0x1141cc>
 12bb7e8: f9401101     	ldr	x1, [x8, #0x20]
 12bb7ec: aa1403e0     	mov	x0, x20
 12bb7f0: aa1f03e2     	mov	x2, xzr
 12bb7f4: 942f3250     	bl	0x1e88134 <__start_il2cpp+0xce0970>
 12bb7f8: 36000160     	tbz	w0, #0x0, 0x12bb824 <__start_il2cpp+0x114060>
 12bb7fc: f940b260     	ldr	x0, [x19, #0x160]
 12bb800: b4000c80     	cbz	x0, 0x12bb990 <__start_il2cpp+0x1141cc>
 12bb804: 52800021     	mov	w1, #0x1                // =1
 12bb808: aa1f03e2     	mov	x2, xzr
 12bb80c: 9447f4eb     	bl	0x24b8bb8 <__start_il2cpp+0x13113f4>
 12bb810: b9415a61     	ldr	w1, [x19, #0x158]
 12bb814: bd415e60     	ldr	s0, [x19, #0x15c]
 12bb818: aa1303e0     	mov	x0, x19
 12bb81c: 94000082     	bl	0x12bba24 <__start_il2cpp+0x114260>
 12bb820: 1400000e     	b	0x12bb858 <__start_il2cpp+0x114094>
 12bb824: f940b260     	ldr	x0, [x19, #0x160]
 12bb828: b4000b40     	cbz	x0, 0x12bb990 <__start_il2cpp+0x1141cc>
 12bb82c: 2a1f03e1     	mov	w1, wzr
 12bb830: aa1f03e2     	mov	x2, xzr
 12bb834: 9447f4e1     	bl	0x24b8bb8 <__start_il2cpp+0x13113f4>
 12bb838: f9406a60     	ldr	x0, [x19, #0xd0]
 12bb83c: b4000aa0     	cbz	x0, 0x12bb990 <__start_il2cpp+0x1141cc>
 12bb840: aa1f03e1     	mov	x1, xzr
 12bb844: 9447f5d9     	bl	0x24b8fa8 <__start_il2cpp+0x13117e4>
 12bb848: b4000a40     	cbz	x0, 0x12bb990 <__start_il2cpp+0x1141cc>
 12bb84c: 2a1f03e1     	mov	w1, wzr
 12bb850: aa1f03e2     	mov	x2, xzr
 12bb854: 9447f4d9     	bl	0x24b8bb8 <__start_il2cpp+0x13113f4>
 12bb858: 3944c668     	ldrb	w8, [x19, #0x131]
 12bb85c: 34000668     	cbz	w8, 0x12bb928 <__start_il2cpp+0x114164>
 12bb860: f9403e60     	ldr	x0, [x19, #0x78]
 12bb864: b4000960     	cbz	x0, 0x12bb990 <__start_il2cpp+0x1141cc>
 12bb868: f000ad08     	adrp	x8, 0x285e000
 12bb86c: f9467d08     	ldr	x8, [x8, #0xcf8]
 12bb870: aa1f03e1     	mov	x1, xzr
 12bb874: f9400108     	ldr	x8, [x8]
 12bb878: f9405d08     	ldr	x8, [x8, #0xb8]
 12bb87c: bd40050b     	ldr	s11, [x8, #0x4]
 12bb880: bd400d0c     	ldr	s12, [x8, #0xc]
 12bb884: 9447f49e     	bl	0x24b8afc <__start_il2cpp+0x1311338>
 12bb888: b4000840     	cbz	x0, 0x12bb990 <__start_il2cpp+0x1141cc>
 12bb88c: aa1f03e1     	mov	x1, xzr
 12bb890: 94481943     	bl	0x24c1d9c <__start_il2cpp+0x131a5d8>
 12bb894: f9403e60     	ldr	x0, [x19, #0x78]
 12bb898: b40007c0     	cbz	x0, 0x12bb990 <__start_il2cpp+0x1141cc>
 12bb89c: aa1f03e1     	mov	x1, xzr
 12bb8a0: 4ea01c08     	mov	v8.16b, v0.16b
 12bb8a4: 4ea11c2a     	mov	v10.16b, v1.16b
 12bb8a8: 4ea21c49     	mov	v9.16b, v2.16b
 12bb8ac: 9447f494     	bl	0x24b8afc <__start_il2cpp+0x1311338>
 12bb8b0: b4000700     	cbz	x0, 0x12bb990 <__start_il2cpp+0x1141cc>
 12bb8b4: 1e2c396b     	fsub	s11, s11, s12
 12bb8b8: 1e2a2961     	fadd	s1, s11, s10
 12bb8bc: 4ea81d00     	mov	v0.16b, v8.16b
 12bb8c0: 4ea91d22     	mov	v2.16b, v9.16b
 12bb8c4: aa1f03e1     	mov	x1, xzr
 12bb8c8: 94481958     	bl	0x24c1e28 <__start_il2cpp+0x131a664>
 12bb8cc: f9404260     	ldr	x0, [x19, #0x80]
 12bb8d0: b4000600     	cbz	x0, 0x12bb990 <__start_il2cpp+0x1141cc>
 12bb8d4: aa1f03e1     	mov	x1, xzr
 12bb8d8: 9447f489     	bl	0x24b8afc <__start_il2cpp+0x1311338>
 12bb8dc: b40005a0     	cbz	x0, 0x12bb990 <__start_il2cpp+0x1141cc>
 12bb8e0: aa1f03e1     	mov	x1, xzr
 12bb8e4: 9448192e     	bl	0x24c1d9c <__start_il2cpp+0x131a5d8>
 12bb8e8: f9404260     	ldr	x0, [x19, #0x80]
 12bb8ec: b4000520     	cbz	x0, 0x12bb990 <__start_il2cpp+0x1141cc>
 12bb8f0: aa1f03e1     	mov	x1, xzr
 12bb8f4: 4ea01c08     	mov	v8.16b, v0.16b
 12bb8f8: 4ea11c2a     	mov	v10.16b, v1.16b
 12bb8fc: 4ea21c49     	mov	v9.16b, v2.16b
 12bb900: 9447f47f     	bl	0x24b8afc <__start_il2cpp+0x1311338>
 12bb904: b4000460     	cbz	x0, 0x12bb990 <__start_il2cpp+0x1141cc>
 12bb908: 1e2c1000     	fmov	s0, #0.50000000
 12bb90c: 1e200960     	fmul	s0, s11, s0
 12bb910: 1e2a2801     	fadd	s1, s0, s10
 12bb914: 4ea81d00     	mov	v0.16b, v8.16b
 12bb918: 4ea91d22     	mov	v2.16b, v9.16b
 12bb91c: aa1f03e1     	mov	x1, xzr
 12bb920: 94481942     	bl	0x24c1e28 <__start_il2cpp+0x131a664>
 12bb924: 3904c67f     	strb	wzr, [x19, #0x131]
 12bb928: f000ad34     	adrp	x20, 0x2862000
 12bb92c: f9428e94     	ldr	x20, [x20, #0x518]
 12bb930: aa1303e0     	mov	x0, x19
 12bb934: 940000a4     	bl	0x12bbbc4 <__start_il2cpp+0x114400>
 12bb938: aa0003e1     	mov	x1, x0
 12bb93c: aa1303e0     	mov	x0, x19
 12bb940: aa1f03e2     	mov	x2, xzr
 12bb944: 9447f882     	bl	0x24b9b4c <__start_il2cpp+0x1312388>
 12bb948: f9400280     	ldr	x0, [x20]
 12bb94c: b940e008     	ldr	w8, [x0, #0xe0]
 12bb950: 35000068     	cbnz	w8, 0x12bb95c <__start_il2cpp+0x114198>
 12bb954: 97f811a3     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12bb958: f9400280     	ldr	x0, [x20]
 12bb95c: f9405c08     	ldr	x8, [x0, #0xb8]
 12bb960: f9400500     	ldr	x0, [x8, #0x8]
 12bb964: b4000160     	cbz	x0, 0x12bb990 <__start_il2cpp+0x1141cc>
 12bb968: a9444ff4     	ldp	x20, x19, [sp, #0x40]
 12bb96c: a94357f6     	ldp	x22, x21, [sp, #0x30]
 12bb970: f94017fe     	ldr	x30, [sp, #0x28]
 12bb974: 6d41a3e9     	ldp	d9, d8, [sp, #0x18]
 12bb978: 6d40abeb     	ldp	d11, d10, [sp, #0x8]
 12bb97c: 52800022     	mov	w2, #0x1                // =1
 12bb980: 2a1f03e1     	mov	w1, wzr
 12bb984: aa1f03e3     	mov	x3, xzr
 12bb988: fc4507ec     	ldr	d12, [sp], #0x50
 12bb98c: 1400e02d     	b	0x12f3a40 <__start_il2cpp+0x14c27c>
 12bb990: 97f811dc     	bl	0x10c0100 <CloseNLSocket+0x638>
