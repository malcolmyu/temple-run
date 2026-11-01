
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12e0054: d101c3ff     	sub	sp, sp, #0x70
 12e0058: 6d012beb     	stp	d11, d10, [sp, #0x10]
 12e005c: 6d0223e9     	stp	d9, d8, [sp, #0x20]
 12e0060: f9001bfe     	str	x30, [sp, #0x30]
 12e0064: a9045ff8     	stp	x24, x23, [sp, #0x40]
 12e0068: a90557f6     	stp	x22, x21, [sp, #0x50]
 12e006c: a9064ff4     	stp	x20, x19, [sp, #0x60]
 12e0070: b000bab4     	adrp	x20, 0x2a35000
 12e0074: 396c0288     	ldrb	w8, [x20, #0xb00]
 12e0078: aa0003f3     	mov	x19, x0
 12e007c: 37000128     	tbnz	w8, #0x0, 0x12e00a0 <__start_il2cpp+0x1388dc>
 12e0080: b000ac20     	adrp	x0, 0x2865000
 12e0084: f9475800     	ldr	x0, [x0, #0xeb0]
 12e0088: 97f77f94     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e008c: b000ac20     	adrp	x0, 0x2865000
 12e0090: f9475c00     	ldr	x0, [x0, #0xeb8]
 12e0094: 97f77f91     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e0098: 52800028     	mov	w8, #0x1                // =1
 12e009c: 392c0288     	strb	w8, [x20, #0xb00]
 12e00a0: 39409268     	ldrb	w8, [x19, #0x24]
 12e00a4: 34000208     	cbz	w8, 0x12e00e4 <__start_il2cpp+0x138920>
 12e00a8: fc434268     	ldur	d8, [x19, #0x34]
 12e00ac: bd403e69     	ldr	s9, [x19, #0x3c]
 12e00b0: fd40166a     	ldr	d10, [x19, #0x28]
 12e00b4: bd40326b     	ldr	s11, [x19, #0x30]
 12e00b8: aa1f03e0     	mov	x0, xzr
 12e00bc: 94477ce5     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 12e00c0: 0f809141     	fmul	v1.2s, v10.2s, v0.s[0]
 12e00c4: 1e200960     	fmul	s0, s11, s0
 12e00c8: 0e21d501     	fadd	v1.2s, v8.2s, v1.2s
 12e00cc: 1e202920     	fadd	s0, s9, s0
 12e00d0: f900167f     	str	xzr, [x19, #0x28]
 12e00d4: b900327f     	str	wzr, [x19, #0x30]
 12e00d8: fc034261     	stur	d1, [x19, #0x34]
 12e00dc: bd003e60     	str	s0, [x19, #0x3c]
 12e00e0: 3900927f     	strb	wzr, [x19, #0x24]
 12e00e4: aa1303e0     	mov	x0, x19
 12e00e8: 94000156     	bl	0x12e0640 <__start_il2cpp+0x138e7c>
 12e00ec: 36002180     	tbz	w0, #0x0, 0x12e051c <__start_il2cpp+0x138d58>
 12e00f0: 39419268     	ldrb	w8, [x19, #0x64]
 12e00f4: 340000c8     	cbz	w8, 0x12e010c <__start_il2cpp+0x138948>
 12e00f8: f9403a68     	ldr	x8, [x19, #0x70]
 12e00fc: b4000088     	cbz	x8, 0x12e010c <__start_il2cpp+0x138948>
 12e0100: b9401908     	ldr	w8, [x8, #0x18]
 12e0104: 7100091f     	cmp	w8, #0x2
 12e0108: 5400080a     	b.ge	0x12e0208 <__start_il2cpp+0x138a44>
 12e010c: b000abf4     	adrp	x20, 0x285d000
 12e0110: 39414268     	ldrb	w8, [x19, #0x50]
 12e0114: f9474a94     	ldr	x20, [x20, #0xe90]
 12e0118: 9000bab5     	adrp	x21, 0x2a34000
 12e011c: 34001768     	cbz	w8, 0x12e0408 <__start_il2cpp+0x138c44>
 12e0120: bd405660     	ldr	s0, [x19, #0x54]
 12e0124: 1e202008     	fcmp	s0, #0.0
 12e0128: 540011cb     	b.lt	0x12e0360 <__start_il2cpp+0x138b9c>
 12e012c: b000bab6     	adrp	x22, 0x2a35000
 12e0130: 394136c8     	ldrb	w8, [x22, #0x4d]
 12e0134: 350000c8     	cbnz	w8, 0x12e014c <__start_il2cpp+0x138988>
 12e0138: d000abe0     	adrp	x0, 0x285e000
 12e013c: f9417800     	ldr	x0, [x0, #0x2f0]
 12e0140: 97f77f66     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e0144: 52800028     	mov	w8, #0x1                // =1
 12e0148: 390136c8     	strb	w8, [x22, #0x4d]
 12e014c: d000abf6     	adrp	x22, 0x285e000
 12e0150: f9417ad6     	ldr	x22, [x22, #0x2f0]
 12e0154: 2d46a66a     	ldp	s10, s9, [x19, #0x34]
 12e0158: bd403e68     	ldr	s8, [x19, #0x3c]
 12e015c: f94002c0     	ldr	x0, [x22]
 12e0160: b940e008     	ldr	w8, [x0, #0xe0]
 12e0164: 35000048     	cbnz	w8, 0x12e016c <__start_il2cpp+0x1389a8>
 12e0168: 97f77f9e     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e016c: 1e2a0940     	fmul	s0, s10, s10
 12e0170: 1e290921     	fmul	s1, s9, s9
 12e0174: bd405662     	ldr	s2, [x19, #0x54]
 12e0178: 1e212800     	fadd	s0, s0, s1
 12e017c: 1e280901     	fmul	s1, s8, s8
 12e0180: 1e212800     	fadd	s0, s0, s1
 12e0184: 1e21c000     	fsqrt	s0, s0
 12e0188: 1e222000     	fcmp	s0, s2
 12e018c: 54000ead     	b.le	0x12e0360 <__start_il2cpp+0x138b9c>
 12e0190: b000bab7     	adrp	x23, 0x2a35000
 12e0194: 2d46aa69     	ldp	s9, s10, [x19, #0x34]
 12e0198: 39414ee8     	ldrb	w8, [x23, #0x53]
 12e019c: bd403e68     	ldr	s8, [x19, #0x3c]
 12e01a0: 350000c8     	cbnz	w8, 0x12e01b8 <__start_il2cpp+0x1389f4>
 12e01a4: d000abe0     	adrp	x0, 0x285e000
 12e01a8: f9417800     	ldr	x0, [x0, #0x2f0]
 12e01ac: 97f77f4b     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e01b0: 52800028     	mov	w8, #0x1                // =1
 12e01b4: 39014ee8     	strb	w8, [x23, #0x53]
 12e01b8: f94002c0     	ldr	x0, [x22]
 12e01bc: b940e008     	ldr	w8, [x0, #0xe0]
 12e01c0: 35000048     	cbnz	w8, 0x12e01c8 <__start_il2cpp+0x138a04>
 12e01c4: 97f77f87     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e01c8: f0ff9da8     	adrp	x8, 0x697000
 12e01cc: 1e290920     	fmul	s0, s9, s9
 12e01d0: 1e2a0941     	fmul	s1, s10, s10
 12e01d4: bd45cd02     	ldr	s2, [x8, #0x5cc]
 12e01d8: 1e212800     	fadd	s0, s0, s1
 12e01dc: 1e280901     	fmul	s1, s8, s8
 12e01e0: 1e202820     	fadd	s0, s1, s0
 12e01e4: 1e21c001     	fsqrt	s1, s0
 12e01e8: 1e222020     	fcmp	s1, s2
 12e01ec: 540009ad     	b.le	0x12e0320 <__start_il2cpp+0x138b5c>
 12e01f0: fc434260     	ldur	d0, [x19, #0x34]
 12e01f4: bd403e62     	ldr	s2, [x19, #0x3c]
 12e01f8: 0e040423     	dup	v3.2s, v1.s[0]
 12e01fc: 2e23fc00     	fdiv	v0.2s, v0.2s, v3.2s
 12e0200: 1e211841     	fdiv	s1, s2, s1
 12e0204: 14000052     	b	0x12e034c <__start_il2cpp+0x138b88>
 12e0208: bd406a68     	ldr	s8, [x19, #0x68]
 12e020c: aa1f03e0     	mov	x0, xzr
 12e0210: 94477c90     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 12e0214: f9403a60     	ldr	x0, [x19, #0x70]
 12e0218: 1e202900     	fadd	s0, s8, s0
 12e021c: bd006a60     	str	s0, [x19, #0x68]
 12e0220: b40020e0     	cbz	x0, 0x12e063c <__start_il2cpp+0x138e78>
 12e0224: b9401808     	ldr	w8, [x0, #0x18]
 12e0228: 51000508     	sub	w8, w8, #0x1
 12e022c: 7100051f     	cmp	w8, #0x1
 12e0230: 540005cb     	b.lt	0x12e02e8 <__start_il2cpp+0x138b24>
 12e0234: b000ac38     	adrp	x24, 0x2865000
 12e0238: f9475f18     	ldr	x24, [x24, #0xeb8]
 12e023c: 2a1f03f6     	mov	w22, wzr
 12e0240: aa1f03f7     	mov	x23, xzr
 12e0244: f9400302     	ldr	x2, [x24]
 12e0248: 2a1603e1     	mov	w1, w22
 12e024c: 941867c1     	bl	0x18fa150 <__start_il2cpp+0x75298c>
 12e0250: f9403a68     	ldr	x8, [x19, #0x70]
 12e0254: b4001f48     	cbz	x8, 0x12e063c <__start_il2cpp+0x138e78>
 12e0258: f9400302     	ldr	x2, [x24]
 12e025c: aa0003f5     	mov	x21, x0
 12e0260: 110006c1     	add	w1, w22, #0x1
 12e0264: aa0803e0     	mov	x0, x8
 12e0268: 941867ba     	bl	0x18fa150 <__start_il2cpp+0x75298c>
 12e026c: 710002df     	cmp	w22, #0x0
 12e0270: 9a9702b7     	csel	x23, x21, x23, eq
 12e0274: b4001e55     	cbz	x21, 0x12e063c <__start_il2cpp+0x138e78>
 12e0278: bd406a60     	ldr	s0, [x19, #0x68]
 12e027c: bd4012a1     	ldr	s1, [x21, #0x10]
 12e0280: aa0003f4     	mov	x20, x0
 12e0284: 1e212000     	fcmp	s0, s1
 12e0288: 540000ab     	b.lt	0x12e029c <__start_il2cpp+0x138ad8>
 12e028c: b4001d94     	cbz	x20, 0x12e063c <__start_il2cpp+0x138e78>
 12e0290: bd401282     	ldr	s2, [x20, #0x10]
 12e0294: 1e222000     	fcmp	s0, s2
 12e0298: 54001529     	b.ls	0x12e053c <__start_il2cpp+0x138d78>
 12e029c: f9403a60     	ldr	x0, [x19, #0x70]
 12e02a0: b4001ce0     	cbz	x0, 0x12e063c <__start_il2cpp+0x138e78>
 12e02a4: b9401808     	ldr	w8, [x0, #0x18]
 12e02a8: 110006d6     	add	w22, w22, #0x1
 12e02ac: 51000508     	sub	w8, w8, #0x1
 12e02b0: 6b0802df     	cmp	w22, w8
 12e02b4: 54fffc8b     	b.lt	0x12e0244 <__start_il2cpp+0x138a80>
 12e02b8: b40001f7     	cbz	x23, 0x12e02f4 <__start_il2cpp+0x138b30>
 12e02bc: b4000094     	cbz	x20, 0x12e02cc <__start_il2cpp+0x138b08>
 12e02c0: bd4012e1     	ldr	s1, [x23, #0x10]
 12e02c4: 1e212000     	fcmp	s0, s1
 12e02c8: 54000185     	b.pl	0x12e02f8 <__start_il2cpp+0x138b34>
 12e02cc: aa1303e0     	mov	x0, x19
 12e02d0: aa1f03e1     	mov	x1, xzr
 12e02d4: 9447578e     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e02d8: b4001b20     	cbz	x0, 0x12e063c <__start_il2cpp+0x138e78>
 12e02dc: 2d430ae1     	ldp	s1, s2, [x23, #0x18]
 12e02e0: bd4016e0     	ldr	s0, [x23, #0x14]
 12e02e4: 1400000b     	b	0x12e0310 <__start_il2cpp+0x138b4c>
 12e02e8: aa1f03f7     	mov	x23, xzr
 12e02ec: aa1f03f4     	mov	x20, xzr
 12e02f0: b5fffe77     	cbnz	x23, 0x12e02bc <__start_il2cpp+0x138af8>
 12e02f4: b4000134     	cbz	x20, 0x12e0318 <__start_il2cpp+0x138b54>
 12e02f8: aa1303e0     	mov	x0, x19
 12e02fc: aa1f03e1     	mov	x1, xzr
 12e0300: 94475783     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e0304: b40019c0     	cbz	x0, 0x12e063c <__start_il2cpp+0x138e78>
 12e0308: 2d430a81     	ldp	s1, s2, [x20, #0x18]
 12e030c: bd401680     	ldr	s0, [x20, #0x14]
 12e0310: aa1f03e1     	mov	x1, xzr
 12e0314: 94478900     	bl	0x24c2714 <__start_il2cpp+0x131af50>
 12e0318: 3901927f     	strb	wzr, [x19, #0x64]
 12e031c: 14000080     	b	0x12e051c <__start_il2cpp+0x138d58>
 12e0320: 397e82a8     	ldrb	w8, [x21, #0xfa0]
 12e0324: 350000c8     	cbnz	w8, 0x12e033c <__start_il2cpp+0x138b78>
 12e0328: b000abe0     	adrp	x0, 0x285d000
 12e032c: f9474800     	ldr	x0, [x0, #0xe90]
 12e0330: 97f77eea     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e0334: 52800028     	mov	w8, #0x1                // =1
 12e0338: 393e82a8     	strb	w8, [x21, #0xfa0]
 12e033c: f9400288     	ldr	x8, [x20]
 12e0340: f9405d08     	ldr	x8, [x8, #0xb8]
 12e0344: fd400100     	ldr	d0, [x8]
 12e0348: bd400901     	ldr	s1, [x8, #0x8]
 12e034c: bd405662     	ldr	s2, [x19, #0x54]
 12e0350: 0f829000     	fmul	v0.2s, v0.2s, v2.s[0]
 12e0354: 1e220821     	fmul	s1, s1, s2
 12e0358: fc034260     	stur	d0, [x19, #0x34]
 12e035c: bd003e61     	str	s1, [x19, #0x3c]
 12e0360: bd405a60     	ldr	s0, [x19, #0x58]
 12e0364: 1e202008     	fcmp	s0, #0.0
 12e0368: 5400018b     	b.lt	0x12e0398 <__start_il2cpp+0x138bd4>
 12e036c: bd403661     	ldr	s1, [x19, #0x34]
 12e0370: 1e20c022     	fabs	s2, s1
 12e0374: 1e202040     	fcmp	s2, s0
 12e0378: 5400010d     	b.le	0x12e0398 <__start_il2cpp+0x138bd4>
 12e037c: 1e202028     	fcmp	s1, #0.0
 12e0380: 54000065     	b.pl	0x12e038c <__start_il2cpp+0x138bc8>
 12e0384: 1e214001     	fneg	s1, s0
 12e0388: bd003661     	str	s1, [x19, #0x34]
 12e038c: 1e202008     	fcmp	s0, #0.0
 12e0390: 5400004d     	b.le	0x12e0398 <__start_il2cpp+0x138bd4>
 12e0394: bd003660     	str	s0, [x19, #0x34]
 12e0398: bd405e60     	ldr	s0, [x19, #0x5c]
 12e039c: 1e202008     	fcmp	s0, #0.0
 12e03a0: 5400018b     	b.lt	0x12e03d0 <__start_il2cpp+0x138c0c>
 12e03a4: bd403a61     	ldr	s1, [x19, #0x38]
 12e03a8: 1e20c022     	fabs	s2, s1
 12e03ac: 1e202040     	fcmp	s2, s0
 12e03b0: 5400010d     	b.le	0x12e03d0 <__start_il2cpp+0x138c0c>
 12e03b4: 1e202028     	fcmp	s1, #0.0
 12e03b8: 54000065     	b.pl	0x12e03c4 <__start_il2cpp+0x138c00>
 12e03bc: 1e214001     	fneg	s1, s0
 12e03c0: bd003a61     	str	s1, [x19, #0x38]
 12e03c4: 1e202008     	fcmp	s0, #0.0
 12e03c8: 5400004d     	b.le	0x12e03d0 <__start_il2cpp+0x138c0c>
 12e03cc: bd003a60     	str	s0, [x19, #0x38]
 12e03d0: bd406260     	ldr	s0, [x19, #0x60]
 12e03d4: 1e202008     	fcmp	s0, #0.0
 12e03d8: 5400018b     	b.lt	0x12e0408 <__start_il2cpp+0x138c44>
 12e03dc: bd403e61     	ldr	s1, [x19, #0x3c]
 12e03e0: 1e20c022     	fabs	s2, s1
 12e03e4: 1e202040     	fcmp	s2, s0
 12e03e8: 5400010d     	b.le	0x12e0408 <__start_il2cpp+0x138c44>
 12e03ec: 1e202028     	fcmp	s1, #0.0
 12e03f0: 54000065     	b.pl	0x12e03fc <__start_il2cpp+0x138c38>
 12e03f4: 1e214001     	fneg	s1, s0
 12e03f8: bd003e61     	str	s1, [x19, #0x3c]
 12e03fc: 1e202008     	fcmp	s0, #0.0
 12e0400: 5400004d     	b.le	0x12e0408 <__start_il2cpp+0x138c44>
 12e0404: bd003e60     	str	s0, [x19, #0x3c]
 12e0408: aa1f03e0     	mov	x0, xzr
 12e040c: 94477c11     	bl	0x24bf450 <__start_il2cpp+0x1317c8c>
 12e0410: f0ff9da8     	adrp	x8, 0x697000
 12e0414: bd40366a     	ldr	s10, [x19, #0x34]
 12e0418: 397e82a9     	ldrb	w9, [x21, #0xfa0]
 12e041c: bd461d09     	ldr	s9, [x8, #0x61c]
 12e0420: fd401e6b     	ldr	d11, [x19, #0x38]
 12e0424: 4ea01c08     	mov	v8.16b, v0.16b
 12e0428: 350000c9     	cbnz	w9, 0x12e0440 <__start_il2cpp+0x138c7c>
 12e042c: b000abe0     	adrp	x0, 0x285d000
 12e0430: f9474800     	ldr	x0, [x0, #0xe90]
 12e0434: 97f77ea9     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e0438: 52800028     	mov	w8, #0x1                // =1
 12e043c: 393e82a8     	strb	w8, [x21, #0xfa0]
 12e0440: f9400288     	ldr	x8, [x20]
 12e0444: 1e295908     	fmin	s8, s8, s9
 12e0448: f9405d08     	ldr	x8, [x8, #0xb8]
 12e044c: bd400100     	ldr	s0, [x8]
 12e0450: fc404101     	ldur	d1, [x8, #0x4]
 12e0454: f0ff9da8     	adrp	x8, 0x697000
 12e0458: bd44d102     	ldr	s2, [x8, #0x4d0]
 12e045c: 1e203940     	fsub	s0, s10, s0
 12e0460: 0ea1d561     	fsub	v1.2s, v11.2s, v1.2s
 12e0464: 1e200800     	fmul	s0, s0, s0
 12e0468: 2e21dc21     	fmul	v1.2s, v1.2s, v1.2s
 12e046c: 1e212800     	fadd	s0, s0, s1
 12e0470: 5e0c0421     	mov	s1, v1.s[1]
 12e0474: 1e202820     	fadd	s0, s1, s0
 12e0478: 1e222000     	fcmp	s0, s2
 12e047c: 540001a4     	b.mi	0x12e04b0 <__start_il2cpp+0x138cec>
 12e0480: aa1303e0     	mov	x0, x19
 12e0484: aa1f03e1     	mov	x1, xzr
 12e0488: 94475721     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e048c: b4000d80     	cbz	x0, 0x12e063c <__start_il2cpp+0x138e78>
 12e0490: 2d470261     	ldp	s1, s0, [x19, #0x38]
 12e0494: bd403663     	ldr	s3, [x19, #0x34]
 12e0498: 2a1f03e1     	mov	w1, wzr
 12e049c: aa1f03e2     	mov	x2, xzr
 12e04a0: 1e200902     	fmul	s2, s8, s0
 12e04a4: 1e210901     	fmul	s1, s8, s1
 12e04a8: 1e230900     	fmul	s0, s8, s3
 12e04ac: 94478b1e     	bl	0x24c3124 <__start_il2cpp+0x131b960>
 12e04b0: bd404e60     	ldr	s0, [x19, #0x4c]
 12e04b4: 1e202008     	fcmp	s0, #0.0
 12e04b8: 54000320     	b.eq	0x12e051c <__start_il2cpp+0x138d58>
 12e04bc: aa1303e0     	mov	x0, x19
 12e04c0: aa1f03e1     	mov	x1, xzr
 12e04c4: 94475712     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e04c8: aa0003f4     	mov	x20, x0
 12e04cc: aa1303e0     	mov	x0, x19
 12e04d0: aa1f03e1     	mov	x1, xzr
 12e04d4: 9447570e     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e04d8: b4000b20     	cbz	x0, 0x12e063c <__start_il2cpp+0x138e78>
 12e04dc: aa1f03e1     	mov	x1, xzr
 12e04e0: 94478865     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12e04e4: b4000ad4     	cbz	x20, 0x12e063c <__start_il2cpp+0x138e78>
 12e04e8: 2d491a65     	ldp	s5, s6, [x19, #0x48]
 12e04ec: 2d481263     	ldp	s3, s4, [x19, #0x40]
 12e04f0: aa1403e0     	mov	x0, x20
 12e04f4: a9464ff4     	ldp	x20, x19, [sp, #0x60]
 12e04f8: 1e260906     	fmul	s6, s8, s6
 12e04fc: a94557f6     	ldp	x22, x21, [sp, #0x50]
 12e0500: a9445ff8     	ldp	x24, x23, [sp, #0x40]
 12e0504: f9401bfe     	ldr	x30, [sp, #0x30]
 12e0508: 6d4223e9     	ldp	d9, d8, [sp, #0x20]
 12e050c: 6d412beb     	ldp	d11, d10, [sp, #0x10]
 12e0510: aa1f03e1     	mov	x1, xzr
 12e0514: 9101c3ff     	add	sp, sp, #0x70
 12e0518: 14478c13     	b	0x24c3564 <__start_il2cpp+0x131bda0>
 12e051c: a9464ff4     	ldp	x20, x19, [sp, #0x60]
 12e0520: a94557f6     	ldp	x22, x21, [sp, #0x50]
 12e0524: a9445ff8     	ldp	x24, x23, [sp, #0x40]
 12e0528: f9401bfe     	ldr	x30, [sp, #0x30]
 12e052c: 6d4223e9     	ldp	d9, d8, [sp, #0x20]
 12e0530: 6d412beb     	ldp	d11, d10, [sp, #0x10]
 12e0534: 9101c3ff     	add	sp, sp, #0x70
 12e0538: d65f03c0     	ret
 12e053c: 1e222020     	fcmp	s1, s2
 12e0540: 1e2e1003     	fmov	s3, #1.00000000
 12e0544: 54000080     	b.eq	0x12e0554 <__start_il2cpp+0x138d90>
 12e0548: 1e213800     	fsub	s0, s0, s1
 12e054c: 1e213841     	fsub	s1, s2, s1
 12e0550: 1e211803     	fdiv	s3, s0, s1
 12e0554: 394082a9     	ldrb	w9, [x21, #0x20]
 12e0558: 39408288     	ldrb	w8, [x20, #0x20]
 12e055c: 34000129     	cbz	w9, 0x12e0580 <__start_il2cpp+0x138dbc>
 12e0560: 34000208     	cbz	w8, 0x12e05a0 <__start_il2cpp+0x138ddc>
 12e0564: 1e2c1000     	fmov	s0, #0.50000000
 12e0568: 1e202060     	fcmp	s3, s0
 12e056c: 1e232861     	fadd	s1, s3, s3
 12e0570: 54000205     	b.pl	0x12e05b0 <__start_il2cpp+0x138dec>
 12e0574: 1e210822     	fmul	s2, s1, s1
 12e0578: 1e220821     	fmul	s1, s1, s2
 12e057c: 14000013     	b	0x12e05c8 <__start_il2cpp+0x138e04>
 12e0580: 34000148     	cbz	w8, 0x12e05a8 <__start_il2cpp+0x138de4>
 12e0584: 1e3e1000     	fmov	s0, #-1.00000000
 12e0588: 1e202860     	fadd	s0, s3, s0
 12e058c: 1e200801     	fmul	s1, s0, s0
 12e0590: 1e210800     	fmul	s0, s0, s1
 12e0594: 1e2e1001     	fmov	s1, #1.00000000
 12e0598: 1e212800     	fadd	s0, s0, s1
 12e059c: 1400000c     	b	0x12e05cc <__start_il2cpp+0x138e08>
 12e05a0: 1e230860     	fmul	s0, s3, s3
 12e05a4: 1e200863     	fmul	s3, s3, s0
 12e05a8: 3d8003e3     	str	q3, [sp]
 12e05ac: 14000009     	b	0x12e05d0 <__start_il2cpp+0x138e0c>
 12e05b0: 1e301002     	fmov	s2, #-2.00000000
 12e05b4: 1e222821     	fadd	s1, s1, s2
 12e05b8: 1e210822     	fmul	s2, s1, s1
 12e05bc: 1e220821     	fmul	s1, s1, s2
 12e05c0: 1e201002     	fmov	s2, #2.00000000
 12e05c4: 1e222821     	fadd	s1, s1, s2
 12e05c8: 1e200820     	fmul	s0, s1, s0
 12e05cc: 3d8003e0     	str	q0, [sp]
 12e05d0: bd401e88     	ldr	s8, [x20, #0x1c]
 12e05d4: fc414289     	ldur	d9, [x20, #0x14]
 12e05d8: fc4142aa     	ldur	d10, [x21, #0x14]
 12e05dc: bd401eab     	ldr	s11, [x21, #0x1c]
 12e05e0: aa1303e0     	mov	x0, x19
 12e05e4: aa1f03e1     	mov	x1, xzr
 12e05e8: 944756c9     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12e05ec: b4000280     	cbz	x0, 0x12e063c <__start_il2cpp+0x138e78>
 12e05f0: 3dc003e4     	ldr	q4, [sp]
 12e05f4: fc4142a3     	ldur	d3, [x21, #0x14]
 12e05f8: bd401ea2     	ldr	s2, [x21, #0x1c]
 12e05fc: 0eaad520     	fsub	v0.2s, v9.2s, v10.2s
 12e0600: 1e2b3901     	fsub	s1, s8, s11
 12e0604: a9464ff4     	ldp	x20, x19, [sp, #0x60]
 12e0608: a94557f6     	ldp	x22, x21, [sp, #0x50]
 12e060c: a9445ff8     	ldp	x24, x23, [sp, #0x40]
 12e0610: f9401bfe     	ldr	x30, [sp, #0x30]
 12e0614: 6d4223e9     	ldp	d9, d8, [sp, #0x20]
 12e0618: 6d412beb     	ldp	d11, d10, [sp, #0x10]
 12e061c: 0f849000     	fmul	v0.2s, v0.2s, v4.s[0]
 12e0620: 1e240821     	fmul	s1, s1, s4
 12e0624: 0e23d400     	fadd	v0.2s, v0.2s, v3.2s
 12e0628: 1e222822     	fadd	s2, s1, s2
 12e062c: 5e0c0401     	mov	s1, v0.s[1]
 12e0630: aa1f03e1     	mov	x1, xzr
 12e0634: 9101c3ff     	add	sp, sp, #0x70
 12e0638: 14478837     	b	0x24c2714 <__start_il2cpp+0x131af50>
 12e063c: 97f77eb1     	bl	0x10c0100 <CloseNLSocket+0x638>
