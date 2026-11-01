
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12992b4: f81c0ffe     	str	x30, [sp, #-0x40]!
 12992b8: a9015ff8     	stp	x24, x23, [sp, #0x10]
 12992bc: a90257f6     	stp	x22, x21, [sp, #0x20]
 12992c0: a9034ff4     	stp	x20, x19, [sp, #0x30]
 12992c4: 9000bcf8     	adrp	x24, 0x2a35000
 12992c8: b000ae37     	adrp	x23, 0x285e000
 12992cc: b000ae34     	adrp	x20, 0x285e000
 12992d0: d000ae56     	adrp	x22, 0x2863000
 12992d4: d000ae55     	adrp	x21, 0x2863000
 12992d8: 39627708     	ldrb	w8, [x24, #0x89d]
 12992dc: f9417ef7     	ldr	x23, [x23, #0x2f8]
 12992e0: f9418294     	ldr	x20, [x20, #0x300]
 12992e4: f946eed6     	ldr	x22, [x22, #0xdd8]
 12992e8: f946f2b5     	ldr	x21, [x21, #0xde0]
 12992ec: aa0003f3     	mov	x19, x0
 12992f0: 370001e8     	tbnz	w8, #0x0, 0x129932c <__start_il2cpp+0xf1b68>
 12992f4: b000ae20     	adrp	x0, 0x285e000
 12992f8: f9418000     	ldr	x0, [x0, #0x300]
 12992fc: 97f89af7     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1299300: d000ae40     	adrp	x0, 0x2863000
 1299304: f946f000     	ldr	x0, [x0, #0xde0]
 1299308: 97f89af4     	bl	0x10bfed8 <CloseNLSocket+0x410>
 129930c: d000ae40     	adrp	x0, 0x2863000
 1299310: f946ec00     	ldr	x0, [x0, #0xdd8]
 1299314: 97f89af1     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1299318: b000ae20     	adrp	x0, 0x285e000
 129931c: f9417c00     	ldr	x0, [x0, #0x2f8]
 1299320: 97f89aee     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1299324: 52800028     	mov	w8, #0x1                // =1
 1299328: 39227708     	strb	w8, [x24, #0x89d]
 129932c: 52a84908     	mov	w8, #0x42480000         // =1112014848
 1299330: 52800029     	mov	w9, #0x1                // =1
 1299334: b9018268     	str	w8, [x19, #0x180]
 1299338: b9018a69     	str	w9, [x19, #0x188]
 129933c: f94002e0     	ldr	x0, [x23]
 1299340: 97f89b6d     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 1299344: f9400281     	ldr	x1, [x20]
 1299348: aa0003f4     	mov	x20, x0
 129934c: 9419823f     	bl	0x18f9c48 <__start_il2cpp+0x752484>
 1299350: f900e274     	str	x20, [x19, #0x1c0]
 1299354: f94002c0     	ldr	x0, [x22]
 1299358: 97f89b67     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 129935c: f94002a1     	ldr	x1, [x21]
 1299360: aa0003f4     	mov	x20, x0
 1299364: 94198239     	bl	0x18f9c48 <__start_il2cpp+0x752484>
 1299368: 4f03f600     	fmov	v0.4s, #1.00000000
 129936c: f900e674     	str	x20, [x19, #0x1c8]
 1299370: 3d807660     	str	q0, [x19, #0x1d0]
 1299374: aa1303e0     	mov	x0, x19
 1299378: a9434ff4     	ldp	x20, x19, [sp, #0x30]
 129937c: a94257f6     	ldp	x22, x21, [sp, #0x20]
 1299380: a9415ff8     	ldp	x24, x23, [sp, #0x10]
 1299384: aa1f03e1     	mov	x1, xzr
 1299388: f84407fe     	ldr	x30, [sp], #0x40
 129938c: 14011ed9     	b	0x12e0ef0 <__start_il2cpp+0x13972c>
