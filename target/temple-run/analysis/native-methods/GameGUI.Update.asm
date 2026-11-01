
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12bf954: a9bf4ffe     	stp	x30, x19, [sp, #-0x10]!
 12bf958: f9402c08     	ldr	x8, [x0, #0x58]
 12bf95c: b40002a8     	cbz	x8, 0x12bf9b0 <__start_il2cpp+0x1181ec>
 12bf960: b9413901     	ldr	w1, [x8, #0x138]
 12bf964: b9408009     	ldr	w9, [x0, #0x80]
 12bf968: aa0003f3     	mov	x19, x0
 12bf96c: 6b09003f     	cmp	w1, w9
 12bf970: 540000c0     	b.eq	0x12bf988 <__start_il2cpp+0x1181c4>
 12bf974: aa1303e0     	mov	x0, x19
 12bf978: b9008261     	str	w1, [x19, #0x80]
 12bf97c: 97fffedb     	bl	0x12bf4e8 <__start_il2cpp+0x117d24>
 12bf980: f9402e68     	ldr	x8, [x19, #0x58]
 12bf984: b4000168     	cbz	x8, 0x12bf9b0 <__start_il2cpp+0x1181ec>
 12bf988: b9414901     	ldr	w1, [x8, #0x148]
 12bf98c: b9408668     	ldr	w8, [x19, #0x84]
 12bf990: 6b08003f     	cmp	w1, w8
 12bf994: 54000061     	b.ne	0x12bf9a0 <__start_il2cpp+0x1181dc>
 12bf998: a8c14ffe     	ldp	x30, x19, [sp], #0x10
 12bf99c: d65f03c0     	ret
 12bf9a0: b9008661     	str	w1, [x19, #0x84]
 12bf9a4: aa1303e0     	mov	x0, x19
 12bf9a8: a8c14ffe     	ldp	x30, x19, [sp], #0x10
 12bf9ac: 17fffedf     	b	0x12bf528 <__start_il2cpp+0x117d64>
 12bf9b0: 97f801d4     	bl	0x10c0100 <CloseNLSocket+0x638>
