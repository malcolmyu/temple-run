
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12e68c8: a9be57fe     	stp	x30, x21, [sp, #-0x20]!
 12e68cc: a9014ff4     	stp	x20, x19, [sp, #0x10]
 12e68d0: f000ba75     	adrp	x21, 0x2a35000
 12e68d4: 9000abd4     	adrp	x20, 0x285e000
 12e68d8: 396c6ea8     	ldrb	w8, [x21, #0xb1b]
 12e68dc: f9414294     	ldr	x20, [x20, #0x280]
 12e68e0: aa0003f3     	mov	x19, x0
 12e68e4: 37000188     	tbnz	w8, #0x0, 0x12e6914 <__start_il2cpp+0x13f150>
 12e68e8: 9000abc0     	adrp	x0, 0x285e000
 12e68ec: f9414000     	ldr	x0, [x0, #0x280]
 12e68f0: 97f7657a     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e68f4: 9000abc0     	adrp	x0, 0x285e000
 12e68f8: f944f800     	ldr	x0, [x0, #0x9f0]
 12e68fc: 97f76577     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e6900: d000aba0     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12e6904: f9456000     	ldr	x0, [x0, #0xac0]
 12e6908: 97f76574     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e690c: 52800028     	mov	w8, #0x1                // =1
 12e6910: 392c6ea8     	strb	w8, [x21, #0xb1b]
 12e6914: f9400280     	ldr	x0, [x20]
 12e6918: b940e008     	ldr	w8, [x0, #0xe0]
 12e691c: 35000068     	cbnz	w8, 0x12e6928 <__start_il2cpp+0x13f164>
 12e6920: 97f765b0     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e6924: f9400280     	ldr	x0, [x20]
 12e6928: f9405c08     	ldr	x8, [x0, #0xb8]
 12e692c: f9400108     	ldr	x8, [x8]
 12e6930: b40003c8     	cbz	x8, 0x12e69a8 <__start_il2cpp+0x13f1e4>
 12e6934: d000aba9     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12e6938: f9456129     	ldr	x9, [x9, #0xac0]
 12e693c: 9000abd5     	adrp	x21, 0x285e000
 12e6940: f9412914     	ldr	x20, [x8, #0x250]
 12e6944: f9400120     	ldr	x0, [x9]
 12e6948: b940e009     	ldr	w9, [x0, #0xe0]
 12e694c: f944fab5     	ldr	x21, [x21, #0x9f0]
 12e6950: 35000049     	cbnz	w9, 0x12e6958 <__start_il2cpp+0x13f194>
 12e6954: 97f765a3     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e6958: f94002a1     	ldr	x1, [x21]
 12e695c: aa1403e0     	mov	x0, x20
 12e6960: 940465d4     	bl	0x14000b0 <__start_il2cpp+0x2588ec>
 12e6964: b4000220     	cbz	x0, 0x12e69a8 <__start_il2cpp+0x13f1e4>
 12e6968: aa1f03e1     	mov	x1, xzr
 12e696c: aa0003f4     	mov	x20, x0
 12e6970: 94474863     	bl	0x24b8afc <__start_il2cpp+0x1311338>
 12e6974: aa0003f5     	mov	x21, x0
 12e6978: aa1303e0     	mov	x0, x19
 12e697c: aa1f03e1     	mov	x1, xzr
 12e6980: 94473de3     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e6984: b4000135     	cbz	x21, 0x12e69a8 <__start_il2cpp+0x13f1e4>
 12e6988: aa0003e1     	mov	x1, x0
 12e698c: aa1503e0     	mov	x0, x21
 12e6990: aa1f03e2     	mov	x2, xzr
 12e6994: 9447712c     	bl	0x24c2e44 <__start_il2cpp+0x131b680>
 12e6998: aa1403e0     	mov	x0, x20
 12e699c: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 12e69a0: a8c257fe     	ldp	x30, x21, [sp], #0x20
 12e69a4: d65f03c0     	ret
 12e69a8: 97f765d6     	bl	0x10c0100 <CloseNLSocket+0x638>
