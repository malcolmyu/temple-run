
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 126b4e4: a9be57fe     	stp	x30, x21, [sp, #-0x20]!
 126b4e8: a9014ff4     	stp	x20, x19, [sp, #0x10]
 126b4ec: d000be54     	adrp	x20, 0x2a35000
 126b4f0: 395d0a88     	ldrb	w8, [x20, #0x742]
 126b4f4: aa0003f3     	mov	x19, x0
 126b4f8: 370000c8     	tbnz	w8, #0x0, 0x126b510 <__start_il2cpp+0xc3d4c>
 126b4fc: d000afa0     	adrp	x0, 0x2861000
 126b500: f9411400     	ldr	x0, [x0, #0x228]
 126b504: 97f95275     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126b508: 52800028     	mov	w8, #0x1                // =1
 126b50c: 391d0a88     	strb	w8, [x20, #0x742]
 126b510: b941ba68     	ldr	w8, [x19, #0x1b8]
 126b514: 7100051f     	cmp	w8, #0x1
 126b518: 540001eb     	b.lt	0x126b554 <__start_il2cpp+0xc3d90>
 126b51c: d000afb5     	adrp	x21, 0x2861000
 126b520: f94116b5     	ldr	x21, [x21, #0x228]
 126b524: 2a1f03f4     	mov	w20, wzr
 126b528: f940e260     	ldr	x0, [x19, #0x1c0]
 126b52c: b40001a0     	cbz	x0, 0x126b560 <__start_il2cpp+0xc3d9c>
 126b530: f94002a2     	ldr	x2, [x21]
 126b534: 2a1403e1     	mov	w1, w20
 126b538: 941a3b06     	bl	0x18fa150 <__start_il2cpp+0x75298c>
 126b53c: b4000120     	cbz	x0, 0x126b560 <__start_il2cpp+0xc3d9c>
 126b540: 3901401f     	strb	wzr, [x0, #0x50]
 126b544: b941ba68     	ldr	w8, [x19, #0x1b8]
 126b548: 11000694     	add	w20, w20, #0x1
 126b54c: 6b08029f     	cmp	w20, w8
 126b550: 54fffecb     	b.lt	0x126b528 <__start_il2cpp+0xc3d64>
 126b554: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 126b558: a8c257fe     	ldp	x30, x21, [sp], #0x20
 126b55c: d65f03c0     	ret
 126b560: 97f952e8     	bl	0x10c0100 <CloseNLSocket+0x638>
