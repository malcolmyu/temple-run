
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 126fcf4: d10283ff     	sub	sp, sp, #0xa0
 126fcf8: 6d042beb     	stp	d11, d10, [sp, #0x40]
 126fcfc: 6d0523e9     	stp	d9, d8, [sp, #0x50]
 126fd00: f90033fe     	str	x30, [sp, #0x60]
 126fd04: a9075ff8     	stp	x24, x23, [sp, #0x70]
 126fd08: a90857f6     	stp	x22, x21, [sp, #0x80]
 126fd0c: a9094ff4     	stp	x20, x19, [sp, #0x90]
 126fd10: d000be34     	adrp	x20, 0x2a35000
 126fd14: 395d1e88     	ldrb	w8, [x20, #0x747]
 126fd18: aa0003f3     	mov	x19, x0
 126fd1c: 370001e8     	tbnz	w8, #0x0, 0x126fd58 <__start_il2cpp+0xc8594>
 126fd20: f000af80     	adrp	x0, 0x2862000
 126fd24: f9423400     	ldr	x0, [x0, #0x468]
 126fd28: 97f9406c     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126fd2c: f000af80     	adrp	x0, 0x2862000
 126fd30: f9423800     	ldr	x0, [x0, #0x470]
 126fd34: 97f94069     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126fd38: f000af80     	adrp	x0, 0x2862000
 126fd3c: f9423c00     	ldr	x0, [x0, #0x478]
 126fd40: 97f94066     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126fd44: f000af80     	adrp	x0, 0x2862000
 126fd48: f9424400     	ldr	x0, [x0, #0x488]
 126fd4c: 97f94063     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126fd50: 52800028     	mov	w8, #0x1                // =1
 126fd54: 391d1e88     	strb	w8, [x20, #0x747]
 126fd58: a9027fff     	stp	xzr, xzr, [sp, #0x20]
 126fd5c: f9001bff     	str	xzr, [sp, #0x30]
 126fd60: f9403e68     	ldr	x8, [x19, #0x78]
 126fd64: b4000b28     	cbz	x8, 0x126fec8 <__start_il2cpp+0xc8704>
 126fd68: 3940b108     	ldrb	w8, [x8, #0x2c]
 126fd6c: 34000988     	cbz	w8, 0x126fe9c <__start_il2cpp+0xc86d8>
 126fd70: f9403a60     	ldr	x0, [x19, #0x70]
 126fd74: b4000aa0     	cbz	x0, 0x126fec8 <__start_il2cpp+0xc8704>
 126fd78: 39436008     	ldrb	w8, [x0, #0xd8]
 126fd7c: 35000908     	cbnz	w8, 0x126fe9c <__start_il2cpp+0xc86d8>
 126fd80: 1e2703e0     	fmov	s0, wzr
 126fd84: aa1f03e1     	mov	x1, xzr
 126fd88: 94009f7e     	bl	0x1297b80 <__start_il2cpp+0xf03bc>
 126fd8c: 36000880     	tbz	w0, #0x0, 0x126fe9c <__start_il2cpp+0xc86d8>
 126fd90: f9410660     	ldr	x0, [x19, #0x208]
 126fd94: b40009a0     	cbz	x0, 0x126fec8 <__start_il2cpp+0xc8704>
 126fd98: f000af88     	adrp	x8, 0x2862000
 126fd9c: f9424508     	ldr	x8, [x8, #0x488]
 126fda0: f9400101     	ldr	x1, [x8]
 126fda4: 910023e8     	add	x8, sp, #0x8
 126fda8: 941a2c56     	bl	0x18faf00 <__start_il2cpp+0x75373c>
 126fdac: 3cc083e0     	ldur	q0, [sp, #0x8]
 126fdb0: f9400fe8     	ldr	x8, [sp, #0x18]
 126fdb4: f000af96     	adrp	x22, 0x2862000
 126fdb8: f000af74     	adrp	x20, 0x285e000
 126fdbc: f9423ad6     	ldr	x22, [x22, #0x470]
 126fdc0: f9417a94     	ldr	x20, [x20, #0x2f0]
 126fdc4: d000be37     	adrp	x23, 0x2a35000
 126fdc8: 3d800be0     	str	q0, [sp, #0x20]
 126fdcc: f9001be8     	str	x8, [sp, #0x30]
 126fdd0: 52800038     	mov	w24, #0x1               // =1
 126fdd4: f94002c1     	ldr	x1, [x22]
 126fdd8: 910083e0     	add	x0, sp, #0x20
 126fddc: 94120a37     	bl	0x16f26b8 <__start_il2cpp+0x54aef4>
 126fde0: 360004c0     	tbz	w0, #0x0, 0x126fe78 <__start_il2cpp+0xc86b4>
 126fde4: f9403a60     	ldr	x0, [x19, #0x70]
 126fde8: b40006c0     	cbz	x0, 0x126fec0 <__start_il2cpp+0xc86fc>
 126fdec: f9401bf5     	ldr	x21, [sp, #0x30]
 126fdf0: aa1f03e1     	mov	x1, xzr
 126fdf4: 9401c42a     	bl	0x12e0e9c <__start_il2cpp+0x1396d8>
 126fdf8: b4000675     	cbz	x21, 0x126fec4 <__start_il2cpp+0xc8700>
 126fdfc: 4ea01c08     	mov	v8.16b, v0.16b
 126fe00: 4ea11c29     	mov	v9.16b, v1.16b
 126fe04: aa1503e0     	mov	x0, x21
 126fe08: aa1f03e1     	mov	x1, xzr
 126fe0c: 9401c424     	bl	0x12e0e9c <__start_il2cpp+0x1396d8>
 126fe10: 395df6e8     	ldrb	w8, [x23, #0x77d]
 126fe14: 4ea01c0a     	mov	v10.16b, v0.16b
 126fe18: 4ea11c2b     	mov	v11.16b, v1.16b
 126fe1c: 35000088     	cbnz	w8, 0x126fe2c <__start_il2cpp+0xc8668>
 126fe20: aa1403e0     	mov	x0, x20
 126fe24: 97f9402d     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126fe28: 391df6f8     	strb	w24, [x23, #0x77d]
 126fe2c: f9400280     	ldr	x0, [x20]
 126fe30: b940e008     	ldr	w8, [x0, #0xe0]
 126fe34: 35000048     	cbnz	w8, 0x126fe3c <__start_il2cpp+0xc8678>
 126fe38: 97f9406a     	bl	0x10bffe0 <CloseNLSocket+0x518>
 126fe3c: f9403a60     	ldr	x0, [x19, #0x70]
 126fe40: b40003e0     	cbz	x0, 0x126febc <__start_il2cpp+0xc86f8>
 126fe44: aa1f03e1     	mov	x1, xzr
 126fe48: 9400a124     	bl	0x12982d8 <__start_il2cpp+0xf0b14>
 126fe4c: 1e2a3901     	fsub	s1, s8, s10
 126fe50: 1e2b3922     	fsub	s2, s9, s11
 126fe54: 1e210821     	fmul	s1, s1, s1
 126fe58: 1e220842     	fmul	s2, s2, s2
 126fe5c: 1e222821     	fadd	s1, s1, s2
 126fe60: 1e21c021     	fsqrt	s1, s1
 126fe64: 1e201820     	fdiv	s0, s1, s0
 126fe68: aa1503e0     	mov	x0, x21
 126fe6c: aa1f03e1     	mov	x1, xzr
 126fe70: 9400f8d1     	bl	0x12ae1b4 <__start_il2cpp+0x1069f0>
 126fe74: 17ffffd8     	b	0x126fdd4 <__start_il2cpp+0xc8610>
 126fe78: f000af88     	adrp	x8, 0x2862000
 126fe7c: f9423508     	ldr	x8, [x8, #0x468]
 126fe80: 910083e0     	add	x0, sp, #0x20
 126fe84: f9400101     	ldr	x1, [x8]
 126fe88: 94120a0b     	bl	0x16f26b4 <__start_il2cpp+0x54aef0>
 126fe8c: f9403e68     	ldr	x8, [x19, #0x78]
 126fe90: b40001c8     	cbz	x8, 0x126fec8 <__start_il2cpp+0xc8704>
 126fe94: 3900b11f     	strb	wzr, [x8, #0x2c]
 126fe98: b900311f     	str	wzr, [x8, #0x30]
 126fe9c: a9494ff4     	ldp	x20, x19, [sp, #0x90]
 126fea0: a94857f6     	ldp	x22, x21, [sp, #0x80]
 126fea4: a9475ff8     	ldp	x24, x23, [sp, #0x70]
 126fea8: f94033fe     	ldr	x30, [sp, #0x60]
 126feac: 6d4523e9     	ldp	d9, d8, [sp, #0x50]
 126feb0: 6d442beb     	ldp	d11, d10, [sp, #0x40]
 126feb4: 910283ff     	add	sp, sp, #0xa0
 126feb8: d65f03c0     	ret
 126febc: 97f94091     	bl	0x10c0100 <CloseNLSocket+0x638>
 126fec0: 97f94090     	bl	0x10c0100 <CloseNLSocket+0x638>
 126fec4: 97f9408f     	bl	0x10c0100 <CloseNLSocket+0x638>
 126fec8: 97f9408e     	bl	0x10c0100 <CloseNLSocket+0x638>
 126fecc: 14000008     	b	0x126feec <__start_il2cpp+0xc8728>
 126fed0: 14000007     	b	0x126feec <__start_il2cpp+0xc8728>
 126fed4: 14000006     	b	0x126feec <__start_il2cpp+0xc8728>
 126fed8: 14000005     	b	0x126feec <__start_il2cpp+0xc8728>
 126fedc: 14000004     	b	0x126feec <__start_il2cpp+0xc8728>
 126fee0: 14000003     	b	0x126feec <__start_il2cpp+0xc8728>
 126fee4: 14000002     	b	0x126feec <__start_il2cpp+0xc8728>
 126fee8: 14000001     	b	0x126feec <__start_il2cpp+0xc8728>
 126feec: aa0003f4     	mov	x20, x0
 126fef0: 7100043f     	cmp	w1, #0x1
 126fef4: 540001a1     	b.ne	0x126ff28 <__start_il2cpp+0xc8764>
 126fef8: aa1403e0     	mov	x0, x20
 126fefc: 94525f7d     	bl	0x2707cf0 <__cxa_begin_catch@plt>
 126ff00: f9400015     	ldr	x21, [x0]
 126ff04: 94525f7f     	bl	0x2707d00 <__cxa_end_catch@plt>
 126ff08: f000af88     	adrp	x8, 0x2862000
 126ff0c: f9423508     	ldr	x8, [x8, #0x468]
 126ff10: 910083e0     	add	x0, sp, #0x20
 126ff14: f9400101     	ldr	x1, [x8]
 126ff18: 941209e7     	bl	0x16f26b4 <__start_il2cpp+0x54aef0>
 126ff1c: b4fffb95     	cbz	x21, 0x126fe8c <__start_il2cpp+0xc86c8>
 126ff20: aa1503e0     	mov	x0, x21
 126ff24: 97f94075     	bl	0x10c00f8 <CloseNLSocket+0x630>
 126ff28: aa1f03f5     	mov	x21, xzr
 126ff2c: 14000002     	b	0x126ff34 <__start_il2cpp+0xc8770>
 126ff30: aa0003f4     	mov	x20, x0
 126ff34: f000af88     	adrp	x8, 0x2862000
 126ff38: f9423508     	ldr	x8, [x8, #0x468]
 126ff3c: f9400101     	ldr	x1, [x8]
 126ff40: 910083e0     	add	x0, sp, #0x20
 126ff44: 941209dc     	bl	0x16f26b4 <__start_il2cpp+0x54aef0>
 126ff48: b5000075     	cbnz	x21, 0x126ff54 <__start_il2cpp+0xc8790>
 126ff4c: aa1403e0     	mov	x0, x20
 126ff50: 97fccdeb     	bl	0x11a36fc <__emutls_get_address+0x4b8>
 126ff54: aa1503e0     	mov	x0, x21
 126ff58: 97f94068     	bl	0x10c00f8 <CloseNLSocket+0x630>
 126ff5c: 97f36c66     	bl	0xf4b0f4 <.text+0x178>
