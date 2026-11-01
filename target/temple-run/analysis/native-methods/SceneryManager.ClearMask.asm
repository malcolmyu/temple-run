
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12f6dac: f81f0ffe     	str	x30, [sp, #-0x10]!
 12f6db0: f940300b     	ldr	x11, [x0, #0x60]
 12f6db4: b40002cb     	cbz	x11, 0x12f6e0c <__start_il2cpp+0x14f648>
 12f6db8: f9400969     	ldr	x9, [x11, #0x10]
 12f6dbc: aa1f03e8     	mov	x8, xzr
 12f6dc0: 9100816b     	add	x11, x11, #0x20
 12f6dc4: b940012a     	ldr	w10, [x9]
 12f6dc8: aa1f03ec     	mov	x12, xzr
 12f6dcc: eb0a011f     	cmp	x8, x10
 12f6dd0: 540001c2     	b.hs	0x12f6e08 <__start_il2cpp+0x14f644>
 12f6dd4: f940092d     	ldr	x13, [x9, #0x10]
 12f6dd8: eb2d419f     	cmp	x12, w13, uxtw
 12f6ddc: 54000162     	b.hs	0x12f6e08 <__start_il2cpp+0x14f644>
 12f6de0: 9b0d2d0d     	madd	x13, x8, x13, x11
 12f6de4: 382c69bf     	strb	wzr, [x13, x12]
 12f6de8: 9100058c     	add	x12, x12, #0x1
 12f6dec: f1004d9f     	cmp	x12, #0x13
 12f6df0: 54fffee1     	b.ne	0x12f6dcc <__start_il2cpp+0x14f608>
 12f6df4: 91000508     	add	x8, x8, #0x1
 12f6df8: f1004d1f     	cmp	x8, #0x13
 12f6dfc: 54fffe61     	b.ne	0x12f6dc8 <__start_il2cpp+0x14f604>
 12f6e00: f84107fe     	ldr	x30, [sp], #0x10
 12f6e04: d65f03c0     	ret
 12f6e08: 97f724c0     	bl	0x10c0108 <CloseNLSocket+0x640>
 12f6e0c: 97f724bd     	bl	0x10c0100 <CloseNLSocket+0x638>
