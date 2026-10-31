
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 129667c: a9be57fe     	stp	x30, x21, [sp, #-0x20]!
 1296680: a9014ff4     	stp	x20, x19, [sp, #0x10]
 1296684: f000bcf5     	adrp	x21, 0x2a35000
 1296688: f000ae34     	adrp	x20, 0x285d000
 129668c: 39622aa8     	ldrb	w8, [x21, #0x88a]
 1296690: f9460e94     	ldr	x20, [x20, #0xc18]
 1296694: aa0003f3     	mov	x19, x0
 1296698: 37000128     	tbnz	w8, #0x0, 0x12966bc <__start_il2cpp+0xeeef8>
 129669c: f000ae20     	adrp	x0, 0x285d000
 12966a0: f9460c00     	ldr	x0, [x0, #0xc18]
 12966a4: 97f8a60d     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12966a8: b000ae60     	adrp	x0, 0x2863000
 12966ac: f9469000     	ldr	x0, [x0, #0xd20]
 12966b0: 97f8a60a     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12966b4: 52800028     	mov	w8, #0x1                // =1
 12966b8: 39222aa8     	strb	w8, [x21, #0x88a]
 12966bc: f9400280     	ldr	x0, [x20]
 12966c0: b940e008     	ldr	w8, [x0, #0xe0]
 12966c4: 35000068     	cbnz	w8, 0x12966d0 <__start_il2cpp+0xeef0c>
 12966c8: 97f8a646     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12966cc: f9400280     	ldr	x0, [x20]
 12966d0: f9405c08     	ldr	x8, [x0, #0xb8]
 12966d4: f9400100     	ldr	x0, [x8]
 12966d8: b40003a0     	cbz	x0, 0x129674c <__start_il2cpp+0xeef88>
 12966dc: b000ae68     	adrp	x8, 0x2863000
 12966e0: f9469108     	ldr	x8, [x8, #0xd20]
 12966e4: aa1f03e2     	mov	x2, xzr
 12966e8: f9400101     	ldr	x1, [x8]
 12966ec: 97fccdad     	bl	0x11c9da0 <__start_il2cpp+0x225dc>
 12966f0: aa0003f4     	mov	x20, x0
 12966f4: aa1303e0     	mov	x0, x19
 12966f8: aa1f03e1     	mov	x1, xzr
 12966fc: 94487e84     	bl	0x24b610c <__start_il2cpp+0x130e948>
 1296700: b4000274     	cbz	x20, 0x129674c <__start_il2cpp+0xeef88>
 1296704: aa0003f5     	mov	x21, x0
 1296708: aa1403e0     	mov	x0, x20
 129670c: aa1f03e1     	mov	x1, xzr
 1296710: 94487e7f     	bl	0x24b610c <__start_il2cpp+0x130e948>
 1296714: b40001d5     	cbz	x21, 0x129674c <__start_il2cpp+0xeef88>
 1296718: aa0003e1     	mov	x1, x0
 129671c: aa1503e0     	mov	x0, x21
 1296720: aa1f03e2     	mov	x2, xzr
 1296724: 9448b1c8     	bl	0x24c2e44 <__start_il2cpp+0x131b680>
 1296728: aa1303e0     	mov	x0, x19
 129672c: aa1f03e1     	mov	x1, xzr
 1296730: 94487e77     	bl	0x24b610c <__start_il2cpp+0x130e948>
 1296734: aa0003e1     	mov	x1, x0
 1296738: aa1403e0     	mov	x0, x20
 129673c: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 1296740: aa1f03e2     	mov	x2, xzr
 1296744: a8c257fe     	ldp	x30, x21, [sp], #0x20
 1296748: 17fcd76c     	b	0x11cc4f8 <__start_il2cpp+0x24d34>
 129674c: 97f8a66d     	bl	0x10c0100 <CloseNLSocket+0x638>
