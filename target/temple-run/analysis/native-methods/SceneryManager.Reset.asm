
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12f7624: a9be57fe     	stp	x30, x21, [sp, #-0x20]!
 12f7628: a9014ff4     	stp	x20, x19, [sp, #0x10]
 12f762c: d000b9f5     	adrp	x21, 0x2a35000
 12f7630: f000ab34     	adrp	x20, 0x285e000
 12f7634: 396eeea8     	ldrb	w8, [x21, #0xbbb]
 12f7638: f9414294     	ldr	x20, [x20, #0x280]
 12f763c: aa0003f3     	mov	x19, x0
 12f7640: 370000c8     	tbnz	w8, #0x0, 0x12f7658 <__start_il2cpp+0x14fe94>
 12f7644: f000ab20     	adrp	x0, 0x285e000
 12f7648: f9414000     	ldr	x0, [x0, #0x280]
 12f764c: 97f72223     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f7650: 52800028     	mov	w8, #0x1                // =1
 12f7654: 392eeea8     	strb	w8, [x21, #0xbbb]
 12f7658: f9400280     	ldr	x0, [x20]
 12f765c: b940e008     	ldr	w8, [x0, #0xe0]
 12f7660: 35000068     	cbnz	w8, 0x12f766c <__start_il2cpp+0x14fea8>
 12f7664: 97f7225f     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12f7668: f9400280     	ldr	x0, [x20]
 12f766c: f9405c08     	ldr	x8, [x0, #0xb8]
 12f7670: f9400108     	ldr	x8, [x8]
 12f7674: b40000e8     	cbz	x8, 0x12f7690 <__start_il2cpp+0x14fecc>
 12f7678: f9401501     	ldr	x1, [x8, #0x28]
 12f767c: aa1303e0     	mov	x0, x19
 12f7680: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 12f7684: 52800022     	mov	w2, #0x1                // =1
 12f7688: a8c257fe     	ldp	x30, x21, [sp], #0x20
 12f768c: 17fffab5     	b	0x12f6160 <__start_il2cpp+0x14e99c>
 12f7690: 97f7229c     	bl	0x10c0100 <CloseNLSocket+0x638>
