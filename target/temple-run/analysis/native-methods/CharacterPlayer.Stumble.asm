
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12979d8: 6dbd23e9     	stp	d9, d8, [sp, #-0x30]!
 12979dc: f9000bfe     	str	x30, [sp, #0x10]
 12979e0: a9024ff4     	stp	x20, x19, [sp, #0x20]
 12979e4: d000bcf4     	adrp	x20, 0x2a35000
 12979e8: 39624e88     	ldrb	w8, [x20, #0x893]
 12979ec: 4ea01c08     	mov	v8.16b, v0.16b
 12979f0: aa0003f3     	mov	x19, x0
 12979f4: 37000188     	tbnz	w8, #0x0, 0x1297a24 <__start_il2cpp+0xf0260>
 12979f8: f000ae20     	adrp	x0, 0x285e000
 12979fc: f9414000     	ldr	x0, [x0, #0x280]
 1297a00: 97f8a136     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1297a04: 9000ae60     	adrp	x0, 0x2863000
 1297a08: f946c400     	ldr	x0, [x0, #0xd88]
 1297a0c: 97f8a133     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1297a10: 9000ae60     	adrp	x0, 0x2863000
 1297a14: f946c800     	ldr	x0, [x0, #0xd90]
 1297a18: 97f8a130     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1297a1c: 52800028     	mov	w8, #0x1                // =1
 1297a20: 39224e88     	strb	w8, [x20, #0x893]
 1297a24: 1e202108     	fcmp	s8, #0.0
 1297a28: 5400010d     	b.le	0x1297a48 <__start_il2cpp+0xf0284>
 1297a2c: 52800028     	mov	w8, #0x1                // =1
 1297a30: 39043668     	strb	w8, [x19, #0x10d]
 1297a34: bd011268     	str	s8, [x19, #0x110]
 1297a38: a9424ff4     	ldp	x20, x19, [sp, #0x20]
 1297a3c: f9400bfe     	ldr	x30, [sp, #0x10]
 1297a40: 6cc323e9     	ldp	d9, d8, [sp], #0x30
 1297a44: d65f03c0     	ret
 1297a48: bd411e60     	ldr	s0, [x19, #0x11c]
 1297a4c: 1e249001     	fmov	s1, #10.00000000
 1297a50: 52800028     	mov	w8, #0x1                // =1
 1297a54: 39049268     	strb	w8, [x19, #0x124]
 1297a58: 1e212000     	fcmp	s0, s1
 1297a5c: 3904367f     	strb	wzr, [x19, #0x10d]
 1297a60: 540001a5     	b.pl	0x1297a94 <__start_il2cpp+0xf02d0>
 1297a64: 528000c1     	mov	w1, #0x6                // =6
 1297a68: aa1303e0     	mov	x0, x19
 1297a6c: 94000111     	bl	0x1297eb0 <__start_il2cpp+0xf06ec>
 1297a70: f940de60     	ldr	x0, [x19, #0x1b8]
 1297a74: b4000840     	cbz	x0, 0x1297b7c <__start_il2cpp+0xf03b8>
 1297a78: 90ffa008     	adrp	x8, 0x697000
 1297a7c: bd455d00     	ldr	s0, [x8, #0x55c]
 1297a80: a9424ff4     	ldp	x20, x19, [sp, #0x20]
 1297a84: f9400bfe     	ldr	x30, [sp, #0x10]
 1297a88: 52800261     	mov	w1, #0x13               // =19
 1297a8c: 6cc323e9     	ldp	d9, d8, [sp], #0x30
 1297a90: 17fff6cb     	b	0x12955bc <__start_il2cpp+0xeddf8>
 1297a94: f000ae28     	adrp	x8, 0x285e000
 1297a98: f9414108     	ldr	x8, [x8, #0x280]
 1297a9c: fc434268     	ldur	d8, [x19, #0x34]
 1297aa0: bd403e69     	ldr	s9, [x19, #0x3c]
 1297aa4: f9400100     	ldr	x0, [x8]
 1297aa8: b940e008     	ldr	w8, [x0, #0xe0]
 1297aac: 35000048     	cbnz	w8, 0x1297ab4 <__start_il2cpp+0xf02f0>
 1297ab0: 97f8a14c     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1297ab4: aa1f03e0     	mov	x0, xzr
 1297ab8: 97ff8202     	bl	0x12782c0 <__start_il2cpp+0xd0afc>
 1297abc: 0f809101     	fmul	v1.2s, v8.2s, v0.s[0]
 1297ac0: 1e200920     	fmul	s0, s9, s0
 1297ac4: 52800034     	mov	w20, #0x1               // =1
 1297ac8: aa1303e0     	mov	x0, x19
 1297acc: fc034261     	stur	d1, [x19, #0x34]
 1297ad0: bd003e60     	str	s0, [x19, #0x3c]
 1297ad4: 39043274     	strb	w20, [x19, #0x10c]
 1297ad8: b901167f     	str	wzr, [x19, #0x114]
 1297adc: 940001ff     	bl	0x12982d8 <__start_il2cpp+0xf0b14>
 1297ae0: 90ffa008     	adrp	x8, 0x697000
 1297ae4: bd46ad01     	ldr	s1, [x8, #0x6ac]
 1297ae8: 1e2c1002     	fmov	s2, #0.50000000
 1297aec: b9014274     	str	w20, [x19, #0x140]
 1297af0: b9014e7f     	str	wzr, [x19, #0x14c]
 1297af4: 1e210800     	fmul	s0, s0, s1
 1297af8: 1e222000     	fcmp	s0, s2
 1297afc: bd011a60     	str	s0, [x19, #0x118]
 1297b00: 5400006d     	b.le	0x1297b0c <__start_il2cpp+0xf0348>
 1297b04: 52a7e008     	mov	w8, #0x3f000000         // =1056964608
 1297b08: b9011a68     	str	w8, [x19, #0x118]
 1297b0c: f940de60     	ldr	x0, [x19, #0x1b8]
 1297b10: b9011e7f     	str	wzr, [x19, #0x11c]
 1297b14: b4000340     	cbz	x0, 0x1297b7c <__start_il2cpp+0xf03b8>
 1297b18: 1e2e1000     	fmov	s0, #1.00000000
 1297b1c: 52800201     	mov	w1, #0x10               // =16
 1297b20: 97fff6a7     	bl	0x12955bc <__start_il2cpp+0xeddf8>
 1297b24: f940de60     	ldr	x0, [x19, #0x1b8]
 1297b28: b40002a0     	cbz	x0, 0x1297b7c <__start_il2cpp+0xf03b8>
 1297b2c: 1e2e1000     	fmov	s0, #1.00000000
 1297b30: 52800281     	mov	w1, #0x14               // =20
 1297b34: 97fff6a2     	bl	0x12955bc <__start_il2cpp+0xeddf8>
 1297b38: f9405260     	ldr	x0, [x19, #0xa0]
 1297b3c: b4000200     	cbz	x0, 0x1297b7c <__start_il2cpp+0xf03b8>
 1297b40: 9000ae68     	adrp	x8, 0x2863000
 1297b44: f946c908     	ldr	x8, [x8, #0xd90]
 1297b48: aa1f03e2     	mov	x2, xzr
 1297b4c: f9400101     	ldr	x1, [x8]
 1297b50: 9447d4ff     	bl	0x248cf4c <__start_il2cpp+0x12e5788>
 1297b54: f9405260     	ldr	x0, [x19, #0xa0]
 1297b58: b4000120     	cbz	x0, 0x1297b7c <__start_il2cpp+0xf03b8>
 1297b5c: 9000ae68     	adrp	x8, 0x2863000
 1297b60: f946c508     	ldr	x8, [x8, #0xd88]
 1297b64: a9424ff4     	ldp	x20, x19, [sp, #0x20]
 1297b68: f9400bfe     	ldr	x30, [sp, #0x10]
 1297b6c: aa1f03e2     	mov	x2, xzr
 1297b70: f9400101     	ldr	x1, [x8]
 1297b74: 6cc323e9     	ldp	d9, d8, [sp], #0x30
 1297b78: 1447d51c     	b	0x248cfe8 <__start_il2cpp+0x12e5824>
 1297b7c: 97f8a161     	bl	0x10c0100 <CloseNLSocket+0x638>
