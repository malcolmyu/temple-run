
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1298768: f81e0ffe     	str	x30, [sp, #-0x20]!
 129876c: a9014ff4     	stp	x20, x19, [sp, #0x10]
 1298770: b000bcf4     	adrp	x20, 0x2a35000
 1298774: 39625688     	ldrb	w8, [x20, #0x895]
 1298778: aa0003f3     	mov	x19, x0
 129877c: 37000128     	tbnz	w8, #0x0, 0x12987a0 <__start_il2cpp+0xf0fdc>
 1298780: f000ae40     	adrp	x0, 0x2863000
 1298784: f946e400     	ldr	x0, [x0, #0xdc8]
 1298788: 97f89dd4     	bl	0x10bfed8 <CloseNLSocket+0x410>
 129878c: f000ae40     	adrp	x0, 0x2863000
 1298790: f946e800     	ldr	x0, [x0, #0xdd0]
 1298794: 97f89dd1     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1298798: 52800028     	mov	w8, #0x1                // =1
 129879c: 39225688     	strb	w8, [x20, #0x895]
 12987a0: 39440268     	ldrb	w8, [x19, #0x100]
 12987a4: 350000a8     	cbnz	w8, 0x12987b8 <__start_il2cpp+0xf0ff4>
 12987a8: 3943e268     	ldrb	w8, [x19, #0xf8]
 12987ac: 35000068     	cbnz	w8, 0x12987b8 <__start_il2cpp+0xf0ff4>
 12987b0: 3943c268     	ldrb	w8, [x19, #0xf0]
 12987b4: 340000a8     	cbz	w8, 0x12987c8 <__start_il2cpp+0xf1004>
 12987b8: 2a1f03e0     	mov	w0, wzr
 12987bc: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 12987c0: f84207fe     	ldr	x30, [sp], #0x20
 12987c4: d65f03c0     	ret
 12987c8: 52800028     	mov	w8, #0x1                // =1
 12987cc: aa1303e0     	mov	x0, x19
 12987d0: 39040268     	strb	w8, [x19, #0x100]
 12987d4: b901067f     	str	wzr, [x19, #0x104]
 12987d8: 97fffec0     	bl	0x12982d8 <__start_il2cpp+0xf0b14>
 12987dc: f0ff9fe8     	adrp	x8, 0x697000
 12987e0: bd452501     	ldr	s1, [x8, #0x524]
 12987e4: f940de60     	ldr	x0, [x19, #0x1b8]
 12987e8: 1e210800     	fmul	s0, s0, s1
 12987ec: 1e2d1001     	fmov	s1, #0.75000000
 12987f0: 1e215800     	fmin	s0, s0, s1
 12987f4: bd010a60     	str	s0, [x19, #0x108]
 12987f8: b4000280     	cbz	x0, 0x1298848 <__start_il2cpp+0xf1084>
 12987fc: 1e2e1000     	fmov	s0, #1.00000000
 1298800: 52800361     	mov	w1, #0x1b               // =27
 1298804: 97fff36e     	bl	0x12955bc <__start_il2cpp+0xeddf8>
 1298808: f9405260     	ldr	x0, [x19, #0xa0]
 129880c: b40001e0     	cbz	x0, 0x1298848 <__start_il2cpp+0xf1084>
 1298810: f000ae48     	adrp	x8, 0x2863000
 1298814: f946e908     	ldr	x8, [x8, #0xdd0]
 1298818: aa1f03e2     	mov	x2, xzr
 129881c: f9400101     	ldr	x1, [x8]
 1298820: 9447d1cb     	bl	0x248cf4c <__start_il2cpp+0x12e5788>
 1298824: f9405260     	ldr	x0, [x19, #0xa0]
 1298828: b4000100     	cbz	x0, 0x1298848 <__start_il2cpp+0xf1084>
 129882c: f000ae48     	adrp	x8, 0x2863000
 1298830: f946e508     	ldr	x8, [x8, #0xdc8]
 1298834: aa1f03e2     	mov	x2, xzr
 1298838: f9400101     	ldr	x1, [x8]
 129883c: 9447d1eb     	bl	0x248cfe8 <__start_il2cpp+0x12e5824>
 1298840: 52800020     	mov	w0, #0x1                // =1
 1298844: 17ffffde     	b	0x12987bc <__start_il2cpp+0xf0ff8>
 1298848: 97f89e2e     	bl	0x10c0100 <CloseNLSocket+0x638>
