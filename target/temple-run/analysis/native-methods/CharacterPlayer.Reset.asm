
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 129836c: a9be57fe     	stp	x30, x21, [sp, #-0x20]!
 1298370: a9014ff4     	stp	x20, x19, [sp, #0x10]
 1298374: b000bcf5     	adrp	x21, 0x2a35000
 1298378: d000ae54     	adrp	x20, 0x2862000
 129837c: 39624aa8     	ldrb	w8, [x21, #0x892]
 1298380: f941ea94     	ldr	x20, [x20, #0x3d0]
 1298384: aa0003f3     	mov	x19, x0
 1298388: 370000c8     	tbnz	w8, #0x0, 0x12983a0 <__start_il2cpp+0xf0bdc>
 129838c: d000ae40     	adrp	x0, 0x2862000
 1298390: f941e800     	ldr	x0, [x0, #0x3d0]
 1298394: 97f89ed1     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1298398: 52800028     	mov	w8, #0x1                // =1
 129839c: 39224aa8     	strb	w8, [x21, #0x892]
 12983a0: aa1303e0     	mov	x0, x19
 12983a4: 94000057     	bl	0x1298500 <__start_il2cpp+0xf0d3c>
 12983a8: 529999a9     	mov	w9, #0xcccd             // =52429
 12983ac: 52800028     	mov	w8, #0x1                // =1
 12983b0: 72a7d989     	movk	w9, #0x3ecc, lsl #16
 12983b4: b901927f     	str	wzr, [x19, #0x190]
 12983b8: 3903627f     	strb	wzr, [x19, #0xd8]
 12983bc: f80dc27f     	stur	xzr, [x19, #0xdc]
 12983c0: 3903c27f     	strb	wzr, [x19, #0xf0]
 12983c4: 7901f27f     	strh	wzr, [x19, #0xf8]
 12983c8: 3904027f     	strb	wzr, [x19, #0x100]
 12983cc: b901067f     	str	wzr, [x19, #0x104]
 12983d0: 7902627f     	strh	wzr, [x19, #0x130]
 12983d4: 79021a7f     	strh	wzr, [x19, #0x10c]
 12983d8: 79024a7f     	strh	wzr, [x19, #0x124]
 12983dc: 3906c268     	strb	w8, [x19, #0x1b0]
 12983e0: b9012e69     	str	w9, [x19, #0x12c]
 12983e4: b9013a7f     	str	wzr, [x19, #0x138]
 12983e8: f9400280     	ldr	x0, [x20]
 12983ec: b940e008     	ldr	w8, [x0, #0xe0]
 12983f0: 35000068     	cbnz	w8, 0x12983fc <__start_il2cpp+0xf0c38>
 12983f4: 97f89efb     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12983f8: f9400280     	ldr	x0, [x20]
 12983fc: f9405c08     	ldr	x8, [x0, #0xb8]
 1298400: aa1f03e0     	mov	x0, xzr
 1298404: f9400114     	ldr	x20, [x8]
 1298408: 94003850     	bl	0x12a6548 <__start_il2cpp+0xfed84>
 129840c: b4000780     	cbz	x0, 0x12984fc <__start_il2cpp+0xf0d38>
 1298410: aa1f03e1     	mov	x1, xzr
 1298414: 9400387e     	bl	0x12a660c <__start_il2cpp+0xfee48>
 1298418: b4000734     	cbz	x20, 0x12984fc <__start_il2cpp+0xf0d38>
 129841c: 2a0003e1     	mov	w1, w0
 1298420: aa1403e0     	mov	x0, x20
 1298424: aa1f03e2     	mov	x2, xzr
 1298428: 97ffccd8     	bl	0x128b788 <__start_il2cpp+0xe3fc4>
 129842c: 52800028     	mov	w8, #0x1                // =1
 1298430: b9014268     	str	w8, [x19, #0x140]
 1298434: 91059268     	add	x8, x19, #0x164
 1298438: b9013e60     	str	w0, [x19, #0x13c]
 129843c: f900a67f     	str	xzr, [x19, #0x148]
 1298440: 3904ca7f     	strb	wzr, [x19, #0x132]
 1298444: b901367f     	str	wzr, [x19, #0x134]
 1298448: 3905527f     	strb	wzr, [x19, #0x154]
 129844c: b901727f     	str	wzr, [x19, #0x170]
 1298450: 3905d27f     	strb	wzr, [x19, #0x174]
 1298454: f900be7f     	str	xzr, [x19, #0x178]
 1298458: b901867f     	str	wzr, [x19, #0x184]
 129845c: f900ae7f     	str	xzr, [x19, #0x158]
 1298460: 7902c27f     	strh	wzr, [x19, #0x160]
 1298464: f900011f     	str	xzr, [x8]
 1298468: 3900211f     	strb	wzr, [x8, #0x8]
 129846c: 52a81c08     	mov	w8, #0x40e00000         // =1088421888
 1298470: aa1303e0     	mov	x0, x19
 1298474: aa1f03e1     	mov	x1, xzr
 1298478: b9011e68     	str	w8, [x19, #0x11c]
 129847c: b900ea7f     	str	wzr, [x19, #0xe8]
 1298480: 94487723     	bl	0x24b610c <__start_il2cpp+0x130e948>
 1298484: b40003c0     	cbz	x0, 0x12984fc <__start_il2cpp+0xf0d38>
 1298488: aa1f03e1     	mov	x1, xzr
 129848c: 9448a9ae     	bl	0x24c2b44 <__start_il2cpp+0x131b380>
 1298490: bd40e663     	ldr	s3, [x19, #0xe4]
 1298494: aa1303e0     	mov	x0, x19
 1298498: 1e230800     	fmul	s0, s0, s3
 129849c: 1e230821     	fmul	s1, s1, s3
 12984a0: 1e230842     	fmul	s2, s2, s3
 12984a4: 2d068660     	stp	s0, s1, [x19, #0x34]
 12984a8: bd003e62     	str	s2, [x19, #0x3c]
 12984ac: 97fffdf3     	bl	0x1297c78 <__start_il2cpp+0xf04b4>
 12984b0: f940ce68     	ldr	x8, [x19, #0x198]
 12984b4: b4000248     	cbz	x8, 0x12984fc <__start_il2cpp+0xf0d38>
 12984b8: f9402900     	ldr	x0, [x8, #0x50]
 12984bc: b4000200     	cbz	x0, 0x12984fc <__start_il2cpp+0xf0d38>
 12984c0: 52800021     	mov	w1, #0x1                // =1
 12984c4: 2a1f03e2     	mov	w2, wzr
 12984c8: aa1f03e3     	mov	x3, xzr
 12984cc: 9400a0aa     	bl	0x12c0774 <__start_il2cpp+0x118fb0>
 12984d0: aa1303e0     	mov	x0, x19
 12984d4: aa1f03e1     	mov	x1, xzr
 12984d8: 9448770d     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12984dc: b4000100     	cbz	x0, 0x12984fc <__start_il2cpp+0xf0d38>
 12984e0: aa1f03e1     	mov	x1, xzr
 12984e4: 9448a864     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12984e8: 2d0f8660     	stp	s0, s1, [x19, #0x7c]
 12984ec: bd008662     	str	s2, [x19, #0x84]
 12984f0: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 12984f4: a8c257fe     	ldp	x30, x21, [sp], #0x20
 12984f8: d65f03c0     	ret
 12984fc: 97f89f01     	bl	0x10c0100 <CloseNLSocket+0x638>
