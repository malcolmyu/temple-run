
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12ae1f4: fc1d0fe8     	str	d8, [sp, #-0x30]!
 12ae1f8: a90157fe     	stp	x30, x21, [sp, #0x10]
 12ae1fc: a9024ff4     	stp	x20, x19, [sp, #0x20]
 12ae200: f000bc35     	adrp	x21, 0x2a35000
 12ae204: 9000ad94     	adrp	x20, 0x285e000
 12ae208: 3965c6a8     	ldrb	w8, [x21, #0x971]
 12ae20c: f9414294     	ldr	x20, [x20, #0x280]
 12ae210: aa0003f3     	mov	x19, x0
 12ae214: 370000c8     	tbnz	w8, #0x0, 0x12ae22c <__start_il2cpp+0x106a68>
 12ae218: 9000ad80     	adrp	x0, 0x285e000
 12ae21c: f9414000     	ldr	x0, [x0, #0x280]
 12ae220: 97f8472e     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12ae224: 52800028     	mov	w8, #0x1                // =1
 12ae228: 3925c6a8     	strb	w8, [x21, #0x971]
 12ae22c: f9400280     	ldr	x0, [x20]
 12ae230: b940e008     	ldr	w8, [x0, #0xe0]
 12ae234: 35000068     	cbnz	w8, 0x12ae240 <__start_il2cpp+0x106a7c>
 12ae238: 97f8476a     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12ae23c: f9400280     	ldr	x0, [x20]
 12ae240: f9405c08     	ldr	x8, [x0, #0xb8]
 12ae244: f9400108     	ldr	x8, [x8]
 12ae248: b40009a8     	cbz	x8, 0x12ae37c <__start_il2cpp+0x106bb8>
 12ae24c: f9403908     	ldr	x8, [x8, #0x70]
 12ae250: b4000968     	cbz	x8, 0x12ae37c <__start_il2cpp+0x106bb8>
 12ae254: 3946c108     	ldrb	w8, [x8, #0x1b0]
 12ae258: 350008a8     	cbnz	w8, 0x12ae36c <__start_il2cpp+0x106ba8>
 12ae25c: aa1303e0     	mov	x0, x19
 12ae260: aa1f03e1     	mov	x1, xzr
 12ae264: 94481faa     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12ae268: b40008a0     	cbz	x0, 0x12ae37c <__start_il2cpp+0x106bb8>
 12ae26c: aa1f03e1     	mov	x1, xzr
 12ae270: 94485101     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12ae274: 52b84408     	mov	w8, #-0x3de00000        // =-1038090240
 12ae278: 1e270100     	fmov	s0, w8
 12ae27c: 1e202020     	fcmp	s1, s0
 12ae280: 54000764     	b.mi	0x12ae36c <__start_il2cpp+0x106ba8>
 12ae284: 3941ea68     	ldrb	w8, [x19, #0x7a]
 12ae288: 34000208     	cbz	w8, 0x12ae2c8 <__start_il2cpp+0x106b04>
 12ae28c: bd407e68     	ldr	s8, [x19, #0x7c]
 12ae290: aa1f03e0     	mov	x0, xzr
 12ae294: 9448446f     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 12ae298: 1e203900     	fsub	s0, s8, s0
 12ae29c: 1e202008     	fcmp	s0, #0.0
 12ae2a0: bd007e60     	str	s0, [x19, #0x7c]
 12ae2a4: 54000128     	b.hi	0x12ae2c8 <__start_il2cpp+0x106b04>
 12ae2a8: 3941e668     	ldrb	w8, [x19, #0x79]
 12ae2ac: 350000e8     	cbnz	w8, 0x12ae2c8 <__start_il2cpp+0x106b04>
 12ae2b0: 3941e268     	ldrb	w8, [x19, #0x78]
 12ae2b4: 350000a8     	cbnz	w8, 0x12ae2c8 <__start_il2cpp+0x106b04>
 12ae2b8: bd408260     	ldr	s0, [x19, #0x80]
 12ae2bc: 52800028     	mov	w8, #0x1                // =1
 12ae2c0: 78079268     	sturh	w8, [x19, #0x79]
 12ae2c4: bd003a60     	str	s0, [x19, #0x38]
 12ae2c8: 52b86f48     	mov	w8, #-0x3c860000        // =-1015414784
 12ae2cc: 1e2703e0     	fmov	s0, wzr
 12ae2d0: 1e2703e2     	fmov	s2, wzr
 12ae2d4: 1e270101     	fmov	s1, w8
 12ae2d8: aa1303e0     	mov	x0, x19
 12ae2dc: aa1f03e1     	mov	x1, xzr
 12ae2e0: 9400c983     	bl	0x12e08ec <__start_il2cpp+0x139128>
 12ae2e4: aa1303e0     	mov	x0, x19
 12ae2e8: aa1f03e1     	mov	x1, xzr
 12ae2ec: 9400c759     	bl	0x12e0050 <__start_il2cpp+0x13888c>
 12ae2f0: 39421268     	ldrb	w8, [x19, #0x84]
 12ae2f4: 34000228     	cbz	w8, 0x12ae338 <__start_il2cpp+0x106b74>
 12ae2f8: aa1303e0     	mov	x0, x19
 12ae2fc: aa1f03e1     	mov	x1, xzr
 12ae300: 94481f83     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12ae304: b40003c0     	cbz	x0, 0x12ae37c <__start_il2cpp+0x106bb8>
 12ae308: aa1f03e1     	mov	x1, xzr
 12ae30c: 944850da     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12ae310: bd408a60     	ldr	s0, [x19, #0x88]
 12ae314: 1e202020     	fcmp	s1, s0
 12ae318: 54000105     	b.pl	0x12ae338 <__start_il2cpp+0x106b74>
 12ae31c: 3941e268     	ldrb	w8, [x19, #0x78]
 12ae320: 350000c8     	cbnz	w8, 0x12ae338 <__start_il2cpp+0x106b74>
 12ae324: aa1303e0     	mov	x0, x19
 12ae328: aa1f03e1     	mov	x1, xzr
 12ae32c: 9400c9eb     	bl	0x12e0ad8 <__start_il2cpp+0x139314>
 12ae330: b9003a7f     	str	wzr, [x19, #0x38]
 12ae334: 3901e67f     	strb	wzr, [x19, #0x79]
 12ae338: aa1303e0     	mov	x0, x19
 12ae33c: aa1f03e1     	mov	x1, xzr
 12ae340: 94481f73     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12ae344: b40001c0     	cbz	x0, 0x12ae37c <__start_il2cpp+0x106bb8>
 12ae348: aa1f03e1     	mov	x1, xzr
 12ae34c: 944850ca     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12ae350: bd408a60     	ldr	s0, [x19, #0x88]
 12ae354: 1e301002     	fmov	s2, #-2.00000000
 12ae358: 1e222800     	fadd	s0, s0, s2
 12ae35c: 1e202020     	fcmp	s1, s0
 12ae360: 54000065     	b.pl	0x12ae36c <__start_il2cpp+0x106ba8>
 12ae364: 52800028     	mov	w8, #0x1                // =1
 12ae368: 3901e268     	strb	w8, [x19, #0x78]
 12ae36c: a9424ff4     	ldp	x20, x19, [sp, #0x20]
 12ae370: a94157fe     	ldp	x30, x21, [sp, #0x10]
 12ae374: fc4307e8     	ldr	d8, [sp], #0x30
 12ae378: d65f03c0     	ret
 12ae37c: 97f84761     	bl	0x10c0100 <CloseNLSocket+0x638>
