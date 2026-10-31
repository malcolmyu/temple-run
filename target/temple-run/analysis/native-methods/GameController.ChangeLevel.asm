
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1272c80: f81e0ffe     	str	x30, [sp, #-0x20]!
 1272c84: a9014ff4     	stp	x20, x19, [sp, #0x10]
 1272c88: f000be14     	adrp	x20, 0x2a35000
 1272c8c: 9000af93     	adrp	x19, 0x2862000
 1272c90: 395d4288     	ldrb	w8, [x20, #0x750]
 1272c94: f9424a73     	ldr	x19, [x19, #0x490]
 1272c98: 370000c8     	tbnz	w8, #0x0, 0x1272cb0 <__start_il2cpp+0xcb4ec>
 1272c9c: 9000af80     	adrp	x0, 0x2862000
 1272ca0: f9424800     	ldr	x0, [x0, #0x490]
 1272ca4: 97f9348d     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1272ca8: 52800028     	mov	w8, #0x1                // =1
 1272cac: 391d4288     	strb	w8, [x20, #0x750]
 1272cb0: f9400260     	ldr	x0, [x19]
 1272cb4: b940e008     	ldr	w8, [x0, #0xe0]
 1272cb8: 35000068     	cbnz	w8, 0x1272cc4 <__start_il2cpp+0xcb500>
 1272cbc: 97f934c9     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1272cc0: f9400260     	ldr	x0, [x19]
 1272cc4: f9405c08     	ldr	x8, [x0, #0xb8]
 1272cc8: b9404509     	ldr	w9, [x8, #0x44]
 1272ccc: 71000d3f     	cmp	w9, #0x3
 1272cd0: 54000120     	b.eq	0x1272cf4 <__start_il2cpp+0xcb530>
 1272cd4: 7100093f     	cmp	w9, #0x2
 1272cd8: 54000220     	b.eq	0x1272d1c <__start_il2cpp+0xcb558>
 1272cdc: 7100053f     	cmp	w9, #0x1
 1272ce0: 54000441     	b.ne	0x1272d68 <__start_il2cpp+0xcb5a4>
 1272ce4: b940e009     	ldr	w9, [x0, #0xe0]
 1272ce8: 34000369     	cbz	w9, 0x1272d54 <__start_il2cpp+0xcb590>
 1272cec: 52800054     	mov	w20, #0x2               // =2
 1272cf0: 1400001d     	b	0x1272d64 <__start_il2cpp+0xcb5a0>
 1272cf4: 52800041     	mov	w1, #0x2                // =2
 1272cf8: 2a1f03e0     	mov	w0, wzr
 1272cfc: aa1f03e2     	mov	x2, xzr
 1272d00: 9449047a     	bl	0x24b3ee8 <__start_il2cpp+0x130c724>
 1272d04: 2a0003e8     	mov	w8, w0
 1272d08: f9400260     	ldr	x0, [x19]
 1272d0c: 7100011f     	cmp	w8, #0x0
 1272d10: 52800028     	mov	w8, #0x1                // =1
 1272d14: 1a881514     	cinc	w20, w8, eq
 1272d18: 1400000a     	b	0x1272d40 <__start_il2cpp+0xcb57c>
 1272d1c: 52800041     	mov	w1, #0x2                // =2
 1272d20: 2a1f03e0     	mov	w0, wzr
 1272d24: aa1f03e2     	mov	x2, xzr
 1272d28: 94490470     	bl	0x24b3ee8 <__start_il2cpp+0x130c724>
 1272d2c: 2a0003e8     	mov	w8, w0
 1272d30: f9400260     	ldr	x0, [x19]
 1272d34: 7100011f     	cmp	w8, #0x0
 1272d38: 52800068     	mov	w8, #0x3                // =3
 1272d3c: 1a9f1514     	csinc	w20, w8, wzr, ne
 1272d40: b940e009     	ldr	w9, [x0, #0xe0]
 1272d44: 350000e9     	cbnz	w9, 0x1272d60 <__start_il2cpp+0xcb59c>
 1272d48: 97f934a6     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1272d4c: f9400260     	ldr	x0, [x19]
 1272d50: 14000004     	b	0x1272d60 <__start_il2cpp+0xcb59c>
 1272d54: 97f934a3     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1272d58: f9400260     	ldr	x0, [x19]
 1272d5c: 52800054     	mov	w20, #0x2               // =2
 1272d60: f9405c08     	ldr	x8, [x0, #0xb8]
 1272d64: b9004514     	str	w20, [x8, #0x44]
 1272d68: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 1272d6c: f84207fe     	ldr	x30, [sp], #0x20
 1272d70: d65f03c0     	ret
