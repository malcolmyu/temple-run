
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1298500: a9be57fe     	stp	x30, x21, [sp, #-0x20]!
 1298504: a9014ff4     	stp	x20, x19, [sp, #0x10]
 1298508: b000bcf5     	adrp	x21, 0x2a35000
 129850c: d000ae54     	adrp	x20, 0x2862000
 1298510: 39626aa8     	ldrb	w8, [x21, #0x89a]
 1298514: f941ea94     	ldr	x20, [x20, #0x3d0]
 1298518: aa0003f3     	mov	x19, x0
 129851c: 37000368     	tbnz	w8, #0x0, 0x1298588 <__start_il2cpp+0xf0dc4>
 1298520: f000ae40     	adrp	x0, 0x2863000
 1298524: f946d800     	ldr	x0, [x0, #0xdb0]
 1298528: 97f89e6c     	bl	0x10bfed8 <CloseNLSocket+0x410>
 129852c: f000ae40     	adrp	x0, 0x2863000
 1298530: f946dc00     	ldr	x0, [x0, #0xdb8]
 1298534: 97f89e69     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1298538: f000ae40     	adrp	x0, 0x2863000
 129853c: f946e000     	ldr	x0, [x0, #0xdc0]
 1298540: 97f89e66     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1298544: b000ae40     	adrp	x0, 0x2861000
 1298548: f9427400     	ldr	x0, [x0, #0x4e8]
 129854c: 97f89e63     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1298550: b000ae40     	adrp	x0, 0x2861000
 1298554: f9427800     	ldr	x0, [x0, #0x4f0]
 1298558: 97f89e60     	bl	0x10bfed8 <CloseNLSocket+0x410>
 129855c: d000ae20     	adrp	x0, 0x285e000
 1298560: f944f800     	ldr	x0, [x0, #0x9f0]
 1298564: 97f89e5d     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1298568: 9000ae20     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 129856c: f9456000     	ldr	x0, [x0, #0xac0]
 1298570: 97f89e5a     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1298574: d000ae40     	adrp	x0, 0x2862000
 1298578: f941e800     	ldr	x0, [x0, #0x3d0]
 129857c: 97f89e57     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1298580: 52800028     	mov	w8, #0x1                // =1
 1298584: 39226aa8     	strb	w8, [x21, #0x89a]
 1298588: f9400280     	ldr	x0, [x20]
 129858c: b940e008     	ldr	w8, [x0, #0xe0]
 1298590: 35000068     	cbnz	w8, 0x129859c <__start_il2cpp+0xf0dd8>
 1298594: 97f89e93     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1298598: f9400280     	ldr	x0, [x20]
 129859c: f9405c08     	ldr	x8, [x0, #0xb8]
 12985a0: aa1f03e0     	mov	x0, xzr
 12985a4: f9400114     	ldr	x20, [x8]
 12985a8: 940037e8     	bl	0x12a6548 <__start_il2cpp+0xfed84>
 12985ac: b4000d60     	cbz	x0, 0x1298758 <__start_il2cpp+0xf0f94>
 12985b0: aa1f03e1     	mov	x1, xzr
 12985b4: 94003816     	bl	0x12a660c <__start_il2cpp+0xfee48>
 12985b8: b4000d14     	cbz	x20, 0x1298758 <__start_il2cpp+0xf0f94>
 12985bc: 9000ae35     	adrp	x21, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12985c0: f94562b5     	ldr	x21, [x21, #0xac0]
 12985c4: 2a0003e1     	mov	w1, w0
 12985c8: aa1403e0     	mov	x0, x20
 12985cc: aa1f03e2     	mov	x2, xzr
 12985d0: 97ffd950     	bl	0x128eb10 <__start_il2cpp+0xe734c>
 12985d4: b9018a60     	str	w0, [x19, #0x188]
 12985d8: f94002a0     	ldr	x0, [x21]
 12985dc: f9405674     	ldr	x20, [x19, #0xa8]
 12985e0: b940e008     	ldr	w8, [x0, #0xe0]
 12985e4: 35000048     	cbnz	w8, 0x12985ec <__start_il2cpp+0xf0e28>
 12985e8: 97f89e7e     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12985ec: aa1403e0     	mov	x0, x20
 12985f0: aa1f03e1     	mov	x1, xzr
 12985f4: aa1f03e2     	mov	x2, xzr
 12985f8: 94488094     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12985fc: 36000160     	tbz	w0, #0x0, 0x1298628 <__start_il2cpp+0xf0e64>
 1298600: f94002a0     	ldr	x0, [x21]
 1298604: f9405674     	ldr	x20, [x19, #0xa8]
 1298608: b940e008     	ldr	w8, [x0, #0xe0]
 129860c: 35000048     	cbnz	w8, 0x1298614 <__start_il2cpp+0xf0e50>
 1298610: 97f89e74     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1298614: aa1403e0     	mov	x0, x20
 1298618: aa1f03e1     	mov	x1, xzr
 129861c: 9448918a     	bl	0x24bcc44 <__start_il2cpp+0x1315480>
 1298620: 6f00e400     	movi	v0.2d, #0000000000000000
 1298624: ad050260     	stp	q0, q0, [x19, #0xa0]
 1298628: f940e260     	ldr	x0, [x19, #0x1c0]
 129862c: b4000960     	cbz	x0, 0x1298758 <__start_il2cpp+0xf0f94>
 1298630: b9418a61     	ldr	w1, [x19, #0x188]
 1298634: b9401808     	ldr	w8, [x0, #0x18]
 1298638: 6b08003f     	cmp	w1, w8
 129863c: b000ae48     	adrp	x8, 0x2861000
 1298640: f9427908     	ldr	x8, [x8, #0x4f0]
 1298644: 5400006d     	b.le	0x1298650 <__start_il2cpp+0xf0e8c>
 1298648: 2a1f03e1     	mov	w1, wzr
 129864c: b9018a7f     	str	wzr, [x19, #0x188]
 1298650: f9400102     	ldr	x2, [x8]
 1298654: 941986bf     	bl	0x18fa150 <__start_il2cpp+0x75298c>
 1298658: f94002a8     	ldr	x8, [x21]
 129865c: aa0003f4     	mov	x20, x0
 1298660: b940e109     	ldr	w9, [x8, #0xe0]
 1298664: 35000069     	cbnz	w9, 0x1298670 <__start_il2cpp+0xf0eac>
 1298668: aa0803e0     	mov	x0, x8
 129866c: 97f89e5d     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1298670: aa1403e0     	mov	x0, x20
 1298674: aa1f03e1     	mov	x1, xzr
 1298678: aa1f03e2     	mov	x2, xzr
 129867c: 94488073     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 1298680: 36000660     	tbz	w0, #0x0, 0x129874c <__start_il2cpp+0xf0f88>
 1298684: f94002a0     	ldr	x0, [x21]
 1298688: b940e008     	ldr	w8, [x0, #0xe0]
 129868c: 35000048     	cbnz	w8, 0x1298694 <__start_il2cpp+0xf0ed0>
 1298690: 97f89e54     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1298694: d000ae28     	adrp	x8, 0x285e000
 1298698: f944f908     	ldr	x8, [x8, #0x9f0]
 129869c: aa1403e0     	mov	x0, x20
 12986a0: f9400101     	ldr	x1, [x8]
 12986a4: 94059e83     	bl	0x14000b0 <__start_il2cpp+0x2588ec>
 12986a8: b4000580     	cbz	x0, 0x1298758 <__start_il2cpp+0xf0f94>
 12986ac: aa1f03e1     	mov	x1, xzr
 12986b0: aa0003f4     	mov	x20, x0
 12986b4: 94488112     	bl	0x24b8afc <__start_il2cpp+0x1311338>
 12986b8: aa0003f5     	mov	x21, x0
 12986bc: aa1303e0     	mov	x0, x19
 12986c0: aa1f03e1     	mov	x1, xzr
 12986c4: 94487692     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12986c8: b4000495     	cbz	x21, 0x1298758 <__start_il2cpp+0xf0f94>
 12986cc: aa0003e1     	mov	x1, x0
 12986d0: aa1503e0     	mov	x0, x21
 12986d4: aa1f03e2     	mov	x2, xzr
 12986d8: 9448a9db     	bl	0x24c2e44 <__start_il2cpp+0x131b680>
 12986dc: aa1403e0     	mov	x0, x20
 12986e0: aa1f03e1     	mov	x1, xzr
 12986e4: 94488106     	bl	0x24b8afc <__start_il2cpp+0x1311338>
 12986e8: b4000380     	cbz	x0, 0x1298758 <__start_il2cpp+0xf0f94>
 12986ec: 1e2703e0     	fmov	s0, wzr
 12986f0: 1e2e1001     	fmov	s1, #1.00000000
 12986f4: 1e2703e2     	fmov	s2, wzr
 12986f8: aa1f03e1     	mov	x1, xzr
 12986fc: 9448a5cb     	bl	0x24c1e28 <__start_il2cpp+0x131a664>
 1298700: f9005674     	str	x20, [x19, #0xa8]
 1298704: f000ae48     	adrp	x8, 0x2863000
 1298708: f946d908     	ldr	x8, [x8, #0xdb0]
 129870c: aa1403e0     	mov	x0, x20
 1298710: f9400101     	ldr	x1, [x8]
 1298714: 9405022c     	bl	0x13d8fc4 <__start_il2cpp+0x231800>
 1298718: f9005260     	str	x0, [x19, #0xa0]
 129871c: f000ae48     	adrp	x8, 0x2863000
 1298720: f946e108     	ldr	x8, [x8, #0xdc0]
 1298724: aa1403e0     	mov	x0, x20
 1298728: f9400101     	ldr	x1, [x8]
 129872c: 94050496     	bl	0x13d9984 <__start_il2cpp+0x2321c0>
 1298730: f9005a60     	str	x0, [x19, #0xb0]
 1298734: f000ae48     	adrp	x8, 0x2863000
 1298738: f946dd08     	ldr	x8, [x8, #0xdb8]
 129873c: aa1403e0     	mov	x0, x20
 1298740: f9400101     	ldr	x1, [x8]
 1298744: 94050490     	bl	0x13d9984 <__start_il2cpp+0x2321c0>
 1298748: f9005e60     	str	x0, [x19, #0xb8]
 129874c: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 1298750: a8c257fe     	ldp	x30, x21, [sp], #0x20
 1298754: d65f03c0     	ret
 1298758: 97f89e6a     	bl	0x10c0100 <CloseNLSocket+0x638>
