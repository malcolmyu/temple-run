
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 129555c: a9bf4ffe     	stp	x30, x19, [sp, #-0x10]!
 1295560: aa0003f3     	mov	x19, x0
 1295564: f9401000     	ldr	x0, [x0, #0x20]
 1295568: b40001a0     	cbz	x0, 0x129559c <__start_il2cpp+0xeddd8>
 129556c: aa1f03e1     	mov	x1, xzr
 1295570: 9447ea22     	bl	0x248fdf8 <__start_il2cpp+0x12e8634>
 1295574: f9401260     	ldr	x0, [x19, #0x20]
 1295578: b4000120     	cbz	x0, 0x129559c <__start_il2cpp+0xeddd8>
 129557c: f9403261     	ldr	x1, [x19, #0x60]
 1295580: aa1f03e2     	mov	x2, xzr
 1295584: 9447e9bb     	bl	0x248fc70 <__start_il2cpp+0x12e84ac>
 1295588: f9401260     	ldr	x0, [x19, #0x20]
 129558c: b4000080     	cbz	x0, 0x129559c <__start_il2cpp+0xeddd8>
 1295590: aa1f03e1     	mov	x1, xzr
 1295594: a8c14ffe     	ldp	x30, x19, [sp], #0x10
 1295598: 1447e9c7     	b	0x248fcb4 <__start_il2cpp+0x12e84f0>
 129559c: 97f8aad9     	bl	0x10c0100 <CloseNLSocket+0x638>
