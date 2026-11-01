
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12cbbbc: a9be57fe     	stp	x30, x21, [sp, #-0x20]!
 12cbbc0: a9014ff4     	stp	x20, x19, [sp, #0x10]
 12cbbc4: d000bb55     	adrp	x21, 0x2a35000
 12cbbc8: f000acb4     	adrp	x20, 0x2862000
 12cbbcc: 39695aa8     	ldrb	w8, [x21, #0xa56]
 12cbbd0: f9464e94     	ldr	x20, [x20, #0xc98]
 12cbbd4: aa0003f3     	mov	x19, x0
 12cbbd8: 370000c8     	tbnz	w8, #0x0, 0x12cbbf0 <__start_il2cpp+0x12442c>
 12cbbdc: f000aca0     	adrp	x0, 0x2862000
 12cbbe0: f9464c00     	ldr	x0, [x0, #0xc98]
 12cbbe4: 97f7d0bd     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12cbbe8: 52800028     	mov	w8, #0x1                // =1
 12cbbec: 39295aa8     	strb	w8, [x21, #0xa56]
 12cbbf0: b9403268     	ldr	w8, [x19, #0x30]
 12cbbf4: aa1303e0     	mov	x0, x19
 12cbbf8: b9004268     	str	w8, [x19, #0x40]
 12cbbfc: f9400281     	ldr	x1, [x20]
 12cbc00: 94035ba7     	bl	0x13a2a9c <__start_il2cpp+0x1fb2d8>
 12cbc04: f9002660     	str	x0, [x19, #0x48]
 12cbc08: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 12cbc0c: a8c257fe     	ldp	x30, x21, [sp], #0x20
 12cbc10: d65f03c0     	ret
