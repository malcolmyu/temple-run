
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12e4bf4: d10343ff     	sub	sp, sp, #0xd0
 12e4bf8: 6d033bef     	stp	d15, d14, [sp, #0x30]
 12e4bfc: 6d0433ed     	stp	d13, d12, [sp, #0x40]
 12e4c00: 6d052beb     	stp	d11, d10, [sp, #0x50]
 12e4c04: 6d0623e9     	stp	d9, d8, [sp, #0x60]
 12e4c08: a9077bfd     	stp	x29, x30, [sp, #0x70]
 12e4c0c: a9086ffc     	stp	x28, x27, [sp, #0x80]
 12e4c10: a90967fa     	stp	x26, x25, [sp, #0x90]
 12e4c14: a90a5ff8     	stp	x24, x23, [sp, #0xa0]
 12e4c18: a90b57f6     	stp	x22, x21, [sp, #0xb0]
 12e4c1c: a90c4ff4     	stp	x20, x19, [sp, #0xc0]
 12e4c20: b000ba95     	adrp	x21, 0x2a35000
 12e4c24: 9000abdd     	adrp	x29, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12e4c28: 396cb6a8     	ldrb	w8, [x21, #0xb2d]
 12e4c2c: f94563bd     	ldr	x29, [x29, #0xac0]
 12e4c30: aa0203fb     	mov	x27, x2
 12e4c34: 2a0103f4     	mov	w20, w1
 12e4c38: aa0003f3     	mov	x19, x0
 12e4c3c: 370003c8     	tbnz	w8, #0x0, 0x12e4cb4 <__start_il2cpp+0x13d4f0>
 12e4c40: f000abe0     	adrp	x0, 0x2863000
 12e4c44: f9467400     	ldr	x0, [x0, #0xce8]
 12e4c48: 97f76ca4     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e4c4c: d000ac00     	adrp	x0, 0x2866000
 12e4c50: f9410c00     	ldr	x0, [x0, #0x218]
 12e4c54: 97f76ca1     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e4c58: b000abc0     	adrp	x0, 0x285d000
 12e4c5c: f9456000     	ldr	x0, [x0, #0xac0]
 12e4c60: 97f76c9e     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e4c64: 9000abc0     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12e4c68: f9456000     	ldr	x0, [x0, #0xac0]
 12e4c6c: 97f76c9b     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e4c70: d000abe0     	adrp	x0, 0x2862000
 12e4c74: f9424800     	ldr	x0, [x0, #0x490]
 12e4c78: 97f76c98     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e4c7c: d000ac00     	adrp	x0, 0x2866000
 12e4c80: f9410400     	ldr	x0, [x0, #0x208]
 12e4c84: 97f76c95     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e4c88: b000abc0     	adrp	x0, 0x285d000
 12e4c8c: f9460c00     	ldr	x0, [x0, #0xc18]
 12e4c90: 97f76c92     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e4c94: d000ac00     	adrp	x0, 0x2866000
 12e4c98: f9414000     	ldr	x0, [x0, #0x280]
 12e4c9c: 97f76c8f     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e4ca0: f000abe0     	adrp	x0, 0x2863000
 12e4ca4: f9469000     	ldr	x0, [x0, #0xd20]
 12e4ca8: 97f76c8c     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e4cac: 52800028     	mov	w8, #0x1                // =1
 12e4cb0: 392cb6a8     	strb	w8, [x21, #0xb2d]
 12e4cb4: f94003a0     	ldr	x0, [x29]
 12e4cb8: b940e008     	ldr	w8, [x0, #0xe0]
 12e4cbc: 35000048     	cbnz	w8, 0x12e4cc4 <__start_il2cpp+0x13d500>
 12e4cc0: 97f76cc8     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4cc4: aa1b03e0     	mov	x0, x27
 12e4cc8: aa1f03e1     	mov	x1, xzr
 12e4ccc: aa1f03e2     	mov	x2, xzr
 12e4cd0: 944751f2     	bl	0x24b9498 <__start_il2cpp+0x1311cd4>
 12e4cd4: 37000060     	tbnz	w0, #0x0, 0x12e4ce0 <__start_il2cpp+0x13d51c>
 12e4cd8: 3940f668     	ldrb	w8, [x19, #0x3d]
 12e4cdc: 340001a8     	cbz	w8, 0x12e4d10 <__start_il2cpp+0x13d54c>
 12e4ce0: a94c4ff4     	ldp	x20, x19, [sp, #0xc0]
 12e4ce4: a94b57f6     	ldp	x22, x21, [sp, #0xb0]
 12e4ce8: a94a5ff8     	ldp	x24, x23, [sp, #0xa0]
 12e4cec: a94967fa     	ldp	x26, x25, [sp, #0x90]
 12e4cf0: a9486ffc     	ldp	x28, x27, [sp, #0x80]
 12e4cf4: a9477bfd     	ldp	x29, x30, [sp, #0x70]
 12e4cf8: 6d4623e9     	ldp	d9, d8, [sp, #0x60]
 12e4cfc: 6d452beb     	ldp	d11, d10, [sp, #0x50]
 12e4d00: 6d4433ed     	ldp	d13, d12, [sp, #0x40]
 12e4d04: 6d433bef     	ldp	d15, d14, [sp, #0x30]
 12e4d08: 910343ff     	add	sp, sp, #0xd0
 12e4d0c: d65f03c0     	ret
 12e4d10: d000abfa     	adrp	x26, 0x2862000
 12e4d14: f9424b5a     	ldr	x26, [x26, #0x490]
 12e4d18: f9400340     	ldr	x0, [x26]
 12e4d1c: b940e008     	ldr	w8, [x0, #0xe0]
 12e4d20: 35000068     	cbnz	w8, 0x12e4d2c <__start_il2cpp+0x13d568>
 12e4d24: 97f76caf     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4d28: f9400340     	ldr	x0, [x26]
 12e4d2c: f9405c08     	ldr	x8, [x0, #0xb8]
 12e4d30: 39404109     	ldrb	w9, [x8, #0x10]
 12e4d34: 34fffd69     	cbz	w9, 0x12e4ce0 <__start_il2cpp+0x13d51c>
 12e4d38: b4008ebb     	cbz	x27, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e4d3c: b940e009     	ldr	w9, [x0, #0xe0]
 12e4d40: b9408b75     	ldr	w21, [x27, #0x88]
 12e4d44: 35000089     	cbnz	w9, 0x12e4d54 <__start_il2cpp+0x13d590>
 12e4d48: 97f76ca6     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4d4c: f9400340     	ldr	x0, [x26]
 12e4d50: f9405c08     	ldr	x8, [x0, #0xb8]
 12e4d54: b9404109     	ldr	w9, [x8, #0x40]
 12e4d58: 6b0902bf     	cmp	w21, w9
 12e4d5c: 54fffc2a     	b.ge	0x12e4ce0 <__start_il2cpp+0x13d51c>
 12e4d60: b940e009     	ldr	w9, [x0, #0xe0]
 12e4d64: b9408775     	ldr	w21, [x27, #0x84]
 12e4d68: 35000089     	cbnz	w9, 0x12e4d78 <__start_il2cpp+0x13d5b4>
 12e4d6c: 97f76c9d     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4d70: f9400340     	ldr	x0, [x26]
 12e4d74: f9405c08     	ldr	x8, [x0, #0xb8]
 12e4d78: b9403d09     	ldr	w9, [x8, #0x3c]
 12e4d7c: 6b0902bf     	cmp	w21, w9
 12e4d80: 54fffb0d     	b.le	0x12e4ce0 <__start_il2cpp+0x13d51c>
 12e4d84: 3940f269     	ldrb	w9, [x19, #0x3c]
 12e4d88: 340001a9     	cbz	w9, 0x12e4dbc <__start_il2cpp+0x13d5f8>
 12e4d8c: b9403a69     	ldr	w9, [x19, #0x38]
 12e4d90: 7100093f     	cmp	w9, #0x2
 12e4d94: 54000140     	b.eq	0x12e4dbc <__start_il2cpp+0x13d5f8>
 12e4d98: 7100153f     	cmp	w9, #0x5
 12e4d9c: 54000100     	b.eq	0x12e4dbc <__start_il2cpp+0x13d5f8>
 12e4da0: b940e009     	ldr	w9, [x0, #0xe0]
 12e4da4: 35000089     	cbnz	w9, 0x12e4db4 <__start_il2cpp+0x13d5f0>
 12e4da8: 97f76c8e     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4dac: f9400348     	ldr	x8, [x26]
 12e4db0: f9405d08     	ldr	x8, [x8, #0xb8]
 12e4db4: 39405508     	ldrb	w8, [x8, #0x15]
 12e4db8: 34fff948     	cbz	w8, 0x12e4ce0 <__start_il2cpp+0x13d51c>
 12e4dbc: b9403a68     	ldr	w8, [x19, #0x38]
 12e4dc0: 71001d1f     	cmp	w8, #0x7
 12e4dc4: 54fff8e0     	b.eq	0x12e4ce0 <__start_il2cpp+0x13d51c>
 12e4dc8: d000ac08     	adrp	x8, 0x2866000
 12e4dcc: b9403275     	ldr	w21, [x19, #0x30]
 12e4dd0: f9410508     	ldr	x8, [x8, #0x208]
 12e4dd4: 52800081     	mov	w1, #0x4                // =4
 12e4dd8: f9400100     	ldr	x0, [x8]
 12e4ddc: 97f76c5d     	bl	0x10bff50 <CloseNLSocket+0x488>
 12e4de0: d000ac08     	adrp	x8, 0x2866000
 12e4de4: f9414108     	ldr	x8, [x8, #0x280]
 12e4de8: aa1f03e2     	mov	x2, xzr
 12e4dec: aa0003f6     	mov	x22, x0
 12e4df0: f9400101     	ldr	x1, [x8]
 12e4df4: 942c0378     	bl	0x1de5bd4 <__start_il2cpp+0xc3e410>
 12e4df8: d000ac08     	adrp	x8, 0x2866000
 12e4dfc: f9410d08     	ldr	x8, [x8, #0x218]
 12e4e00: 2a1503e0     	mov	w0, w21
 12e4e04: aa1603e1     	mov	x1, x22
 12e4e08: f9400102     	ldr	x2, [x8]
 12e4e0c: 9403cae7     	bl	0x13d79a8 <__start_il2cpp+0x2301e4>
 12e4e10: 3707f680     	tbnz	w0, #0x0, 0x12e4ce0 <__start_il2cpp+0x13d51c>
 12e4e14: f9400340     	ldr	x0, [x26]
 12e4e18: b940e008     	ldr	w8, [x0, #0xe0]
 12e4e1c: 35000068     	cbnz	w8, 0x12e4e28 <__start_il2cpp+0x13d664>
 12e4e20: 97f76c70     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4e24: f9400340     	ldr	x0, [x26]
 12e4e28: f9405c08     	ldr	x8, [x0, #0xb8]
 12e4e2c: 39404509     	ldrb	w9, [x8, #0x11]
 12e4e30: 34000109     	cbz	w9, 0x12e4e50 <__start_il2cpp+0x13d68c>
 12e4e34: b940e009     	ldr	w9, [x0, #0xe0]
 12e4e38: 35000089     	cbnz	w9, 0x12e4e48 <__start_il2cpp+0x13d684>
 12e4e3c: 97f76c69     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4e40: f9400340     	ldr	x0, [x26]
 12e4e44: f9405c08     	ldr	x8, [x0, #0xb8]
 12e4e48: 39404908     	ldrb	w8, [x8, #0x12]
 12e4e4c: 34000388     	cbz	w8, 0x12e4ebc <__start_il2cpp+0x13d6f8>
 12e4e50: b940e008     	ldr	w8, [x0, #0xe0]
 12e4e54: 35000068     	cbnz	w8, 0x12e4e60 <__start_il2cpp+0x13d69c>
 12e4e58: 97f76c62     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4e5c: f9400340     	ldr	x0, [x26]
 12e4e60: f9405c08     	ldr	x8, [x0, #0xb8]
 12e4e64: 39404509     	ldrb	w9, [x8, #0x11]
 12e4e68: 34000169     	cbz	w9, 0x12e4e94 <__start_il2cpp+0x13d6d0>
 12e4e6c: b940e009     	ldr	w9, [x0, #0xe0]
 12e4e70: 35000089     	cbnz	w9, 0x12e4e80 <__start_il2cpp+0x13d6bc>
 12e4e74: 97f76c5b     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4e78: f9400340     	ldr	x0, [x26]
 12e4e7c: f9405c08     	ldr	x8, [x0, #0xb8]
 12e4e80: 39404908     	ldrb	w8, [x8, #0x12]
 12e4e84: 34000088     	cbz	w8, 0x12e4e94 <__start_il2cpp+0x13d6d0>
 12e4e88: 52800055     	mov	w21, #0x2               // =2
 12e4e8c: 52800078     	mov	w24, #0x3               // =3
 12e4e90: 14000018     	b	0x12e4ef0 <__start_il2cpp+0x13d72c>
 12e4e94: b940e008     	ldr	w8, [x0, #0xe0]
 12e4e98: 35000068     	cbnz	w8, 0x12e4ea4 <__start_il2cpp+0x13d6e0>
 12e4e9c: 97f76c51     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4ea0: f9400340     	ldr	x0, [x26]
 12e4ea4: f9405c08     	ldr	x8, [x0, #0xb8]
 12e4ea8: 39404509     	ldrb	w9, [x8, #0x11]
 12e4eac: 340000e9     	cbz	w9, 0x12e4ec8 <__start_il2cpp+0x13d704>
 12e4eb0: 52800038     	mov	w24, #0x1               // =1
 12e4eb4: 52800035     	mov	w21, #0x1               // =1
 12e4eb8: 1400000e     	b	0x12e4ef0 <__start_il2cpp+0x13d72c>
 12e4ebc: 52800035     	mov	w21, #0x1               // =1
 12e4ec0: 52800058     	mov	w24, #0x2               // =2
 12e4ec4: 1400000b     	b	0x12e4ef0 <__start_il2cpp+0x13d72c>
 12e4ec8: b940e009     	ldr	w9, [x0, #0xe0]
 12e4ecc: 35000089     	cbnz	w9, 0x12e4edc <__start_il2cpp+0x13d718>
 12e4ed0: 97f76c44     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4ed4: f9400348     	ldr	x8, [x26]
 12e4ed8: f9405d08     	ldr	x8, [x8, #0xb8]
 12e4edc: 39404908     	ldrb	w8, [x8, #0x12]
 12e4ee0: 7100011f     	cmp	w8, #0x0
 12e4ee4: 52800068     	mov	w8, #0x3                // =3
 12e4ee8: 1a9f1518     	csinc	w24, w8, wzr, ne
 12e4eec: 2a1803f5     	mov	w21, w24
 12e4ef0: b000abd6     	adrp	x22, 0x285d000
 12e4ef4: f9460ed6     	ldr	x22, [x22, #0xc18]
 12e4ef8: f94002c0     	ldr	x0, [x22]
 12e4efc: b940e008     	ldr	w8, [x0, #0xe0]
 12e4f00: 35000068     	cbnz	w8, 0x12e4f0c <__start_il2cpp+0x13d748>
 12e4f04: 97f76c37     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4f08: f94002c0     	ldr	x0, [x22]
 12e4f0c: f9405c08     	ldr	x8, [x0, #0xb8]
 12e4f10: f9400100     	ldr	x0, [x8]
 12e4f14: b4007fc0     	cbz	x0, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e4f18: f000abe8     	adrp	x8, 0x2863000
 12e4f1c: f9469108     	ldr	x8, [x8, #0xd20]
 12e4f20: aa1f03e2     	mov	x2, xzr
 12e4f24: f9400101     	ldr	x1, [x8]
 12e4f28: 97fb939e     	bl	0x11c9da0 <__start_il2cpp+0x225dc>
 12e4f2c: f000abe8     	adrp	x8, 0x2863000
 12e4f30: f9467508     	ldr	x8, [x8, #0xce8]
 12e4f34: aa0003fc     	mov	x28, x0
 12e4f38: f9400108     	ldr	x8, [x8]
 12e4f3c: b940e109     	ldr	w9, [x8, #0xe0]
 12e4f40: 35000069     	cbnz	w9, 0x12e4f4c <__start_il2cpp+0x13d788>
 12e4f44: aa0803e0     	mov	x0, x8
 12e4f48: 97f76c26     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4f4c: 2a1503e0     	mov	w0, w21
 12e4f50: aa1f03e1     	mov	x1, xzr
 12e4f54: 97fec44c     	bl	0x1296084 <__start_il2cpp+0xee8c0>
 12e4f58: b4007da0     	cbz	x0, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e4f5c: aa1f03e1     	mov	x1, xzr
 12e4f60: aa0003f6     	mov	x22, x0
 12e4f64: 9447446a     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e4f68: b4007d20     	cbz	x0, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e4f6c: 52b85688     	mov	w8, #-0x3d4c0000        // =-1028390912
 12e4f70: 1e2703e0     	fmov	s0, wzr
 12e4f74: 1e2703e2     	fmov	s2, wzr
 12e4f78: 1e270101     	fmov	s1, w8
 12e4f7c: aa1f03e1     	mov	x1, xzr
 12e4f80: 9447764f     	bl	0x24c28bc <__start_il2cpp+0x131b0f8>
 12e4f84: aa1603e0     	mov	x0, x22
 12e4f88: aa1f03e1     	mov	x1, xzr
 12e4f8c: 94474460     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e4f90: aa0003f7     	mov	x23, x0
 12e4f94: aa1303e0     	mov	x0, x19
 12e4f98: aa1f03e1     	mov	x1, xzr
 12e4f9c: 9447445c     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e4fa0: b4007b77     	cbz	x23, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e4fa4: aa0003e1     	mov	x1, x0
 12e4fa8: aa1703e0     	mov	x0, x23
 12e4fac: aa1f03e2     	mov	x2, xzr
 12e4fb0: 944777a5     	bl	0x24c2e44 <__start_il2cpp+0x131b680>
 12e4fb4: 2a1503e0     	mov	w0, w21
 12e4fb8: aa1f03e1     	mov	x1, xzr
 12e4fbc: 97fec432     	bl	0x1296084 <__start_il2cpp+0xee8c0>
 12e4fc0: b4007a60     	cbz	x0, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e4fc4: aa1f03e1     	mov	x1, xzr
 12e4fc8: aa0003f5     	mov	x21, x0
 12e4fcc: 94474450     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e4fd0: b40079e0     	cbz	x0, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e4fd4: 52b84b08     	mov	w8, #-0x3da80000        // =-1034420224
 12e4fd8: 1e2703e0     	fmov	s0, wzr
 12e4fdc: 1e2703e2     	fmov	s2, wzr
 12e4fe0: 1e270101     	fmov	s1, w8
 12e4fe4: aa1f03e1     	mov	x1, xzr
 12e4fe8: 94477635     	bl	0x24c28bc <__start_il2cpp+0x131b0f8>
 12e4fec: aa1503e0     	mov	x0, x21
 12e4ff0: aa1f03e1     	mov	x1, xzr
 12e4ff4: f90013f5     	str	x21, [sp, #0x20]
 12e4ff8: 94474445     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e4ffc: aa0003f7     	mov	x23, x0
 12e5000: aa1303e0     	mov	x0, x19
 12e5004: aa1f03e1     	mov	x1, xzr
 12e5008: 94474441     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e500c: b4007817     	cbz	x23, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e5010: aa0003e1     	mov	x1, x0
 12e5014: aa1703e0     	mov	x0, x23
 12e5018: aa1f03e2     	mov	x2, xzr
 12e501c: 9447778a     	bl	0x24c2e44 <__start_il2cpp+0x131b680>
 12e5020: 2a1803e0     	mov	w0, w24
 12e5024: aa1f03e1     	mov	x1, xzr
 12e5028: 97fec417     	bl	0x1296084 <__start_il2cpp+0xee8c0>
 12e502c: b4007700     	cbz	x0, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e5030: aa1f03e1     	mov	x1, xzr
 12e5034: aa0003f5     	mov	x21, x0
 12e5038: 94474435     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e503c: f94013f7     	ldr	x23, [sp, #0x20]
 12e5040: b4007660     	cbz	x0, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e5044: 1e2703e0     	fmov	s0, wzr
 12e5048: 1e365001     	fmov	s1, #-18.00000000
 12e504c: 1e2703e2     	fmov	s2, wzr
 12e5050: aa1f03e1     	mov	x1, xzr
 12e5054: 9447761a     	bl	0x24c28bc <__start_il2cpp+0x131b0f8>
 12e5058: aa1503e0     	mov	x0, x21
 12e505c: aa1f03e1     	mov	x1, xzr
 12e5060: 9447442b     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e5064: aa0003f9     	mov	x25, x0
 12e5068: aa1303e0     	mov	x0, x19
 12e506c: aa1f03e1     	mov	x1, xzr
 12e5070: 94474427     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e5074: b40074d9     	cbz	x25, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e5078: aa0003e1     	mov	x1, x0
 12e507c: aa1903e0     	mov	x0, x25
 12e5080: aa1f03e2     	mov	x2, xzr
 12e5084: 94477770     	bl	0x24c2e44 <__start_il2cpp+0x131b680>
 12e5088: 2a1803e0     	mov	w0, w24
 12e508c: aa1f03e1     	mov	x1, xzr
 12e5090: 97fec3fd     	bl	0x1296084 <__start_il2cpp+0xee8c0>
 12e5094: b40073c0     	cbz	x0, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e5098: aa1f03e1     	mov	x1, xzr
 12e509c: aa0003f8     	mov	x24, x0
 12e50a0: 9447441b     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e50a4: b4007340     	cbz	x0, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e50a8: 1e2703e0     	fmov	s0, wzr
 12e50ac: 1e365001     	fmov	s1, #-18.00000000
 12e50b0: 1e2703e2     	fmov	s2, wzr
 12e50b4: aa1f03e1     	mov	x1, xzr
 12e50b8: 94477601     	bl	0x24c28bc <__start_il2cpp+0x131b0f8>
 12e50bc: aa1803e0     	mov	x0, x24
 12e50c0: aa1f03e1     	mov	x1, xzr
 12e50c4: 94474412     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e50c8: aa0003f9     	mov	x25, x0
 12e50cc: aa1303e0     	mov	x0, x19
 12e50d0: aa1f03e1     	mov	x1, xzr
 12e50d4: 9447440e     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e50d8: b40071b9     	cbz	x25, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e50dc: aa0003e1     	mov	x1, x0
 12e50e0: aa1903e0     	mov	x0, x25
 12e50e4: aa1f03e2     	mov	x2, xzr
 12e50e8: 94477757     	bl	0x24c2e44 <__start_il2cpp+0x131b680>
 12e50ec: 52800020     	mov	w0, #0x1                // =1
 12e50f0: aa1f03e1     	mov	x1, xzr
 12e50f4: 97fec3e4     	bl	0x1296084 <__start_il2cpp+0xee8c0>
 12e50f8: b40070a0     	cbz	x0, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e50fc: aa1f03e1     	mov	x1, xzr
 12e5100: aa0003f9     	mov	x25, x0
 12e5104: f90007fc     	str	x28, [sp, #0x8]
 12e5108: 94474401     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e510c: b4007000     	cbz	x0, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e5110: 52a84b08     	mov	w8, #0x42580000         // =1113063424
 12e5114: 1e2703e0     	fmov	s0, wzr
 12e5118: 1e2703e2     	fmov	s2, wzr
 12e511c: 1e270101     	fmov	s1, w8
 12e5120: aa1f03e1     	mov	x1, xzr
 12e5124: 944775e6     	bl	0x24c28bc <__start_il2cpp+0x131b0f8>
 12e5128: aa1903e0     	mov	x0, x25
 12e512c: aa1f03e1     	mov	x1, xzr
 12e5130: 944743f7     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e5134: aa0003fc     	mov	x28, x0
 12e5138: aa1303e0     	mov	x0, x19
 12e513c: aa1f03e1     	mov	x1, xzr
 12e5140: 944743f3     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e5144: b4006e5c     	cbz	x28, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e5148: aa0003e1     	mov	x1, x0
 12e514c: aa1c03e0     	mov	x0, x28
 12e5150: aa1f03e2     	mov	x2, xzr
 12e5154: 9447773c     	bl	0x24c2e44 <__start_il2cpp+0x131b680>
 12e5158: f9400340     	ldr	x0, [x26]
 12e515c: b940e008     	ldr	w8, [x0, #0xe0]
 12e5160: 35000048     	cbnz	w8, 0x12e5168 <__start_il2cpp+0x13d9a4>
 12e5164: 97f76b9f     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e5168: aa1603e0     	mov	x0, x22
 12e516c: 94000ec9     	bl	0x12e8c90 <__start_il2cpp+0x1414cc>
 12e5170: aa1703e0     	mov	x0, x23
 12e5174: 94000ec7     	bl	0x12e8c90 <__start_il2cpp+0x1414cc>
 12e5178: aa1503e0     	mov	x0, x21
 12e517c: f90017f5     	str	x21, [sp, #0x28]
 12e5180: 94000ec4     	bl	0x12e8c90 <__start_il2cpp+0x1414cc>
 12e5184: aa1803e0     	mov	x0, x24
 12e5188: 94000ec2     	bl	0x12e8c90 <__start_il2cpp+0x1414cc>
 12e518c: aa1903e0     	mov	x0, x25
 12e5190: 94000ec0     	bl	0x12e8c90 <__start_il2cpp+0x1414cc>
 12e5194: aa1603e0     	mov	x0, x22
 12e5198: aa1f03e1     	mov	x1, xzr
 12e519c: 944743dc     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e51a0: f000ba75     	adrp	x21, 0x2a34000
 12e51a4: 397e82a8     	ldrb	w8, [x21, #0xfa0]
 12e51a8: aa0003fc     	mov	x28, x0
 12e51ac: 350000c8     	cbnz	w8, 0x12e51c4 <__start_il2cpp+0x13da00>
 12e51b0: 9000abc0     	adrp	x0, 0x285d000
 12e51b4: f9474800     	ldr	x0, [x0, #0xe90]
 12e51b8: 97f76b48     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e51bc: 52800028     	mov	w8, #0x1                // =1
 12e51c0: 393e82a8     	strb	w8, [x21, #0xfa0]
 12e51c4: f9000ff6     	str	x22, [sp, #0x18]
 12e51c8: b4006a3c     	cbz	x28, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e51cc: 9000abd6     	adrp	x22, 0x285d000
 12e51d0: f9474ad6     	ldr	x22, [x22, #0xe90]
 12e51d4: aa1c03e0     	mov	x0, x28
 12e51d8: aa1f03e1     	mov	x1, xzr
 12e51dc: f94002c8     	ldr	x8, [x22]
 12e51e0: f9405d08     	ldr	x8, [x8, #0xb8]
 12e51e4: 2d408901     	ldp	s1, s2, [x8, #0x4]
 12e51e8: bd400100     	ldr	s0, [x8]
 12e51ec: 9447730f     	bl	0x24c1e28 <__start_il2cpp+0x131a664>
 12e51f0: aa1703e0     	mov	x0, x23
 12e51f4: aa1f03e1     	mov	x1, xzr
 12e51f8: 944743c5     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e51fc: 397e82a8     	ldrb	w8, [x21, #0xfa0]
 12e5200: aa0003fc     	mov	x28, x0
 12e5204: 350000c8     	cbnz	w8, 0x12e521c <__start_il2cpp+0x13da58>
 12e5208: 9000abc0     	adrp	x0, 0x285d000
 12e520c: f9474800     	ldr	x0, [x0, #0xe90]
 12e5210: 97f76b32     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e5214: 52800028     	mov	w8, #0x1                // =1
 12e5218: 393e82a8     	strb	w8, [x21, #0xfa0]
 12e521c: b400679c     	cbz	x28, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e5220: f94002c8     	ldr	x8, [x22]
 12e5224: aa1c03e0     	mov	x0, x28
 12e5228: aa1f03e1     	mov	x1, xzr
 12e522c: f9405d08     	ldr	x8, [x8, #0xb8]
 12e5230: 2d408901     	ldp	s1, s2, [x8, #0x4]
 12e5234: bd400100     	ldr	s0, [x8]
 12e5238: 944772fc     	bl	0x24c1e28 <__start_il2cpp+0x131a664>
 12e523c: f94017e0     	ldr	x0, [sp, #0x28]
 12e5240: aa1f03e1     	mov	x1, xzr
 12e5244: 944743b2     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e5248: 397e82a8     	ldrb	w8, [x21, #0xfa0]
 12e524c: aa0003fc     	mov	x28, x0
 12e5250: 350000c8     	cbnz	w8, 0x12e5268 <__start_il2cpp+0x13daa4>
 12e5254: 9000abc0     	adrp	x0, 0x285d000
 12e5258: f9474800     	ldr	x0, [x0, #0xe90]
 12e525c: 97f76b1f     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e5260: 52800028     	mov	w8, #0x1                // =1
 12e5264: 393e82a8     	strb	w8, [x21, #0xfa0]
 12e5268: b400653c     	cbz	x28, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e526c: f94002c8     	ldr	x8, [x22]
 12e5270: aa1c03e0     	mov	x0, x28
 12e5274: aa1f03e1     	mov	x1, xzr
 12e5278: f9405d08     	ldr	x8, [x8, #0xb8]
 12e527c: 2d408901     	ldp	s1, s2, [x8, #0x4]
 12e5280: bd400100     	ldr	s0, [x8]
 12e5284: 944772e9     	bl	0x24c1e28 <__start_il2cpp+0x131a664>
 12e5288: aa1803e0     	mov	x0, x24
 12e528c: aa1f03e1     	mov	x1, xzr
 12e5290: 9447439f     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e5294: 397e82a8     	ldrb	w8, [x21, #0xfa0]
 12e5298: aa0003fc     	mov	x28, x0
 12e529c: 350000c8     	cbnz	w8, 0x12e52b4 <__start_il2cpp+0x13daf0>
 12e52a0: 9000abc0     	adrp	x0, 0x285d000
 12e52a4: f9474800     	ldr	x0, [x0, #0xe90]
 12e52a8: 97f76b0c     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e52ac: 52800028     	mov	w8, #0x1                // =1
 12e52b0: 393e82a8     	strb	w8, [x21, #0xfa0]
 12e52b4: b40062dc     	cbz	x28, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e52b8: f94002c8     	ldr	x8, [x22]
 12e52bc: aa1c03e0     	mov	x0, x28
 12e52c0: aa1f03e1     	mov	x1, xzr
 12e52c4: f9405d08     	ldr	x8, [x8, #0xb8]
 12e52c8: 2d408901     	ldp	s1, s2, [x8, #0x4]
 12e52cc: bd400100     	ldr	s0, [x8]
 12e52d0: 944772d6     	bl	0x24c1e28 <__start_il2cpp+0x131a664>
 12e52d4: aa1903e0     	mov	x0, x25
 12e52d8: aa1f03e1     	mov	x1, xzr
 12e52dc: 9447438c     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e52e0: 397e82a8     	ldrb	w8, [x21, #0xfa0]
 12e52e4: aa0003fc     	mov	x28, x0
 12e52e8: 350000c8     	cbnz	w8, 0x12e5300 <__start_il2cpp+0x13db3c>
 12e52ec: 9000abc0     	adrp	x0, 0x285d000
 12e52f0: f9474800     	ldr	x0, [x0, #0xe90]
 12e52f4: 97f76af9     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e52f8: 52800028     	mov	w8, #0x1                // =1
 12e52fc: 393e82a8     	strb	w8, [x21, #0xfa0]
 12e5300: b400607c     	cbz	x28, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e5304: f94002c8     	ldr	x8, [x22]
 12e5308: aa1c03e0     	mov	x0, x28
 12e530c: aa1f03e1     	mov	x1, xzr
 12e5310: f9405d08     	ldr	x8, [x8, #0xb8]
 12e5314: 2d408901     	ldp	s1, s2, [x8, #0x4]
 12e5318: bd400100     	ldr	s0, [x8]
 12e531c: 944772c3     	bl	0x24c1e28 <__start_il2cpp+0x131a664>
 12e5320: aa1303e0     	mov	x0, x19
 12e5324: 97fff66d     	bl	0x12e2cd8 <__start_il2cpp+0x13b514>
 12e5328: f94017f5     	ldr	x21, [sp, #0x28]
 12e532c: 360005a0     	tbz	w0, #0x0, 0x12e53e0 <__start_il2cpp+0x13dc1c>
 12e5330: f9400fe0     	ldr	x0, [sp, #0x18]
 12e5334: aa1f03e1     	mov	x1, xzr
 12e5338: 94474375     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e533c: b4005e80     	cbz	x0, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e5340: 1e2703e0     	fmov	s0, wzr
 12e5344: 1e211001     	fmov	s1, #3.00000000
 12e5348: 1e373002     	fmov	s2, #-25.00000000
 12e534c: aa1f03e1     	mov	x1, xzr
 12e5350: 944772b6     	bl	0x24c1e28 <__start_il2cpp+0x131a664>
 12e5354: aa1703e0     	mov	x0, x23
 12e5358: aa1f03e1     	mov	x1, xzr
 12e535c: 9447436c     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e5360: b4005d60     	cbz	x0, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e5364: 1e2703e0     	fmov	s0, wzr
 12e5368: 1e211001     	fmov	s1, #3.00000000
 12e536c: 1e353002     	fmov	s2, #-12.50000000
 12e5370: aa1f03e1     	mov	x1, xzr
 12e5374: 944772ad     	bl	0x24c1e28 <__start_il2cpp+0x131a664>
 12e5378: aa1503e0     	mov	x0, x21
 12e537c: aa1f03e1     	mov	x1, xzr
 12e5380: 94474363     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e5384: b4005c40     	cbz	x0, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e5388: 1e2703e0     	fmov	s0, wzr
 12e538c: 1e211001     	fmov	s1, #3.00000000
 12e5390: 1e2703e2     	fmov	s2, wzr
 12e5394: aa1f03e1     	mov	x1, xzr
 12e5398: 944772a4     	bl	0x24c1e28 <__start_il2cpp+0x131a664>
 12e539c: aa1803e0     	mov	x0, x24
 12e53a0: aa1f03e1     	mov	x1, xzr
 12e53a4: 9447435a     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e53a8: b4005b20     	cbz	x0, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e53ac: 1e2703e0     	fmov	s0, wzr
 12e53b0: 1e211001     	fmov	s1, #3.00000000
 12e53b4: 1e253002     	fmov	s2, #12.50000000
 12e53b8: aa1f03e1     	mov	x1, xzr
 12e53bc: 9447729b     	bl	0x24c1e28 <__start_il2cpp+0x131a664>
 12e53c0: aa1903e0     	mov	x0, x25
 12e53c4: aa1f03e1     	mov	x1, xzr
 12e53c8: 94474351     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e53cc: b4005a00     	cbz	x0, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e53d0: 1e2703e0     	fmov	s0, wzr
 12e53d4: 1e211001     	fmov	s1, #3.00000000
 12e53d8: 1e273002     	fmov	s2, #25.00000000
 12e53dc: 14000097     	b	0x12e5638 <__start_il2cpp+0x13de74>
 12e53e0: aa1303e0     	mov	x0, x19
 12e53e4: 97fff65c     	bl	0x12e2d54 <__start_il2cpp+0x13b590>
 12e53e8: f9400fec     	ldr	x12, [sp, #0x18]
 12e53ec: 36000560     	tbz	w0, #0x0, 0x12e5498 <__start_il2cpp+0x13dcd4>
 12e53f0: aa0c03e0     	mov	x0, x12
 12e53f4: aa1f03e1     	mov	x1, xzr
 12e53f8: 94474345     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e53fc: b4005880     	cbz	x0, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e5400: 1e273000     	fmov	s0, #25.00000000
 12e5404: 1e211001     	fmov	s1, #3.00000000
 12e5408: 1e2703e2     	fmov	s2, wzr
 12e540c: aa1f03e1     	mov	x1, xzr
 12e5410: 94477286     	bl	0x24c1e28 <__start_il2cpp+0x131a664>
 12e5414: aa1703e0     	mov	x0, x23
 12e5418: aa1f03e1     	mov	x1, xzr
 12e541c: 9447433c     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e5420: b4005760     	cbz	x0, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e5424: 1e253000     	fmov	s0, #12.50000000
 12e5428: 1e211001     	fmov	s1, #3.00000000
 12e542c: 1e2703e2     	fmov	s2, wzr
 12e5430: aa1f03e1     	mov	x1, xzr
 12e5434: 9447727d     	bl	0x24c1e28 <__start_il2cpp+0x131a664>
 12e5438: aa1503e0     	mov	x0, x21
 12e543c: aa1f03e1     	mov	x1, xzr
 12e5440: 94474333     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e5444: b4005640     	cbz	x0, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e5448: 1e2703e0     	fmov	s0, wzr
 12e544c: 1e211001     	fmov	s1, #3.00000000
 12e5450: 1e2703e2     	fmov	s2, wzr
 12e5454: aa1f03e1     	mov	x1, xzr
 12e5458: 94477274     	bl	0x24c1e28 <__start_il2cpp+0x131a664>
 12e545c: aa1803e0     	mov	x0, x24
 12e5460: aa1f03e1     	mov	x1, xzr
 12e5464: 9447432a     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e5468: b4005520     	cbz	x0, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e546c: 1e353000     	fmov	s0, #-12.50000000
 12e5470: 1e211001     	fmov	s1, #3.00000000
 12e5474: 1e2703e2     	fmov	s2, wzr
 12e5478: aa1f03e1     	mov	x1, xzr
 12e547c: 9447726b     	bl	0x24c1e28 <__start_il2cpp+0x131a664>
 12e5480: aa1903e0     	mov	x0, x25
 12e5484: aa1f03e1     	mov	x1, xzr
 12e5488: 94474321     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e548c: b4005400     	cbz	x0, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e5490: 1e373000     	fmov	s0, #-25.00000000
 12e5494: 14000067     	b	0x12e5630 <__start_il2cpp+0x13de6c>
 12e5498: b9403268     	ldr	w8, [x19, #0x30]
 12e549c: 51000d08     	sub	w8, w8, #0x3
 12e54a0: 71000d1f     	cmp	w8, #0x3
 12e54a4: 54000ce8     	b.hi	0x12e5640 <__start_il2cpp+0x13de7c>
 12e54a8: d0ff9e89     	adrp	x9, 0x6b7000
 12e54ac: 91315529     	add	x9, x9, #0xc55
 12e54b0: 1000008a     	adr	x10, 0x12e54c0 <__start_il2cpp+0x13dcfc>
 12e54b4: 3868692b     	ldrb	w11, [x9, x8]
 12e54b8: 8b0b094a     	add	x10, x10, x11, lsl #2
 12e54bc: d61f0140     	br	x10
 12e54c0: aa0c03e0     	mov	x0, x12
 12e54c4: aa1f03e1     	mov	x1, xzr
 12e54c8: 94474311     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e54cc: b4005200     	cbz	x0, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e54d0: 1e2703e0     	fmov	s0, wzr
 12e54d4: 1e211001     	fmov	s1, #3.00000000
 12e54d8: 1e373002     	fmov	s2, #-25.00000000
 12e54dc: aa1f03e1     	mov	x1, xzr
 12e54e0: 94477252     	bl	0x24c1e28 <__start_il2cpp+0x131a664>
 12e54e4: aa1703e0     	mov	x0, x23
 12e54e8: aa1f03e1     	mov	x1, xzr
 12e54ec: 94474308     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e54f0: b40050e0     	cbz	x0, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e54f4: 1e2703e0     	fmov	s0, wzr
 12e54f8: 1e211001     	fmov	s1, #3.00000000
 12e54fc: 1e353002     	fmov	s2, #-12.50000000
 12e5500: 17ffffcc     	b	0x12e5430 <__start_il2cpp+0x13dc6c>
 12e5504: aa0c03e0     	mov	x0, x12
 12e5508: aa1f03e1     	mov	x1, xzr
 12e550c: 94474300     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e5510: b4004fe0     	cbz	x0, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e5514: 1e2703e0     	fmov	s0, wzr
 12e5518: 1e211001     	fmov	s1, #3.00000000
 12e551c: 1e373002     	fmov	s2, #-25.00000000
 12e5520: aa1f03e1     	mov	x1, xzr
 12e5524: 94477241     	bl	0x24c1e28 <__start_il2cpp+0x131a664>
 12e5528: aa1703e0     	mov	x0, x23
 12e552c: aa1f03e1     	mov	x1, xzr
 12e5530: 944742f7     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e5534: b4004ec0     	cbz	x0, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e5538: 1e2703e0     	fmov	s0, wzr
 12e553c: 1e211001     	fmov	s1, #3.00000000
 12e5540: 1e353002     	fmov	s2, #-12.50000000
 12e5544: 14000022     	b	0x12e55cc <__start_il2cpp+0x13de08>
 12e5548: aa0c03e0     	mov	x0, x12
 12e554c: aa1f03e1     	mov	x1, xzr
 12e5550: 944742ef     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e5554: b4004dc0     	cbz	x0, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e5558: 1e2703e0     	fmov	s0, wzr
 12e555c: 1e211001     	fmov	s1, #3.00000000
 12e5560: 1e273002     	fmov	s2, #25.00000000
 12e5564: aa1f03e1     	mov	x1, xzr
 12e5568: 94477230     	bl	0x24c1e28 <__start_il2cpp+0x131a664>
 12e556c: aa1703e0     	mov	x0, x23
 12e5570: aa1f03e1     	mov	x1, xzr
 12e5574: 944742e6     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e5578: b4004ca0     	cbz	x0, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e557c: 1e2703e0     	fmov	s0, wzr
 12e5580: 1e211001     	fmov	s1, #3.00000000
 12e5584: 1e253002     	fmov	s2, #12.50000000
 12e5588: 17ffffaa     	b	0x12e5430 <__start_il2cpp+0x13dc6c>
 12e558c: aa0c03e0     	mov	x0, x12
 12e5590: aa1f03e1     	mov	x1, xzr
 12e5594: 944742de     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e5598: b4004ba0     	cbz	x0, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e559c: 1e2703e0     	fmov	s0, wzr
 12e55a0: 1e211001     	fmov	s1, #3.00000000
 12e55a4: 1e273002     	fmov	s2, #25.00000000
 12e55a8: aa1f03e1     	mov	x1, xzr
 12e55ac: 9447721f     	bl	0x24c1e28 <__start_il2cpp+0x131a664>
 12e55b0: aa1703e0     	mov	x0, x23
 12e55b4: aa1f03e1     	mov	x1, xzr
 12e55b8: 944742d5     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e55bc: b4004a80     	cbz	x0, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e55c0: 1e2703e0     	fmov	s0, wzr
 12e55c4: 1e211001     	fmov	s1, #3.00000000
 12e55c8: 1e253002     	fmov	s2, #12.50000000
 12e55cc: aa1f03e1     	mov	x1, xzr
 12e55d0: 94477216     	bl	0x24c1e28 <__start_il2cpp+0x131a664>
 12e55d4: aa1503e0     	mov	x0, x21
 12e55d8: aa1f03e1     	mov	x1, xzr
 12e55dc: 944742cc     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e55e0: b4004960     	cbz	x0, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e55e4: 1e2703e0     	fmov	s0, wzr
 12e55e8: 1e211001     	fmov	s1, #3.00000000
 12e55ec: 1e2703e2     	fmov	s2, wzr
 12e55f0: aa1f03e1     	mov	x1, xzr
 12e55f4: 9447720d     	bl	0x24c1e28 <__start_il2cpp+0x131a664>
 12e55f8: aa1803e0     	mov	x0, x24
 12e55fc: aa1f03e1     	mov	x1, xzr
 12e5600: 944742c3     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e5604: b4004840     	cbz	x0, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e5608: 1e253000     	fmov	s0, #12.50000000
 12e560c: 1e211001     	fmov	s1, #3.00000000
 12e5610: 1e2703e2     	fmov	s2, wzr
 12e5614: aa1f03e1     	mov	x1, xzr
 12e5618: 94477204     	bl	0x24c1e28 <__start_il2cpp+0x131a664>
 12e561c: aa1903e0     	mov	x0, x25
 12e5620: aa1f03e1     	mov	x1, xzr
 12e5624: 944742ba     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e5628: b4004720     	cbz	x0, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e562c: 1e273000     	fmov	s0, #25.00000000
 12e5630: 1e211001     	fmov	s1, #3.00000000
 12e5634: 1e2703e2     	fmov	s2, wzr
 12e5638: aa1f03e1     	mov	x1, xzr
 12e563c: 944771fb     	bl	0x24c1e28 <__start_il2cpp+0x131a664>
 12e5640: b9403668     	ldr	w8, [x19, #0x34]
 12e5644: 3940f269     	ldrb	w9, [x19, #0x3c]
 12e5648: 1e211000     	fmov	s0, #3.00000000
 12e564c: 1e265001     	fmov	s1, #18.00000000
 12e5650: 71000d1f     	cmp	w8, #0x3
 12e5654: 1e200c20     	fcsel	s0, s1, s0, eq
 12e5658: 7100051f     	cmp	w8, #0x1
 12e565c: 1e351001     	fmov	s1, #-12.00000000
 12e5660: 1e200c28     	fcsel	s8, s1, s0, eq
 12e5664: 34000269     	cbz	w9, 0x12e56b0 <__start_il2cpp+0x13deec>
 12e5668: b9403a68     	ldr	w8, [x19, #0x38]
 12e566c: 7100091f     	cmp	w8, #0x2
 12e5670: 54000200     	b.eq	0x12e56b0 <__start_il2cpp+0x13deec>
 12e5674: 7100151f     	cmp	w8, #0x5
 12e5678: 540001c0     	b.eq	0x12e56b0 <__start_il2cpp+0x13deec>
 12e567c: 7100191f     	cmp	w8, #0x6
 12e5680: 540002c1     	b.ne	0x12e56d8 <__start_il2cpp+0x13df14>
 12e5684: 52800041     	mov	w1, #0x2                // =2
 12e5688: 2a1f03e0     	mov	w0, wzr
 12e568c: aa1f03e2     	mov	x2, xzr
 12e5690: 94473a16     	bl	0x24b3ee8 <__start_il2cpp+0x130c724>
 12e5694: 34000120     	cbz	w0, 0x12e56b8 <__start_il2cpp+0x13def4>
 12e5698: b9403a68     	ldr	w8, [x19, #0x38]
 12e569c: 4ea81d0b     	mov	v11.16b, v8.16b
 12e56a0: 4ea81d0a     	mov	v10.16b, v8.16b
 12e56a4: 7100191f     	cmp	w8, #0x6
 12e56a8: 54000181     	b.ne	0x12e56d8 <__start_il2cpp+0x13df14>
 12e56ac: 1400001d     	b	0x12e5720 <__start_il2cpp+0x13df5c>
 12e56b0: 4ea81d0b     	mov	v11.16b, v8.16b
 12e56b4: 1400001a     	b	0x12e571c <__start_il2cpp+0x13df58>
 12e56b8: f9400340     	ldr	x0, [x26]
 12e56bc: b940e008     	ldr	w8, [x0, #0xe0]
 12e56c0: 35000068     	cbnz	w8, 0x12e56cc <__start_il2cpp+0x13df08>
 12e56c4: 97f76a47     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e56c8: f9400340     	ldr	x0, [x26]
 12e56cc: f9405c08     	ldr	x8, [x0, #0xb8]
 12e56d0: 39405508     	ldrb	w8, [x8, #0x15]
 12e56d4: 34fffe28     	cbz	w8, 0x12e5698 <__start_il2cpp+0x13ded4>
 12e56d8: b9403668     	ldr	w8, [x19, #0x34]
 12e56dc: 52a84089     	mov	w9, #0x42040000         // =1107558400
 12e56e0: 1e265000     	fmov	s0, #18.00000000
 12e56e4: 1e270121     	fmov	s1, w9
 12e56e8: 52a84189     	mov	w9, #0x420c0000         // =1108082688
 12e56ec: 71000d1f     	cmp	w8, #0x3
 12e56f0: 1e269002     	fmov	s2, #20.00000000
 12e56f4: 1e200c20     	fcsel	s0, s1, s0, eq
 12e56f8: 1e270121     	fmov	s1, w9
 12e56fc: 1e220c21     	fcsel	s1, s1, s2, eq
 12e5700: 1e211002     	fmov	s2, #3.00000000
 12e5704: 7100051f     	cmp	w8, #0x1
 12e5708: 1e200c48     	fcsel	s8, s2, s0, eq
 12e570c: 1e229000     	fmov	s0, #5.00000000
 12e5710: 1e210c0b     	fcsel	s11, s0, s1, eq
 12e5714: 52800028     	mov	w8, #0x1                // =1
 12e5718: 39013268     	strb	w8, [x19, #0x4c]
 12e571c: 4ea81d0a     	mov	v10.16b, v8.16b
 12e5720: f9400340     	ldr	x0, [x26]
 12e5724: b940e008     	ldr	w8, [x0, #0xe0]
 12e5728: 35000068     	cbnz	w8, 0x12e5734 <__start_il2cpp+0x13df70>
 12e572c: 97f76a2d     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e5730: f9400340     	ldr	x0, [x26]
 12e5734: f9405c08     	ldr	x8, [x0, #0xb8]
 12e5738: b9403a6a     	ldr	w10, [x19, #0x38]
 12e573c: 39405909     	ldrb	w9, [x8, #0x16]
 12e5740: 39404d0b     	ldrb	w11, [x8, #0x13]
 12e5744: 39405108     	ldrb	w8, [x8, #0x14]
 12e5748: 7100013f     	cmp	w9, #0x0
 12e574c: 1a9f07fc     	cset	w28, ne
 12e5750: 7100017f     	cmp	w11, #0x0
 12e5754: 1a9f07f6     	cset	w22, ne
 12e5758: 7100095f     	cmp	w10, #0x2
 12e575c: 54000501     	b.ne	0x12e57fc <__start_il2cpp+0x13e038>
 12e5760: b9403269     	ldr	w9, [x19, #0x30]
 12e5764: 5100452b     	sub	w11, w9, #0x11
 12e5768: 7100357f     	cmp	w11, #0xd
 12e576c: 54000448     	b.hi	0x12e57f4 <__start_il2cpp+0x13e030>
 12e5770: d0ff9e8c     	adrp	x12, 0x6b7000
 12e5774: 9131658c     	add	x12, x12, #0xc59
 12e5778: 1000010d     	adr	x13, 0x12e5798 <__start_il2cpp+0x13dfd4>
 12e577c: 386b698e     	ldrb	w14, [x12, x11]
 12e5780: 8b0e09ad     	add	x13, x13, x14, lsl #2
 12e5784: 2a1f03fc     	mov	w28, wzr
 12e5788: 2a1f03e9     	mov	w9, wzr
 12e578c: 2a1f03ea     	mov	w10, wzr
 12e5790: 2a1f03f6     	mov	w22, wzr
 12e5794: d61f01a0     	br	x13
 12e5798: 7100069f     	cmp	w20, #0x1
 12e579c: 54000240     	b.eq	0x12e57e4 <__start_il2cpp+0x13e020>
 12e57a0: 71000e9f     	cmp	w20, #0x3
 12e57a4: 540006e0     	b.eq	0x12e5880 <__start_il2cpp+0x13e0bc>
 12e57a8: 14000013     	b	0x12e57f4 <__start_il2cpp+0x13e030>
 12e57ac: 7100069f     	cmp	w20, #0x1
 12e57b0: 54000680     	b.eq	0x12e5880 <__start_il2cpp+0x13e0bc>
 12e57b4: 71000e9f     	cmp	w20, #0x3
 12e57b8: 54000160     	b.eq	0x12e57e4 <__start_il2cpp+0x13e020>
 12e57bc: 1400000e     	b	0x12e57f4 <__start_il2cpp+0x13e030>
 12e57c0: 71000a9f     	cmp	w20, #0x2
 12e57c4: 54000100     	b.eq	0x12e57e4 <__start_il2cpp+0x13e020>
 12e57c8: 7100129f     	cmp	w20, #0x4
 12e57cc: 540005a0     	b.eq	0x12e5880 <__start_il2cpp+0x13e0bc>
 12e57d0: 14000009     	b	0x12e57f4 <__start_il2cpp+0x13e030>
 12e57d4: 71000a9f     	cmp	w20, #0x2
 12e57d8: 54000540     	b.eq	0x12e5880 <__start_il2cpp+0x13e0bc>
 12e57dc: 7100129f     	cmp	w20, #0x4
 12e57e0: 540000a1     	b.ne	0x12e57f4 <__start_il2cpp+0x13e030>
 12e57e4: 2a1f03fc     	mov	w28, wzr
 12e57e8: 2a1f03e9     	mov	w9, wzr
 12e57ec: 2a1f03f6     	mov	w22, wzr
 12e57f0: 14000004     	b	0x12e5800 <__start_il2cpp+0x13e03c>
 12e57f4: 2a1f03fc     	mov	w28, wzr
 12e57f8: 2a1f03f6     	mov	w22, wzr
 12e57fc: 2a0803e9     	mov	w9, w8
 12e5800: 2a0803ea     	mov	w10, w8
 12e5804: f94003a0     	ldr	x0, [x29]
 12e5808: 7100015f     	cmp	w10, #0x0
 12e580c: 1a9f07f7     	cset	w23, ne
 12e5810: 7100013f     	cmp	w9, #0x0
 12e5814: b940e008     	ldr	w8, [x0, #0xe0]
 12e5818: 1a9f07f5     	cset	w21, ne
 12e581c: 35000048     	cbnz	w8, 0x12e5824 <__start_il2cpp+0x13e060>
 12e5820: 97f769f0     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e5824: aa1b03e0     	mov	x0, x27
 12e5828: aa1f03e1     	mov	x1, xzr
 12e582c: aa1f03e2     	mov	x2, xzr
 12e5830: 94474c06     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12e5834: f9000bf9     	str	x25, [sp, #0x10]
 12e5838: 360001c0     	tbz	w0, #0x0, 0x12e5870 <__start_il2cpp+0x13e0ac>
 12e583c: b9404b68     	ldr	w8, [x27, #0x48]
 12e5840: aa1803f9     	mov	x25, x24
 12e5844: 7100051f     	cmp	w8, #0x1
 12e5848: 54000260     	b.eq	0x12e5894 <__start_il2cpp+0x13e0d0>
 12e584c: 7100091f     	cmp	w8, #0x2
 12e5850: 540002c0     	b.eq	0x12e58a8 <__start_il2cpp+0x13e0e4>
 12e5854: 71000d1f     	cmp	w8, #0x3
 12e5858: 54000341     	b.ne	0x12e58c0 <__start_il2cpp+0x13e0fc>
 12e585c: 2a1f03fa     	mov	w26, wzr
 12e5860: 2a1f03fd     	mov	w29, wzr
 12e5864: 2a1f03f7     	mov	w23, wzr
 12e5868: 2a1f03f6     	mov	w22, wzr
 12e586c: 14000017     	b	0x12e58c8 <__start_il2cpp+0x13e104>
 12e5870: aa1803f9     	mov	x25, x24
 12e5874: 2a1c03fd     	mov	w29, w28
 12e5878: 2a1c03f8     	mov	w24, w28
 12e587c: 14000024     	b	0x12e590c <__start_il2cpp+0x13e148>
 12e5880: 2a1f03fc     	mov	w28, wzr
 12e5884: 2a1f03ea     	mov	w10, wzr
 12e5888: 2a1f03f6     	mov	w22, wzr
 12e588c: 2a0803e9     	mov	w9, w8
 12e5890: 17ffffdd     	b	0x12e5804 <__start_il2cpp+0x13e040>
 12e5894: 2a1f03fa     	mov	w26, wzr
 12e5898: 2a1f03f5     	mov	w21, wzr
 12e589c: 2a1f03f7     	mov	w23, wzr
 12e58a0: 2a1c03fd     	mov	w29, w28
 12e58a4: 14000005     	b	0x12e58b8 <__start_il2cpp+0x13e0f4>
 12e58a8: 2a1f03fd     	mov	w29, wzr
 12e58ac: 2a1f03f5     	mov	w21, wzr
 12e58b0: 2a1f03f6     	mov	w22, wzr
 12e58b4: 2a1c03fa     	mov	w26, w28
 12e58b8: 2a1f03fc     	mov	w28, wzr
 12e58bc: 14000003     	b	0x12e58c8 <__start_il2cpp+0x13e104>
 12e58c0: 2a1c03fa     	mov	w26, w28
 12e58c4: 2a1c03fd     	mov	w29, w28
 12e58c8: aa1303e0     	mov	x0, x19
 12e58cc: 2a1c03f8     	mov	w24, w28
 12e58d0: 97fff3f8     	bl	0x12e28b0 <__start_il2cpp+0x13b0ec>
 12e58d4: 2a1a03fc     	mov	w28, w26
 12e58d8: 36000120     	tbz	w0, #0x0, 0x12e58fc <__start_il2cpp+0x13e138>
 12e58dc: b9404b68     	ldr	w8, [x27, #0x48]
 12e58e0: 7100051f     	cmp	w8, #0x1
 12e58e4: 54000341     	b.ne	0x12e594c <__start_il2cpp+0x13e188>
 12e58e8: 2a1f03fc     	mov	w28, wzr
 12e58ec: 2a1f03fd     	mov	w29, wzr
 12e58f0: 2a1f03f8     	mov	w24, wzr
 12e58f4: 2a1f03f5     	mov	w21, wzr
 12e58f8: 2a1f03f7     	mov	w23, wzr
 12e58fc: 39413368     	ldrb	w8, [x27, #0x4c]
 12e5900: 34000068     	cbz	w8, 0x12e590c <__start_il2cpp+0x13e148>
 12e5904: 39413268     	ldrb	w8, [x19, #0x4c]
 12e5908: 340006c8     	cbz	w8, 0x12e59e0 <__start_il2cpp+0x13e21c>
 12e590c: 9000abc8     	adrp	x8, 0x285d000
 12e5910: f9456108     	ldr	x8, [x8, #0xac0]
 12e5914: 528000e1     	mov	w1, #0x7                // =7
 12e5918: f9400100     	ldr	x0, [x8]
 12e591c: 97f7698d     	bl	0x10bff50 <CloseNLSocket+0x488>
 12e5920: aa0003fb     	mov	x27, x0
 12e5924: 4eab1d6c     	mov	v12.16b, v11.16b
 12e5928: 4eab1d69     	mov	v9.16b, v11.16b
 12e592c: 340009d6     	cbz	w22, 0x12e5a64 <__start_il2cpp+0x13e2a0>
 12e5930: b4002efb     	cbz	x27, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e5934: b9401b68     	ldr	w8, [x27, #0x18]
 12e5938: 34002ec8     	cbz	w8, 0x12e5f10 <__start_il2cpp+0x13e74c>
 12e593c: 52800021     	mov	w1, #0x1                // =1
 12e5940: b900237f     	str	wzr, [x27, #0x20]
 12e5944: 37000977     	tbnz	w23, #0x0, 0x12e5a70 <__start_il2cpp+0x13e2ac>
 12e5948: 14000055     	b	0x12e5a9c <__start_il2cpp+0x13e2d8>
 12e594c: f9400fe0     	ldr	x0, [sp, #0x18]
 12e5950: aa1f03e1     	mov	x1, xzr
 12e5954: 944741ee     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e5958: a94253f3     	ldp	x19, x20, [sp, #0x20]
 12e595c: f94007f6     	ldr	x22, [sp, #0x8]
 12e5960: b4002d76     	cbz	x22, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e5964: aa0003e1     	mov	x1, x0
 12e5968: aa1603e0     	mov	x0, x22
 12e596c: aa1f03e2     	mov	x2, xzr
 12e5970: 97fb9ae2     	bl	0x11cc4f8 <__start_il2cpp+0x24d34>
 12e5974: aa1303e0     	mov	x0, x19
 12e5978: aa1f03e1     	mov	x1, xzr
 12e597c: 944741e4     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e5980: aa0003e1     	mov	x1, x0
 12e5984: aa1603e0     	mov	x0, x22
 12e5988: aa1f03e2     	mov	x2, xzr
 12e598c: 97fb9adb     	bl	0x11cc4f8 <__start_il2cpp+0x24d34>
 12e5990: aa1403e0     	mov	x0, x20
 12e5994: aa1f03e1     	mov	x1, xzr
 12e5998: 944741dd     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e599c: aa0003e1     	mov	x1, x0
 12e59a0: aa1603e0     	mov	x0, x22
 12e59a4: aa1f03e2     	mov	x2, xzr
 12e59a8: 97fb9ad4     	bl	0x11cc4f8 <__start_il2cpp+0x24d34>
 12e59ac: aa1903e0     	mov	x0, x25
 12e59b0: aa1f03e1     	mov	x1, xzr
 12e59b4: 944741d6     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e59b8: aa0003e1     	mov	x1, x0
 12e59bc: aa1603e0     	mov	x0, x22
 12e59c0: aa1f03e2     	mov	x2, xzr
 12e59c4: 97fb9acd     	bl	0x11cc4f8 <__start_il2cpp+0x24d34>
 12e59c8: f9400be0     	ldr	x0, [sp, #0x10]
 12e59cc: aa1f03e1     	mov	x1, xzr
 12e59d0: 944741cf     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e59d4: aa0003e1     	mov	x1, x0
 12e59d8: aa1603e0     	mov	x0, x22
 12e59dc: 1400011d     	b	0x12e5e50 <__start_il2cpp+0x13e68c>
 12e59e0: b9403668     	ldr	w8, [x19, #0x34]
 12e59e4: 1e2703e0     	fmov	s0, wzr
 12e59e8: 7100051f     	cmp	w8, #0x1
 12e59ec: 540000e1     	b.ne	0x12e5a08 <__start_il2cpp+0x13e244>
 12e59f0: 1e35d001     	fmov	s1, #-15.00000000
 12e59f4: 1e34500c     	fmov	s12, #-9.00000000
 12e59f8: 1e32100b     	fmov	s11, #-4.00000000
 12e59fc: 1e359009     	fmov	s9, #-14.00000000
 12e5a00: 1e2703ea     	fmov	s10, wzr
 12e5a04: 14000010     	b	0x12e5a44 <__start_il2cpp+0x13e280>
 12e5a08: 71000d1f     	cmp	w8, #0x3
 12e5a0c: 1e25d001     	fmov	s1, #15.00000000
 12e5a10: 1e27d002     	fmov	s2, #30.00000000
 12e5a14: 1e24d003     	fmov	s3, #11.00000000
 12e5a18: 1e275004     	fmov	s4, #26.00000000
 12e5a1c: 1e231005     	fmov	s5, #6.00000000
 12e5a20: 1e26b006     	fmov	s6, #21.00000000
 12e5a24: 1e2e1007     	fmov	s7, #1.00000000
 12e5a28: 1e261010     	fmov	s16, #16.00000000
 12e5a2c: 1e2703f1     	fmov	s17, wzr
 12e5a30: 1e210c4a     	fcsel	s10, s2, s1, eq
 12e5a34: 1e230c8b     	fcsel	s11, s4, s3, eq
 12e5a38: 1e250ccc     	fcsel	s12, s6, s5, eq
 12e5a3c: 1e270e09     	fcsel	s9, s16, s7, eq
 12e5a40: 1e310c21     	fcsel	s1, s1, s17, eq
 12e5a44: 9000abc8     	adrp	x8, 0x285d000
 12e5a48: f9456108     	ldr	x8, [x8, #0xac0]
 12e5a4c: 528000e1     	mov	w1, #0x7                // =7
 12e5a50: 1e202828     	fadd	s8, s1, s0
 12e5a54: f9400100     	ldr	x0, [x8]
 12e5a58: 97f7693e     	bl	0x10bff50 <CloseNLSocket+0x488>
 12e5a5c: aa0003fb     	mov	x27, x0
 12e5a60: 3707f696     	tbnz	w22, #0x0, 0x12e5930 <__start_il2cpp+0x13e16c>
 12e5a64: 340001b7     	cbz	w23, 0x12e5a98 <__start_il2cpp+0x13e2d4>
 12e5a68: b400253b     	cbz	x27, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e5a6c: 2a1f03e1     	mov	w1, wzr
 12e5a70: b9401b68     	ldr	w8, [x27, #0x18]
 12e5a74: 6b08003f     	cmp	w1, w8
 12e5a78: 540024c2     	b.hs	0x12e5f10 <__start_il2cpp+0x13e74c>
 12e5a7c: f94013f6     	ldr	x22, [sp, #0x20]
 12e5a80: 8b214b68     	add	x8, x27, w1, uxtw #2
 12e5a84: 52800029     	mov	w9, #0x1                // =1
 12e5a88: 11000421     	add	w1, w1, #0x1
 12e5a8c: b9002109     	str	w9, [x8, #0x20]
 12e5a90: 370000d5     	tbnz	w21, #0x0, 0x12e5aa8 <__start_il2cpp+0x13e2e4>
 12e5a94: 14000010     	b	0x12e5ad4 <__start_il2cpp+0x13e310>
 12e5a98: 2a1f03e1     	mov	w1, wzr
 12e5a9c: 340001b5     	cbz	w21, 0x12e5ad0 <__start_il2cpp+0x13e30c>
 12e5aa0: f94013f6     	ldr	x22, [sp, #0x20]
 12e5aa4: b400235b     	cbz	x27, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e5aa8: b9401b68     	ldr	w8, [x27, #0x18]
 12e5aac: 6b08003f     	cmp	w1, w8
 12e5ab0: 54002302     	b.hs	0x12e5f10 <__start_il2cpp+0x13e74c>
 12e5ab4: f94017f5     	ldr	x21, [sp, #0x28]
 12e5ab8: 8b214b68     	add	x8, x27, w1, uxtw #2
 12e5abc: 52800049     	mov	w9, #0x2                // =2
 12e5ac0: 11000421     	add	w1, w1, #0x1
 12e5ac4: b9002109     	str	w9, [x8, #0x20]
 12e5ac8: 370000dd     	tbnz	w29, #0x0, 0x12e5ae0 <__start_il2cpp+0x13e31c>
 12e5acc: 14000010     	b	0x12e5b0c <__start_il2cpp+0x13e348>
 12e5ad0: f94013f6     	ldr	x22, [sp, #0x20]
 12e5ad4: 340001bd     	cbz	w29, 0x12e5b08 <__start_il2cpp+0x13e344>
 12e5ad8: f94017f5     	ldr	x21, [sp, #0x28]
 12e5adc: b400219b     	cbz	x27, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e5ae0: b9401b68     	ldr	w8, [x27, #0x18]
 12e5ae4: 6b08003f     	cmp	w1, w8
 12e5ae8: 54002142     	b.hs	0x12e5f10 <__start_il2cpp+0x13e74c>
 12e5aec: 8b214b68     	add	x8, x27, w1, uxtw #2
 12e5af0: 52800069     	mov	w9, #0x3                // =3
 12e5af4: 11000421     	add	w1, w1, #0x1
 12e5af8: b9002109     	str	w9, [x8, #0x20]
 12e5afc: 36000238     	tbz	w24, #0x0, 0x12e5b40 <__start_il2cpp+0x13e37c>
 12e5b00: 52800028     	mov	w8, #0x1                // =1
 12e5b04: 14000005     	b	0x12e5b18 <__start_il2cpp+0x13e354>
 12e5b08: f94017f5     	ldr	x21, [sp, #0x28]
 12e5b0c: 340002f8     	cbz	w24, 0x12e5b68 <__start_il2cpp+0x13e3a4>
 12e5b10: b4001ffb     	cbz	x27, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e5b14: 2a1f03e8     	mov	w8, wzr
 12e5b18: b9401b69     	ldr	w9, [x27, #0x18]
 12e5b1c: 6b09003f     	cmp	w1, w9
 12e5b20: 54001f82     	b.hs	0x12e5f10 <__start_il2cpp+0x13e74c>
 12e5b24: f9400bf8     	ldr	x24, [sp, #0x10]
 12e5b28: 8b214b69     	add	x9, x27, w1, uxtw #2
 12e5b2c: 5280008a     	mov	w10, #0x4               // =4
 12e5b30: 11000421     	add	w1, w1, #0x1
 12e5b34: b900212a     	str	w10, [x9, #0x20]
 12e5b38: 35000068     	cbnz	w8, 0x12e5b44 <__start_il2cpp+0x13e380>
 12e5b3c: 1400000c     	b	0x12e5b6c <__start_il2cpp+0x13e3a8>
 12e5b40: f9400bf8     	ldr	x24, [sp, #0x10]
 12e5b44: b9401b68     	ldr	w8, [x27, #0x18]
 12e5b48: 6b08003f     	cmp	w1, w8
 12e5b4c: 54001e22     	b.hs	0x12e5f10 <__start_il2cpp+0x13e74c>
 12e5b50: 8b214b68     	add	x8, x27, w1, uxtw #2
 12e5b54: 528000a9     	mov	w9, #0x5                // =5
 12e5b58: 11000421     	add	w1, w1, #0x1
 12e5b5c: b9002109     	str	w9, [x8, #0x20]
 12e5b60: 370000bc     	tbnz	w28, #0x0, 0x12e5b74 <__start_il2cpp+0x13e3b0>
 12e5b64: 1400000b     	b	0x12e5b90 <__start_il2cpp+0x13e3cc>
 12e5b68: f9400bf8     	ldr	x24, [sp, #0x10]
 12e5b6c: 34000d9c     	cbz	w28, 0x12e5d1c <__start_il2cpp+0x13e558>
 12e5b70: b4001cfb     	cbz	x27, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e5b74: b9401b68     	ldr	w8, [x27, #0x18]
 12e5b78: 6b08003f     	cmp	w1, w8
 12e5b7c: 54001ca2     	b.hs	0x12e5f10 <__start_il2cpp+0x13e74c>
 12e5b80: 8b214b68     	add	x8, x27, w1, uxtw #2
 12e5b84: 528000c9     	mov	w9, #0x6                // =6
 12e5b88: 11000421     	add	w1, w1, #0x1
 12e5b8c: b9002109     	str	w9, [x8, #0x20]
 12e5b90: 2a1f03e0     	mov	w0, wzr
 12e5b94: aa1f03e2     	mov	x2, xzr
 12e5b98: bd0023ec     	str	s12, [sp, #0x20]
 12e5b9c: bd002be8     	str	s8, [sp, #0x28]
 12e5ba0: 944738d2     	bl	0x24b3ee8 <__start_il2cpp+0x130c724>
 12e5ba4: b9401b68     	ldr	w8, [x27, #0x18]
 12e5ba8: 6b08001f     	cmp	w0, w8
 12e5bac: 54001b22     	b.hs	0x12e5f10 <__start_il2cpp+0x13e74c>
 12e5bb0: 8b20cb68     	add	x8, x27, w0, sxtw #2
 12e5bb4: b9802108     	ldrsw	x8, [x8, #0x20]
 12e5bb8: 4eab1d68     	mov	v8.16b, v11.16b
 12e5bbc: 4eaa1d4c     	mov	v12.16b, v10.16b
 12e5bc0: 1e2703ed     	fmov	s13, wzr
 12e5bc4: 1e2703ee     	fmov	s14, wzr
 12e5bc8: 1e2703ef     	fmov	s15, wzr
 12e5bcc: 71001d1f     	cmp	w8, #0x7
 12e5bd0: 1e2703ea     	fmov	s10, wzr
 12e5bd4: 1e2703eb     	fmov	s11, wzr
 12e5bd8: 540002e2     	b.hs	0x12e5c34 <__start_il2cpp+0x13e470>
 12e5bdc: d0ff9e8b     	adrp	x11, 0x6b7000
 12e5be0: 9132a16b     	add	x11, x11, #0xca8
 12e5be4: bc68796d     	ldr	s13, [x11, x8, lsl #2]
 12e5be8: d0ff9e8b     	adrp	x11, 0x6b7000
 12e5bec: 9133116b     	add	x11, x11, #0xcc4
 12e5bf0: bc68796e     	ldr	s14, [x11, x8, lsl #2]
 12e5bf4: d0ff9e8b     	adrp	x11, 0x6b7000
 12e5bf8: 9133816b     	add	x11, x11, #0xce0
 12e5bfc: bc68796f     	ldr	s15, [x11, x8, lsl #2]
 12e5c00: d0ff9e8b     	adrp	x11, 0x6b7000
 12e5c04: 9133f16b     	add	x11, x11, #0xcfc
 12e5c08: d0ff9e89     	adrp	x9, 0x6b7000
 12e5c0c: d0ff9e8a     	adrp	x10, 0x6b7000
 12e5c10: bc68796a     	ldr	s10, [x11, x8, lsl #2]
 12e5c14: d0ff9e8b     	adrp	x11, 0x6b7000
 12e5c18: 9131c129     	add	x9, x9, #0xc70
 12e5c1c: 9132314a     	add	x10, x10, #0xc8c
 12e5c20: 9134616b     	add	x11, x11, #0xd18
 12e5c24: b8687929     	ldr	w9, [x9, x8, lsl #2]
 12e5c28: b868794a     	ldr	w10, [x10, x8, lsl #2]
 12e5c2c: bc68796b     	ldr	s11, [x11, x8, lsl #2]
 12e5c30: 2908aa69     	stp	w9, w10, [x19, #0x44]
 12e5c34: b9403668     	ldr	w8, [x19, #0x34]
 12e5c38: 71000d1f     	cmp	w8, #0x3
 12e5c3c: 54000101     	b.ne	0x12e5c5c <__start_il2cpp+0x13e498>
 12e5c40: d0ff9d88     	adrp	x8, 0x697000
 12e5c44: bd455d00     	ldr	s0, [x8, #0x55c]
 12e5c48: 1e20096b     	fmul	s11, s11, s0
 12e5c4c: 1e20094a     	fmul	s10, s10, s0
 12e5c50: 1e2009ef     	fmul	s15, s15, s0
 12e5c54: 1e2009ce     	fmul	s14, s14, s0
 12e5c58: 1e2009ad     	fmul	s13, s13, s0
 12e5c5c: aa1303e0     	mov	x0, x19
 12e5c60: 97fff41e     	bl	0x12e2cd8 <__start_il2cpp+0x13b514>
 12e5c64: 360002c0     	tbz	w0, #0x0, 0x12e5cbc <__start_il2cpp+0x13e4f8>
 12e5c68: 71000e9f     	cmp	w20, #0x3
 12e5c6c: 540006e0     	b.eq	0x12e5d48 <__start_il2cpp+0x13e584>
 12e5c70: 7100069f     	cmp	w20, #0x1
 12e5c74: 54001461     	b.ne	0x12e5f00 <__start_il2cpp+0x13e73c>
 12e5c78: f9400ff4     	ldr	x20, [sp, #0x18]
 12e5c7c: 1e214160     	fneg	s0, s11
 12e5c80: aa1403e0     	mov	x0, x20
 12e5c84: 97ffebd3     	bl	0x12e0bd0 <__start_il2cpp+0x13940c>
 12e5c88: 1e214140     	fneg	s0, s10
 12e5c8c: aa1603e0     	mov	x0, x22
 12e5c90: 97ffebd0     	bl	0x12e0bd0 <__start_il2cpp+0x13940c>
 12e5c94: 1e2141e0     	fneg	s0, s15
 12e5c98: aa1503e0     	mov	x0, x21
 12e5c9c: 97ffebcd     	bl	0x12e0bd0 <__start_il2cpp+0x13940c>
 12e5ca0: 1e2141c0     	fneg	s0, s14
 12e5ca4: aa1903e0     	mov	x0, x25
 12e5ca8: 97ffebca     	bl	0x12e0bd0 <__start_il2cpp+0x13940c>
 12e5cac: 1e2141a0     	fneg	s0, s13
 12e5cb0: aa1803e0     	mov	x0, x24
 12e5cb4: 97ffebc7     	bl	0x12e0bd0 <__start_il2cpp+0x13940c>
 12e5cb8: 14000083     	b	0x12e5ec4 <__start_il2cpp+0x13e700>
 12e5cbc: aa1303e0     	mov	x0, x19
 12e5cc0: 97fff425     	bl	0x12e2d54 <__start_il2cpp+0x13b590>
 12e5cc4: 360003e0     	tbz	w0, #0x0, 0x12e5d40 <__start_il2cpp+0x13e57c>
 12e5cc8: 7100129f     	cmp	w20, #0x4
 12e5ccc: 54000dc0     	b.eq	0x12e5e84 <__start_il2cpp+0x13e6c0>
 12e5cd0: 71000a9f     	cmp	w20, #0x2
 12e5cd4: 54001161     	b.ne	0x12e5f00 <__start_il2cpp+0x13e73c>
 12e5cd8: f9400ff4     	ldr	x20, [sp, #0x18]
 12e5cdc: 4eab1d60     	mov	v0.16b, v11.16b
 12e5ce0: aa1403e0     	mov	x0, x20
 12e5ce4: 97ffebf9     	bl	0x12e0cc8 <__start_il2cpp+0x139504>
 12e5ce8: aa1603e0     	mov	x0, x22
 12e5cec: 4eaa1d40     	mov	v0.16b, v10.16b
 12e5cf0: 97ffebf6     	bl	0x12e0cc8 <__start_il2cpp+0x139504>
 12e5cf4: aa1503e0     	mov	x0, x21
 12e5cf8: 4eaf1de0     	mov	v0.16b, v15.16b
 12e5cfc: 97ffebf3     	bl	0x12e0cc8 <__start_il2cpp+0x139504>
 12e5d00: aa1903e0     	mov	x0, x25
 12e5d04: 4eae1dc0     	mov	v0.16b, v14.16b
 12e5d08: 97ffebf0     	bl	0x12e0cc8 <__start_il2cpp+0x139504>
 12e5d0c: aa1803e0     	mov	x0, x24
 12e5d10: 4ead1da0     	mov	v0.16b, v13.16b
 12e5d14: 97ffebed     	bl	0x12e0cc8 <__start_il2cpp+0x139504>
 12e5d18: 1400001c     	b	0x12e5d88 <__start_il2cpp+0x13e5c4>
 12e5d1c: 7100043f     	cmp	w1, #0x1
 12e5d20: 5400052b     	b.lt	0x12e5dc4 <__start_il2cpp+0x13e600>
 12e5d24: 2a1f03e0     	mov	w0, wzr
 12e5d28: aa1f03e2     	mov	x2, xzr
 12e5d2c: 9447386f     	bl	0x24b3ee8 <__start_il2cpp+0x130c724>
 12e5d30: b4000efb     	cbz	x27, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e5d34: bd0023ec     	str	s12, [sp, #0x20]
 12e5d38: bd002be8     	str	s8, [sp, #0x28]
 12e5d3c: 17ffff9a     	b	0x12e5ba4 <__start_il2cpp+0x13e3e0>
 12e5d40: f9400fe0     	ldr	x0, [sp, #0x18]
 12e5d44: 14000061     	b	0x12e5ec8 <__start_il2cpp+0x13e704>
 12e5d48: f9400ff4     	ldr	x20, [sp, #0x18]
 12e5d4c: 4ead1da0     	mov	v0.16b, v13.16b
 12e5d50: aa1403e0     	mov	x0, x20
 12e5d54: 97ffeb9f     	bl	0x12e0bd0 <__start_il2cpp+0x13940c>
 12e5d58: aa1603e0     	mov	x0, x22
 12e5d5c: 4eae1dc0     	mov	v0.16b, v14.16b
 12e5d60: 97ffeb9c     	bl	0x12e0bd0 <__start_il2cpp+0x13940c>
 12e5d64: aa1503e0     	mov	x0, x21
 12e5d68: 4eaf1de0     	mov	v0.16b, v15.16b
 12e5d6c: 97ffeb99     	bl	0x12e0bd0 <__start_il2cpp+0x13940c>
 12e5d70: aa1903e0     	mov	x0, x25
 12e5d74: 4eaa1d40     	mov	v0.16b, v10.16b
 12e5d78: 97ffeb96     	bl	0x12e0bd0 <__start_il2cpp+0x13940c>
 12e5d7c: aa1803e0     	mov	x0, x24
 12e5d80: 4eab1d60     	mov	v0.16b, v11.16b
 12e5d84: 97ffeb93     	bl	0x12e0bd0 <__start_il2cpp+0x13940c>
 12e5d88: bd402be0     	ldr	s0, [sp, #0x28]
 12e5d8c: aa1403e0     	mov	x0, x20
 12e5d90: 97ffebaf     	bl	0x12e0c4c <__start_il2cpp+0x139488>
 12e5d94: aa1603e0     	mov	x0, x22
 12e5d98: 4ea91d20     	mov	v0.16b, v9.16b
 12e5d9c: 97ffebac     	bl	0x12e0c4c <__start_il2cpp+0x139488>
 12e5da0: bd4023e0     	ldr	s0, [sp, #0x20]
 12e5da4: aa1503e0     	mov	x0, x21
 12e5da8: 97ffeba9     	bl	0x12e0c4c <__start_il2cpp+0x139488>
 12e5dac: aa1903e0     	mov	x0, x25
 12e5db0: 4ea81d00     	mov	v0.16b, v8.16b
 12e5db4: 97ffeba6     	bl	0x12e0c4c <__start_il2cpp+0x139488>
 12e5db8: aa1803e0     	mov	x0, x24
 12e5dbc: 4eac1d80     	mov	v0.16b, v12.16b
 12e5dc0: 1400004f     	b	0x12e5efc <__start_il2cpp+0x13e738>
 12e5dc4: f9400fe0     	ldr	x0, [sp, #0x18]
 12e5dc8: aa1f03e1     	mov	x1, xzr
 12e5dcc: 944740d0     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e5dd0: f94007f3     	ldr	x19, [sp, #0x8]
 12e5dd4: b40009d3     	cbz	x19, 0x12e5f0c <__start_il2cpp+0x13e748>
 12e5dd8: aa0003e1     	mov	x1, x0
 12e5ddc: aa1303e0     	mov	x0, x19
 12e5de0: aa1f03e2     	mov	x2, xzr
 12e5de4: 97fb99c5     	bl	0x11cc4f8 <__start_il2cpp+0x24d34>
 12e5de8: aa1603e0     	mov	x0, x22
 12e5dec: aa1f03e1     	mov	x1, xzr
 12e5df0: 944740c7     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e5df4: aa0003e1     	mov	x1, x0
 12e5df8: aa1303e0     	mov	x0, x19
 12e5dfc: aa1f03e2     	mov	x2, xzr
 12e5e00: 97fb99be     	bl	0x11cc4f8 <__start_il2cpp+0x24d34>
 12e5e04: aa1503e0     	mov	x0, x21
 12e5e08: aa1f03e1     	mov	x1, xzr
 12e5e0c: 944740c0     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e5e10: aa0003e1     	mov	x1, x0
 12e5e14: aa1303e0     	mov	x0, x19
 12e5e18: aa1f03e2     	mov	x2, xzr
 12e5e1c: 97fb99b7     	bl	0x11cc4f8 <__start_il2cpp+0x24d34>
 12e5e20: aa1903e0     	mov	x0, x25
 12e5e24: aa1f03e1     	mov	x1, xzr
 12e5e28: 944740b9     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e5e2c: aa0003e1     	mov	x1, x0
 12e5e30: aa1303e0     	mov	x0, x19
 12e5e34: aa1f03e2     	mov	x2, xzr
 12e5e38: 97fb99b0     	bl	0x11cc4f8 <__start_il2cpp+0x24d34>
 12e5e3c: aa1803e0     	mov	x0, x24
 12e5e40: aa1f03e1     	mov	x1, xzr
 12e5e44: 944740b2     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e5e48: aa0003e1     	mov	x1, x0
 12e5e4c: aa1303e0     	mov	x0, x19
 12e5e50: a94c4ff4     	ldp	x20, x19, [sp, #0xc0]
 12e5e54: a94b57f6     	ldp	x22, x21, [sp, #0xb0]
 12e5e58: a94a5ff8     	ldp	x24, x23, [sp, #0xa0]
 12e5e5c: a94967fa     	ldp	x26, x25, [sp, #0x90]
 12e5e60: a9486ffc     	ldp	x28, x27, [sp, #0x80]
 12e5e64: a9477bfd     	ldp	x29, x30, [sp, #0x70]
 12e5e68: 6d4623e9     	ldp	d9, d8, [sp, #0x60]
 12e5e6c: 6d452beb     	ldp	d11, d10, [sp, #0x50]
 12e5e70: 6d4433ed     	ldp	d13, d12, [sp, #0x40]
 12e5e74: 6d433bef     	ldp	d15, d14, [sp, #0x30]
 12e5e78: aa1f03e2     	mov	x2, xzr
 12e5e7c: 910343ff     	add	sp, sp, #0xd0
 12e5e80: 17fb999e     	b	0x11cc4f8 <__start_il2cpp+0x24d34>
 12e5e84: f9400ff4     	ldr	x20, [sp, #0x18]
 12e5e88: 1e2141a0     	fneg	s0, s13
 12e5e8c: aa1403e0     	mov	x0, x20
 12e5e90: 97ffeb8e     	bl	0x12e0cc8 <__start_il2cpp+0x139504>
 12e5e94: 1e2141c0     	fneg	s0, s14
 12e5e98: aa1603e0     	mov	x0, x22
 12e5e9c: 97ffeb8b     	bl	0x12e0cc8 <__start_il2cpp+0x139504>
 12e5ea0: 1e2141e0     	fneg	s0, s15
 12e5ea4: aa1503e0     	mov	x0, x21
 12e5ea8: 97ffeb88     	bl	0x12e0cc8 <__start_il2cpp+0x139504>
 12e5eac: 1e214140     	fneg	s0, s10
 12e5eb0: aa1903e0     	mov	x0, x25
 12e5eb4: 97ffeb85     	bl	0x12e0cc8 <__start_il2cpp+0x139504>
 12e5eb8: 1e214160     	fneg	s0, s11
 12e5ebc: aa1803e0     	mov	x0, x24
 12e5ec0: 97ffeb82     	bl	0x12e0cc8 <__start_il2cpp+0x139504>
 12e5ec4: aa1403e0     	mov	x0, x20
 12e5ec8: 4eac1d80     	mov	v0.16b, v12.16b
 12e5ecc: 97ffeb60     	bl	0x12e0c4c <__start_il2cpp+0x139488>
 12e5ed0: aa1603e0     	mov	x0, x22
 12e5ed4: 4ea81d00     	mov	v0.16b, v8.16b
 12e5ed8: 97ffeb5d     	bl	0x12e0c4c <__start_il2cpp+0x139488>
 12e5edc: bd4023e0     	ldr	s0, [sp, #0x20]
 12e5ee0: aa1503e0     	mov	x0, x21
 12e5ee4: 97ffeb5a     	bl	0x12e0c4c <__start_il2cpp+0x139488>
 12e5ee8: aa1903e0     	mov	x0, x25
 12e5eec: 4ea91d20     	mov	v0.16b, v9.16b
 12e5ef0: 97ffeb57     	bl	0x12e0c4c <__start_il2cpp+0x139488>
 12e5ef4: bd402be0     	ldr	s0, [sp, #0x28]
 12e5ef8: aa1803e0     	mov	x0, x24
 12e5efc: 97ffeb54     	bl	0x12e0c4c <__start_il2cpp+0x139488>
 12e5f00: 52800028     	mov	w8, #0x1                // =1
 12e5f04: 3900f668     	strb	w8, [x19, #0x3d]
 12e5f08: 17fffb76     	b	0x12e4ce0 <__start_il2cpp+0x13d51c>
 12e5f0c: 97f7687d     	bl	0x10c0100 <CloseNLSocket+0x638>
 12e5f10: 97f7687e     	bl	0x10c0108 <CloseNLSocket+0x640>
