
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12f6ee8: f81f0ffe     	str	x30, [sp, #-0x10]!
 12f6eec: 52a84e08     	mov	w8, #0x42700000         // =1114636288
 12f6ef0: 52aff009     	mov	w9, #0x7f800000         // =2139095040
 12f6ef4: b980540d     	ldrsw	x13, [x0, #0x54]
 12f6ef8: 1e270102     	fmov	s2, w8
 12f6efc: 1e221800     	fdiv	s0, s0, s2
 12f6f00: 1e270123     	fmov	s3, w9
 12f6f04: 52b0000c     	mov	w12, #-0x80000000       // =-2147483648
 12f6f08: 1e221821     	fdiv	s1, s1, s2
 12f6f0c: 1e380008     	fcvtzs	w8, s0
 12f6f10: 1e232000     	fcmp	s0, s3
 12f6f14: 3200ebeb     	mov	w11, #0x77777777        // =2004318071
 12f6f18: 1e380029     	fcvtzs	w9, s1
 12f6f1c: 1a88018a     	csel	w10, w12, w8, eq
 12f6f20: 1e232020     	fcmp	s1, s3
 12f6f24: 1a890188     	csel	w8, w12, w9, eq
 12f6f28: 9b0b7da9     	mul	x9, x13, x11
 12f6f2c: d360fd29     	lsr	x9, x9, #32
 12f6f30: 4b0d0129     	sub	w9, w9, w13
 12f6f34: 13057d2c     	asr	w12, w9, #5
 12f6f38: 0b497d89     	add	w9, w12, w9, lsr #31
 12f6f3c: 0b080129     	add	w9, w9, w8
 12f6f40: 7100493f     	cmp	w9, #0x12
 12f6f44: 2a1f03e8     	mov	w8, wzr
 12f6f48: 5400038c     	b.gt	0x12f6fb8 <__start_il2cpp+0x14f7f4>
 12f6f4c: b980500c     	ldrsw	x12, [x0, #0x50]
 12f6f50: 9b0b7d8b     	mul	x11, x12, x11
 12f6f54: d360fd6b     	lsr	x11, x11, #32
 12f6f58: 4b0c016b     	sub	w11, w11, w12
 12f6f5c: 13057d6c     	asr	w12, w11, #5
 12f6f60: 0b4b7d8b     	add	w11, w12, w11, lsr #31
 12f6f64: 0b0a016a     	add	w10, w11, w10
 12f6f68: 7100495f     	cmp	w10, #0x12
 12f6f6c: 5400026c     	b.gt	0x12f6fb8 <__start_il2cpp+0x14f7f4>
 12f6f70: 2a09014b     	orr	w11, w10, w9
 12f6f74: 37f8022b     	tbnz	w11, #0x1f, 0x12f6fb8 <__start_il2cpp+0x14f7f4>
 12f6f78: f9403008     	ldr	x8, [x0, #0x60]
 12f6f7c: b4000268     	cbz	x8, 0x12f6fc8 <__start_il2cpp+0x14f804>
 12f6f80: f940090b     	ldr	x11, [x8, #0x10]
 12f6f84: b940016c     	ldr	w12, [x11]
 12f6f88: 6b0c015f     	cmp	w10, w12
 12f6f8c: 540001c2     	b.hs	0x12f6fc4 <__start_il2cpp+0x14f800>
 12f6f90: f940096b     	ldr	x11, [x11, #0x10]
 12f6f94: 6b0b013f     	cmp	w9, w11
 12f6f98: 54000162     	b.hs	0x12f6fc4 <__start_il2cpp+0x14f800>
 12f6f9c: 93407d4a     	sxtw	x10, w10
 12f6fa0: 93407d29     	sxtw	x9, w9
 12f6fa4: 9b0a2569     	madd	x9, x11, x10, x9
 12f6fa8: 8b090108     	add	x8, x8, x9
 12f6fac: 39408108     	ldrb	w8, [x8, #0x20]
 12f6fb0: 7100011f     	cmp	w8, #0x0
 12f6fb4: 1a9f07e8     	cset	w8, ne
 12f6fb8: 2a0803e0     	mov	w0, w8
 12f6fbc: f84107fe     	ldr	x30, [sp], #0x10
 12f6fc0: d65f03c0     	ret
 12f6fc4: 97f72451     	bl	0x10c0108 <CloseNLSocket+0x640>
 12f6fc8: 97f7244e     	bl	0x10c0100 <CloseNLSocket+0x638>
