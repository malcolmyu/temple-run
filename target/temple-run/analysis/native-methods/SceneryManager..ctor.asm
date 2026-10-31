
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12f7998: d100c3ff     	sub	sp, sp, #0x30
 12f799c: a90157fe     	stp	x30, x21, [sp, #0x10]
 12f79a0: a9024ff4     	stp	x20, x19, [sp, #0x20]
 12f79a4: d000b9f5     	adrp	x21, 0x2a35000
 12f79a8: f000ab74     	adrp	x20, 0x2866000
 12f79ac: 396efaa8     	ldrb	w8, [x21, #0xbbe]
 12f79b0: f9448a94     	ldr	x20, [x20, #0x910]
 12f79b4: aa0003f3     	mov	x19, x0
 12f79b8: 370000c8     	tbnz	w8, #0x0, 0x12f79d0 <__start_il2cpp+0x15020c>
 12f79bc: f000ab60     	adrp	x0, 0x2866000
 12f79c0: f9448800     	ldr	x0, [x0, #0x910]
 12f79c4: 97f72145     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f79c8: 52800028     	mov	w8, #0x1                // =1
 12f79cc: 392efaa8     	strb	w8, [x21, #0xbbe]
 12f79d0: 90ff9d08     	adrp	x8, 0x697000
 12f79d4: 9134c108     	add	x8, x8, #0xd30
 12f79d8: 3dc00100     	ldr	q0, [x8]
 12f79dc: f9400280     	ldr	x0, [x20]
 12f79e0: 910003e1     	mov	x1, sp
 12f79e4: 3d8003e0     	str	q0, [sp]
 12f79e8: 97f7215c     	bl	0x10bff58 <CloseNLSocket+0x490>
 12f79ec: f9003260     	str	x0, [x19, #0x60]
 12f79f0: aa1303e0     	mov	x0, x19
 12f79f4: aa1f03e1     	mov	x1, xzr
 12f79f8: 944709a2     	bl	0x24ba080 <__start_il2cpp+0x13128bc>
 12f79fc: a9424ff4     	ldp	x20, x19, [sp, #0x20]
 12f7a00: a94157fe     	ldp	x30, x21, [sp, #0x10]
 12f7a04: 9100c3ff     	add	sp, sp, #0x30
 12f7a08: d65f03c0     	ret
