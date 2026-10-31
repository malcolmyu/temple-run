
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12f7490: a9bc67fe     	stp	x30, x25, [sp, #-0x40]!
 12f7494: a9015ff8     	stp	x24, x23, [sp, #0x10]
 12f7498: a90257f6     	stp	x22, x21, [sp, #0x20]
 12f749c: a9034ff4     	stp	x20, x19, [sp, #0x30]
 12f74a0: d000b9f4     	adrp	x20, 0x2a35000
 12f74a4: d000ab36     	adrp	x22, 0x285d000
 12f74a8: 396eea88     	ldrb	w8, [x20, #0xbba]
 12f74ac: f940a2d6     	ldr	x22, [x22, #0x140]
 12f74b0: aa0003f3     	mov	x19, x0
 12f74b4: 37000248     	tbnz	w8, #0x0, 0x12f74fc <__start_il2cpp+0x14fd38>
 12f74b8: d000ab20     	adrp	x0, 0x285d000
 12f74bc: f9423c00     	ldr	x0, [x0, #0x478]
 12f74c0: 97f72286     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f74c4: f000ab60     	adrp	x0, 0x2866000
 12f74c8: f9446400     	ldr	x0, [x0, #0x8c8]
 12f74cc: 97f72283     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f74d0: d000ab20     	adrp	x0, 0x285d000
 12f74d4: f940a000     	ldr	x0, [x0, #0x140]
 12f74d8: 97f72280     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f74dc: f000ab60     	adrp	x0, 0x2866000
 12f74e0: f9446800     	ldr	x0, [x0, #0x8d0]
 12f74e4: 97f7227d     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f74e8: f000ab60     	adrp	x0, 0x2866000
 12f74ec: f9446c00     	ldr	x0, [x0, #0x8d8]
 12f74f0: 97f7227a     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f74f4: 52800028     	mov	w8, #0x1                // =1
 12f74f8: 392eea88     	strb	w8, [x20, #0xbba]
 12f74fc: f000ab75     	adrp	x21, 0x2866000
 12f7500: f9446ab5     	ldr	x21, [x21, #0x8d0]
 12f7504: f94002c8     	ldr	x8, [x22]
 12f7508: f000ab77     	adrp	x23, 0x2866000
 12f750c: d000ab38     	adrp	x24, 0x285d000
 12f7510: f000ab76     	adrp	x22, 0x2866000
 12f7514: f94466f7     	ldr	x23, [x23, #0x8c8]
 12f7518: f9423f18     	ldr	x24, [x24, #0x478]
 12f751c: f9446ed6     	ldr	x22, [x22, #0x8d8]
 12f7520: aa1f03f4     	mov	x20, xzr
 12f7524: aa1f03f9     	mov	x25, xzr
 12f7528: f9403269     	ldr	x9, [x19, #0x60]
 12f752c: b40004e9     	cbz	x9, 0x12f75c8 <__start_il2cpp+0x14fe04>
 12f7530: f940092a     	ldr	x10, [x9, #0x10]
 12f7534: b940014b     	ldr	w11, [x10]
 12f7538: eb0b029f     	cmp	x20, x11
 12f753c: 54000442     	b.hs	0x12f75c4 <__start_il2cpp+0x14fe00>
 12f7540: f940094a     	ldr	x10, [x10, #0x10]
 12f7544: eb2a433f     	cmp	x25, w10, uxtw
 12f7548: 540003e2     	b.hs	0x12f75c4 <__start_il2cpp+0x14fe00>
 12f754c: 9b0a2689     	madd	x9, x20, x10, x9
 12f7550: 8b190129     	add	x9, x9, x25
 12f7554: 39408129     	ldrb	w9, [x9, #0x20]
 12f7558: aa0803e0     	mov	x0, x8
 12f755c: aa1f03e2     	mov	x2, xzr
 12f7560: 7100013f     	cmp	w9, #0x0
 12f7564: 9a9702a9     	csel	x9, x21, x23, eq
 12f7568: f9400121     	ldr	x1, [x9]
 12f756c: 94290e4c     	bl	0x1d3ae9c <__start_il2cpp+0xb936d8>
 12f7570: 91000739     	add	x25, x25, #0x1
 12f7574: f1004f3f     	cmp	x25, #0x13
 12f7578: aa0003e8     	mov	x8, x0
 12f757c: 54fffd61     	b.ne	0x12f7528 <__start_il2cpp+0x14fd64>
 12f7580: f9400301     	ldr	x1, [x24]
 12f7584: aa0803e0     	mov	x0, x8
 12f7588: aa1f03e2     	mov	x2, xzr
 12f758c: 94290e44     	bl	0x1d3ae9c <__start_il2cpp+0xb936d8>
 12f7590: 91000694     	add	x20, x20, #0x1
 12f7594: f1004e9f     	cmp	x20, #0x13
 12f7598: aa0003e8     	mov	x8, x0
 12f759c: 54fffc41     	b.ne	0x12f7524 <__start_il2cpp+0x14fd60>
 12f75a0: f94002c0     	ldr	x0, [x22]
 12f75a4: aa0803e1     	mov	x1, x8
 12f75a8: aa1f03e2     	mov	x2, xzr
 12f75ac: 94290e3c     	bl	0x1d3ae9c <__start_il2cpp+0xb936d8>
 12f75b0: a9434ff4     	ldp	x20, x19, [sp, #0x30]
 12f75b4: a94257f6     	ldp	x22, x21, [sp, #0x20]
 12f75b8: a9415ff8     	ldp	x24, x23, [sp, #0x10]
 12f75bc: a8c467fe     	ldp	x30, x25, [sp], #0x40
 12f75c0: 14000003     	b	0x12f75cc <__start_il2cpp+0x14fe08>
 12f75c4: 97f722d1     	bl	0x10c0108 <CloseNLSocket+0x640>
 12f75c8: 97f722ce     	bl	0x10c0100 <CloseNLSocket+0x638>
