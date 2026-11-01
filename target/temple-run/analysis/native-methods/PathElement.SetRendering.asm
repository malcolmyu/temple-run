
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12e85e8: a9bc67fe     	stp	x30, x25, [sp, #-0x40]!
 12e85ec: a9015ff8     	stp	x24, x23, [sp, #0x10]
 12e85f0: a90257f6     	stp	x22, x21, [sp, #0x20]
 12e85f4: a9034ff4     	stp	x20, x19, [sp, #0x30]
 12e85f8: b000ba75     	adrp	x21, 0x2a35000
 12e85fc: 9000abb6     	adrp	x22, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12e8600: 396ca6a8     	ldrb	w8, [x21, #0xb29]
 12e8604: f94562d6     	ldr	x22, [x22, #0xac0]
 12e8608: 2a0103f4     	mov	w20, w1
 12e860c: aa0003f3     	mov	x19, x0
 12e8610: 37000128     	tbnz	w8, #0x0, 0x12e8634 <__start_il2cpp+0x140e70>
 12e8614: d000abc0     	adrp	x0, 0x2862000
 12e8618: f9438000     	ldr	x0, [x0, #0x700]
 12e861c: 97f75e2f     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e8620: 9000aba0     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12e8624: f9456000     	ldr	x0, [x0, #0xac0]
 12e8628: 97f75e2c     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e862c: 52800028     	mov	w8, #0x1                // =1
 12e8630: 392ca6a8     	strb	w8, [x21, #0xb29]
 12e8634: f94002c0     	ldr	x0, [x22]
 12e8638: f9401675     	ldr	x21, [x19, #0x28]
 12e863c: b940e008     	ldr	w8, [x0, #0xe0]
 12e8640: 35000048     	cbnz	w8, 0x12e8648 <__start_il2cpp+0x140e84>
 12e8644: 97f75e67     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e8648: aa1503e0     	mov	x0, x21
 12e864c: aa1f03e1     	mov	x1, xzr
 12e8650: aa1f03e2     	mov	x2, xzr
 12e8654: 9447407d     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12e8658: 36000ac0     	tbz	w0, #0x0, 0x12e87b0 <__start_il2cpp+0x140fec>
 12e865c: f9406668     	ldr	x8, [x19, #0xc8]
 12e8660: b4000a88     	cbz	x8, 0x12e87b0 <__start_il2cpp+0x140fec>
 12e8664: f9400d08     	ldr	x8, [x8, #0x18]
 12e8668: b4000a48     	cbz	x8, 0x12e87b0 <__start_il2cpp+0x140fec>
 12e866c: f9401675     	ldr	x21, [x19, #0x28]
 12e8670: aa1f03e0     	mov	x0, xzr
 12e8674: 9446b216     	bl	0x2494ecc <__start_il2cpp+0x12ed708>
 12e8678: aa0003e1     	mov	x1, x0
 12e867c: aa1503e0     	mov	x0, x21
 12e8680: aa1f03e2     	mov	x2, xzr
 12e8684: 94004b93     	bl	0x12fb4d0 <__start_il2cpp+0x153d0c>
 12e8688: b940ba68     	ldr	w8, [x19, #0xb8]
 12e868c: 12000009     	and	w9, w0, #0x1
 12e8690: 0a140017     	and	w23, w0, w20
 12e8694: 39034269     	strb	w9, [x19, #0xd0]
 12e8698: 36000097     	tbz	w23, #0x0, 0x12e86a8 <__start_il2cpp+0x140ee4>
 12e869c: 7100051f     	cmp	w8, #0x1
 12e86a0: 54000081     	b.ne	0x12e86b0 <__start_il2cpp+0x140eec>
 12e86a4: 14000043     	b	0x12e87b0 <__start_il2cpp+0x140fec>
 12e86a8: 7100091f     	cmp	w8, #0x2
 12e86ac: 54000820     	b.eq	0x12e87b0 <__start_il2cpp+0x140fec>
 12e86b0: f9406674     	ldr	x20, [x19, #0xc8]
 12e86b4: b40008b4     	cbz	x20, 0x12e87c8 <__start_il2cpp+0x141004>
 12e86b8: b9401a88     	ldr	w8, [x20, #0x18]
 12e86bc: 7100051f     	cmp	w8, #0x1
 12e86c0: 540001cb     	b.lt	0x12e86f8 <__start_il2cpp+0x140f34>
 12e86c4: 2a1f03f5     	mov	w21, wzr
 12e86c8: 6b0802bf     	cmp	w21, w8
 12e86cc: 540007c2     	b.hs	0x12e87c4 <__start_il2cpp+0x141000>
 12e86d0: 8b35ce88     	add	x8, x20, w21, sxtw #3
 12e86d4: f9401100     	ldr	x0, [x8, #0x20]
 12e86d8: b4000780     	cbz	x0, 0x12e87c8 <__start_il2cpp+0x141004>
 12e86dc: 120002e1     	and	w1, w23, #0x1
 12e86e0: aa1f03e2     	mov	x2, xzr
 12e86e4: 9446d8c8     	bl	0x249ea04 <__start_il2cpp+0x12f7240>
 12e86e8: b9401a88     	ldr	w8, [x20, #0x18]
 12e86ec: 110006b5     	add	w21, w21, #0x1
 12e86f0: 6b0802bf     	cmp	w21, w8
 12e86f4: 54fffeab     	b.lt	0x12e86c8 <__start_il2cpp+0x140f04>
 12e86f8: 36000537     	tbz	w23, #0x0, 0x12e879c <__start_il2cpp+0x140fd8>
 12e86fc: aa1303e0     	mov	x0, x19
 12e8700: aa1f03e1     	mov	x1, xzr
 12e8704: 94473691     	bl	0x24b6148 <__start_il2cpp+0x130e984>
 12e8708: 52800021     	mov	w1, #0x1                // =1
 12e870c: aa1f03e2     	mov	x2, xzr
 12e8710: 97fca828     	bl	0x12127b0 <__start_il2cpp+0x6afec>
 12e8714: d000abc8     	adrp	x8, 0x2862000
 12e8718: f9438108     	ldr	x8, [x8, #0x700]
 12e871c: aa1303e0     	mov	x0, x19
 12e8720: f9400101     	ldr	x1, [x8]
 12e8724: 9402eb7a     	bl	0x13a350c <__start_il2cpp+0x1fbd48>
 12e8728: b40003a0     	cbz	x0, 0x12e879c <__start_il2cpp+0x140fd8>
 12e872c: f9400c08     	ldr	x8, [x0, #0x18]
 12e8730: aa0003f4     	mov	x20, x0
 12e8734: 7100051f     	cmp	w8, #0x1
 12e8738: 5400032b     	b.lt	0x12e879c <__start_il2cpp+0x140fd8>
 12e873c: aa1f03f8     	mov	x24, xzr
 12e8740: 92407d08     	and	x8, x8, #0xffffffff
 12e8744: 91008299     	add	x25, x20, #0x20
 12e8748: eb28431f     	cmp	x24, w8, uxtw
 12e874c: 540003c2     	b.hs	0x12e87c4 <__start_il2cpp+0x141000>
 12e8750: f94002c0     	ldr	x0, [x22]
 12e8754: f8787b35     	ldr	x21, [x25, x24, lsl #3]
 12e8758: b940e008     	ldr	w8, [x0, #0xe0]
 12e875c: 35000048     	cbnz	w8, 0x12e8764 <__start_il2cpp+0x140fa0>
 12e8760: 97f75e20     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e8764: aa1503e0     	mov	x0, x21
 12e8768: aa1f03e1     	mov	x1, xzr
 12e876c: aa1f03e2     	mov	x2, xzr
 12e8770: 94474036     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12e8774: 360000c0     	tbz	w0, #0x0, 0x12e878c <__start_il2cpp+0x140fc8>
 12e8778: b4000295     	cbz	x21, 0x12e87c8 <__start_il2cpp+0x141004>
 12e877c: 52800021     	mov	w1, #0x1                // =1
 12e8780: aa1503e0     	mov	x0, x21
 12e8784: aa1f03e2     	mov	x2, xzr
 12e8788: 944733c2     	bl	0x24b5690 <__start_il2cpp+0x130decc>
 12e878c: b9401a88     	ldr	w8, [x20, #0x18]
 12e8790: 91000718     	add	x24, x24, #0x1
 12e8794: eb28c31f     	cmp	x24, w8, sxtw
 12e8798: 54fffd8b     	b.lt	0x12e8748 <__start_il2cpp+0x140f84>
 12e879c: b4000173     	cbz	x19, 0x12e87c8 <__start_il2cpp+0x141004>
 12e87a0: 720002ff     	tst	w23, #0x1
 12e87a4: 52800028     	mov	w8, #0x1                // =1
 12e87a8: 1a881508     	cinc	w8, w8, eq
 12e87ac: b900ba68     	str	w8, [x19, #0xb8]
 12e87b0: a9434ff4     	ldp	x20, x19, [sp, #0x30]
 12e87b4: a94257f6     	ldp	x22, x21, [sp, #0x20]
 12e87b8: a9415ff8     	ldp	x24, x23, [sp, #0x10]
 12e87bc: a8c467fe     	ldp	x30, x25, [sp], #0x40
 12e87c0: d65f03c0     	ret
 12e87c4: 97f75e51     	bl	0x10c0108 <CloseNLSocket+0x640>
 12e87c8: 97f75e4e     	bl	0x10c0100 <CloseNLSocket+0x638>
