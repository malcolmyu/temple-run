
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 127176c: d103c3ff     	sub	sp, sp, #0xf0
 1271770: 6d053bef     	stp	d15, d14, [sp, #0x50]
 1271774: 6d0633ed     	stp	d13, d12, [sp, #0x60]
 1271778: 6d072beb     	stp	d11, d10, [sp, #0x70]
 127177c: 6d0823e9     	stp	d9, d8, [sp, #0x80]
 1271780: a9097bfd     	stp	x29, x30, [sp, #0x90]
 1271784: a90a6ffc     	stp	x28, x27, [sp, #0xa0]
 1271788: a90b67fa     	stp	x26, x25, [sp, #0xb0]
 127178c: a90c5ff8     	stp	x24, x23, [sp, #0xc0]
 1271790: a90d57f6     	stp	x22, x21, [sp, #0xd0]
 1271794: a90e4ff4     	stp	x20, x19, [sp, #0xe0]
 1271798: 9000be34     	adrp	x20, 0x2a35000
 127179c: 395d4e88     	ldrb	w8, [x20, #0x753]
 12717a0: aa0003f3     	mov	x19, x0
 12717a4: 37000368     	tbnz	w8, #0x0, 0x1271810 <__start_il2cpp+0xca04c>
 12717a8: b000af80     	adrp	x0, 0x2862000
 12717ac: f9423400     	ldr	x0, [x0, #0x468]
 12717b0: 97f939ca     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12717b4: b000af80     	adrp	x0, 0x2862000
 12717b8: f9423800     	ldr	x0, [x0, #0x470]
 12717bc: 97f939c7     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12717c0: b000af80     	adrp	x0, 0x2862000
 12717c4: f9423c00     	ldr	x0, [x0, #0x478]
 12717c8: 97f939c4     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12717cc: b000af80     	adrp	x0, 0x2862000
 12717d0: f9424400     	ldr	x0, [x0, #0x488]
 12717d4: 97f939c1     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12717d8: b000af80     	adrp	x0, 0x2862000
 12717dc: f9438c00     	ldr	x0, [x0, #0x718]
 12717e0: 97f939be     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12717e4: b000af80     	adrp	x0, 0x2862000
 12717e8: f9439000     	ldr	x0, [x0, #0x720]
 12717ec: 97f939bb     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12717f0: b000af80     	adrp	x0, 0x2862000
 12717f4: f9439400     	ldr	x0, [x0, #0x728]
 12717f8: 97f939b8     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12717fc: f000af40     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1271800: f9456000     	ldr	x0, [x0, #0xac0]
 1271804: 97f939b5     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1271808: 52800028     	mov	w8, #0x1                // =1
 127180c: 391d4e88     	strb	w8, [x20, #0x753]
 1271810: a9037fff     	stp	xzr, xzr, [sp, #0x30]
 1271814: f90023ff     	str	xzr, [sp, #0x40]
 1271818: f9410660     	ldr	x0, [x19, #0x208]
 127181c: b4003840     	cbz	x0, 0x1271f24 <__start_il2cpp+0xca760>
 1271820: b9401808     	ldr	w8, [x0, #0x18]
 1271824: 34003688     	cbz	w8, 0x1271ef4 <__start_il2cpp+0xca730>
 1271828: 7100111f     	cmp	w8, #0x4
 127182c: 5400046b     	b.lt	0x12718b8 <__start_il2cpp+0xca0f4>
 1271830: 39441a68     	ldrb	w8, [x19, #0x106]
 1271834: 35000428     	cbnz	w8, 0x12718b8 <__start_il2cpp+0xca0f4>
 1271838: b000af96     	adrp	x22, 0x2862000
 127183c: f000af57     	adrp	x23, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1271840: f94396d6     	ldr	x22, [x22, #0x728]
 1271844: f94562f7     	ldr	x23, [x23, #0xac0]
 1271848: 52800074     	mov	w20, #0x3               // =3
 127184c: f94002c2     	ldr	x2, [x22]
 1271850: 2a1403e1     	mov	w1, w20
 1271854: 941a223f     	bl	0x18fa150 <__start_il2cpp+0x75298c>
 1271858: b4003660     	cbz	x0, 0x1271f24 <__start_il2cpp+0xca760>
 127185c: aa1f03e1     	mov	x1, xzr
 1271860: 9449123a     	bl	0x24b6148 <__start_il2cpp+0x130e984>
 1271864: f94002e8     	ldr	x8, [x23]
 1271868: aa0003f5     	mov	x21, x0
 127186c: b940e109     	ldr	w9, [x8, #0xe0]
 1271870: 35000069     	cbnz	w9, 0x127187c <__start_il2cpp+0xca0b8>
 1271874: aa0803e0     	mov	x0, x8
 1271878: 97f939da     	bl	0x10bffe0 <CloseNLSocket+0x518>
 127187c: aa1503e0     	mov	x0, x21
 1271880: aa1f03e1     	mov	x1, xzr
 1271884: 94492cf0     	bl	0x24bcc44 <__start_il2cpp+0x1315480>
 1271888: f9410660     	ldr	x0, [x19, #0x208]
 127188c: b40034c0     	cbz	x0, 0x1271f24 <__start_il2cpp+0xca760>
 1271890: b9401808     	ldr	w8, [x0, #0x18]
 1271894: 11000694     	add	w20, w20, #0x1
 1271898: 6b08029f     	cmp	w20, w8
 127189c: 54fffd8b     	b.lt	0x127184c <__start_il2cpp+0xca088>
 12718a0: b000af89     	adrp	x9, 0x2862000
 12718a4: f9438d29     	ldr	x9, [x9, #0x718]
 12718a8: 51000d02     	sub	w2, w8, #0x3
 12718ac: 52800061     	mov	w1, #0x3                // =3
 12718b0: f9400123     	ldr	x3, [x9]
 12718b4: 941a28e9     	bl	0x18fbc58 <__start_il2cpp+0x754494>
 12718b8: f9403a68     	ldr	x8, [x19, #0x70]
 12718bc: b4003348     	cbz	x8, 0x1271f24 <__start_il2cpp+0xca760>
 12718c0: bd411d00     	ldr	s0, [x8, #0x11c]
 12718c4: 1e249001     	fmov	s1, #10.00000000
 12718c8: 52a84709     	mov	w9, #0x42380000         // =1110966272
 12718cc: 1e270123     	fmov	s3, w9
 12718d0: 1e211800     	fdiv	s0, s0, s1
 12718d4: 1e36f002     	fmov	s2, #-23.00000000
 12718d8: 1e230800     	fmul	s0, s0, s3
 12718dc: 1e222801     	fadd	s1, s0, s2
 12718e0: 1e24f000     	fmov	s0, #11.50000000
 12718e4: 1e202020     	fcmp	s1, s0
 12718e8: 540000e4     	b.mi	0x1271904 <__start_il2cpp+0xca140>
 12718ec: 1e273000     	fmov	s0, #25.00000000
 12718f0: 1e202020     	fcmp	s1, s0
 12718f4: 4ea11c20     	mov	v0.16b, v1.16b
 12718f8: 5400006d     	b.le	0x1271904 <__start_il2cpp+0xca140>
 12718fc: 52a852c9     	mov	w9, #0x42960000         // =1117126656
 1271900: 1e270120     	fmov	s0, w9
 1271904: 39440109     	ldrb	w9, [x8, #0x100]
 1271908: 34000169     	cbz	w9, 0x1271934 <__start_il2cpp+0xca170>
 127190c: f9402a69     	ldr	x9, [x19, #0x50]
 1271910: b40030a9     	cbz	x9, 0x1271f24 <__start_il2cpp+0xca760>
 1271914: 39433129     	ldrb	w9, [x9, #0xcc]
 1271918: 340000e9     	cbz	w9, 0x1271934 <__start_il2cpp+0xca170>
 127191c: 52a852c9     	mov	w9, #0x42960000         // =1117126656
 1271920: 52a88f4a     	mov	w10, #0x447a0000        // =1148846080
 1271924: 1e270121     	fmov	s1, w9
 1271928: 1e212808     	fadd	s8, s0, s1
 127192c: 1e270149     	fmov	s9, w10
 1271930: 1400000a     	b	0x1271958 <__start_il2cpp+0xca194>
 1271934: f9403e69     	ldr	x9, [x19, #0x78]
 1271938: b4002f69     	cbz	x9, 0x1271f24 <__start_il2cpp+0xca760>
 127193c: 39408129     	ldrb	w9, [x9, #0x20]
 1271940: 1e249001     	fmov	s1, #10.00000000
 1271944: 1e212801     	fadd	s1, s0, s1
 1271948: 7100013f     	cmp	w9, #0x0
 127194c: 52a85909     	mov	w9, #0x42c80000         // =1120403456
 1271950: 1e210c08     	fcsel	s8, s0, s1, eq
 1271954: 1e270129     	fmov	s9, w9
 1271958: 39436109     	ldrb	w9, [x8, #0xd8]
 127195c: 340000a9     	cbz	w9, 0x1271970 <__start_il2cpp+0xca1ac>
 1271960: b940e108     	ldr	w8, [x8, #0xe0]
 1271964: 1e2703e0     	fmov	s0, wzr
 1271968: 7100191f     	cmp	w8, #0x6
 127196c: 1e280c08     	fcsel	s8, s0, s8, eq
 1271970: bd421a6a     	ldr	s10, [x19, #0x218]
 1271974: aa1f03e0     	mov	x0, xzr
 1271978: 1e2a390b     	fsub	s11, s8, s10
 127197c: 944936b5     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 1271980: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1271984: 1e202168     	fcmp	s11, #0.0
 1271988: 1e214001     	fneg	s1, s0
 127198c: 1e270103     	fmov	s3, w8
 1271990: 1e294c63     	fcsel	s3, s3, s9, mi
 1271994: 1e204c20     	fcsel	s0, s1, s0, mi
 1271998: bd421a64     	ldr	s4, [x19, #0x218]
 127199c: 1e230800     	fmul	s0, s0, s3
 12719a0: 7eaad502     	fabd	s2, s8, s10
 12719a4: 1e20c001     	fabs	s1, s0
 12719a8: f9410660     	ldr	x0, [x19, #0x208]
 12719ac: 1e222020     	fcmp	s1, s2
 12719b0: 1e20cd60     	fcsel	s0, s11, s0, gt
 12719b4: 1e202880     	fadd	s0, s4, s0
 12719b8: bd021a60     	str	s0, [x19, #0x218]
 12719bc: b4002b40     	cbz	x0, 0x1271f24 <__start_il2cpp+0xca760>
 12719c0: b000af88     	adrp	x8, 0x2862000
 12719c4: f9424508     	ldr	x8, [x8, #0x488]
 12719c8: b000af99     	adrp	x25, 0x2862000
 12719cc: f9400101     	ldr	x1, [x8]
 12719d0: f9423b39     	ldr	x25, [x25, #0x470]
 12719d4: 910063e8     	add	x8, sp, #0x18
 12719d8: 941a254a     	bl	0x18faf00 <__start_il2cpp+0x75373c>
 12719dc: d0ffa129     	adrp	x9, 0x697000
 12719e0: 3cc183e0     	ldur	q0, [sp, #0x18]
 12719e4: f94017e8     	ldr	x8, [sp, #0x28]
 12719e8: b000af74     	adrp	x20, 0x285e000
 12719ec: bd45cd21     	ldr	s1, [x9, #0x5cc]
 12719f0: f9417a94     	ldr	x20, [x20, #0x2f0]
 12719f4: d0ffa23a     	adrp	x26, 0x6b7000
 12719f8: d0ffa23b     	adrp	x27, 0x6b7000
 12719fc: 1280001c     	mov	w28, #-0x1              // =-1
 1271a00: 9122f35a     	add	x26, x26, #0x8bc
 1271a04: 9123637b     	add	x27, x27, #0x8d8
 1271a08: 5280003d     	mov	w29, #0x1               // =1
 1271a0c: bd000fe1     	str	s1, [sp, #0xc]
 1271a10: 3d800fe0     	str	q0, [sp, #0x30]
 1271a14: f90023e8     	str	x8, [sp, #0x40]
 1271a18: 52a85918     	mov	w24, #0x42c80000        // =1120403456
 1271a1c: f9400321     	ldr	x1, [x25]
 1271a20: 2a1c03f5     	mov	w21, w28
 1271a24: 9100c3e0     	add	x0, sp, #0x30
 1271a28: 94120324     	bl	0x16f26b8 <__start_il2cpp+0x54aef4>
 1271a2c: 360025a0     	tbz	w0, #0x0, 0x1271ee0 <__start_il2cpp+0xca71c>
 1271a30: f9403a68     	ldr	x8, [x19, #0x70]
 1271a34: b40027a8     	cbz	x8, 0x1271f28 <__start_il2cpp+0xca764>
 1271a38: f94023f6     	ldr	x22, [sp, #0x40]
 1271a3c: b4002796     	cbz	x22, 0x1271f2c <__start_il2cpp+0xca768>
 1271a40: bd413500     	ldr	s0, [x8, #0x134]
 1271a44: 110006bc     	add	w28, w21, #0x1
 1271a48: bd008ac0     	str	s0, [x22, #0x88]
 1271a4c: 3943c108     	ldrb	w8, [x8, #0xf0]
 1271a50: 35fffe68     	cbnz	w8, 0x1271a1c <__start_il2cpp+0xca258>
 1271a54: aa1603e0     	mov	x0, x22
 1271a58: aa1f03e1     	mov	x1, xzr
 1271a5c: 944911ac     	bl	0x24b610c <__start_il2cpp+0x130e948>
 1271a60: aa0003f7     	mov	x23, x0
 1271a64: f9403a60     	ldr	x0, [x19, #0x70]
 1271a68: b40027a0     	cbz	x0, 0x1271f5c <__start_il2cpp+0xca798>
 1271a6c: aa1f03e1     	mov	x1, xzr
 1271a70: 944911a7     	bl	0x24b610c <__start_il2cpp+0x130e948>
 1271a74: b4002720     	cbz	x0, 0x1271f58 <__start_il2cpp+0xca794>
 1271a78: aa1f03e1     	mov	x1, xzr
 1271a7c: 9449436e     	bl	0x24c2834 <__start_il2cpp+0x131b070>
 1271a80: b4002677     	cbz	x23, 0x1271f4c <__start_il2cpp+0xca788>
 1271a84: aa1703e0     	mov	x0, x23
 1271a88: aa1f03e1     	mov	x1, xzr
 1271a8c: 9449438c     	bl	0x24c28bc <__start_il2cpp+0x131b0f8>
 1271a90: f9403a60     	ldr	x0, [x19, #0x70]
 1271a94: b4002560     	cbz	x0, 0x1271f40 <__start_il2cpp+0xca77c>
 1271a98: aa1f03e1     	mov	x1, xzr
 1271a9c: 94009a0f     	bl	0x12982d8 <__start_il2cpp+0xf0b14>
 1271aa0: 52a85408     	mov	w8, #0x42a00000         // =1117782016
 1271aa4: 1e270101     	fmov	s1, w8
 1271aa8: 1e212000     	fcmp	s0, s1
 1271aac: 540000e4     	b.mi	0x1271ac8 <__start_il2cpp+0xca304>
 1271ab0: 1e270301     	fmov	s1, w24
 1271ab4: 1e212000     	fcmp	s0, s1
 1271ab8: 4ea01c01     	mov	v1.16b, v0.16b
 1271abc: 5400006d     	b.le	0x1271ac8 <__start_il2cpp+0xca304>
 1271ac0: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1271ac4: 1e270101     	fmov	s1, w8
 1271ac8: 1e2703ef     	fmov	s15, wzr
 1271acc: 71001abf     	cmp	w21, #0x6
 1271ad0: 1e2703e0     	fmov	s0, wzr
 1271ad4: bd0082c1     	str	s1, [x22, #0x80]
 1271ad8: 540000e8     	b.hi	0x1271af4 <__start_il2cpp+0xca330>
 1271adc: bc75db40     	ldr	s0, [x26, w21, sxtw #2]
 1271ae0: bc75db61     	ldr	s1, [x27, w21, sxtw #2]
 1271ae4: bd421662     	ldr	s2, [x19, #0x214]
 1271ae8: bd421263     	ldr	s3, [x19, #0x210]
 1271aec: 1e200840     	fmul	s0, s2, s0
 1271af0: 1e21086f     	fmul	s15, s3, s1
 1271af4: f9403a68     	ldr	x8, [x19, #0x70]
 1271af8: b40022e8     	cbz	x8, 0x1271f54 <__start_il2cpp+0xca790>
 1271afc: 39436109     	ldrb	w9, [x8, #0xd8]
 1271b00: bd0017e0     	str	s0, [sp, #0x14]
 1271b04: 340000c9     	cbz	w9, 0x1271b1c <__start_il2cpp+0xca358>
 1271b08: b940e108     	ldr	w8, [x8, #0xe0]
 1271b0c: 1e2a1000     	fmov	s0, #0.25000000
 1271b10: 1e2009e0     	fmul	s0, s15, s0
 1271b14: 7100191f     	cmp	w8, #0x6
 1271b18: 1e2f0c0f     	fcsel	s15, s0, s15, eq
 1271b1c: aa1603e0     	mov	x0, x22
 1271b20: aa1f03e1     	mov	x1, xzr
 1271b24: 9449117a     	bl	0x24b610c <__start_il2cpp+0x130e948>
 1271b28: b40021c0     	cbz	x0, 0x1271f60 <__start_il2cpp+0xca79c>
 1271b2c: aa1f03e1     	mov	x1, xzr
 1271b30: 944942d1     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 1271b34: bd0013e1     	str	s1, [sp, #0x10]
 1271b38: f9403a60     	ldr	x0, [x19, #0x70]
 1271b3c: b4002060     	cbz	x0, 0x1271f48 <__start_il2cpp+0xca784>
 1271b40: aa1f03e1     	mov	x1, xzr
 1271b44: 94491172     	bl	0x24b610c <__start_il2cpp+0x130e948>
 1271b48: b4001fa0     	cbz	x0, 0x1271f3c <__start_il2cpp+0xca778>
 1271b4c: aa1f03e1     	mov	x1, xzr
 1271b50: 944942c9     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 1271b54: f9403a60     	ldr	x0, [x19, #0x70]
 1271b58: b4001f00     	cbz	x0, 0x1271f38 <__start_il2cpp+0xca774>
 1271b5c: 3943c008     	ldrb	w8, [x0, #0xf0]
 1271b60: 4ea01c0a     	mov	v10.16b, v0.16b
 1271b64: 4ea11c29     	mov	v9.16b, v1.16b
 1271b68: 4ea21c4b     	mov	v11.16b, v2.16b
 1271b6c: 340005e8     	cbz	w8, 0x1271c28 <__start_il2cpp+0xca464>
 1271b70: aa1603e0     	mov	x0, x22
 1271b74: aa1f03e1     	mov	x1, xzr
 1271b78: 94491165     	bl	0x24b610c <__start_il2cpp+0x130e948>
 1271b7c: aa0003f7     	mov	x23, x0
 1271b80: f9403a60     	ldr	x0, [x19, #0x70]
 1271b84: b4001e60     	cbz	x0, 0x1271f50 <__start_il2cpp+0xca78c>
 1271b88: aa1f03e1     	mov	x1, xzr
 1271b8c: 94491160     	bl	0x24b610c <__start_il2cpp+0x130e948>
 1271b90: b4001d20     	cbz	x0, 0x1271f34 <__start_il2cpp+0xca770>
 1271b94: aa1f03e1     	mov	x1, xzr
 1271b98: 944943eb     	bl	0x24c2b44 <__start_il2cpp+0x131b380>
 1271b9c: f9403a60     	ldr	x0, [x19, #0x70]
 1271ba0: b4001d20     	cbz	x0, 0x1271f44 <__start_il2cpp+0xca780>
 1271ba4: bd421a68     	ldr	s8, [x19, #0x218]
 1271ba8: 4ea01c0c     	mov	v12.16b, v0.16b
 1271bac: 4ea11c2d     	mov	v13.16b, v1.16b
 1271bb0: 4ea21c4e     	mov	v14.16b, v2.16b
 1271bb4: aa1f03e1     	mov	x1, xzr
 1271bb8: 94491155     	bl	0x24b610c <__start_il2cpp+0x130e948>
 1271bbc: b4001ba0     	cbz	x0, 0x1271f30 <__start_il2cpp+0xca76c>
 1271bc0: aa1f03e1     	mov	x1, xzr
 1271bc4: 944943a2     	bl	0x24c2a4c <__start_il2cpp+0x131b288>
 1271bc8: b4001cf7     	cbz	x23, 0x1271f64 <__start_il2cpp+0xca7a0>
 1271bcc: bd4017e3     	ldr	s3, [sp, #0x14]
 1271bd0: 1e2209e2     	fmul	s2, s15, s2
 1271bd4: 1e2109e1     	fmul	s1, s15, s1
 1271bd8: 1e2009e0     	fmul	s0, s15, s0
 1271bdc: 1e282863     	fadd	s3, s3, s8
 1271be0: 1e230984     	fmul	s4, s12, s3
 1271be4: 1e2309a5     	fmul	s5, s13, s3
 1271be8: 1e2309c3     	fmul	s3, s14, s3
 1271bec: 1e243944     	fsub	s4, s10, s4
 1271bf0: 1e253925     	fsub	s5, s9, s5
 1271bf4: 1e233963     	fsub	s3, s11, s3
 1271bf8: 1e222862     	fadd	s2, s3, s2
 1271bfc: 1e2128a1     	fadd	s1, s5, s1
 1271c00: 1e202880     	fadd	s0, s4, s0
 1271c04: aa1703e0     	mov	x0, x23
 1271c08: aa1f03e1     	mov	x1, xzr
 1271c0c: 944942c2     	bl	0x24c2714 <__start_il2cpp+0x131af50>
 1271c10: bd4013e0     	ldr	s0, [sp, #0x10]
 1271c14: aa1603e0     	mov	x0, x22
 1271c18: aa1f03e1     	mov	x1, xzr
 1271c1c: 9401bbaf     	bl	0x12e0ad8 <__start_il2cpp+0x139314>
 1271c20: 390212dd     	strb	w29, [x22, #0x84]
 1271c24: 17ffff7e     	b	0x1271a1c <__start_il2cpp+0xca258>
 1271c28: 39436008     	ldrb	w8, [x0, #0xd8]
 1271c2c: 34000088     	cbz	w8, 0x1271c3c <__start_il2cpp+0xca478>
 1271c30: b940e008     	ldr	w8, [x0, #0xe0]
 1271c34: 7100191f     	cmp	w8, #0x6
 1271c38: 54fff9c0     	b.eq	0x1271b70 <__start_il2cpp+0xca3ac>
 1271c3c: aa1f03e1     	mov	x1, xzr
 1271c40: 94491133     	bl	0x24b610c <__start_il2cpp+0x130e948>
 1271c44: b4001960     	cbz	x0, 0x1271f70 <__start_il2cpp+0xca7ac>
 1271c48: aa1f03e1     	mov	x1, xzr
 1271c4c: 94494380     	bl	0x24c2a4c <__start_il2cpp+0x131b288>
 1271c50: f9403a60     	ldr	x0, [x19, #0x70]
 1271c54: b40018c0     	cbz	x0, 0x1271f6c <__start_il2cpp+0xca7a8>
 1271c58: 4ea01c0c     	mov	v12.16b, v0.16b
 1271c5c: aa1f03e1     	mov	x1, xzr
 1271c60: 9449112b     	bl	0x24b610c <__start_il2cpp+0x130e948>
 1271c64: b4001820     	cbz	x0, 0x1271f68 <__start_il2cpp+0xca7a4>
 1271c68: aa1f03e1     	mov	x1, xzr
 1271c6c: 94494378     	bl	0x24c2a4c <__start_il2cpp+0x131b288>
 1271c70: 9000be28     	adrp	x8, 0x2a35000
 1271c74: 39413d08     	ldrb	w8, [x8, #0x4f]
 1271c78: 4ea21c4d     	mov	v13.16b, v2.16b
 1271c7c: 350000a8     	cbnz	w8, 0x1271c90 <__start_il2cpp+0xca4cc>
 1271c80: aa1403e0     	mov	x0, x20
 1271c84: 97f93895     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1271c88: 9000be28     	adrp	x8, 0x2a35000
 1271c8c: 39013d1d     	strb	w29, [x8, #0x4f]
 1271c90: f9400280     	ldr	x0, [x20]
 1271c94: b940e008     	ldr	w8, [x0, #0xe0]
 1271c98: 35000048     	cbnz	w8, 0x1271ca0 <__start_il2cpp+0xca4dc>
 1271c9c: 97f938d1     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1271ca0: 1e2c0980     	fmul	s0, s12, s12
 1271ca4: 1e2d09a1     	fmul	s1, s13, s13
 1271ca8: 1e212800     	fadd	s0, s0, s1
 1271cac: bd400fe1     	ldr	s1, [sp, #0xc]
 1271cb0: 1e21c000     	fsqrt	s0, s0
 1271cb4: 1e212000     	fcmp	s0, s1
 1271cb8: 5400008d     	b.le	0x1271cc8 <__start_il2cpp+0xca504>
 1271cbc: 1e201981     	fdiv	s1, s12, s0
 1271cc0: 1e2019a0     	fdiv	s0, s13, s0
 1271cc4: 1400000e     	b	0x1271cfc <__start_il2cpp+0xca538>
 1271cc8: 9000be28     	adrp	x8, 0x2a35000
 1271ccc: 39413908     	ldrb	w8, [x8, #0x4e]
 1271cd0: 350000c8     	cbnz	w8, 0x1271ce8 <__start_il2cpp+0xca524>
 1271cd4: b000af60     	adrp	x0, 0x285e000
 1271cd8: f942b400     	ldr	x0, [x0, #0x568]
 1271cdc: 97f9387f     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1271ce0: 9000be28     	adrp	x8, 0x2a35000
 1271ce4: 3901391d     	strb	w29, [x8, #0x4e]
 1271ce8: b000af68     	adrp	x8, 0x285e000
 1271cec: f942b508     	ldr	x8, [x8, #0x568]
 1271cf0: f9400108     	ldr	x8, [x8]
 1271cf4: f9405d08     	ldr	x8, [x8, #0xb8]
 1271cf8: 2d400101     	ldp	s1, s0, [x8]
 1271cfc: f9403a60     	ldr	x0, [x19, #0x70]
 1271d00: 1e20c021     	fabs	s1, s1
 1271d04: 1e20c000     	fabs	s0, s0
 1271d08: 1e202020     	fcmp	s1, s0
 1271d0c: 5400076d     	b.le	0x1271df8 <__start_il2cpp+0xca634>
 1271d10: b40014a0     	cbz	x0, 0x1271fa4 <__start_il2cpp+0xca7e0>
 1271d14: aa1f03e1     	mov	x1, xzr
 1271d18: 944910fd     	bl	0x24b610c <__start_il2cpp+0x130e948>
 1271d1c: b4001300     	cbz	x0, 0x1271f7c <__start_il2cpp+0xca7b8>
 1271d20: aa1f03e1     	mov	x1, xzr
 1271d24: 94494254     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 1271d28: f9403a60     	ldr	x0, [x19, #0x70]
 1271d2c: b4001380     	cbz	x0, 0x1271f9c <__start_il2cpp+0xca7d8>
 1271d30: 4ea01c0a     	mov	v10.16b, v0.16b
 1271d34: aa1f03e1     	mov	x1, xzr
 1271d38: 944910f5     	bl	0x24b610c <__start_il2cpp+0x130e948>
 1271d3c: b40012e0     	cbz	x0, 0x1271f98 <__start_il2cpp+0xca7d4>
 1271d40: aa1f03e1     	mov	x1, xzr
 1271d44: 9449424c     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 1271d48: f9403a60     	ldr	x0, [x19, #0x70]
 1271d4c: b4001200     	cbz	x0, 0x1271f8c <__start_il2cpp+0xca7c8>
 1271d50: 4ea01c0d     	mov	v13.16b, v0.16b
 1271d54: aa1f03e1     	mov	x1, xzr
 1271d58: 944910ed     	bl	0x24b610c <__start_il2cpp+0x130e948>
 1271d5c: b4001120     	cbz	x0, 0x1271f80 <__start_il2cpp+0xca7bc>
 1271d60: aa1f03e1     	mov	x1, xzr
 1271d64: 94494244     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 1271d68: 1e202148     	fcmp	s10, #0.0
 1271d6c: 1e37d001     	fmov	s1, #-30.00000000
 1271d70: 1e27d002     	fmov	s2, #30.00000000
 1271d74: 1e21cc41     	fcsel	s1, s2, s1, gt
 1271d78: 52a84e08     	mov	w8, #0x42700000         // =1114636288
 1271d7c: 1e2d2821     	fadd	s1, s1, s13
 1271d80: 52911129     	mov	w9, #0x8889             // =34953
 1271d84: 4ea01c0c     	mov	v12.16b, v0.16b
 1271d88: 1e270100     	fmov	s0, w8
 1271d8c: 1e380028     	fcvtzs	w8, s1
 1271d90: 72b11109     	movk	w9, #0x8888, lsl #16
 1271d94: 9b297d09     	smull	x9, w8, w9
 1271d98: d360fd29     	lsr	x9, x9, #32
 1271d9c: 0b080128     	add	w8, w9, w8
 1271da0: 13057d09     	asr	w9, w8, #5
 1271da4: 0b487d28     	add	w8, w9, w8, lsr #31
 1271da8: f9403a60     	ldr	x0, [x19, #0x70]
 1271dac: 1e220102     	scvtf	s2, w8
 1271db0: 52aff008     	mov	w8, #0x7f800000         // =2139095040
 1271db4: 1e200840     	fmul	s0, s2, s0
 1271db8: 1e270102     	fmov	s2, w8
 1271dbc: 12a62008     	mov	w8, #-0x31000001        // =-822083585
 1271dc0: 1e222020     	fcmp	s1, s2
 1271dc4: 1e270101     	fmov	s1, w8
 1271dc8: 1e200c28     	fcsel	s8, s1, s0, eq
 1271dcc: b4000de0     	cbz	x0, 0x1271f88 <__start_il2cpp+0xca7c4>
 1271dd0: aa1f03e1     	mov	x1, xzr
 1271dd4: 944910ce     	bl	0x24b610c <__start_il2cpp+0x130e948>
 1271dd8: b4000e40     	cbz	x0, 0x1271fa0 <__start_il2cpp+0xca7dc>
 1271ddc: aa1f03e1     	mov	x1, xzr
 1271de0: 94494225     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 1271de4: 1e2c3901     	fsub	s1, s8, s12
 1271de8: 1e2c1002     	fmov	s2, #0.50000000
 1271dec: 1e220821     	fmul	s1, s1, s2
 1271df0: 1e20282a     	fadd	s10, s1, s0
 1271df4: 17ffff5f     	b	0x1271b70 <__start_il2cpp+0xca3ac>
 1271df8: b4000be0     	cbz	x0, 0x1271f74 <__start_il2cpp+0xca7b0>
 1271dfc: aa1f03e1     	mov	x1, xzr
 1271e00: 944910c3     	bl	0x24b610c <__start_il2cpp+0x130e948>
 1271e04: b4000c80     	cbz	x0, 0x1271f94 <__start_il2cpp+0xca7d0>
 1271e08: aa1f03e1     	mov	x1, xzr
 1271e0c: 9449421a     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 1271e10: f9403a60     	ldr	x0, [x19, #0x70]
 1271e14: b4000ca0     	cbz	x0, 0x1271fa8 <__start_il2cpp+0xca7e4>
 1271e18: 4ea21c4b     	mov	v11.16b, v2.16b
 1271e1c: aa1f03e1     	mov	x1, xzr
 1271e20: 944910bb     	bl	0x24b610c <__start_il2cpp+0x130e948>
 1271e24: b4000c60     	cbz	x0, 0x1271fb0 <__start_il2cpp+0xca7ec>
 1271e28: aa1f03e1     	mov	x1, xzr
 1271e2c: 94494212     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 1271e30: f9403a60     	ldr	x0, [x19, #0x70]
 1271e34: b4000a80     	cbz	x0, 0x1271f84 <__start_il2cpp+0xca7c0>
 1271e38: 4ea21c4d     	mov	v13.16b, v2.16b
 1271e3c: aa1f03e1     	mov	x1, xzr
 1271e40: 944910b3     	bl	0x24b610c <__start_il2cpp+0x130e948>
 1271e44: b4000b40     	cbz	x0, 0x1271fac <__start_il2cpp+0xca7e8>
 1271e48: aa1f03e1     	mov	x1, xzr
 1271e4c: 9449420a     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 1271e50: 4ea21c4c     	mov	v12.16b, v2.16b
 1271e54: 1e202168     	fcmp	s11, #0.0
 1271e58: 1e37d001     	fmov	s1, #-30.00000000
 1271e5c: 1e27d002     	fmov	s2, #30.00000000
 1271e60: 1e21cc41     	fcsel	s1, s2, s1, gt
 1271e64: 52a84e08     	mov	w8, #0x42700000         // =1114636288
 1271e68: 1e2d2821     	fadd	s1, s1, s13
 1271e6c: 52911129     	mov	w9, #0x8889             // =34953
 1271e70: 1e270100     	fmov	s0, w8
 1271e74: 1e380028     	fcvtzs	w8, s1
 1271e78: 72b11109     	movk	w9, #0x8888, lsl #16
 1271e7c: 9b297d09     	smull	x9, w8, w9
 1271e80: d360fd29     	lsr	x9, x9, #32
 1271e84: 0b080128     	add	w8, w9, w8
 1271e88: 13057d09     	asr	w9, w8, #5
 1271e8c: 0b487d28     	add	w8, w9, w8, lsr #31
 1271e90: f9403a60     	ldr	x0, [x19, #0x70]
 1271e94: 1e220102     	scvtf	s2, w8
 1271e98: 52aff008     	mov	w8, #0x7f800000         // =2139095040
 1271e9c: 1e200840     	fmul	s0, s2, s0
 1271ea0: 1e270102     	fmov	s2, w8
 1271ea4: 12a62008     	mov	w8, #-0x31000001        // =-822083585
 1271ea8: 1e222020     	fcmp	s1, s2
 1271eac: 1e270101     	fmov	s1, w8
 1271eb0: 1e200c28     	fcsel	s8, s1, s0, eq
 1271eb4: b40006e0     	cbz	x0, 0x1271f90 <__start_il2cpp+0xca7cc>
 1271eb8: aa1f03e1     	mov	x1, xzr
 1271ebc: 94491094     	bl	0x24b610c <__start_il2cpp+0x130e948>
 1271ec0: b40005c0     	cbz	x0, 0x1271f78 <__start_il2cpp+0xca7b4>
 1271ec4: aa1f03e1     	mov	x1, xzr
 1271ec8: 944941eb     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 1271ecc: 1e2c3900     	fsub	s0, s8, s12
 1271ed0: 1e2c1001     	fmov	s1, #0.50000000
 1271ed4: 1e210800     	fmul	s0, s0, s1
 1271ed8: 1e22280b     	fadd	s11, s0, s2
 1271edc: 17ffff25     	b	0x1271b70 <__start_il2cpp+0xca3ac>
 1271ee0: b000af88     	adrp	x8, 0x2862000
 1271ee4: f9423508     	ldr	x8, [x8, #0x468]
 1271ee8: 9100c3e0     	add	x0, sp, #0x30
 1271eec: f9400101     	ldr	x1, [x8]
 1271ef0: 941201f1     	bl	0x16f26b4 <__start_il2cpp+0x54aef0>
 1271ef4: a94e4ff4     	ldp	x20, x19, [sp, #0xe0]
 1271ef8: a94d57f6     	ldp	x22, x21, [sp, #0xd0]
 1271efc: a94c5ff8     	ldp	x24, x23, [sp, #0xc0]
 1271f00: a94b67fa     	ldp	x26, x25, [sp, #0xb0]
 1271f04: a94a6ffc     	ldp	x28, x27, [sp, #0xa0]
 1271f08: a9497bfd     	ldp	x29, x30, [sp, #0x90]
 1271f0c: 6d4823e9     	ldp	d9, d8, [sp, #0x80]
 1271f10: 6d472beb     	ldp	d11, d10, [sp, #0x70]
 1271f14: 6d4633ed     	ldp	d13, d12, [sp, #0x60]
 1271f18: 6d453bef     	ldp	d15, d14, [sp, #0x50]
 1271f1c: 9103c3ff     	add	sp, sp, #0xf0
 1271f20: d65f03c0     	ret
 1271f24: 97f93877     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271f28: 97f93876     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271f2c: 97f93875     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271f30: 97f93874     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271f34: 97f93873     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271f38: 97f93872     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271f3c: 97f93871     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271f40: 97f93870     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271f44: 97f9386f     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271f48: 97f9386e     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271f4c: 97f9386d     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271f50: 97f9386c     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271f54: 97f9386b     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271f58: 97f9386a     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271f5c: 97f93869     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271f60: 97f93868     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271f64: 97f93867     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271f68: 97f93866     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271f6c: 97f93865     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271f70: 97f93864     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271f74: 97f93863     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271f78: 97f93862     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271f7c: 97f93861     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271f80: 97f93860     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271f84: 97f9385f     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271f88: 97f9385e     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271f8c: 97f9385d     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271f90: 97f9385c     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271f94: 97f9385b     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271f98: 97f9385a     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271f9c: 97f93859     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271fa0: 97f93858     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271fa4: 97f93857     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271fa8: 97f93856     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271fac: 97f93855     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271fb0: 97f93854     	bl	0x10c0100 <CloseNLSocket+0x638>
 1271fb4: 14000048     	b	0x12720d4 <__start_il2cpp+0xca910>
 1271fb8: 14000047     	b	0x12720d4 <__start_il2cpp+0xca910>
 1271fbc: 14000046     	b	0x12720d4 <__start_il2cpp+0xca910>
 1271fc0: 14000045     	b	0x12720d4 <__start_il2cpp+0xca910>
 1271fc4: 14000044     	b	0x12720d4 <__start_il2cpp+0xca910>
 1271fc8: 14000043     	b	0x12720d4 <__start_il2cpp+0xca910>
 1271fcc: 14000042     	b	0x12720d4 <__start_il2cpp+0xca910>
 1271fd0: 14000041     	b	0x12720d4 <__start_il2cpp+0xca910>
 1271fd4: 14000040     	b	0x12720d4 <__start_il2cpp+0xca910>
 1271fd8: 1400003f     	b	0x12720d4 <__start_il2cpp+0xca910>
 1271fdc: 1400003e     	b	0x12720d4 <__start_il2cpp+0xca910>
 1271fe0: 1400003d     	b	0x12720d4 <__start_il2cpp+0xca910>
 1271fe4: 1400003c     	b	0x12720d4 <__start_il2cpp+0xca910>
 1271fe8: 1400003b     	b	0x12720d4 <__start_il2cpp+0xca910>
 1271fec: 1400003a     	b	0x12720d4 <__start_il2cpp+0xca910>
 1271ff0: 14000039     	b	0x12720d4 <__start_il2cpp+0xca910>
 1271ff4: 14000038     	b	0x12720d4 <__start_il2cpp+0xca910>
 1271ff8: 14000037     	b	0x12720d4 <__start_il2cpp+0xca910>
 1271ffc: 14000036     	b	0x12720d4 <__start_il2cpp+0xca910>
 1272000: 14000035     	b	0x12720d4 <__start_il2cpp+0xca910>
 1272004: 14000034     	b	0x12720d4 <__start_il2cpp+0xca910>
 1272008: 14000033     	b	0x12720d4 <__start_il2cpp+0xca910>
 127200c: 14000032     	b	0x12720d4 <__start_il2cpp+0xca910>
 1272010: 14000031     	b	0x12720d4 <__start_il2cpp+0xca910>
 1272014: 14000030     	b	0x12720d4 <__start_il2cpp+0xca910>
 1272018: 1400002f     	b	0x12720d4 <__start_il2cpp+0xca910>
 127201c: 1400002e     	b	0x12720d4 <__start_il2cpp+0xca910>
 1272020: 1400002d     	b	0x12720d4 <__start_il2cpp+0xca910>
 1272024: 1400002c     	b	0x12720d4 <__start_il2cpp+0xca910>
 1272028: 1400002b     	b	0x12720d4 <__start_il2cpp+0xca910>
 127202c: 1400002a     	b	0x12720d4 <__start_il2cpp+0xca910>
 1272030: 14000029     	b	0x12720d4 <__start_il2cpp+0xca910>
 1272034: 14000028     	b	0x12720d4 <__start_il2cpp+0xca910>
 1272038: 14000027     	b	0x12720d4 <__start_il2cpp+0xca910>
 127203c: 14000026     	b	0x12720d4 <__start_il2cpp+0xca910>
 1272040: 14000025     	b	0x12720d4 <__start_il2cpp+0xca910>
 1272044: 14000024     	b	0x12720d4 <__start_il2cpp+0xca910>
 1272048: 14000023     	b	0x12720d4 <__start_il2cpp+0xca910>
 127204c: 14000022     	b	0x12720d4 <__start_il2cpp+0xca910>
 1272050: 14000021     	b	0x12720d4 <__start_il2cpp+0xca910>
 1272054: 14000020     	b	0x12720d4 <__start_il2cpp+0xca910>
 1272058: 1400001f     	b	0x12720d4 <__start_il2cpp+0xca910>
 127205c: 1400001e     	b	0x12720d4 <__start_il2cpp+0xca910>
 1272060: 1400001d     	b	0x12720d4 <__start_il2cpp+0xca910>
 1272064: 1400001c     	b	0x12720d4 <__start_il2cpp+0xca910>
 1272068: 1400001b     	b	0x12720d4 <__start_il2cpp+0xca910>
 127206c: 1400001a     	b	0x12720d4 <__start_il2cpp+0xca910>
 1272070: 14000019     	b	0x12720d4 <__start_il2cpp+0xca910>
 1272074: 14000018     	b	0x12720d4 <__start_il2cpp+0xca910>
 1272078: 14000017     	b	0x12720d4 <__start_il2cpp+0xca910>
 127207c: 14000016     	b	0x12720d4 <__start_il2cpp+0xca910>
 1272080: 14000015     	b	0x12720d4 <__start_il2cpp+0xca910>
 1272084: 14000014     	b	0x12720d4 <__start_il2cpp+0xca910>
 1272088: 14000013     	b	0x12720d4 <__start_il2cpp+0xca910>
 127208c: 14000012     	b	0x12720d4 <__start_il2cpp+0xca910>
 1272090: 14000011     	b	0x12720d4 <__start_il2cpp+0xca910>
 1272094: 14000010     	b	0x12720d4 <__start_il2cpp+0xca910>
 1272098: 1400000f     	b	0x12720d4 <__start_il2cpp+0xca910>
 127209c: 1400000e     	b	0x12720d4 <__start_il2cpp+0xca910>
 12720a0: 1400000d     	b	0x12720d4 <__start_il2cpp+0xca910>
 12720a4: 1400000c     	b	0x12720d4 <__start_il2cpp+0xca910>
 12720a8: 1400000b     	b	0x12720d4 <__start_il2cpp+0xca910>
 12720ac: 1400000a     	b	0x12720d4 <__start_il2cpp+0xca910>
 12720b0: 14000009     	b	0x12720d4 <__start_il2cpp+0xca910>
 12720b4: 14000008     	b	0x12720d4 <__start_il2cpp+0xca910>
 12720b8: 14000007     	b	0x12720d4 <__start_il2cpp+0xca910>
 12720bc: 14000006     	b	0x12720d4 <__start_il2cpp+0xca910>
 12720c0: 14000005     	b	0x12720d4 <__start_il2cpp+0xca910>
 12720c4: 14000004     	b	0x12720d4 <__start_il2cpp+0xca910>
 12720c8: 14000003     	b	0x12720d4 <__start_il2cpp+0xca910>
 12720cc: 14000002     	b	0x12720d4 <__start_il2cpp+0xca910>
 12720d0: 14000001     	b	0x12720d4 <__start_il2cpp+0xca910>
 12720d4: aa0003f3     	mov	x19, x0
 12720d8: 7100043f     	cmp	w1, #0x1
 12720dc: 540001a1     	b.ne	0x1272110 <__start_il2cpp+0xca94c>
 12720e0: aa1303e0     	mov	x0, x19
 12720e4: 94525703     	bl	0x2707cf0 <__cxa_begin_catch@plt>
 12720e8: f9400014     	ldr	x20, [x0]
 12720ec: 94525705     	bl	0x2707d00 <__cxa_end_catch@plt>
 12720f0: 9000af88     	adrp	x8, 0x2862000
 12720f4: f9423508     	ldr	x8, [x8, #0x468]
 12720f8: 9100c3e0     	add	x0, sp, #0x30
 12720fc: f9400101     	ldr	x1, [x8]
 1272100: 9412016d     	bl	0x16f26b4 <__start_il2cpp+0x54aef0>
 1272104: b4ffef94     	cbz	x20, 0x1271ef4 <__start_il2cpp+0xca730>
 1272108: aa1403e0     	mov	x0, x20
 127210c: 97f937fb     	bl	0x10c00f8 <CloseNLSocket+0x630>
 1272110: aa1f03f4     	mov	x20, xzr
 1272114: 14000002     	b	0x127211c <__start_il2cpp+0xca958>
 1272118: aa0003f3     	mov	x19, x0
 127211c: 9000af88     	adrp	x8, 0x2862000
 1272120: f9423508     	ldr	x8, [x8, #0x468]
 1272124: f9400101     	ldr	x1, [x8]
 1272128: 9100c3e0     	add	x0, sp, #0x30
 127212c: 94120162     	bl	0x16f26b4 <__start_il2cpp+0x54aef0>
 1272130: b5000074     	cbnz	x20, 0x127213c <__start_il2cpp+0xca978>
 1272134: aa1303e0     	mov	x0, x19
 1272138: 97fcc571     	bl	0x11a36fc <__emutls_get_address+0x4b8>
 127213c: aa1403e0     	mov	x0, x20
 1272140: 97f937ee     	bl	0x10c00f8 <CloseNLSocket+0x630>
 1272144: 97f363ec     	bl	0xf4b0f4 <.text+0x178>
