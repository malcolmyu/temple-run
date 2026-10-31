
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12ae0f4: a9be57fe     	stp	x30, x21, [sp, #-0x20]!
 12ae0f8: a9014ff4     	stp	x20, x19, [sp, #0x10]
 12ae0fc: f000bc35     	adrp	x21, 0x2a35000
 12ae100: 9000ad94     	adrp	x20, 0x285e000
 12ae104: 3965caa8     	ldrb	w8, [x21, #0x972]
 12ae108: f9428694     	ldr	x20, [x20, #0x508]
 12ae10c: aa0003f3     	mov	x19, x0
 12ae110: 37000128     	tbnz	w8, #0x0, 0x12ae134 <__start_il2cpp+0x106970>
 12ae114: 9000ad80     	adrp	x0, 0x285e000
 12ae118: f9428400     	ldr	x0, [x0, #0x508]
 12ae11c: 97f8476f     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12ae120: b000ada0     	adrp	x0, 0x2863000
 12ae124: f946c400     	ldr	x0, [x0, #0xd88]
 12ae128: 97f8476c     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12ae12c: 52800028     	mov	w8, #0x1                // =1
 12ae130: 3925caa8     	strb	w8, [x21, #0x972]
 12ae134: 1e2703e0     	fmov	s0, wzr
 12ae138: aa1303e0     	mov	x0, x19
 12ae13c: aa1f03e1     	mov	x1, xzr
 12ae140: 9400ca66     	bl	0x12e0ad8 <__start_il2cpp+0x139314>
 12ae144: 52a85408     	mov	w8, #0x42a00000         // =1117782016
 12ae148: 7900f27f     	strh	wzr, [x19, #0x78]
 12ae14c: 3901ea7f     	strb	wzr, [x19, #0x7a]
 12ae150: 3902127f     	strb	wzr, [x19, #0x84]
 12ae154: b9008268     	str	w8, [x19, #0x80]
 12ae158: b9008a7f     	str	wzr, [x19, #0x88]
 12ae15c: f9400281     	ldr	x1, [x20]
 12ae160: aa1303e0     	mov	x0, x19
 12ae164: 9403d2e7     	bl	0x13a2d00 <__start_il2cpp+0x1fb53c>
 12ae168: b4000220     	cbz	x0, 0x12ae1ac <__start_il2cpp+0x1069e8>
 12ae16c: b000ada8     	adrp	x8, 0x2863000
 12ae170: f946c508     	ldr	x8, [x8, #0xd88]
 12ae174: aa1f03e2     	mov	x2, xzr
 12ae178: f9400101     	ldr	x1, [x8]
 12ae17c: 94477b20     	bl	0x248cdfc <__start_il2cpp+0x12e5638>
 12ae180: aa0003f3     	mov	x19, x0
 12ae184: 1e2703e0     	fmov	s0, wzr
 12ae188: 1e2e1001     	fmov	s1, #1.00000000
 12ae18c: aa1f03e0     	mov	x0, xzr
 12ae190: 94481746     	bl	0x24b3ea8 <__start_il2cpp+0x130c6e4>
 12ae194: b40000d3     	cbz	x19, 0x12ae1ac <__start_il2cpp+0x1069e8>
 12ae198: aa1303e0     	mov	x0, x19
 12ae19c: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 12ae1a0: aa1f03e1     	mov	x1, xzr
 12ae1a4: a8c257fe     	ldp	x30, x21, [sp], #0x20
 12ae1a8: 14477c67     	b	0x248d344 <__start_il2cpp+0x12e5b80>
 12ae1ac: 97f847d5     	bl	0x10c0100 <CloseNLSocket+0x638>
