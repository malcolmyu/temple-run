
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12f6e10: f81f0ffe     	str	x30, [sp, #-0x10]!
 12f6e14: 52a84e08     	mov	w8, #0x42700000         // =1114636288
 12f6e18: 52aff009     	mov	w9, #0x7f800000         // =2139095040
 12f6e1c: b980540c     	ldrsw	x12, [x0, #0x54]
 12f6e20: 1e270101     	fmov	s1, w8
 12f6e24: 1e211800     	fdiv	s0, s0, s1
 12f6e28: 1e270123     	fmov	s3, w9
 12f6e2c: 52b0000b     	mov	w11, #-0x80000000       // =-2147483648
 12f6e30: 1e211841     	fdiv	s1, s2, s1
 12f6e34: 1e380008     	fcvtzs	w8, s0
 12f6e38: 1e232000     	fcmp	s0, s3
 12f6e3c: 3200ebea     	mov	w10, #0x77777777        // =2004318071
 12f6e40: 1e38002d     	fcvtzs	w13, s1
 12f6e44: 1a880169     	csel	w9, w11, w8, eq
 12f6e48: 1e232020     	fcmp	s1, s3
 12f6e4c: 1a8d0168     	csel	w8, w11, w13, eq
 12f6e50: 9b0a7d8b     	mul	x11, x12, x10
 12f6e54: d360fd6b     	lsr	x11, x11, #32
 12f6e58: 4b0c016b     	sub	w11, w11, w12
 12f6e5c: 13057d6c     	asr	w12, w11, #5
 12f6e60: 0b4b7d8b     	add	w11, w12, w11, lsr #31
 12f6e64: 0b080168     	add	w8, w11, w8
 12f6e68: 7100491f     	cmp	w8, #0x12
 12f6e6c: 5400036c     	b.gt	0x12f6ed8 <__start_il2cpp+0x14f714>
 12f6e70: b980500b     	ldrsw	x11, [x0, #0x50]
 12f6e74: 9b0a7d6a     	mul	x10, x11, x10
 12f6e78: d360fd4a     	lsr	x10, x10, #32
 12f6e7c: 4b0b014a     	sub	w10, w10, w11
 12f6e80: 13057d4b     	asr	w11, w10, #5
 12f6e84: 0b4a7d6a     	add	w10, w11, w10, lsr #31
 12f6e88: 0b090149     	add	w9, w10, w9
 12f6e8c: 7100493f     	cmp	w9, #0x12
 12f6e90: 5400024c     	b.gt	0x12f6ed8 <__start_il2cpp+0x14f714>
 12f6e94: 2a08012a     	orr	w10, w9, w8
 12f6e98: 37f8020a     	tbnz	w10, #0x1f, 0x12f6ed8 <__start_il2cpp+0x14f714>
 12f6e9c: f940300a     	ldr	x10, [x0, #0x60]
 12f6ea0: b400022a     	cbz	x10, 0x12f6ee4 <__start_il2cpp+0x14f720>
 12f6ea4: f940094b     	ldr	x11, [x10, #0x10]
 12f6ea8: b940016c     	ldr	w12, [x11]
 12f6eac: 6b0c013f     	cmp	w9, w12
 12f6eb0: 54000182     	b.hs	0x12f6ee0 <__start_il2cpp+0x14f71c>
 12f6eb4: f940096b     	ldr	x11, [x11, #0x10]
 12f6eb8: 6b0b011f     	cmp	w8, w11
 12f6ebc: 54000122     	b.hs	0x12f6ee0 <__start_il2cpp+0x14f71c>
 12f6ec0: 93407d29     	sxtw	x9, w9
 12f6ec4: 93407d08     	sxtw	x8, w8
 12f6ec8: 9b092168     	madd	x8, x11, x9, x8
 12f6ecc: 8b080148     	add	x8, x10, x8
 12f6ed0: 52800029     	mov	w9, #0x1                // =1
 12f6ed4: 39008109     	strb	w9, [x8, #0x20]
 12f6ed8: f84107fe     	ldr	x30, [sp], #0x10
 12f6edc: d65f03c0     	ret
 12f6ee0: 97f7248a     	bl	0x10c0108 <CloseNLSocket+0x640>
 12f6ee4: 97f72487     	bl	0x10c0100 <CloseNLSocket+0x638>
