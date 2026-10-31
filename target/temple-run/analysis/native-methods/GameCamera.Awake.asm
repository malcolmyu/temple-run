
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12af4b4: a9be57fe     	stp	x30, x21, [sp, #-0x20]!
 12af4b8: a9014ff4     	stp	x20, x19, [sp, #0x10]
 12af4bc: d000bc34     	adrp	x20, 0x2a35000
 12af4c0: b000adb5     	adrp	x21, 0x2864000
 12af4c4: 39661e88     	ldrb	w8, [x20, #0x987]
 12af4c8: f9441ab5     	ldr	x21, [x21, #0x830]
 12af4cc: aa0003f3     	mov	x19, x0
 12af4d0: 37000128     	tbnz	w8, #0x0, 0x12af4f4 <__start_il2cpp+0x107d30>
 12af4d4: f000ad80     	adrp	x0, 0x2862000
 12af4d8: f9423000     	ldr	x0, [x0, #0x460]
 12af4dc: 97f8427f     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12af4e0: b000ada0     	adrp	x0, 0x2864000
 12af4e4: f9441800     	ldr	x0, [x0, #0x830]
 12af4e8: 97f8427c     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12af4ec: 52800028     	mov	w8, #0x1                // =1
 12af4f0: 39261e88     	strb	w8, [x20, #0x987]
 12af4f4: f94002a8     	ldr	x8, [x21]
 12af4f8: f9405d08     	ldr	x8, [x8, #0xb8]
 12af4fc: f9000113     	str	x19, [x8]
 12af500: f9404268     	ldr	x8, [x19, #0x80]
 12af504: b4000208     	cbz	x8, 0x12af544 <__start_il2cpp+0x107d80>
 12af508: f000ad89     	adrp	x9, 0x2862000
 12af50c: f9423129     	ldr	x9, [x9, #0x460]
 12af510: f940010a     	ldr	x10, [x8]
 12af514: f9400129     	ldr	x9, [x9]
 12af518: 3944c14c     	ldrb	w12, [x10, #0x130]
 12af51c: 3944c12b     	ldrb	w11, [x9, #0x130]
 12af520: 6b0b019f     	cmp	w12, w11
 12af524: 54000062     	b.hs	0x12af530 <__start_il2cpp+0x107d6c>
 12af528: aa1f03e8     	mov	x8, xzr
 12af52c: 14000006     	b	0x12af544 <__start_il2cpp+0x107d80>
 12af530: f940654a     	ldr	x10, [x10, #0xc8]
 12af534: 8b0b0d4a     	add	x10, x10, x11, lsl #3
 12af538: f85f814a     	ldur	x10, [x10, #-0x8]
 12af53c: eb09015f     	cmp	x10, x9
 12af540: 9a9f0108     	csel	x8, x8, xzr, eq
 12af544: aa1303e0     	mov	x0, x19
 12af548: aa1f03e1     	mov	x1, xzr
 12af54c: f9004668     	str	x8, [x19, #0x88]
 12af550: 94481aef     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12af554: b40002e0     	cbz	x0, 0x12af5b0 <__start_il2cpp+0x107dec>
 12af558: 2d5b0a61     	ldp	s1, s2, [x19, #0xd8]
 12af55c: bd40d660     	ldr	s0, [x19, #0xd4]
 12af560: aa1f03e1     	mov	x1, xzr
 12af564: 94484c6c     	bl	0x24c2714 <__start_il2cpp+0x131af50>
 12af568: aa1303e0     	mov	x0, x19
 12af56c: aa1f03e1     	mov	x1, xzr
 12af570: 94481ae7     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12af574: f9403e68     	ldr	x8, [x19, #0x78]
 12af578: b40001c8     	cbz	x8, 0x12af5b0 <__start_il2cpp+0x107dec>
 12af57c: aa0003f3     	mov	x19, x0
 12af580: aa0803e0     	mov	x0, x8
 12af584: aa1f03e1     	mov	x1, xzr
 12af588: 94481ae1     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12af58c: b4000120     	cbz	x0, 0x12af5b0 <__start_il2cpp+0x107dec>
 12af590: aa1f03e1     	mov	x1, xzr
 12af594: 94484c38     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12af598: b40000d3     	cbz	x19, 0x12af5b0 <__start_il2cpp+0x107dec>
 12af59c: aa1303e0     	mov	x0, x19
 12af5a0: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 12af5a4: aa1f03e1     	mov	x1, xzr
 12af5a8: a8c257fe     	ldp	x30, x21, [sp], #0x20
 12af5ac: 14485038     	b	0x24c368c <__start_il2cpp+0x131bec8>
 12af5b0: 97f842d4     	bl	0x10c0100 <CloseNLSocket+0x638>
