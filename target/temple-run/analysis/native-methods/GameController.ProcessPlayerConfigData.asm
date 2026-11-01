
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1278008: a9be57fe     	stp	x30, x21, [sp, #-0x20]!
 127800c: a9014ff4     	stp	x20, x19, [sp, #0x10]
 1278010: b000bdf5     	adrp	x21, 0x2a35000
 1278014: d000af34     	adrp	x20, 0x285e000
 1278018: 395d96a8     	ldrb	w8, [x21, #0x765]
 127801c: f9414294     	ldr	x20, [x20, #0x280]
 1278020: aa0003f3     	mov	x19, x0
 1278024: 37000128     	tbnz	w8, #0x0, 0x1278048 <__start_il2cpp+0xd0884>
 1278028: d000af20     	adrp	x0, 0x285e000
 127802c: f9414000     	ldr	x0, [x0, #0x280]
 1278030: 97f91faa     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1278034: d000af40     	adrp	x0, 0x2862000
 1278038: f944fc00     	ldr	x0, [x0, #0x9f8]
 127803c: 97f91fa7     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1278040: 52800028     	mov	w8, #0x1                // =1
 1278044: 391d96a8     	strb	w8, [x21, #0x765]
 1278048: f9400280     	ldr	x0, [x20]
 127804c: b940e008     	ldr	w8, [x0, #0xe0]
 1278050: 34000188     	cbz	w8, 0x1278080 <__start_il2cpp+0xd08bc>
 1278054: b40001b3     	cbz	x19, 0x1278088 <__start_il2cpp+0xd08c4>
 1278058: d000af48     	adrp	x8, 0x2862000
 127805c: f944fd08     	ldr	x8, [x8, #0x9f8]
 1278060: f9400269     	ldr	x9, [x19]
 1278064: f9400108     	ldr	x8, [x8]
 1278068: 3944c12b     	ldrb	w11, [x9, #0x130]
 127806c: 3944c10a     	ldrb	w10, [x8, #0x130]
 1278070: 6b0a017f     	cmp	w11, w10
 1278074: 54000142     	b.hs	0x127809c <__start_il2cpp+0xd08d8>
 1278078: aa1f03e8     	mov	x8, xzr
 127807c: 1400000d     	b	0x12780b0 <__start_il2cpp+0xd08ec>
 1278080: 97f91fd8     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1278084: b5fffeb3     	cbnz	x19, 0x1278058 <__start_il2cpp+0xd0894>
 1278088: f9400288     	ldr	x8, [x20]
 127808c: 52800020     	mov	w0, #0x1                // =1
 1278090: f9405d08     	ldr	x8, [x8, #0xb8]
 1278094: f900151f     	str	xzr, [x8, #0x28]
 1278098: 1400000a     	b	0x12780c0 <__start_il2cpp+0xd08fc>
 127809c: f9406529     	ldr	x9, [x9, #0xc8]
 12780a0: 8b0a0d29     	add	x9, x9, x10, lsl #3
 12780a4: f85f8129     	ldur	x9, [x9, #-0x8]
 12780a8: eb08013f     	cmp	x9, x8
 12780ac: 9a9f0268     	csel	x8, x19, xzr, eq
 12780b0: f9400289     	ldr	x9, [x20]
 12780b4: 52800020     	mov	w0, #0x1                // =1
 12780b8: f9405d29     	ldr	x9, [x9, #0xb8]
 12780bc: f9001528     	str	x8, [x9, #0x28]
 12780c0: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 12780c4: a8c257fe     	ldp	x30, x21, [sp], #0x20
 12780c8: d65f03c0     	ret
