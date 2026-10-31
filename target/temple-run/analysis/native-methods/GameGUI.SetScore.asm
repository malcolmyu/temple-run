
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12bf4e8: d10083ff     	sub	sp, sp, #0x20
 12bf4ec: a9014ffe     	stp	x30, x19, [sp, #0x10]
 12bf4f0: b9000fe1     	str	w1, [sp, #0xc]
 12bf4f4: f9403813     	ldr	x19, [x0, #0x70]
 12bf4f8: 910033e0     	add	x0, sp, #0xc
 12bf4fc: aa1f03e1     	mov	x1, xzr
 12bf500: 942f8b85     	bl	0x1ea2314 <__start_il2cpp+0xcfab50>
 12bf504: b4000113     	cbz	x19, 0x12bf524 <__start_il2cpp+0x117d60>
 12bf508: aa0003e1     	mov	x1, x0
 12bf50c: aa1303e0     	mov	x0, x19
 12bf510: aa1f03e2     	mov	x2, xzr
 12bf514: 97fef097     	bl	0x127b770 <__start_il2cpp+0xd3fac>
 12bf518: a9414ffe     	ldp	x30, x19, [sp, #0x10]
 12bf51c: 910083ff     	add	sp, sp, #0x20
 12bf520: d65f03c0     	ret
 12bf524: 97f802f7     	bl	0x10c0100 <CloseNLSocket+0x638>
