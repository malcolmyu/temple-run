
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1297e40: a9bf4ffe     	stp	x30, x19, [sp, #-0x10]!
 1297e44: aa0003f3     	mov	x19, x0
 1297e48: 9400072d     	bl	0x1299afc <__start_il2cpp+0xf2338>
 1297e4c: b9007a60     	str	w0, [x19, #0x78]
 1297e50: aa1303e0     	mov	x0, x19
 1297e54: aa1f03e1     	mov	x1, xzr
 1297e58: 944878ad     	bl	0x24b610c <__start_il2cpp+0x130e948>
 1297e5c: b4000120     	cbz	x0, 0x1297e80 <__start_il2cpp+0xf06bc>
 1297e60: aa1f03e1     	mov	x1, xzr
 1297e64: 9448aa04     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 1297e68: 2d0f8660     	stp	s0, s1, [x19, #0x7c]
 1297e6c: bd008662     	str	s2, [x19, #0x84]
 1297e70: aa1303e0     	mov	x0, x19
 1297e74: aa1f03e1     	mov	x1, xzr
 1297e78: a8c14ffe     	ldp	x30, x19, [sp], #0x10
 1297e7c: 14012075     	b	0x12e0050 <__start_il2cpp+0x13888c>
 1297e80: 97f8a0a0     	bl	0x10c0100 <CloseNLSocket+0x638>
