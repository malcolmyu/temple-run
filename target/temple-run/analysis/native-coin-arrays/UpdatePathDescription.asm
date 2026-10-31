
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12e664c: f81d0ffe     	str	x30, [sp, #-0x30]!
 12e6650: a90157f6     	stp	x22, x21, [sp, #0x10]
 12e6654: a9024ff4     	stp	x20, x19, [sp, #0x20]
 12e6658: f000ba75     	adrp	x21, 0x2a35000
 12e665c: d000abb6     	adrp	x22, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12e6660: 396c82a8     	ldrb	w8, [x21, #0xb20]
 12e6664: f94562d6     	ldr	x22, [x22, #0xac0]
 12e6668: aa0103f4     	mov	x20, x1
 12e666c: aa0003f3     	mov	x19, x0
 12e6670: 37000128     	tbnz	w8, #0x0, 0x12e6694 <__start_il2cpp+0x13eed0>
 12e6674: d000aba0     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12e6678: f9456000     	ldr	x0, [x0, #0xac0]
 12e667c: 97f76617     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e6680: 9000abe0     	adrp	x0, 0x2862000
 12e6684: f9424800     	ldr	x0, [x0, #0x490]
 12e6688: 97f76614     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e668c: 52800028     	mov	w8, #0x1                // =1
 12e6690: 392c82a8     	strb	w8, [x21, #0xb20]
 12e6694: f94002c0     	ldr	x0, [x22]
 12e6698: b940e008     	ldr	w8, [x0, #0xe0]
 12e669c: 35000048     	cbnz	w8, 0x12e66a4 <__start_il2cpp+0x13eee0>
 12e66a0: 97f76650     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e66a4: aa1403e0     	mov	x0, x20
 12e66a8: aa1f03e1     	mov	x1, xzr
 12e66ac: aa1f03e2     	mov	x2, xzr
 12e66b0: 94474b7a     	bl	0x24b9498 <__start_il2cpp+0x1311cd4>
 12e66b4: 37000a20     	tbnz	w0, #0x0, 0x12e67f8 <__start_il2cpp+0x13f034>
 12e66b8: aa1303e0     	mov	x0, x19
 12e66bc: 97fff07d     	bl	0x12e28b0 <__start_il2cpp+0x13b0ec>
 12e66c0: 36000060     	tbz	w0, #0x0, 0x12e66cc <__start_il2cpp+0x13ef08>
 12e66c4: 2a1f03e8     	mov	w8, wzr
 12e66c8: 14000004     	b	0x12e66d8 <__start_il2cpp+0x13ef14>
 12e66cc: b4000a74     	cbz	x20, 0x12e6818 <__start_il2cpp+0x13f054>
 12e66d0: b9407a88     	ldr	w8, [x20, #0x78]
 12e66d4: 11000508     	add	w8, w8, #0x1
 12e66d8: 3940f269     	ldrb	w9, [x19, #0x3c]
 12e66dc: b9007a68     	str	w8, [x19, #0x78]
 12e66e0: 34000209     	cbz	w9, 0x12e6720 <__start_il2cpp+0x13ef5c>
 12e66e4: aa1303e0     	mov	x0, x19
 12e66e8: b9007e7f     	str	wzr, [x19, #0x7c]
 12e66ec: 97fff245     	bl	0x12e3000 <__start_il2cpp+0x13b83c>
 12e66f0: 360000a0     	tbz	w0, #0x0, 0x12e6704 <__start_il2cpp+0x13ef40>
 12e66f4: b4000934     	cbz	x20, 0x12e6818 <__start_il2cpp+0x13f054>
 12e66f8: b9408288     	ldr	w8, [x20, #0x80]
 12e66fc: 11000508     	add	w8, w8, #0x1
 12e6700: b9008268     	str	w8, [x19, #0x80]
 12e6704: b9403a68     	ldr	w8, [x19, #0x38]
 12e6708: 51001508     	sub	w8, w8, #0x5
 12e670c: 7100051f     	cmp	w8, #0x1
 12e6710: 54000048     	b.hi	0x12e6718 <__start_il2cpp+0x13ef54>
 12e6714: b9007a7f     	str	wzr, [x19, #0x78]
 12e6718: b50000d4     	cbnz	x20, 0x12e6730 <__start_il2cpp+0x13ef6c>
 12e671c: 1400003f     	b	0x12e6818 <__start_il2cpp+0x13f054>
 12e6720: b40007d4     	cbz	x20, 0x12e6818 <__start_il2cpp+0x13f054>
 12e6724: b9407e88     	ldr	w8, [x20, #0x7c]
 12e6728: 11000508     	add	w8, w8, #0x1
 12e672c: 290ffe68     	stp	w8, wzr, [x19, #0x7c]
 12e6730: 3940f668     	ldrb	w8, [x19, #0x3d]
 12e6734: 34000228     	cbz	w8, 0x12e6778 <__start_il2cpp+0x13efb4>
 12e6738: b9408a88     	ldr	w8, [x20, #0x88]
 12e673c: 9000abf6     	adrp	x22, 0x2862000
 12e6740: 11000515     	add	w21, w8, #0x1
 12e6744: b9008a75     	str	w21, [x19, #0x88]
 12e6748: f9424ad6     	ldr	x22, [x22, #0x490]
 12e674c: f94002c0     	ldr	x0, [x22]
 12e6750: b940e008     	ldr	w8, [x0, #0xe0]
 12e6754: 35000068     	cbnz	w8, 0x12e6760 <__start_il2cpp+0x13ef9c>
 12e6758: 97f76622     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e675c: f94002c0     	ldr	x0, [x22]
 12e6760: f9405c08     	ldr	x8, [x0, #0xb8]
 12e6764: b9404108     	ldr	w8, [x8, #0x40]
 12e6768: 6b0802bf     	cmp	w21, w8
 12e676c: 5400010a     	b.ge	0x12e678c <__start_il2cpp+0x13efc8>
 12e6770: b9408688     	ldr	w8, [x20, #0x84]
 12e6774: 14000004     	b	0x12e6784 <__start_il2cpp+0x13efc0>
 12e6778: b9408688     	ldr	w8, [x20, #0x84]
 12e677c: b9008a7f     	str	wzr, [x19, #0x88]
 12e6780: 11000508     	add	w8, w8, #0x1
 12e6784: b9008668     	str	w8, [x19, #0x84]
 12e6788: 14000002     	b	0x12e6790 <__start_il2cpp+0x13efcc>
 12e678c: b900867f     	str	wzr, [x19, #0x84]
 12e6790: 3940fa68     	ldrb	w8, [x19, #0x3e]
 12e6794: 34000068     	cbz	w8, 0x12e67a0 <__start_il2cpp+0x13efdc>
 12e6798: f9003e7f     	str	xzr, [x19, #0x78]
 12e679c: 14000003     	b	0x12e67a8 <__start_il2cpp+0x13efe4>
 12e67a0: 3940fe68     	ldrb	w8, [x19, #0x3f]
 12e67a4: 34000328     	cbz	w8, 0x12e6808 <__start_il2cpp+0x13f044>
 12e67a8: b900767f     	str	wzr, [x19, #0x74]
 12e67ac: 9000abf6     	adrp	x22, 0x2862000
 12e67b0: f9424ad6     	ldr	x22, [x22, #0x490]
 12e67b4: b9403275     	ldr	w21, [x19, #0x30]
 12e67b8: f94002c0     	ldr	x0, [x22]
 12e67bc: b940e008     	ldr	w8, [x0, #0xe0]
 12e67c0: 35000048     	cbnz	w8, 0x12e67c8 <__start_il2cpp+0x13f004>
 12e67c4: 97f76607     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e67c8: 2a1503e0     	mov	w0, w21
 12e67cc: 97fff28b     	bl	0x12e31f8 <__start_il2cpp+0x13ba34>
 12e67d0: 37000120     	tbnz	w0, #0x0, 0x12e67f4 <__start_il2cpp+0x13f030>
 12e67d4: f94002c0     	ldr	x0, [x22]
 12e67d8: b9403294     	ldr	w20, [x20, #0x30]
 12e67dc: b940e008     	ldr	w8, [x0, #0xe0]
 12e67e0: 35000048     	cbnz	w8, 0x12e67e8 <__start_il2cpp+0x13f024>
 12e67e4: 97f765ff     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e67e8: 2a1403e0     	mov	w0, w20
 12e67ec: 97fff283     	bl	0x12e31f8 <__start_il2cpp+0x13ba34>
 12e67f0: 36000040     	tbz	w0, #0x0, 0x12e67f8 <__start_il2cpp+0x13f034>
 12e67f4: f9003e7f     	str	xzr, [x19, #0x78]
 12e67f8: a9424ff4     	ldp	x20, x19, [sp, #0x20]
 12e67fc: a94157f6     	ldp	x22, x21, [sp, #0x10]
 12e6800: f84307fe     	ldr	x30, [sp], #0x30
 12e6804: d65f03c0     	ret
 12e6808: b9407688     	ldr	w8, [x20, #0x74]
 12e680c: 11000508     	add	w8, w8, #0x1
 12e6810: b9007668     	str	w8, [x19, #0x74]
 12e6814: 17ffffe6     	b	0x12e67ac <__start_il2cpp+0x13efe8>
 12e6818: 97f7663a     	bl	0x10c0100 <CloseNLSocket+0x638>
