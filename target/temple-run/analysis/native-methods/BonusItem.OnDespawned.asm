
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12965c4: a9be57fe     	stp	x30, x21, [sp, #-0x20]!
 12965c8: a9014ff4     	stp	x20, x19, [sp, #0x10]
 12965cc: f000bcf5     	adrp	x21, 0x2a35000
 12965d0: f000ae34     	adrp	x20, 0x285d000
 12965d4: 396226a8     	ldrb	w8, [x21, #0x889]
 12965d8: f9460e94     	ldr	x20, [x20, #0xc18]
 12965dc: aa0003f3     	mov	x19, x0
 12965e0: 37000128     	tbnz	w8, #0x0, 0x1296604 <__start_il2cpp+0xeee40>
 12965e4: f000ae20     	adrp	x0, 0x285d000
 12965e8: f9460c00     	ldr	x0, [x0, #0xc18]
 12965ec: 97f8a63b     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12965f0: b000ae60     	adrp	x0, 0x2863000
 12965f4: f9469000     	ldr	x0, [x0, #0xd20]
 12965f8: 97f8a638     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12965fc: 52800028     	mov	w8, #0x1                // =1
 1296600: 392226a8     	strb	w8, [x21, #0x889]
 1296604: aa1303e0     	mov	x0, x19
 1296608: aa1f03e1     	mov	x1, xzr
 129660c: 3902027f     	strb	wzr, [x19, #0x80]
 1296610: 94487ebf     	bl	0x24b610c <__start_il2cpp+0x130e948>
 1296614: f9400288     	ldr	x8, [x20]
 1296618: aa0003f3     	mov	x19, x0
 129661c: b940e109     	ldr	w9, [x8, #0xe0]
 1296620: 35000089     	cbnz	w9, 0x1296630 <__start_il2cpp+0xeee6c>
 1296624: aa0803e0     	mov	x0, x8
 1296628: 97f8a66e     	bl	0x10bffe0 <CloseNLSocket+0x518>
 129662c: f9400288     	ldr	x8, [x20]
 1296630: f9405d08     	ldr	x8, [x8, #0xb8]
 1296634: f9400100     	ldr	x0, [x8]
 1296638: b4000200     	cbz	x0, 0x1296678 <__start_il2cpp+0xeeeb4>
 129663c: b000ae68     	adrp	x8, 0x2863000
 1296640: f9469108     	ldr	x8, [x8, #0xd20]
 1296644: aa1f03e2     	mov	x2, xzr
 1296648: f9400101     	ldr	x1, [x8]
 129664c: 97fccdd5     	bl	0x11c9da0 <__start_il2cpp+0x225dc>
 1296650: b4000140     	cbz	x0, 0x1296678 <__start_il2cpp+0xeeeb4>
 1296654: aa1f03e1     	mov	x1, xzr
 1296658: 94487ead     	bl	0x24b610c <__start_il2cpp+0x130e948>
 129665c: b40000f3     	cbz	x19, 0x1296678 <__start_il2cpp+0xeeeb4>
 1296660: aa0003e1     	mov	x1, x0
 1296664: aa1303e0     	mov	x0, x19
 1296668: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 129666c: aa1f03e2     	mov	x2, xzr
 1296670: a8c257fe     	ldp	x30, x21, [sp], #0x20
 1296674: 1448b1f4     	b	0x24c2e44 <__start_il2cpp+0x131b680>
 1296678: 97f8a6a2     	bl	0x10c0100 <CloseNLSocket+0x638>
