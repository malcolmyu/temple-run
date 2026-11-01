
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1277e80: a9be57fe     	stp	x30, x21, [sp, #-0x20]!
 1277e84: a9014ff4     	stp	x20, x19, [sp, #0x10]
 1277e88: d000bdf5     	adrp	x21, 0x2a35000
 1277e8c: f000af34     	adrp	x20, 0x285e000
 1277e90: 395d8ea8     	ldrb	w8, [x21, #0x763]
 1277e94: f9414294     	ldr	x20, [x20, #0x280]
 1277e98: aa0003f3     	mov	x19, x0
 1277e9c: 37000128     	tbnz	w8, #0x0, 0x1277ec0 <__start_il2cpp+0xd06fc>
 1277ea0: f000af40     	adrp	x0, 0x2862000
 1277ea4: f944f400     	ldr	x0, [x0, #0x9e8]
 1277ea8: 97f9200c     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1277eac: f000af20     	adrp	x0, 0x285e000
 1277eb0: f9414000     	ldr	x0, [x0, #0x280]
 1277eb4: 97f92009     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1277eb8: 52800028     	mov	w8, #0x1                // =1
 1277ebc: 391d8ea8     	strb	w8, [x21, #0x763]
 1277ec0: f9400280     	ldr	x0, [x20]
 1277ec4: b940e008     	ldr	w8, [x0, #0xe0]
 1277ec8: 34000188     	cbz	w8, 0x1277ef8 <__start_il2cpp+0xd0734>
 1277ecc: b40001b3     	cbz	x19, 0x1277f00 <__start_il2cpp+0xd073c>
 1277ed0: f000af48     	adrp	x8, 0x2862000
 1277ed4: f944f508     	ldr	x8, [x8, #0x9e8]
 1277ed8: f9400269     	ldr	x9, [x19]
 1277edc: f9400108     	ldr	x8, [x8]
 1277ee0: 3944c12b     	ldrb	w11, [x9, #0x130]
 1277ee4: 3944c10a     	ldrb	w10, [x8, #0x130]
 1277ee8: 6b0a017f     	cmp	w11, w10
 1277eec: 54000142     	b.hs	0x1277f14 <__start_il2cpp+0xd0750>
 1277ef0: aa1f03e8     	mov	x8, xzr
 1277ef4: 1400000d     	b	0x1277f28 <__start_il2cpp+0xd0764>
 1277ef8: 97f9203a     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1277efc: b5fffeb3     	cbnz	x19, 0x1277ed0 <__start_il2cpp+0xd070c>
 1277f00: f9400288     	ldr	x8, [x20]
 1277f04: 52800020     	mov	w0, #0x1                // =1
 1277f08: f9405d08     	ldr	x8, [x8, #0xb8]
 1277f0c: f9000d1f     	str	xzr, [x8, #0x18]
 1277f10: 1400000a     	b	0x1277f38 <__start_il2cpp+0xd0774>
 1277f14: f9406529     	ldr	x9, [x9, #0xc8]
 1277f18: 8b0a0d29     	add	x9, x9, x10, lsl #3
 1277f1c: f85f8129     	ldur	x9, [x9, #-0x8]
 1277f20: eb08013f     	cmp	x9, x8
 1277f24: 9a9f0268     	csel	x8, x19, xzr, eq
 1277f28: f9400289     	ldr	x9, [x20]
 1277f2c: 52800020     	mov	w0, #0x1                // =1
 1277f30: f9405d29     	ldr	x9, [x9, #0xb8]
 1277f34: f9000d28     	str	x8, [x9, #0x18]
 1277f38: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 1277f3c: a8c257fe     	ldp	x30, x21, [sp], #0x20
 1277f40: d65f03c0     	ret
