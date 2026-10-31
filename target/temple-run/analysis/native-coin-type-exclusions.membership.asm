
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 13d79a8: f81c0ffe     	str	x30, [sp, #-0x40]!
 13d79ac: a9015ff8     	stp	x24, x23, [sp, #0x10]
 13d79b0: a90257f6     	stp	x22, x21, [sp, #0x20]
 13d79b4: a9034ff4     	stp	x20, x19, [sp, #0x30]
 13d79b8: f9401c48     	ldr	x8, [x2, #0x38]
 13d79bc: aa0203f3     	mov	x19, x2
 13d79c0: aa0103f4     	mov	x20, x1
 13d79c4: 2a0003f5     	mov	w21, w0
 13d79c8: b5000068     	cbnz	x8, 0x13d79d4 <__start_il2cpp+0x230210>
 13d79cc: aa1303e0     	mov	x0, x19
 13d79d0: 97f2f9b9     	bl	0x10960b4 <.text+0x14b138>
 13d79d4: b4000434     	cbz	x20, 0x13d7a58 <__start_il2cpp+0x230294>
 13d79d8: b9401a88     	ldr	w8, [x20, #0x18]
 13d79dc: 7100011f     	cmp	w8, #0x0
 13d79e0: 1a9fd7f6     	cset	w22, gt
 13d79e4: 7100051f     	cmp	w8, #0x1
 13d79e8: 540002ab     	b.lt	0x13d7a3c <__start_il2cpp+0x230278>
 13d79ec: aa1f03f7     	mov	x23, xzr
 13d79f0: 91008298     	add	x24, x20, #0x20
 13d79f4: f9401e68     	ldr	x8, [x19, #0x38]
 13d79f8: f9400100     	ldr	x0, [x8]
 13d79fc: 97feaf78     	bl	0x13837dc <__start_il2cpp+0x1dc018>
 13d7a00: b9401a88     	ldr	w8, [x20, #0x18]
 13d7a04: eb0802ff     	cmp	x23, x8
 13d7a08: 54000262     	b.hs	0x13d7a54 <__start_il2cpp+0x230290>
 13d7a0c: b4000260     	cbz	x0, 0x13d7a58 <__start_il2cpp+0x230294>
 13d7a10: f9400008     	ldr	x8, [x0]
 13d7a14: b8777b01     	ldr	w1, [x24, x23, lsl #2]
 13d7a18: 2a1503e2     	mov	w2, w21
 13d7a1c: a95b8d09     	ldp	x9, x3, [x8, #0x1b8]
 13d7a20: d63f0120     	blr	x9
 13d7a24: 370000c0     	tbnz	w0, #0x0, 0x13d7a3c <__start_il2cpp+0x230278>
 13d7a28: b9801a88     	ldrsw	x8, [x20, #0x18]
 13d7a2c: 910006f7     	add	x23, x23, #0x1
 13d7a30: eb0802ff     	cmp	x23, x8
 13d7a34: 1a9fa7f6     	cset	w22, lt
 13d7a38: 54fffdeb     	b.lt	0x13d79f4 <__start_il2cpp+0x230230>
 13d7a3c: 120002c0     	and	w0, w22, #0x1
 13d7a40: a9434ff4     	ldp	x20, x19, [sp, #0x30]
 13d7a44: a94257f6     	ldp	x22, x21, [sp, #0x20]
 13d7a48: a9415ff8     	ldp	x24, x23, [sp, #0x10]
 13d7a4c: f84407fe     	ldr	x30, [sp], #0x40
 13d7a50: d65f03c0     	ret
 13d7a54: 97f3a1ad     	bl	0x10c0108 <CloseNLSocket+0x640>
 13d7a58: 97f3a1aa     	bl	0x10c0100 <CloseNLSocket+0x638>
