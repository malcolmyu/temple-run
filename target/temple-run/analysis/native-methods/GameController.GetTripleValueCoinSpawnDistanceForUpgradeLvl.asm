
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1273510: f81e0ffe     	str	x30, [sp, #-0x20]!
 1273514: a9014ff4     	stp	x20, x19, [sp, #0x10]
 1273518: d000be14     	adrp	x20, 0x2a35000
 127351c: 395d9e88     	ldrb	w8, [x20, #0x767]
 1273520: 2a0003f3     	mov	w19, w0
 1273524: 37000128     	tbnz	w8, #0x0, 0x1273548 <__start_il2cpp+0xcbd84>
 1273528: f000af40     	adrp	x0, 0x285e000
 127352c: f9414000     	ldr	x0, [x0, #0x280]
 1273530: 97f9326a     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273534: 9000af60     	adrp	x0, 0x285f000
 1273538: f943f800     	ldr	x0, [x0, #0x7f0]
 127353c: 97f93267     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1273540: 52800028     	mov	w8, #0x1                // =1
 1273544: 391d9e88     	strb	w8, [x20, #0x767]
 1273548: 7100167f     	cmp	w19, #0x5
 127354c: 540000c9     	b.ls	0x1273564 <__start_il2cpp+0xcbda0>
 1273550: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 1273554: 52993fe0     	mov	w0, #0xc9ff             // =51711
 1273558: 72a77340     	movk	w0, #0x3b9a, lsl #16
 127355c: f84207fe     	ldr	x30, [sp], #0x20
 1273560: d65f03c0     	ret
 1273564: f000af54     	adrp	x20, 0x285e000
 1273568: f9414294     	ldr	x20, [x20, #0x280]
 127356c: f9400280     	ldr	x0, [x20]
 1273570: b940e008     	ldr	w8, [x0, #0xe0]
 1273574: 35000068     	cbnz	w8, 0x1273580 <__start_il2cpp+0xcbdbc>
 1273578: 97f9329a     	bl	0x10bffe0 <CloseNLSocket+0x518>
 127357c: f9400280     	ldr	x0, [x20]
 1273580: f9405c08     	ldr	x8, [x0, #0xb8]
 1273584: f9400d08     	ldr	x8, [x8, #0x18]
 1273588: b4000148     	cbz	x8, 0x12735b0 <__start_il2cpp+0xcbdec>
 127358c: f9401900     	ldr	x0, [x8, #0x30]
 1273590: b4000100     	cbz	x0, 0x12735b0 <__start_il2cpp+0xcbdec>
 1273594: 9000af68     	adrp	x8, 0x285f000
 1273598: f943f908     	ldr	x8, [x8, #0x7f0]
 127359c: 2a1303e1     	mov	w1, w19
 12735a0: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 12735a4: f9400102     	ldr	x2, [x8]
 12735a8: f84207fe     	ldr	x30, [sp], #0x20
 12735ac: 1419b244     	b	0x18dfebc <__start_il2cpp+0x7386f8>
 12735b0: 97f932d4     	bl	0x10c0100 <CloseNLSocket+0x638>
