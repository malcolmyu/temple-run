
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12af5b4: a9bf4ffe     	stp	x30, x19, [sp, #-0x10]!
 12af5b8: aa0003f3     	mov	x19, x0
 12af5bc: 9400001b     	bl	0x12af628 <__start_il2cpp+0x107e64>
 12af5c0: aa1303e0     	mov	x0, x19
 12af5c4: aa1f03e1     	mov	x1, xzr
 12af5c8: 94481ad1     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12af5cc: b40002c0     	cbz	x0, 0x12af624 <__start_il2cpp+0x107e60>
 12af5d0: 2d5b0a61     	ldp	s1, s2, [x19, #0xd8]
 12af5d4: bd40d660     	ldr	s0, [x19, #0xd4]
 12af5d8: aa1f03e1     	mov	x1, xzr
 12af5dc: 94484c4e     	bl	0x24c2714 <__start_il2cpp+0x131af50>
 12af5e0: aa1303e0     	mov	x0, x19
 12af5e4: aa1f03e1     	mov	x1, xzr
 12af5e8: 94481ac9     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12af5ec: f9403e68     	ldr	x8, [x19, #0x78]
 12af5f0: b40001a8     	cbz	x8, 0x12af624 <__start_il2cpp+0x107e60>
 12af5f4: aa0003f3     	mov	x19, x0
 12af5f8: aa0803e0     	mov	x0, x8
 12af5fc: aa1f03e1     	mov	x1, xzr
 12af600: 94481ac3     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12af604: b4000100     	cbz	x0, 0x12af624 <__start_il2cpp+0x107e60>
 12af608: aa1f03e1     	mov	x1, xzr
 12af60c: 94484c1a     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12af610: b40000b3     	cbz	x19, 0x12af624 <__start_il2cpp+0x107e60>
 12af614: aa1303e0     	mov	x0, x19
 12af618: aa1f03e1     	mov	x1, xzr
 12af61c: a8c14ffe     	ldp	x30, x19, [sp], #0x10
 12af620: 1448501b     	b	0x24c368c <__start_il2cpp+0x131bec8>
 12af624: 97f842b7     	bl	0x10c0100 <CloseNLSocket+0x638>
