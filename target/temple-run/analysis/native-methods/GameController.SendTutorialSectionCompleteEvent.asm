
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12677e0: fc1c0fe8     	str	d8, [sp, #-0x40]!
 12677e4: f90007fe     	str	x30, [sp, #0x8]
 12677e8: a9015ff8     	stp	x24, x23, [sp, #0x10]
 12677ec: a90257f6     	stp	x22, x21, [sp, #0x20]
 12677f0: a9034ff4     	stp	x20, x19, [sp, #0x30]
 12677f4: d000be74     	adrp	x20, 0x2a35000
 12677f8: 395c6288     	ldrb	w8, [x20, #0x718]
 12677fc: aa0003f3     	mov	x19, x0
 1267800: 37000488     	tbnz	w8, #0x0, 0x1267890 <__start_il2cpp+0xc00cc>
 1267804: f000afc0     	adrp	x0, 0x2862000
 1267808: f940e800     	ldr	x0, [x0, #0x1d0]
 126780c: 97f961b3     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1267810: f000afc0     	adrp	x0, 0x2862000
 1267814: f940ec00     	ldr	x0, [x0, #0x1d8]
 1267818: 97f961b0     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126781c: f000afc0     	adrp	x0, 0x2862000
 1267820: f940dc00     	ldr	x0, [x0, #0x1b8]
 1267824: 97f961ad     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1267828: f000afc0     	adrp	x0, 0x2862000
 126782c: f9418000     	ldr	x0, [x0, #0x300]
 1267830: 97f961aa     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1267834: f000afc0     	adrp	x0, 0x2862000
 1267838: f9418400     	ldr	x0, [x0, #0x308]
 126783c: 97f961a7     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1267840: f000afc0     	adrp	x0, 0x2862000
 1267844: f9410800     	ldr	x0, [x0, #0x210]
 1267848: 97f961a4     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126784c: f000afc0     	adrp	x0, 0x2862000
 1267850: f9412800     	ldr	x0, [x0, #0x250]
 1267854: 97f961a1     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1267858: f000afc0     	adrp	x0, 0x2862000
 126785c: f9416c00     	ldr	x0, [x0, #0x2d8]
 1267860: 97f9619e     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1267864: f000afc0     	adrp	x0, 0x2862000
 1267868: f9418800     	ldr	x0, [x0, #0x310]
 126786c: 97f9619b     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1267870: f000afc0     	adrp	x0, 0x2862000
 1267874: f9418c00     	ldr	x0, [x0, #0x318]
 1267878: 97f96198     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126787c: f000afc0     	adrp	x0, 0x2862000
 1267880: f9419000     	ldr	x0, [x0, #0x320]
 1267884: 97f96195     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1267888: 52800028     	mov	w8, #0x1                // =1
 126788c: 391c6288     	strb	w8, [x20, #0x718]
 1267890: b9404a69     	ldr	w9, [x19, #0x48]
 1267894: f000afc8     	adrp	x8, 0x2862000
 1267898: f000afd8     	adrp	x24, 0x2862000
 126789c: f000afd7     	adrp	x23, 0x2862000
 12678a0: f940e908     	ldr	x8, [x8, #0x1d0]
 12678a4: f940ef18     	ldr	x24, [x24, #0x1d8]
 12678a8: f9412af7     	ldr	x23, [x23, #0x250]
 12678ac: 51000529     	sub	w9, w9, #0x1
 12678b0: 71000d3f     	cmp	w9, #0x3
 12678b4: 540000a8     	b.hi	0x12678c8 <__start_il2cpp+0xc0104>
 12678b8: f000a52a     	adrp	x10, 0x270e000 <pthread_rwlock_wrlock@plt+0x3fc0>
 12678bc: 9104214a     	add	x10, x10, #0x108
 12678c0: f869d949     	ldr	x9, [x10, w9, sxtw #3]
 12678c4: 14000003     	b	0x12678d0 <__start_il2cpp+0xc010c>
 12678c8: f000afc9     	adrp	x9, 0x2862000
 12678cc: f9418929     	ldr	x9, [x9, #0x310]
 12678d0: f9400100     	ldr	x0, [x8]
 12678d4: f9400134     	ldr	x20, [x9]
 12678d8: 52800061     	mov	w1, #0x3                // =3
 12678dc: 97f9619d     	bl	0x10bff50 <CloseNLSocket+0x488>
 12678e0: f9400308     	ldr	x8, [x24]
 12678e4: bd411668     	ldr	s8, [x19, #0x114]
 12678e8: aa0003f5     	mov	x21, x0
 12678ec: aa0803e0     	mov	x0, x8
 12678f0: 97f96201     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12678f4: f94002e1     	ldr	x1, [x23]
 12678f8: 52aff009     	mov	w9, #0x7f800000         // =2139095040
 12678fc: 1e380108     	fcvtzs	w8, s8
 1267900: 1e270120     	fmov	s0, w9
 1267904: 93407d08     	sxtw	x8, w8
 1267908: 1e202100     	fcmp	s8, s0
 126790c: b26183e9     	mov	x9, #-0x80000000        // =-2147483648
 1267910: 9a880122     	csel	x2, x9, x8, eq
 1267914: aa1f03e3     	mov	x3, xzr
 1267918: aa0003f6     	mov	x22, x0
 126791c: 97ff921f     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 1267920: b40008b5     	cbz	x21, 0x1267a34 <__start_il2cpp+0xc0270>
 1267924: b40000d6     	cbz	x22, 0x126793c <__start_il2cpp+0xc0178>
 1267928: f94002a8     	ldr	x8, [x21]
 126792c: aa1603e0     	mov	x0, x22
 1267930: f9402101     	ldr	x1, [x8, #0x40]
 1267934: 97f961ac     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 1267938: b4000780     	cbz	x0, 0x1267a28 <__start_il2cpp+0xc0264>
 126793c: b9401aa8     	ldr	w8, [x21, #0x18]
 1267940: 34000728     	cbz	w8, 0x1267a24 <__start_il2cpp+0xc0260>
 1267944: f90012b6     	str	x22, [x21, #0x20]
 1267948: f9400300     	ldr	x0, [x24]
 126794c: f000afd6     	adrp	x22, 0x2862000
 1267950: b9811277     	ldrsw	x23, [x19, #0x110]
 1267954: f9416ed6     	ldr	x22, [x22, #0x2d8]
 1267958: 97f961e7     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 126795c: f94002c1     	ldr	x1, [x22]
 1267960: aa1703e2     	mov	x2, x23
 1267964: aa1f03e3     	mov	x3, xzr
 1267968: aa0003f6     	mov	x22, x0
 126796c: 97ff920b     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 1267970: b40000d6     	cbz	x22, 0x1267988 <__start_il2cpp+0xc01c4>
 1267974: f94002a8     	ldr	x8, [x21]
 1267978: aa1603e0     	mov	x0, x22
 126797c: f9402101     	ldr	x1, [x8, #0x40]
 1267980: 97f96199     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 1267984: b4000520     	cbz	x0, 0x1267a28 <__start_il2cpp+0xc0264>
 1267988: b9401aa8     	ldr	w8, [x21, #0x18]
 126798c: 7100051f     	cmp	w8, #0x1
 1267990: 540004a9     	b.ls	0x1267a24 <__start_il2cpp+0xc0260>
 1267994: f90016b6     	str	x22, [x21, #0x28]
 1267998: b9816a76     	ldrsw	x22, [x19, #0x168]
 126799c: f9400300     	ldr	x0, [x24]
 12679a0: f000afd3     	adrp	x19, 0x2862000
 12679a4: f9410a73     	ldr	x19, [x19, #0x210]
 12679a8: 97f961d3     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12679ac: f9400261     	ldr	x1, [x19]
 12679b0: aa1603e2     	mov	x2, x22
 12679b4: aa1f03e3     	mov	x3, xzr
 12679b8: aa0003f3     	mov	x19, x0
 12679bc: 97ff91f7     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 12679c0: b40000d3     	cbz	x19, 0x12679d8 <__start_il2cpp+0xc0214>
 12679c4: f94002a8     	ldr	x8, [x21]
 12679c8: aa1303e0     	mov	x0, x19
 12679cc: f9402101     	ldr	x1, [x8, #0x40]
 12679d0: 97f96185     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 12679d4: b40002a0     	cbz	x0, 0x1267a28 <__start_il2cpp+0xc0264>
 12679d8: b9401aa8     	ldr	w8, [x21, #0x18]
 12679dc: 7100091f     	cmp	w8, #0x2
 12679e0: 54000229     	b.ls	0x1267a24 <__start_il2cpp+0xc0260>
 12679e4: f000afc8     	adrp	x8, 0x2862000
 12679e8: f940dd08     	ldr	x8, [x8, #0x1b8]
 12679ec: f9001ab3     	str	x19, [x21, #0x30]
 12679f0: f9400100     	ldr	x0, [x8]
 12679f4: b940e008     	ldr	w8, [x0, #0xe0]
 12679f8: 35000048     	cbnz	w8, 0x1267a00 <__start_il2cpp+0xc023c>
 12679fc: 97f96179     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1267a00: aa1403e0     	mov	x0, x20
 1267a04: aa1503e1     	mov	x1, x21
 1267a08: a9434ff4     	ldp	x20, x19, [sp, #0x30]
 1267a0c: a94257f6     	ldp	x22, x21, [sp, #0x20]
 1267a10: a9415ff8     	ldp	x24, x23, [sp, #0x10]
 1267a14: f94007fe     	ldr	x30, [sp, #0x8]
 1267a18: aa1f03e2     	mov	x2, xzr
 1267a1c: fc4407e8     	ldr	d8, [sp], #0x40
 1267a20: 1400a6df     	b	0x129159c <__start_il2cpp+0xe9dd8>
 1267a24: 97f961b9     	bl	0x10c0108 <CloseNLSocket+0x640>
 1267a28: 97f961bf     	bl	0x10c0124 <CloseNLSocket+0x65c>
 1267a2c: aa1f03e1     	mov	x1, xzr
 1267a30: 97f96168     	bl	0x10bffd0 <CloseNLSocket+0x508>
 1267a34: 97f961b3     	bl	0x10c0100 <CloseNLSocket+0x638>
