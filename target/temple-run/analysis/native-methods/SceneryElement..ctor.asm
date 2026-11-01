
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12f6840: 52878008     	mov	w8, #0x3c00             // =15360
 12f6844: 72b8c388     	movk	w8, #0xc61c, lsl #16
 12f6848: 0e040d00     	dup	v0.2s, w8
 12f684c: aa1f03e1     	mov	x1, xzr
 12f6850: fd001000     	str	d0, [x0, #0x20]
 12f6854: 14470e0b     	b	0x24ba080 <__start_il2cpp+0x13128bc>
