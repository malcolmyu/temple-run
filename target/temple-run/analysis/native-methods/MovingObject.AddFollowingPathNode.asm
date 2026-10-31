
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12e06d0: a9be57fe     	stp	x30, x21, [sp, #-0x20]!
 12e06d4: a9014ff4     	stp	x20, x19, [sp, #0x10]
 12e06d8: b000bab4     	adrp	x20, 0x2a35000
 12e06dc: 396bf688     	ldrb	w8, [x20, #0xafd]
 12e06e0: aa0103f3     	mov	x19, x1
 12e06e4: aa0003f5     	mov	x21, x0
 12e06e8: 37000188     	tbnz	w8, #0x0, 0x12e0718 <__start_il2cpp+0x138f54>
 12e06ec: b000ac20     	adrp	x0, 0x2865000
 12e06f0: f9476000     	ldr	x0, [x0, #0xec0]
 12e06f4: 97f77df9     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e06f8: b000ac20     	adrp	x0, 0x2865000
 12e06fc: f9476400     	ldr	x0, [x0, #0xec8]
 12e0700: 97f77df6     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e0704: b000ac20     	adrp	x0, 0x2865000
 12e0708: f9476800     	ldr	x0, [x0, #0xed0]
 12e070c: 97f77df3     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e0710: 52800028     	mov	w8, #0x1                // =1
 12e0714: 392bf688     	strb	w8, [x20, #0xafd]
 12e0718: f9403ab4     	ldr	x20, [x21, #0x70]
 12e071c: b5000194     	cbnz	x20, 0x12e074c <__start_il2cpp+0x138f88>
 12e0720: b000ac28     	adrp	x8, 0x2865000
 12e0724: f9476908     	ldr	x8, [x8, #0xed0]
 12e0728: f9400100     	ldr	x0, [x8]
 12e072c: 97f77e72     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12e0730: b000ac28     	adrp	x8, 0x2865000
 12e0734: f9476508     	ldr	x8, [x8, #0xec8]
 12e0738: aa0003f4     	mov	x20, x0
 12e073c: f9400101     	ldr	x1, [x8]
 12e0740: 94186542     	bl	0x18f9c48 <__start_il2cpp+0x752484>
 12e0744: f9003ab4     	str	x20, [x21, #0x70]
 12e0748: b4000394     	cbz	x20, 0x12e07b8 <__start_il2cpp+0x138ff4>
 12e074c: b000ac29     	adrp	x9, 0x2865000
 12e0750: f9476129     	ldr	x9, [x9, #0xec0]
 12e0754: b9401e8a     	ldr	w10, [x20, #0x1c]
 12e0758: f9400a88     	ldr	x8, [x20, #0x10]
 12e075c: f9400129     	ldr	x9, [x9]
 12e0760: 1100054a     	add	w10, w10, #0x1
 12e0764: b9001e8a     	str	w10, [x20, #0x1c]
 12e0768: b4000288     	cbz	x8, 0x12e07b8 <__start_il2cpp+0x138ff4>
 12e076c: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12e0770: b940190b     	ldr	w11, [x8, #0x18]
 12e0774: 6b0b015f     	cmp	w10, w11
 12e0778: 54000102     	b.hs	0x12e0798 <__start_il2cpp+0x138fd4>
 12e077c: 11000549     	add	w9, w10, #0x1
 12e0780: 8b0a0d08     	add	x8, x8, x10, lsl #3
 12e0784: b9001a89     	str	w9, [x20, #0x18]
 12e0788: f9001113     	str	x19, [x8, #0x20]
 12e078c: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 12e0790: a8c257fe     	ldp	x30, x21, [sp], #0x20
 12e0794: d65f03c0     	ret
 12e0798: f9401128     	ldr	x8, [x9, #0x20]
 12e079c: aa1403e0     	mov	x0, x20
 12e07a0: aa1303e1     	mov	x1, x19
 12e07a4: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 12e07a8: f9406108     	ldr	x8, [x8, #0xc0]
 12e07ac: f9403902     	ldr	x2, [x8, #0x70]
 12e07b0: a8c257fe     	ldp	x30, x21, [sp], #0x20
 12e07b4: 14186718     	b	0x18fa414 <__start_il2cpp+0x752c50>
 12e07b8: 97f77e52     	bl	0x10c0100 <CloseNLSocket+0x638>
