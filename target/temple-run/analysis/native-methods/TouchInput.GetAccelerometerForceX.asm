
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12ad500: fc1d0fea     	str	d10, [sp, #-0x30]!
 12ad504: 6d0123e9     	stp	d9, d8, [sp, #0x10]
 12ad508: a9024ffe     	stp	x30, x19, [sp, #0x20]
 12ad50c: 2d4f8400     	ldp	s0, s1, [x0, #0x7c]
 12ad510: fc484008     	ldur	d8, [x0, #0x84]
 12ad514: bd408c09     	ldr	s9, [x0, #0x8c]
 12ad518: aa0003f3     	mov	x19, x0
 12ad51c: aa1f03e0     	mov	x0, xzr
 12ad520: 1e21180a     	fdiv	s10, s0, s1
 12ad524: 94490acd     	bl	0x24f0058 <__start_il2cpp+0x1348894>
 12ad528: 1e2e1003     	fmov	s3, #1.00000000
 12ad52c: 1e202148     	fcmp	s10, #0.0
 12ad530: 1e235943     	fmin	s3, s10, s3
 12ad534: 1e2703e4     	fmov	s4, wzr
 12ad538: 6e0c0420     	mov	v0.s[1], v1.s[0]
 12ad53c: 1e293842     	fsub	s2, s2, s9
 12ad540: 1e245c61     	fcsel	s1, s3, s4, pl
 12ad544: 0ea8d400     	fsub	v0.2s, v0.2s, v8.2s
 12ad548: 0f819000     	fmul	v0.2s, v0.2s, v1.s[0]
 12ad54c: 1e220821     	fmul	s1, s1, s2
 12ad550: 0e20d500     	fadd	v0.2s, v8.2s, v0.2s
 12ad554: 1e212921     	fadd	s1, s9, s1
 12ad558: fc084260     	stur	d0, [x19, #0x84]
 12ad55c: bd008e61     	str	s1, [x19, #0x8c]
 12ad560: a9424ffe     	ldp	x30, x19, [sp, #0x20]
 12ad564: 6d4123e9     	ldp	d9, d8, [sp, #0x10]
 12ad568: fc4307ea     	ldr	d10, [sp], #0x30
 12ad56c: d65f03c0     	ret
