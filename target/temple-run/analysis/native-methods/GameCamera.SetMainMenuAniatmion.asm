
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12b0194: f81d0ffe     	str	x30, [sp, #-0x30]!
 12b0198: a90157f6     	stp	x22, x21, [sp, #0x10]
 12b019c: a9024ff4     	stp	x20, x19, [sp, #0x20]
 12b01a0: b000bc35     	adrp	x21, 0x2a35000
 12b01a4: 39662aa8     	ldrb	w8, [x21, #0x98a]
 12b01a8: 2a0103f4     	mov	w20, w1
 12b01ac: aa0003f3     	mov	x19, x0
 12b01b0: 370000c8     	tbnz	w8, #0x0, 0x12b01c8 <__start_il2cpp+0x108a04>
 12b01b4: d000ad80     	adrp	x0, 0x2862000
 12b01b8: f942a000     	ldr	x0, [x0, #0x540]
 12b01bc: 97f83f47     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12b01c0: 52800028     	mov	w8, #0x1                // =1
 12b01c4: 39262aa8     	strb	w8, [x21, #0x98a]
 12b01c8: aa1303e0     	mov	x0, x19
 12b01cc: 36000174     	tbz	w20, #0x0, 0x12b01f8 <__start_il2cpp+0x108a34>
 12b01d0: 94000085     	bl	0x12b03e4 <__start_il2cpp+0x108c20>
 12b01d4: f9409260     	ldr	x0, [x19, #0x120]
 12b01d8: b4000840     	cbz	x0, 0x12b02e0 <__start_il2cpp+0x108b1c>
 12b01dc: f9400008     	ldr	x8, [x0]
 12b01e0: a9424ff4     	ldp	x20, x19, [sp, #0x20]
 12b01e4: a94157f6     	ldp	x22, x21, [sp, #0x10]
 12b01e8: aa1f03e1     	mov	x1, xzr
 12b01ec: a95a8903     	ldp	x3, x2, [x8, #0x1a8]
 12b01f0: f84307fe     	ldr	x30, [sp], #0x30
 12b01f4: d61f0060     	br	x3
 12b01f8: aa1f03e1     	mov	x1, xzr
 12b01fc: 944817c4     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12b0200: b4000700     	cbz	x0, 0x12b02e0 <__start_il2cpp+0x108b1c>
 12b0204: 2d5b0a61     	ldp	s1, s2, [x19, #0xd8]
 12b0208: bd40d660     	ldr	s0, [x19, #0xd4]
 12b020c: aa1f03e1     	mov	x1, xzr
 12b0210: 94484941     	bl	0x24c2714 <__start_il2cpp+0x131af50>
 12b0214: aa1303e0     	mov	x0, x19
 12b0218: aa1f03e1     	mov	x1, xzr
 12b021c: 9400c198     	bl	0x12e087c <__start_il2cpp+0x1390b8>
 12b0220: d000ad95     	adrp	x21, 0x2862000
 12b0224: f942a2b5     	ldr	x21, [x21, #0x540]
 12b0228: f94002a0     	ldr	x0, [x21]
 12b022c: 97f83fb2     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12b0230: aa1f03e1     	mov	x1, xzr
 12b0234: aa0003f4     	mov	x20, x0
 12b0238: 9400c189     	bl	0x12e085c <__start_il2cpp+0x139098>
 12b023c: b4000534     	cbz	x20, 0x12b02e0 <__start_il2cpp+0x108b1c>
 12b0240: aa1303e0     	mov	x0, x19
 12b0244: aa1f03e1     	mov	x1, xzr
 12b0248: b900129f     	str	wzr, [x20, #0x10]
 12b024c: 944817b0     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12b0250: b4000480     	cbz	x0, 0x12b02e0 <__start_il2cpp+0x108b1c>
 12b0254: aa1f03e1     	mov	x1, xzr
 12b0258: 94484907     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12b025c: 52800036     	mov	w22, #0x1               // =1
 12b0260: aa1303e0     	mov	x0, x19
 12b0264: aa1403e1     	mov	x1, x20
 12b0268: aa1f03e2     	mov	x2, xzr
 12b026c: 2d028680     	stp	s0, s1, [x20, #0x14]
 12b0270: bd001e82     	str	s2, [x20, #0x1c]
 12b0274: 39008296     	strb	w22, [x20, #0x20]
 12b0278: 9400c116     	bl	0x12e06d0 <__start_il2cpp+0x138f0c>
 12b027c: f94002a0     	ldr	x0, [x21]
 12b0280: 97f83f9d     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12b0284: aa1f03e1     	mov	x1, xzr
 12b0288: aa0003f4     	mov	x20, x0
 12b028c: 9400c174     	bl	0x12e085c <__start_il2cpp+0x139098>
 12b0290: b4000294     	cbz	x20, 0x12b02e0 <__start_il2cpp+0x108b1c>
 12b0294: bd40d260     	ldr	s0, [x19, #0xd0]
 12b0298: aa1303e0     	mov	x0, x19
 12b029c: aa1403e1     	mov	x1, x20
 12b02a0: aa1f03e2     	mov	x2, xzr
 12b02a4: bd001280     	str	s0, [x20, #0x10]
 12b02a8: b940ea68     	ldr	w8, [x19, #0xe8]
 12b02ac: f9407269     	ldr	x9, [x19, #0xe0]
 12b02b0: 39008296     	strb	w22, [x20, #0x20]
 12b02b4: b9001e88     	str	w8, [x20, #0x1c]
 12b02b8: f8014289     	stur	x9, [x20, #0x14]
 12b02bc: 9400c105     	bl	0x12e06d0 <__start_il2cpp+0x138f0c>
 12b02c0: aa1303e0     	mov	x0, x19
 12b02c4: aa1f03e1     	mov	x1, xzr
 12b02c8: 9400c167     	bl	0x12e0864 <__start_il2cpp+0x1390a0>
 12b02cc: 3904a276     	strb	w22, [x19, #0x128]
 12b02d0: a9424ff4     	ldp	x20, x19, [sp, #0x20]
 12b02d4: a94157f6     	ldp	x22, x21, [sp, #0x10]
 12b02d8: f84307fe     	ldr	x30, [sp], #0x30
 12b02dc: d65f03c0     	ret
 12b02e0: 97f83f88     	bl	0x10c0100 <CloseNLSocket+0x638>
