
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12f65ec: f81c0ffe     	str	x30, [sp, #-0x40]!
 12f65f0: a9015ff8     	stp	x24, x23, [sp, #0x10]
 12f65f4: a90257f6     	stp	x22, x21, [sp, #0x20]
 12f65f8: a9034ff4     	stp	x20, x19, [sp, #0x30]
 12f65fc: f000b9f6     	adrp	x22, 0x2a35000
 12f6600: 9000ab97     	adrp	x23, 0x2866000
 12f6604: b000ab78     	adrp	x24, 0x2863000
 12f6608: 9000ab54     	adrp	x20, 0x285e000
 12f660c: 9000ab55     	adrp	x21, 0x285e000
 12f6610: 396edac8     	ldrb	w8, [x22, #0xbb6]
 12f6614: f9440ef7     	ldr	x23, [x23, #0x818]
 12f6618: f9468b18     	ldr	x24, [x24, #0xd10]
 12f661c: f9451294     	ldr	x20, [x20, #0xa20]
 12f6620: f94472b5     	ldr	x21, [x21, #0x8e0]
 12f6624: aa0003f3     	mov	x19, x0
 12f6628: 37000428     	tbnz	w8, #0x0, 0x12f66ac <__start_il2cpp+0x14eee8>
 12f662c: d000ab20     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12f6630: f9457000     	ldr	x0, [x0, #0xae0]
 12f6634: 97f72629     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f6638: 9000ab80     	adrp	x0, 0x2866000
 12f663c: f9441000     	ldr	x0, [x0, #0x820]
 12f6640: 97f72626     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f6644: 9000ab40     	adrp	x0, 0x285e000
 12f6648: f9451000     	ldr	x0, [x0, #0xa20]
 12f664c: 97f72623     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f6650: f000ab20     	adrp	x0, 0x285d000
 12f6654: f9461c00     	ldr	x0, [x0, #0xc38]
 12f6658: 97f72620     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f665c: 9000ab40     	adrp	x0, 0x285e000
 12f6660: f944f800     	ldr	x0, [x0, #0x9f0]
 12f6664: 97f7261d     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f6668: d000ab20     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12f666c: f9456000     	ldr	x0, [x0, #0xac0]
 12f6670: 97f7261a     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f6674: 9000ab40     	adrp	x0, 0x285e000
 12f6678: f9447000     	ldr	x0, [x0, #0x8e0]
 12f667c: 97f72617     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f6680: b000ab60     	adrp	x0, 0x2863000
 12f6684: f9468800     	ldr	x0, [x0, #0xd10]
 12f6688: 97f72614     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f668c: 9000ab80     	adrp	x0, 0x2866000
 12f6690: f9440c00     	ldr	x0, [x0, #0x818]
 12f6694: 97f72611     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f6698: d000ab60     	adrp	x0, 0x2864000
 12f669c: f943dc00     	ldr	x0, [x0, #0x7b8]
 12f66a0: 97f7260e     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f66a4: 52800028     	mov	w8, #0x1                // =1
 12f66a8: 392edac8     	strb	w8, [x22, #0xbb6]
 12f66ac: f94002e0     	ldr	x0, [x23]
 12f66b0: f9400302     	ldr	x2, [x24]
 12f66b4: aa1303e1     	mov	x1, x19
 12f66b8: aa1f03e3     	mov	x3, xzr
 12f66bc: 942935e5     	bl	0x1d43e50 <__start_il2cpp+0xb9c68c>
 12f66c0: f94002a8     	ldr	x8, [x21]
 12f66c4: f9400295     	ldr	x21, [x20]
 12f66c8: aa0003f4     	mov	x20, x0
 12f66cc: b940e109     	ldr	w9, [x8, #0xe0]
 12f66d0: 35000069     	cbnz	w9, 0x12f66dc <__start_il2cpp+0x14ef18>
 12f66d4: aa0803e0     	mov	x0, x8
 12f66d8: 97f72642     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12f66dc: aa1503e0     	mov	x0, x21
 12f66e0: aa1f03e1     	mov	x1, xzr
 12f66e4: 942ef23d     	bl	0x1eb2fd8 <__start_il2cpp+0xd0b814>
 12f66e8: aa0003e1     	mov	x1, x0
 12f66ec: aa1403e0     	mov	x0, x20
 12f66f0: aa1f03e2     	mov	x2, xzr
 12f66f4: 9446f62c     	bl	0x24b3fa4 <__start_il2cpp+0x130c7e0>
 12f66f8: aa0003f4     	mov	x20, x0
 12f66fc: b40000e0     	cbz	x0, 0x12f6718 <__start_il2cpp+0x14ef54>
 12f6700: f000ab28     	adrp	x8, 0x285d000
 12f6704: f9461d08     	ldr	x8, [x8, #0xc38]
 12f6708: f9400101     	ldr	x1, [x8]
 12f670c: f9400288     	ldr	x8, [x20]
 12f6710: eb01011f     	cmp	x8, x1
 12f6714: 54000921     	b.ne	0x12f6838 <__start_il2cpp+0x14f074>
 12f6718: d000ab35     	adrp	x21, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12f671c: f94562b5     	ldr	x21, [x21, #0xac0]
 12f6720: f94002a0     	ldr	x0, [x21]
 12f6724: b940e008     	ldr	w8, [x0, #0xe0]
 12f6728: 35000048     	cbnz	w8, 0x12f6730 <__start_il2cpp+0x14ef6c>
 12f672c: 97f7262d     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12f6730: aa1403e0     	mov	x0, x20
 12f6734: aa1f03e1     	mov	x1, xzr
 12f6738: aa1f03e2     	mov	x2, xzr
 12f673c: 94470b57     	bl	0x24b9498 <__start_il2cpp+0x1311cd4>
 12f6740: 36000300     	tbz	w0, #0x0, 0x12f67a0 <__start_il2cpp+0x14efdc>
 12f6744: d000ab68     	adrp	x8, 0x2864000
 12f6748: f943dd08     	ldr	x8, [x8, #0x7b8]
 12f674c: aa1303e1     	mov	x1, x19
 12f6750: aa1f03e2     	mov	x2, xzr
 12f6754: f9400100     	ldr	x0, [x8]
 12f6758: 942911d1     	bl	0x1d3ae9c <__start_il2cpp+0xb936d8>
 12f675c: d000ab28     	adrp	x8, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12f6760: f9457108     	ldr	x8, [x8, #0xae0]
 12f6764: aa0003f3     	mov	x19, x0
 12f6768: f9400108     	ldr	x8, [x8]
 12f676c: b940e109     	ldr	w9, [x8, #0xe0]
 12f6770: 35000069     	cbnz	w9, 0x12f677c <__start_il2cpp+0x14efb8>
 12f6774: aa0803e0     	mov	x0, x8
 12f6778: 97f7261a     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12f677c: aa1303e0     	mov	x0, x19
 12f6780: aa1f03e1     	mov	x1, xzr
 12f6784: 94467e84     	bl	0x2496194 <__start_il2cpp+0x12ee9d0>
 12f6788: a9434ff4     	ldp	x20, x19, [sp, #0x30]
 12f678c: a94257f6     	ldp	x22, x21, [sp, #0x20]
 12f6790: a9415ff8     	ldp	x24, x23, [sp, #0x10]
 12f6794: aa1f03e0     	mov	x0, xzr
 12f6798: f84407fe     	ldr	x30, [sp], #0x40
 12f679c: d65f03c0     	ret
 12f67a0: f94002a0     	ldr	x0, [x21]
 12f67a4: b940e008     	ldr	w8, [x0, #0xe0]
 12f67a8: 35000048     	cbnz	w8, 0x12f67b0 <__start_il2cpp+0x14efec>
 12f67ac: 97f7260d     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12f67b0: 9000ab48     	adrp	x8, 0x285e000
 12f67b4: f944f908     	ldr	x8, [x8, #0x9f0]
 12f67b8: aa1403e0     	mov	x0, x20
 12f67bc: f9400101     	ldr	x1, [x8]
 12f67c0: 9404263c     	bl	0x14000b0 <__start_il2cpp+0x2588ec>
 12f67c4: b4000380     	cbz	x0, 0x12f6834 <__start_il2cpp+0x14f070>
 12f67c8: aa1f03e1     	mov	x1, xzr
 12f67cc: aa0003f3     	mov	x19, x0
 12f67d0: 944708cb     	bl	0x24b8afc <__start_il2cpp+0x1311338>
 12f67d4: b4000300     	cbz	x0, 0x12f6834 <__start_il2cpp+0x14f070>
 12f67d8: 1e2703e0     	fmov	s0, wzr
 12f67dc: 1e2703e1     	fmov	s1, wzr
 12f67e0: 1e2703e2     	fmov	s2, wzr
 12f67e4: aa1f03e1     	mov	x1, xzr
 12f67e8: 94472fcb     	bl	0x24c2714 <__start_il2cpp+0x131af50>
 12f67ec: aa1303e0     	mov	x0, x19
 12f67f0: aa1f03e1     	mov	x1, xzr
 12f67f4: 944708c2     	bl	0x24b8afc <__start_il2cpp+0x1311338>
 12f67f8: b40001e0     	cbz	x0, 0x12f6834 <__start_il2cpp+0x14f070>
 12f67fc: 1e2703e0     	fmov	s0, wzr
 12f6800: 1e2703e1     	fmov	s1, wzr
 12f6804: 1e2703e2     	fmov	s2, wzr
 12f6808: aa1f03e1     	mov	x1, xzr
 12f680c: 94472d87     	bl	0x24c1e28 <__start_il2cpp+0x131a664>
 12f6810: 9000ab88     	adrp	x8, 0x2866000
 12f6814: f9441108     	ldr	x8, [x8, #0x820]
 12f6818: aa1303e0     	mov	x0, x19
 12f681c: a9434ff4     	ldp	x20, x19, [sp, #0x30]
 12f6820: a94257f6     	ldp	x22, x21, [sp, #0x20]
 12f6824: f9400101     	ldr	x1, [x8]
 12f6828: a9415ff8     	ldp	x24, x23, [sp, #0x10]
 12f682c: f84407fe     	ldr	x30, [sp], #0x40
 12f6830: 1403894c     	b	0x13d8d60 <__start_il2cpp+0x23159c>
 12f6834: 97f72633     	bl	0x10c0100 <CloseNLSocket+0x638>
 12f6838: aa1403e0     	mov	x0, x20
 12f683c: 97f72718     	bl	0x10c049c <CloseNLSocket+0x9d4>
