
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12b03e4: 6dbd23e9     	stp	d9, d8, [sp, #-0x30]!
 12b03e8: f9000bfe     	str	x30, [sp, #0x10]
 12b03ec: a9024ff4     	stp	x20, x19, [sp, #0x20]
 12b03f0: aa1f03e1     	mov	x1, xzr
 12b03f4: aa0003f3     	mov	x19, x0
 12b03f8: 3904a01f     	strb	wzr, [x0, #0x128]
 12b03fc: 9400c11e     	bl	0x12e0874 <__start_il2cpp+0x1390b0>
 12b0400: aa1303e0     	mov	x0, x19
 12b0404: aa1f03e1     	mov	x1, xzr
 12b0408: 9400c11d     	bl	0x12e087c <__start_il2cpp+0x1390b8>
 12b040c: aa1303e0     	mov	x0, x19
 12b0410: aa1f03e1     	mov	x1, xzr
 12b0414: 9448173e     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12b0418: b4000520     	cbz	x0, 0x12b04bc <__start_il2cpp+0x108cf8>
 12b041c: 2d5c8a61     	ldp	s1, s2, [x19, #0xe4]
 12b0420: bd40e260     	ldr	s0, [x19, #0xe0]
 12b0424: aa1f03e1     	mov	x1, xzr
 12b0428: 944848bb     	bl	0x24c2714 <__start_il2cpp+0x131af50>
 12b042c: f9404668     	ldr	x8, [x19, #0x88]
 12b0430: b4000468     	cbz	x8, 0x12b04bc <__start_il2cpp+0x108cf8>
 12b0434: bd413500     	ldr	s0, [x8, #0x134]
 12b0438: f9403e60     	ldr	x0, [x19, #0x78]
 12b043c: bd009a60     	str	s0, [x19, #0x98]
 12b0440: b40003e0     	cbz	x0, 0x12b04bc <__start_il2cpp+0x108cf8>
 12b0444: aa1f03e1     	mov	x1, xzr
 12b0448: 94481731     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12b044c: f9404268     	ldr	x8, [x19, #0x80]
 12b0450: b4000368     	cbz	x8, 0x12b04bc <__start_il2cpp+0x108cf8>
 12b0454: aa0003f4     	mov	x20, x0
 12b0458: aa0803e0     	mov	x0, x8
 12b045c: aa1f03e1     	mov	x1, xzr
 12b0460: 9448172b     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12b0464: b40002c0     	cbz	x0, 0x12b04bc <__start_il2cpp+0x108cf8>
 12b0468: aa1f03e1     	mov	x1, xzr
 12b046c: 94484882     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12b0470: f9404260     	ldr	x0, [x19, #0x80]
 12b0474: b4000240     	cbz	x0, 0x12b04bc <__start_il2cpp+0x108cf8>
 12b0478: bd40c269     	ldr	s9, [x19, #0xc0]
 12b047c: aa1f03e1     	mov	x1, xzr
 12b0480: 4ea01c08     	mov	v8.16b, v0.16b
 12b0484: 94481722     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12b0488: b40001a0     	cbz	x0, 0x12b04bc <__start_il2cpp+0x108cf8>
 12b048c: aa1f03e1     	mov	x1, xzr
 12b0490: 94484879     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12b0494: b4000154     	cbz	x20, 0x12b04bc <__start_il2cpp+0x108cf8>
 12b0498: aa1403e0     	mov	x0, x20
 12b049c: a9424ff4     	ldp	x20, x19, [sp, #0x20]
 12b04a0: f9400bfe     	ldr	x30, [sp, #0x10]
 12b04a4: 4ea11c22     	mov	v2.16b, v1.16b
 12b04a8: 4ea81d00     	mov	v0.16b, v8.16b
 12b04ac: 4ea91d21     	mov	v1.16b, v9.16b
 12b04b0: aa1f03e1     	mov	x1, xzr
 12b04b4: 6cc323e9     	ldp	d9, d8, [sp], #0x30
 12b04b8: 14484897     	b	0x24c2714 <__start_il2cpp+0x131af50>
 12b04bc: 97f83f11     	bl	0x10c0100 <CloseNLSocket+0x638>
