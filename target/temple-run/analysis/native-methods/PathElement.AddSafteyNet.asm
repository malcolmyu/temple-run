
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12e6348: fc1b0fe8     	str	d8, [sp, #-0x50]!
 12e634c: f90007fe     	str	x30, [sp, #0x8]
 12e6350: a90167fa     	stp	x26, x25, [sp, #0x10]
 12e6354: a9025ff8     	stp	x24, x23, [sp, #0x20]
 12e6358: a90357f6     	stp	x22, x21, [sp, #0x30]
 12e635c: a9044ff4     	stp	x20, x19, [sp, #0x40]
 12e6360: f000ba74     	adrp	x20, 0x2a35000
 12e6364: d000abb7     	adrp	x23, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12e6368: 396c7288     	ldrb	w8, [x20, #0xb1c]
 12e636c: f94562f7     	ldr	x23, [x23, #0xac0]
 12e6370: 2a0203f5     	mov	w21, w2
 12e6374: aa0103f6     	mov	x22, x1
 12e6378: aa0003f3     	mov	x19, x0
 12e637c: 37000248     	tbnz	w8, #0x0, 0x12e63c4 <__start_il2cpp+0x13ec00>
 12e6380: 9000abe0     	adrp	x0, 0x2862000
 12e6384: f942f800     	ldr	x0, [x0, #0x5f0]
 12e6388: 97f766d4     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e638c: d000abe0     	adrp	x0, 0x2864000
 12e6390: f9450800     	ldr	x0, [x0, #0xa10]
 12e6394: 97f766d1     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e6398: d000aba0     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12e639c: f9456000     	ldr	x0, [x0, #0xac0]
 12e63a0: 97f766ce     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e63a4: 9000abe0     	adrp	x0, 0x2862000
 12e63a8: f9430800     	ldr	x0, [x0, #0x610]
 12e63ac: 97f766cb     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e63b0: 9000abe0     	adrp	x0, 0x2862000
 12e63b4: f9431400     	ldr	x0, [x0, #0x628]
 12e63b8: 97f766c8     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e63bc: 52800028     	mov	w8, #0x1                // =1
 12e63c0: 392c7288     	strb	w8, [x20, #0xb1c]
 12e63c4: f94002e0     	ldr	x0, [x23]
 12e63c8: f9404a74     	ldr	x20, [x19, #0x90]
 12e63cc: b940e008     	ldr	w8, [x0, #0xe0]
 12e63d0: 35000048     	cbnz	w8, 0x12e63d8 <__start_il2cpp+0x13ec14>
 12e63d4: 97f76703     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e63d8: 9000abfa     	adrp	x26, 0x2862000
 12e63dc: 9000abf9     	adrp	x25, 0x2862000
 12e63e0: 9000abf8     	adrp	x24, 0x2862000
 12e63e4: f9430b5a     	ldr	x26, [x26, #0x610]
 12e63e8: f9431739     	ldr	x25, [x25, #0x628]
 12e63ec: f942fb18     	ldr	x24, [x24, #0x5f0]
 12e63f0: aa1403e0     	mov	x0, x20
 12e63f4: aa1f03e1     	mov	x1, xzr
 12e63f8: aa1f03e2     	mov	x2, xzr
 12e63fc: 94474913     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12e6400: 36000180     	tbz	w0, #0x0, 0x12e6430 <__start_il2cpp+0x13ec6c>
 12e6404: f94002e0     	ldr	x0, [x23]
 12e6408: f9404a74     	ldr	x20, [x19, #0x90]
 12e640c: b940e008     	ldr	w8, [x0, #0xe0]
 12e6410: 35000048     	cbnz	w8, 0x12e6418 <__start_il2cpp+0x13ec54>
 12e6414: 97f766f3     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e6418: aa1403e0     	mov	x0, x20
 12e641c: aa1f03e1     	mov	x1, xzr
 12e6420: 94475a09     	bl	0x24bcc44 <__start_il2cpp+0x1315480>
 12e6424: aa1303e0     	mov	x0, x19
 12e6428: f9004a7f     	str	xzr, [x19, #0x90]
 12e642c: 940000fc     	bl	0x12e681c <__start_il2cpp+0x13f058>
 12e6430: f9400340     	ldr	x0, [x26]
 12e6434: b9403a74     	ldr	w20, [x19, #0x38]
 12e6438: 52800061     	mov	w1, #0x3                // =3
 12e643c: 97f766c5     	bl	0x10bff50 <CloseNLSocket+0x488>
 12e6440: f9400321     	ldr	x1, [x25]
 12e6444: aa1f03e2     	mov	x2, xzr
 12e6448: aa0003f7     	mov	x23, x0
 12e644c: 942bfde2     	bl	0x1de5bd4 <__start_il2cpp+0xc3e410>
 12e6450: f9400302     	ldr	x2, [x24]
 12e6454: 2a1403e0     	mov	w0, w20
 12e6458: aa1703e1     	mov	x1, x23
 12e645c: 9403c553     	bl	0x13d79a8 <__start_il2cpp+0x2301e4>
 12e6460: 36000060     	tbz	w0, #0x0, 0x12e646c <__start_il2cpp+0x13eca8>
 12e6464: b9403668     	ldr	w8, [x19, #0x34]
 12e6468: 1400000f     	b	0x12e64a4 <__start_il2cpp+0x13ece0>
 12e646c: b4000ef6     	cbz	x22, 0x12e6648 <__start_il2cpp+0x13ee84>
 12e6470: b9403ac8     	ldr	w8, [x22, #0x38]
 12e6474: 71001d1f     	cmp	w8, #0x7
 12e6478: 54000081     	b.ne	0x12e6488 <__start_il2cpp+0x13ecc4>
 12e647c: b9403668     	ldr	w8, [x19, #0x34]
 12e6480: 71000d1f     	cmp	w8, #0x3
 12e6484: 54000101     	b.ne	0x12e64a4 <__start_il2cpp+0x13ece0>
 12e6488: a9444ff4     	ldp	x20, x19, [sp, #0x40]
 12e648c: a94357f6     	ldp	x22, x21, [sp, #0x30]
 12e6490: a9425ff8     	ldp	x24, x23, [sp, #0x20]
 12e6494: a94167fa     	ldp	x26, x25, [sp, #0x10]
 12e6498: f94007fe     	ldr	x30, [sp, #0x8]
 12e649c: fc4507e8     	ldr	d8, [sp], #0x50
 12e64a0: d65f03c0     	ret
 12e64a4: 71000d1f     	cmp	w8, #0x3
 12e64a8: 1e3e1000     	fmov	s0, #-1.00000000
 12e64ac: 1e259001     	fmov	s1, #14.00000000
 12e64b0: 1e200c20     	fcsel	s0, s1, s0, eq
 12e64b4: 7100051f     	cmp	w8, #0x1
 12e64b8: 1e361001     	fmov	s1, #-16.00000000
 12e64bc: aa1303e0     	mov	x0, x19
 12e64c0: 1e200c28     	fcsel	s8, s1, s0, eq
 12e64c4: 94000101     	bl	0x12e68c8 <__start_il2cpp+0x13f104>
 12e64c8: aa0003f4     	mov	x20, x0
 12e64cc: aa1303e0     	mov	x0, x19
 12e64d0: 97fff221     	bl	0x12e2d54 <__start_il2cpp+0x13b590>
 12e64d4: 36000180     	tbz	w0, #0x0, 0x12e6504 <__start_il2cpp+0x13ed40>
 12e64d8: b4000b94     	cbz	x20, 0x12e6648 <__start_il2cpp+0x13ee84>
 12e64dc: aa1403e0     	mov	x0, x20
 12e64e0: aa1f03e1     	mov	x1, xzr
 12e64e4: 94474986     	bl	0x24b8afc <__start_il2cpp+0x1311338>
 12e64e8: b4000b00     	cbz	x0, 0x12e6648 <__start_il2cpp+0x13ee84>
 12e64ec: 52a85688     	mov	w8, #0x42b40000         // =1119092736
 12e64f0: 1e2703e0     	fmov	s0, wzr
 12e64f4: 1e2703e1     	fmov	s1, wzr
 12e64f8: 1e270102     	fmov	s2, w8
 12e64fc: aa1f03e1     	mov	x1, xzr
 12e6500: 944773e9     	bl	0x24c34a4 <__start_il2cpp+0x131bce0>
 12e6504: b4000a36     	cbz	x22, 0x12e6648 <__start_il2cpp+0x13ee84>
 12e6508: b9403668     	ldr	w8, [x19, #0x34]
 12e650c: b94036c9     	ldr	w9, [x22, #0x34]
 12e6510: 1e2703e1     	fmov	s1, wzr
 12e6514: 1e25d002     	fmov	s2, #15.00000000
 12e6518: 71000d1f     	cmp	w8, #0x3
 12e651c: 1e35d003     	fmov	s3, #-15.00000000
 12e6520: 1e210c40     	fcsel	s0, s2, s1, eq
 12e6524: 7100051f     	cmp	w8, #0x1
 12e6528: 1e200c60     	fcsel	s0, s3, s0, eq
 12e652c: 71000d3f     	cmp	w9, #0x3
 12e6530: 1e210c41     	fcsel	s1, s2, s1, eq
 12e6534: 7100053f     	cmp	w9, #0x1
 12e6538: 1e210c61     	fcsel	s1, s3, s1, eq
 12e653c: 1e212000     	fcmp	s0, s1
 12e6540: 54000105     	b.pl	0x12e6560 <__start_il2cpp+0x13ed9c>
 12e6544: 1e235001     	fmov	s1, #6.50000000
 12e6548: 710012bf     	cmp	w21, #0x4
 12e654c: 1e212808     	fadd	s8, s0, s1
 12e6550: 54000320     	b.eq	0x12e65b4 <__start_il2cpp+0x13edf0>
 12e6554: 710006bf     	cmp	w21, #0x1
 12e6558: 540002e0     	b.eq	0x12e65b4 <__start_il2cpp+0x13edf0>
 12e655c: 1400000e     	b	0x12e6594 <__start_il2cpp+0x13edd0>
 12e6560: 5400042d     	b.le	0x12e65e4 <__start_il2cpp+0x13ee20>
 12e6564: 71000d1f     	cmp	w8, #0x3
 12e6568: 1e343000     	fmov	s0, #-8.50000000
 12e656c: 1e235001     	fmov	s1, #6.50000000
 12e6570: 52b83789     	mov	w9, #-0x3e440000        // =-1044643840
 12e6574: 1e200c20     	fcsel	s0, s1, s0, eq
 12e6578: 7100051f     	cmp	w8, #0x1
 12e657c: 1e270121     	fmov	s1, w9
 12e6580: 1e200c28     	fcsel	s8, s1, s0, eq
 12e6584: 710012bf     	cmp	w21, #0x4
 12e6588: 54000060     	b.eq	0x12e6594 <__start_il2cpp+0x13edd0>
 12e658c: 710006bf     	cmp	w21, #0x1
 12e6590: 54000121     	b.ne	0x12e65b4 <__start_il2cpp+0x13edf0>
 12e6594: b40005b4     	cbz	x20, 0x12e6648 <__start_il2cpp+0x13ee84>
 12e6598: aa1403e0     	mov	x0, x20
 12e659c: aa1f03e1     	mov	x1, xzr
 12e65a0: 94474957     	bl	0x24b8afc <__start_il2cpp+0x1311338>
 12e65a4: b4000520     	cbz	x0, 0x12e6648 <__start_il2cpp+0x13ee84>
 12e65a8: b0ff9d88     	adrp	x8, 0x697000
 12e65ac: bd467500     	ldr	s0, [x8, #0x674]
 12e65b0: 14000008     	b	0x12e65d0 <__start_il2cpp+0x13ee0c>
 12e65b4: b40004b4     	cbz	x20, 0x12e6648 <__start_il2cpp+0x13ee84>
 12e65b8: aa1403e0     	mov	x0, x20
 12e65bc: aa1f03e1     	mov	x1, xzr
 12e65c0: 9447494f     	bl	0x24b8afc <__start_il2cpp+0x1311338>
 12e65c4: b4000420     	cbz	x0, 0x12e6648 <__start_il2cpp+0x13ee84>
 12e65c8: b0ff9d88     	adrp	x8, 0x697000
 12e65cc: bd45fd00     	ldr	s0, [x8, #0x5fc]
 12e65d0: 1e2703e1     	fmov	s1, wzr
 12e65d4: 1e2703e2     	fmov	s2, wzr
 12e65d8: aa1f03e1     	mov	x1, xzr
 12e65dc: 944773b2     	bl	0x24c34a4 <__start_il2cpp+0x131bce0>
 12e65e0: 14000002     	b	0x12e65e8 <__start_il2cpp+0x13ee24>
 12e65e4: b4000334     	cbz	x20, 0x12e6648 <__start_il2cpp+0x13ee84>
 12e65e8: aa1403e0     	mov	x0, x20
 12e65ec: aa1f03e1     	mov	x1, xzr
 12e65f0: 94474943     	bl	0x24b8afc <__start_il2cpp+0x1311338>
 12e65f4: b40002a0     	cbz	x0, 0x12e6648 <__start_il2cpp+0x13ee84>
 12e65f8: d000abf5     	adrp	x21, 0x2864000
 12e65fc: f9450ab5     	ldr	x21, [x21, #0xa10]
 12e6600: 1e2703e0     	fmov	s0, wzr
 12e6604: 1e2703e2     	fmov	s2, wzr
 12e6608: 4ea81d01     	mov	v1.16b, v8.16b
 12e660c: aa1f03e1     	mov	x1, xzr
 12e6610: 94476e06     	bl	0x24c1e28 <__start_il2cpp+0x131a664>
 12e6614: f9004a74     	str	x20, [x19, #0x90]
 12e6618: f94002a1     	ldr	x1, [x21]
 12e661c: aa1403e0     	mov	x0, x20
 12e6620: 9403ca69     	bl	0x13d8fc4 <__start_il2cpp+0x231800>
 12e6624: f9006260     	str	x0, [x19, #0xc0]
 12e6628: aa1303e0     	mov	x0, x19
 12e662c: a9444ff4     	ldp	x20, x19, [sp, #0x40]
 12e6630: a94357f6     	ldp	x22, x21, [sp, #0x30]
 12e6634: a9425ff8     	ldp	x24, x23, [sp, #0x20]
 12e6638: a94167fa     	ldp	x26, x25, [sp, #0x10]
 12e663c: f94007fe     	ldr	x30, [sp, #0x8]
 12e6640: fc4507e8     	ldr	d8, [sp], #0x50
 12e6644: 14000076     	b	0x12e681c <__start_il2cpp+0x13f058>
 12e6648: 97f766ae     	bl	0x10c0100 <CloseNLSocket+0x638>
