
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12b0380: a9bf4ffe     	stp	x30, x19, [sp, #-0x10]!
 12b0384: aa0003f3     	mov	x19, x0
 12b0388: 1e2e1000     	fmov	s0, #1.00000000
 12b038c: 1e2e1001     	fmov	s1, #1.00000000
 12b0390: 1e2e1002     	fmov	s2, #1.00000000
 12b0394: 1e2e1003     	fmov	s3, #1.00000000
 12b0398: aa1f03e0     	mov	x0, xzr
 12b039c: 9447b06a     	bl	0x249c544 <__start_il2cpp+0x12f4d80>
 12b03a0: 2d5d8660     	ldp	s0, s1, [x19, #0xec]
 12b03a4: bd40f662     	ldr	s2, [x19, #0xf4]
 12b03a8: 1e2e1003     	fmov	s3, #1.00000000
 12b03ac: aa1f03e0     	mov	x0, xzr
 12b03b0: 9447aff0     	bl	0x249c370 <__start_il2cpp+0x12f4bac>
 12b03b4: aa1303e0     	mov	x0, x19
 12b03b8: aa1f03e1     	mov	x1, xzr
 12b03bc: 94481754     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12b03c0: b4000100     	cbz	x0, 0x12b03e0 <__start_il2cpp+0x108c1c>
 12b03c4: aa1f03e1     	mov	x1, xzr
 12b03c8: 944848ab     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12b03cc: 2d5d9263     	ldp	s3, s4, [x19, #0xec]
 12b03d0: bd40f665     	ldr	s5, [x19, #0xf4]
 12b03d4: aa1f03e0     	mov	x0, xzr
 12b03d8: a8c14ffe     	ldp	x30, x19, [sp], #0x10
 12b03dc: 1447afc0     	b	0x249c2dc <__start_il2cpp+0x12f4b18>
 12b03e0: 97f83f48     	bl	0x10c0100 <CloseNLSocket+0x638>
