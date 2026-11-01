
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1267570: fc1c0fe8     	str	d8, [sp, #-0x40]!
 1267574: f90007fe     	str	x30, [sp, #0x8]
 1267578: a9015ff8     	stp	x24, x23, [sp, #0x10]
 126757c: a90257f6     	stp	x22, x21, [sp, #0x20]
 1267580: a9034ff4     	stp	x20, x19, [sp, #0x30]
 1267584: d000be75     	adrp	x21, 0x2a35000
 1267588: f000afd4     	adrp	x20, 0x2862000
 126758c: f000afd7     	adrp	x23, 0x2862000
 1267590: f000afd8     	adrp	x24, 0x2862000
 1267594: 395c5ea8     	ldrb	w8, [x21, #0x717]
 1267598: f940ea94     	ldr	x20, [x20, #0x1d0]
 126759c: f940eef7     	ldr	x23, [x23, #0x1d8]
 12675a0: f9412b18     	ldr	x24, [x24, #0x250]
 12675a4: aa0003f3     	mov	x19, x0
 12675a8: 37000368     	tbnz	w8, #0x0, 0x1267614 <__start_il2cpp+0xbfe50>
 12675ac: f000afc0     	adrp	x0, 0x2862000
 12675b0: f940e800     	ldr	x0, [x0, #0x1d0]
 12675b4: 97f96249     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12675b8: f000afc0     	adrp	x0, 0x2862000
 12675bc: f940ec00     	ldr	x0, [x0, #0x1d8]
 12675c0: 97f96246     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12675c4: f000afc0     	adrp	x0, 0x2862000
 12675c8: f940dc00     	ldr	x0, [x0, #0x1b8]
 12675cc: 97f96243     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12675d0: f000afc0     	adrp	x0, 0x2862000
 12675d4: f9417c00     	ldr	x0, [x0, #0x2f8]
 12675d8: 97f96240     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12675dc: f000afc0     	adrp	x0, 0x2862000
 12675e0: f9410800     	ldr	x0, [x0, #0x210]
 12675e4: 97f9623d     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12675e8: f000afc0     	adrp	x0, 0x2862000
 12675ec: f9417000     	ldr	x0, [x0, #0x2e0]
 12675f0: 97f9623a     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12675f4: f000afc0     	adrp	x0, 0x2862000
 12675f8: f9412800     	ldr	x0, [x0, #0x250]
 12675fc: 97f96237     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1267600: f000afc0     	adrp	x0, 0x2862000
 1267604: f9416c00     	ldr	x0, [x0, #0x2d8]
 1267608: 97f96234     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126760c: 52800028     	mov	w8, #0x1                // =1
 1267610: 391c5ea8     	strb	w8, [x21, #0x717]
 1267614: b9404a60     	ldr	w0, [x19, #0x48]
 1267618: aa1f03e1     	mov	x1, xzr
 126761c: 9400af0d     	bl	0x1293250 <__start_il2cpp+0xeba8c>
 1267620: f9400288     	ldr	x8, [x20]
 1267624: aa0003f5     	mov	x21, x0
 1267628: 52800081     	mov	w1, #0x4                // =4
 126762c: aa0803e0     	mov	x0, x8
 1267630: 97f96248     	bl	0x10bff50 <CloseNLSocket+0x488>
 1267634: f94002e8     	ldr	x8, [x23]
 1267638: bd411668     	ldr	s8, [x19, #0x114]
 126763c: aa0003f4     	mov	x20, x0
 1267640: aa0803e0     	mov	x0, x8
 1267644: 97f962ac     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 1267648: f9400301     	ldr	x1, [x24]
 126764c: 52aff009     	mov	w9, #0x7f800000         // =2139095040
 1267650: 1e380108     	fcvtzs	w8, s8
 1267654: 1e270120     	fmov	s0, w9
 1267658: 93407d08     	sxtw	x8, w8
 126765c: 1e202100     	fcmp	s8, s0
 1267660: b26183e9     	mov	x9, #-0x80000000        // =-2147483648
 1267664: 9a880122     	csel	x2, x9, x8, eq
 1267668: aa1f03e3     	mov	x3, xzr
 126766c: aa0003f6     	mov	x22, x0
 1267670: 97ff92ca     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 1267674: b4000b54     	cbz	x20, 0x12677dc <__start_il2cpp+0xc0018>
 1267678: b40000d6     	cbz	x22, 0x1267690 <__start_il2cpp+0xbfecc>
 126767c: f9400288     	ldr	x8, [x20]
 1267680: aa1603e0     	mov	x0, x22
 1267684: f9402101     	ldr	x1, [x8, #0x40]
 1267688: 97f96257     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 126768c: b4000a20     	cbz	x0, 0x12677d0 <__start_il2cpp+0xc000c>
 1267690: b9401a88     	ldr	w8, [x20, #0x18]
 1267694: 340009c8     	cbz	w8, 0x12677cc <__start_il2cpp+0xc0008>
 1267698: f9001296     	str	x22, [x20, #0x20]
 126769c: f94002e0     	ldr	x0, [x23]
 12676a0: f000afd6     	adrp	x22, 0x2862000
 12676a4: f94172d6     	ldr	x22, [x22, #0x2e0]
 12676a8: 97f96293     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12676ac: f94002c1     	ldr	x1, [x22]
 12676b0: aa1503e2     	mov	x2, x21
 12676b4: aa1f03e3     	mov	x3, xzr
 12676b8: aa0003f6     	mov	x22, x0
 12676bc: 97ff926c     	bl	0x124c06c <__start_il2cpp+0xa48a8>
 12676c0: b40000d6     	cbz	x22, 0x12676d8 <__start_il2cpp+0xbff14>
 12676c4: f9400288     	ldr	x8, [x20]
 12676c8: aa1603e0     	mov	x0, x22
 12676cc: f9402101     	ldr	x1, [x8, #0x40]
 12676d0: 97f96245     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 12676d4: b40007e0     	cbz	x0, 0x12677d0 <__start_il2cpp+0xc000c>
 12676d8: b9401a88     	ldr	w8, [x20, #0x18]
 12676dc: 7100051f     	cmp	w8, #0x1
 12676e0: 54000769     	b.ls	0x12677cc <__start_il2cpp+0xc0008>
 12676e4: f9001696     	str	x22, [x20, #0x28]
 12676e8: f94002e0     	ldr	x0, [x23]
 12676ec: f000afd5     	adrp	x21, 0x2862000
 12676f0: b9811276     	ldrsw	x22, [x19, #0x110]
 12676f4: f9416eb5     	ldr	x21, [x21, #0x2d8]
 12676f8: 97f9627f     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12676fc: f94002a1     	ldr	x1, [x21]
 1267700: aa1603e2     	mov	x2, x22
 1267704: aa1f03e3     	mov	x3, xzr
 1267708: aa0003f5     	mov	x21, x0
 126770c: 97ff92a3     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 1267710: b40000d5     	cbz	x21, 0x1267728 <__start_il2cpp+0xbff64>
 1267714: f9400288     	ldr	x8, [x20]
 1267718: aa1503e0     	mov	x0, x21
 126771c: f9402101     	ldr	x1, [x8, #0x40]
 1267720: 97f96231     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 1267724: b4000560     	cbz	x0, 0x12677d0 <__start_il2cpp+0xc000c>
 1267728: b9401a88     	ldr	w8, [x20, #0x18]
 126772c: 7100091f     	cmp	w8, #0x2
 1267730: 540004e9     	b.ls	0x12677cc <__start_il2cpp+0xc0008>
 1267734: f9001a95     	str	x21, [x20, #0x30]
 1267738: b9816a75     	ldrsw	x21, [x19, #0x168]
 126773c: f94002e0     	ldr	x0, [x23]
 1267740: f000afd3     	adrp	x19, 0x2862000
 1267744: f9410a73     	ldr	x19, [x19, #0x210]
 1267748: 97f9626b     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 126774c: f9400261     	ldr	x1, [x19]
 1267750: aa1503e2     	mov	x2, x21
 1267754: aa1f03e3     	mov	x3, xzr
 1267758: aa0003f3     	mov	x19, x0
 126775c: 97ff928f     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 1267760: b40000d3     	cbz	x19, 0x1267778 <__start_il2cpp+0xbffb4>
 1267764: f9400288     	ldr	x8, [x20]
 1267768: aa1303e0     	mov	x0, x19
 126776c: f9402101     	ldr	x1, [x8, #0x40]
 1267770: 97f9621d     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 1267774: b40002e0     	cbz	x0, 0x12677d0 <__start_il2cpp+0xc000c>
 1267778: b9401a88     	ldr	w8, [x20, #0x18]
 126777c: 71000d1f     	cmp	w8, #0x3
 1267780: 54000269     	b.ls	0x12677cc <__start_il2cpp+0xc0008>
 1267784: f000afc8     	adrp	x8, 0x2862000
 1267788: f940dd08     	ldr	x8, [x8, #0x1b8]
 126778c: f9001e93     	str	x19, [x20, #0x38]
 1267790: f000afd3     	adrp	x19, 0x2862000
 1267794: f9400100     	ldr	x0, [x8]
 1267798: b940e008     	ldr	w8, [x0, #0xe0]
 126779c: f9417e73     	ldr	x19, [x19, #0x2f8]
 12677a0: 35000048     	cbnz	w8, 0x12677a8 <__start_il2cpp+0xbffe4>
 12677a4: 97f9620f     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12677a8: f9400260     	ldr	x0, [x19]
 12677ac: aa1403e1     	mov	x1, x20
 12677b0: a9434ff4     	ldp	x20, x19, [sp, #0x30]
 12677b4: a94257f6     	ldp	x22, x21, [sp, #0x20]
 12677b8: a9415ff8     	ldp	x24, x23, [sp, #0x10]
 12677bc: f94007fe     	ldr	x30, [sp, #0x8]
 12677c0: aa1f03e2     	mov	x2, xzr
 12677c4: fc4407e8     	ldr	d8, [sp], #0x40
 12677c8: 1400a775     	b	0x129159c <__start_il2cpp+0xe9dd8>
 12677cc: 97f9624f     	bl	0x10c0108 <CloseNLSocket+0x640>
 12677d0: 97f96255     	bl	0x10c0124 <CloseNLSocket+0x65c>
 12677d4: aa1f03e1     	mov	x1, xzr
 12677d8: 97f961fe     	bl	0x10bffd0 <CloseNLSocket+0x508>
 12677dc: 97f96249     	bl	0x10c0100 <CloseNLSocket+0x638>
