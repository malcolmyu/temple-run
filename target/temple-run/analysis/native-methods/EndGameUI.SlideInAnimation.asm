
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12bbbc4: a9be57fe     	stp	x30, x21, [sp, #-0x20]!
 12bbbc8: a9014ff4     	stp	x20, x19, [sp, #0x10]
 12bbbcc: d000bbd4     	adrp	x20, 0x2a35000
 12bbbd0: b000ad55     	adrp	x21, 0x2864000
 12bbbd4: 3967ae88     	ldrb	w8, [x20, #0x9eb]
 12bbbd8: f94626b5     	ldr	x21, [x21, #0xc48]
 12bbbdc: aa0003f3     	mov	x19, x0
 12bbbe0: 370000c8     	tbnz	w8, #0x0, 0x12bbbf8 <__start_il2cpp+0x114434>
 12bbbe4: b000ad40     	adrp	x0, 0x2864000
 12bbbe8: f9462400     	ldr	x0, [x0, #0xc48]
 12bbbec: 97f810bb     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12bbbf0: 52800028     	mov	w8, #0x1                // =1
 12bbbf4: 3927ae88     	strb	w8, [x20, #0x9eb]
 12bbbf8: f94002a0     	ldr	x0, [x21]
 12bbbfc: 97f8113e     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12bbc00: aa1f03e1     	mov	x1, xzr
 12bbc04: aa0003f4     	mov	x20, x0
 12bbc08: 9430a9ff     	bl	0x1ee6404 <__start_il2cpp+0xd3ec40>
 12bbc0c: b900129f     	str	wzr, [x20, #0x10]
 12bbc10: f9001293     	str	x19, [x20, #0x20]
 12bbc14: aa1403e0     	mov	x0, x20
 12bbc18: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 12bbc1c: a8c257fe     	ldp	x30, x21, [sp], #0x20
 12bbc20: d65f03c0     	ret
