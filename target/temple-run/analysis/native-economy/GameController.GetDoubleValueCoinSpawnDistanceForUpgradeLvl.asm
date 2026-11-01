
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 127346c: f81e0ffe     	str	x30, [sp, #-0x20]!
 1273470: a9014ff4     	stp	x20, x19, [sp, #0x10]
 1273474: d000be14     	adrp	x20, 0x2a35000
 1273478: 395d9a88     	ldrb	w8, [x20, #0x766]
 127347c: 2a0003f3     	mov	w19, w0
 1273480: 37000128     	tbnz	w8, #0x0, 0x12734a4 <__start_il2cpp+0xcbce0>
 1273484: f000af40     	adrp	x0, 0x285e000
 1273488: f9414000     	ldr	x0, [x0, #0x280]
 127348c: 97f93293     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273490: 9000af60     	adrp	x0, 0x285f000
 1273494: f943f800     	ldr	x0, [x0, #0x7f0]
 1273498: 97f93290     	bl	0x10bfed8 <CloseNLSocket+0x410>
 127349c: 52800028     	mov	w8, #0x1                // =1
 12734a0: 391d9a88     	strb	w8, [x20, #0x766]
 12734a4: 7100167f     	cmp	w19, #0x5
 12734a8: 540000c9     	b.ls	0x12734c0 <__start_il2cpp+0xcbcfc>
 12734ac: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 12734b0: 52993fe0     	mov	w0, #0xc9ff             // =51711
 12734b4: 72a77340     	movk	w0, #0x3b9a, lsl #16
 12734b8: f84207fe     	ldr	x30, [sp], #0x20
 12734bc: d65f03c0     	ret
 12734c0: f000af54     	adrp	x20, 0x285e000
 12734c4: f9414294     	ldr	x20, [x20, #0x280]
 12734c8: f9400280     	ldr	x0, [x20]
 12734cc: b940e008     	ldr	w8, [x0, #0xe0]
 12734d0: 35000068     	cbnz	w8, 0x12734dc <__start_il2cpp+0xcbd18>
 12734d4: 97f932c3     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12734d8: f9400280     	ldr	x0, [x20]
 12734dc: f9405c08     	ldr	x8, [x0, #0xb8]
 12734e0: f9400d08     	ldr	x8, [x8, #0x18]
 12734e4: b4000148     	cbz	x8, 0x127350c <__start_il2cpp+0xcbd48>
 12734e8: f9401500     	ldr	x0, [x8, #0x28]
 12734ec: b4000100     	cbz	x0, 0x127350c <__start_il2cpp+0xcbd48>
 12734f0: 9000af68     	adrp	x8, 0x285f000
 12734f4: f943f908     	ldr	x8, [x8, #0x7f0]
 12734f8: 2a1303e1     	mov	w1, w19
 12734fc: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 1273500: f9400102     	ldr	x2, [x8]
 1273504: f84207fe     	ldr	x30, [sp], #0x20
 1273508: 1419b26d     	b	0x18dfebc <__start_il2cpp+0x7386f8>
 127350c: 97f932fd     	bl	0x10c0100 <CloseNLSocket+0x638>
