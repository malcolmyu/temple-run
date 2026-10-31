
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1273a28: f000af73     	adrp	x19, 0x2862000
 1273a2c: f9440673     	ldr	x19, [x19, #0x808]
 1273a30: 2a0003f4     	mov	w20, w0
 1273a34: aa0803e0     	mov	x0, x8
 1273a38: 2a1403e1     	mov	w1, w20
 1273a3c: f9400262     	ldr	x2, [x19]
 1273a40: aa1f03e3     	mov	x3, xzr
 1273a44: 9109a398     	add	x24, x28, #0x268
 1273a48: 9400653b     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1273a4c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1273a50: 1e270101     	fmov	s1, w8
 1273a54: 1e212000     	fcmp	s0, s1
 1273a58: 54000585     	b.pl	0x1273b08 <__start_il2cpp+0xcc344>
 1273a5c: bd412780     	ldr	s0, [x28, #0x124]
 1273a60: 52a87f48     	mov	w8, #0x43fa0000         // =1140457472
 1273a64: 1e270101     	fmov	s1, w8
 1273a68: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1273a6c: 1e211800     	fdiv	s0, s0, s1
 1273a70: 1e270101     	fmov	s1, w8
 1273a74: 1e210800     	fmul	s0, s0, s1
 1273a78: 1e212000     	fcmp	s0, s1
 1273a7c: 540003ab     	b.lt	0x1273af0 <__start_il2cpp+0xcc32c>
 1273a80: f9400300     	ldr	x0, [x24]
 1273a84: b401da80     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1273a88: b000af49     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1273a8c: f9400261     	ldr	x1, [x19]
 1273a90: f947a529     	ldr	x9, [x9, #0xf48]
 1273a94: b9401c0a     	ldr	w10, [x0, #0x1c]
 1273a98: f9400808     	ldr	x8, [x0, #0x10]
 1273a9c: f9400129     	ldr	x9, [x9]
 1273aa0: 1100054a     	add	w10, w10, #0x1
 1273aa4: b9001c0a     	str	w10, [x0, #0x1c]
 1273aa8: b401d968     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1273aac: b980180a     	ldrsw	x10, [x0, #0x18]
 1273ab0: b940190b     	ldr	w11, [x8, #0x18]
 1273ab4: 6b0b015f     	cmp	w10, w11
 1273ab8: 54000102     	b.hs	0x1273ad8 <__start_il2cpp+0xcc314>
 1273abc: 11000549     	add	w9, w10, #0x1
 1273ac0: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1273ac4: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1273ac8: b9001809     	str	w9, [x0, #0x18]
 1273acc: f9001101     	str	x1, [x8, #0x20]
 1273ad0: 1e270140     	fmov	s0, w10
 1273ad4: 14000007     	b	0x1273af0 <__start_il2cpp+0xcc32c>
 1273ad8: f9401128     	ldr	x8, [x9, #0x20]
 1273adc: f9406108     	ldr	x8, [x8, #0xc0]
 1273ae0: f9403902     	ldr	x2, [x8, #0x70]
 1273ae4: 941a1a4c     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1273ae8: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1273aec: 1e270100     	fmov	s0, w8
 1273af0: f94002e0     	ldr	x0, [x23]
 1273af4: b401d700     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1273af8: f9400262     	ldr	x2, [x19]
 1273afc: 2a1403e1     	mov	w1, w20
 1273b00: aa1f03e3     	mov	x3, xzr
 1273b04: 94006514     	bl	0x128cf54 <__start_il2cpp+0xe5790>
