
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12ae51c: fc1d0fea     	str	d10, [sp, #-0x30]!
 12ae520: 6d0123e9     	stp	d9, d8, [sp, #0x10]
 12ae524: a9024ffe     	stp	x30, x19, [sp, #0x20]
 12ae528: aa1f03e1     	mov	x1, xzr
 12ae52c: 94481ef8     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12ae530: aa0003f3     	mov	x19, x0
 12ae534: aa1f03e0     	mov	x0, xzr
 12ae538: 94479a65     	bl	0x2494ecc <__start_il2cpp+0x12ed708>
 12ae53c: b40003c0     	cbz	x0, 0x12ae5b4 <__start_il2cpp+0x106df0>
 12ae540: aa1f03e1     	mov	x1, xzr
 12ae544: 94481ef2     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12ae548: b4000360     	cbz	x0, 0x12ae5b4 <__start_il2cpp+0x106df0>
 12ae54c: aa1f03e1     	mov	x1, xzr
 12ae550: 94485049     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12ae554: aa1f03e0     	mov	x0, xzr
 12ae558: 4ea01c08     	mov	v8.16b, v0.16b
 12ae55c: 4ea11c29     	mov	v9.16b, v1.16b
 12ae560: 4ea21c4a     	mov	v10.16b, v2.16b
 12ae564: 94479a5a     	bl	0x2494ecc <__start_il2cpp+0x12ed708>
 12ae568: b4000260     	cbz	x0, 0x12ae5b4 <__start_il2cpp+0x106df0>
 12ae56c: aa1f03e1     	mov	x1, xzr
 12ae570: 94481ee7     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12ae574: b4000200     	cbz	x0, 0x12ae5b4 <__start_il2cpp+0x106df0>
 12ae578: aa1f03e1     	mov	x1, xzr
 12ae57c: 94485153     	bl	0x24c2ac8 <__start_il2cpp+0x131b304>
 12ae580: b40001b3     	cbz	x19, 0x12ae5b4 <__start_il2cpp+0x106df0>
 12ae584: 4ea01c03     	mov	v3.16b, v0.16b
 12ae588: 4ea11c24     	mov	v4.16b, v1.16b
 12ae58c: aa1303e0     	mov	x0, x19
 12ae590: 4ea81d00     	mov	v0.16b, v8.16b
 12ae594: 4ea91d21     	mov	v1.16b, v9.16b
 12ae598: a9424ffe     	ldp	x30, x19, [sp, #0x20]
 12ae59c: 6d4123e9     	ldp	d9, d8, [sp, #0x10]
 12ae5a0: 4ea21c45     	mov	v5.16b, v2.16b
 12ae5a4: 4eaa1d42     	mov	v2.16b, v10.16b
 12ae5a8: aa1f03e1     	mov	x1, xzr
 12ae5ac: fc4307ea     	ldr	d10, [sp], #0x30
 12ae5b0: 1448541e     	b	0x24c3628 <__start_il2cpp+0x131be64>
 12ae5b4: 97f846d3     	bl	0x10c0100 <CloseNLSocket+0x638>
