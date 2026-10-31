
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12aa7d0: a9bc67fe     	stp	x30, x25, [sp, #-0x40]!
 12aa7d4: a9015ff8     	stp	x24, x23, [sp, #0x10]
 12aa7d8: a90257f6     	stp	x22, x21, [sp, #0x20]
 12aa7dc: a9034ff4     	stp	x20, x19, [sp, #0x30]
 12aa7e0: f000bc54     	adrp	x20, 0x2a35000
 12aa7e4: 9000adb7     	adrp	x23, 0x285e000
 12aa7e8: 9000adb6     	adrp	x22, 0x285e000
 12aa7ec: 39658e88     	ldrb	w8, [x20, #0x963]
 12aa7f0: f941cef7     	ldr	x23, [x23, #0x398]
 12aa7f4: f941cad6     	ldr	x22, [x22, #0x390]
 12aa7f8: aa0003f3     	mov	x19, x0
 12aa7fc: 37000188     	tbnz	w8, #0x0, 0x12aa82c <__start_il2cpp+0x103068>
 12aa800: 9000ada0     	adrp	x0, 0x285e000
 12aa804: f941c000     	ldr	x0, [x0, #0x380]
 12aa808: 97f855b4     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12aa80c: 9000ada0     	adrp	x0, 0x285e000
 12aa810: f941c800     	ldr	x0, [x0, #0x390]
 12aa814: 97f855b1     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12aa818: 9000ada0     	adrp	x0, 0x285e000
 12aa81c: f941cc00     	ldr	x0, [x0, #0x398]
 12aa820: 97f855ae     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12aa824: 52800028     	mov	w8, #0x1                // =1
 12aa828: 39258e88     	strb	w8, [x20, #0x963]
 12aa82c: f94002e0     	ldr	x0, [x23]
 12aa830: 97f85631     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12aa834: f94002c1     	ldr	x1, [x22]
 12aa838: aa0003f4     	mov	x20, x0
 12aa83c: 9418d45e     	bl	0x18df9b4 <__start_il2cpp+0x7381f0>
 12aa840: b400a434     	cbz	x20, 0x12abcc4 <__start_il2cpp+0x104500>
 12aa844: 9000adb5     	adrp	x21, 0x285e000
 12aa848: f941c2b5     	ldr	x21, [x21, #0x380]
 12aa84c: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aa850: f9400a88     	ldr	x8, [x20, #0x10]
 12aa854: f94002a9     	ldr	x9, [x21]
 12aa858: 1100054a     	add	w10, w10, #0x1
 12aa85c: b9001e8a     	str	w10, [x20, #0x1c]
 12aa860: b400a328     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12aa864: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12aa868: b940190b     	ldr	w11, [x8, #0x18]
 12aa86c: 6b0b015f     	cmp	w10, w11
 12aa870: 54000142     	b.hs	0x12aa898 <__start_il2cpp+0x1030d4>
 12aa874: 1100054b     	add	w11, w10, #0x1
 12aa878: 8b0a090a     	add	x10, x8, x10, lsl #2
 12aa87c: 52801f4c     	mov	w12, #0xfa              // =250
 12aa880: b9001a8b     	str	w11, [x20, #0x18]
 12aa884: b900214c     	str	w12, [x10, #0x20]
 12aa888: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aa88c: 1100054a     	add	w10, w10, #0x1
 12aa890: b9001e8a     	str	w10, [x20, #0x1c]
 12aa894: 1400000d     	b	0x12aa8c8 <__start_il2cpp+0x103104>
 12aa898: f9401128     	ldr	x8, [x9, #0x20]
 12aa89c: 52801f41     	mov	w1, #0xfa               // =250
 12aa8a0: aa1403e0     	mov	x0, x20
 12aa8a4: f9406108     	ldr	x8, [x8, #0xc0]
 12aa8a8: f9403902     	ldr	x2, [x8, #0x70]
 12aa8ac: 9418d640     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12aa8b0: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aa8b4: f9400a88     	ldr	x8, [x20, #0x10]
 12aa8b8: f94002a9     	ldr	x9, [x21]
 12aa8bc: 1100054a     	add	w10, w10, #0x1
 12aa8c0: b9001e8a     	str	w10, [x20, #0x1c]
 12aa8c4: b400a008     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12aa8c8: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12aa8cc: b940190b     	ldr	w11, [x8, #0x18]
 12aa8d0: 6b0b015f     	cmp	w10, w11
 12aa8d4: 54000142     	b.hs	0x12aa8fc <__start_il2cpp+0x103138>
 12aa8d8: 1100054b     	add	w11, w10, #0x1
 12aa8dc: 8b0a090a     	add	x10, x8, x10, lsl #2
 12aa8e0: 52807d0c     	mov	w12, #0x3e8             // =1000
 12aa8e4: b9001a8b     	str	w11, [x20, #0x18]
 12aa8e8: b900214c     	str	w12, [x10, #0x20]
 12aa8ec: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aa8f0: 1100054a     	add	w10, w10, #0x1
 12aa8f4: b9001e8a     	str	w10, [x20, #0x1c]
 12aa8f8: 1400000d     	b	0x12aa92c <__start_il2cpp+0x103168>
 12aa8fc: f9401128     	ldr	x8, [x9, #0x20]
 12aa900: 52807d01     	mov	w1, #0x3e8              // =1000
 12aa904: aa1403e0     	mov	x0, x20
 12aa908: f9406108     	ldr	x8, [x8, #0xc0]
 12aa90c: f9403902     	ldr	x2, [x8, #0x70]
 12aa910: 9418d627     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12aa914: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aa918: f9400a88     	ldr	x8, [x20, #0x10]
 12aa91c: f94002a9     	ldr	x9, [x21]
 12aa920: 1100054a     	add	w10, w10, #0x1
 12aa924: b9001e8a     	str	w10, [x20, #0x1c]
 12aa928: b4009ce8     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12aa92c: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12aa930: b940190b     	ldr	w11, [x8, #0x18]
 12aa934: 6b0b015f     	cmp	w10, w11
 12aa938: 54000142     	b.hs	0x12aa960 <__start_il2cpp+0x10319c>
 12aa93c: 1100054b     	add	w11, w10, #0x1
 12aa940: 8b0a090a     	add	x10, x8, x10, lsl #2
 12aa944: 5281388c     	mov	w12, #0x9c4             // =2500
 12aa948: b9001a8b     	str	w11, [x20, #0x18]
 12aa94c: b900214c     	str	w12, [x10, #0x20]
 12aa950: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aa954: 1100054a     	add	w10, w10, #0x1
 12aa958: b9001e8a     	str	w10, [x20, #0x1c]
 12aa95c: 1400000d     	b	0x12aa990 <__start_il2cpp+0x1031cc>
 12aa960: f9401128     	ldr	x8, [x9, #0x20]
 12aa964: 52813881     	mov	w1, #0x9c4              // =2500
 12aa968: aa1403e0     	mov	x0, x20
 12aa96c: f9406108     	ldr	x8, [x8, #0xc0]
 12aa970: f9403902     	ldr	x2, [x8, #0x70]
 12aa974: 9418d60e     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12aa978: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aa97c: f9400a88     	ldr	x8, [x20, #0x10]
 12aa980: f94002a9     	ldr	x9, [x21]
 12aa984: 1100054a     	add	w10, w10, #0x1
 12aa988: b9001e8a     	str	w10, [x20, #0x1c]
 12aa98c: b40099c8     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12aa990: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12aa994: b940190b     	ldr	w11, [x8, #0x18]
 12aa998: 6b0b015f     	cmp	w10, w11
 12aa99c: 54000142     	b.hs	0x12aa9c4 <__start_il2cpp+0x103200>
 12aa9a0: 1100054b     	add	w11, w10, #0x1
 12aa9a4: 8b0a090a     	add	x10, x8, x10, lsl #2
 12aa9a8: 5282710c     	mov	w12, #0x1388            // =5000
 12aa9ac: b9001a8b     	str	w11, [x20, #0x18]
 12aa9b0: b900214c     	str	w12, [x10, #0x20]
 12aa9b4: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aa9b8: 1100054a     	add	w10, w10, #0x1
 12aa9bc: b9001e8a     	str	w10, [x20, #0x1c]
 12aa9c0: 1400000d     	b	0x12aa9f4 <__start_il2cpp+0x103230>
 12aa9c4: f9401128     	ldr	x8, [x9, #0x20]
 12aa9c8: 52827101     	mov	w1, #0x1388             // =5000
 12aa9cc: aa1403e0     	mov	x0, x20
 12aa9d0: f9406108     	ldr	x8, [x8, #0xc0]
 12aa9d4: f9403902     	ldr	x2, [x8, #0x70]
 12aa9d8: 9418d5f5     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12aa9dc: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aa9e0: f9400a88     	ldr	x8, [x20, #0x10]
 12aa9e4: f94002a9     	ldr	x9, [x21]
 12aa9e8: 1100054a     	add	w10, w10, #0x1
 12aa9ec: b9001e8a     	str	w10, [x20, #0x1c]
 12aa9f0: b40096a8     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12aa9f4: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12aa9f8: b940190b     	ldr	w11, [x8, #0x18]
 12aa9fc: 6b0b015f     	cmp	w10, w11
 12aaa00: 54000142     	b.hs	0x12aaa28 <__start_il2cpp+0x103264>
 12aaa04: 1100054b     	add	w11, w10, #0x1
 12aaa08: 8b0a090a     	add	x10, x8, x10, lsl #2
 12aaa0c: 5283a98c     	mov	w12, #0x1d4c            // =7500
 12aaa10: b9001a8b     	str	w11, [x20, #0x18]
 12aaa14: b900214c     	str	w12, [x10, #0x20]
 12aaa18: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aaa1c: 1100054a     	add	w10, w10, #0x1
 12aaa20: b9001e8a     	str	w10, [x20, #0x1c]
 12aaa24: 1400000d     	b	0x12aaa58 <__start_il2cpp+0x103294>
 12aaa28: f9401128     	ldr	x8, [x9, #0x20]
 12aaa2c: 5283a981     	mov	w1, #0x1d4c             // =7500
 12aaa30: aa1403e0     	mov	x0, x20
 12aaa34: f9406108     	ldr	x8, [x8, #0xc0]
 12aaa38: f9403902     	ldr	x2, [x8, #0x70]
 12aaa3c: 9418d5dc     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12aaa40: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aaa44: f9400a88     	ldr	x8, [x20, #0x10]
 12aaa48: f94002a9     	ldr	x9, [x21]
 12aaa4c: 1100054a     	add	w10, w10, #0x1
 12aaa50: b9001e8a     	str	w10, [x20, #0x1c]
 12aaa54: b4009388     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12aaa58: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12aaa5c: b940190b     	ldr	w11, [x8, #0x18]
 12aaa60: 6b0b015f     	cmp	w10, w11
 12aaa64: 540000e2     	b.hs	0x12aaa80 <__start_il2cpp+0x1032bc>
 12aaa68: 11000549     	add	w9, w10, #0x1
 12aaa6c: 8b0a0908     	add	x8, x8, x10, lsl #2
 12aaa70: 528c350a     	mov	w10, #0x61a8            // =25000
 12aaa74: b9001a89     	str	w9, [x20, #0x18]
 12aaa78: b900210a     	str	w10, [x8, #0x20]
 12aaa7c: 14000007     	b	0x12aaa98 <__start_il2cpp+0x1032d4>
 12aaa80: f9401128     	ldr	x8, [x9, #0x20]
 12aaa84: 528c3501     	mov	w1, #0x61a8             // =25000
 12aaa88: aa1403e0     	mov	x0, x20
 12aaa8c: f9406108     	ldr	x8, [x8, #0xc0]
 12aaa90: f9403902     	ldr	x2, [x8, #0x70]
 12aaa94: 9418d5c6     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12aaa98: f9001674     	str	x20, [x19, #0x28]
 12aaa9c: f94002e0     	ldr	x0, [x23]
 12aaaa0: 97f85595     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12aaaa4: f94002c1     	ldr	x1, [x22]
 12aaaa8: aa0003f4     	mov	x20, x0
 12aaaac: 9418d3c2     	bl	0x18df9b4 <__start_il2cpp+0x7381f0>
 12aaab0: b40090b4     	cbz	x20, 0x12abcc4 <__start_il2cpp+0x104500>
 12aaab4: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aaab8: f9400a88     	ldr	x8, [x20, #0x10]
 12aaabc: f94002a9     	ldr	x9, [x21]
 12aaac0: 1100054a     	add	w10, w10, #0x1
 12aaac4: b9001e8a     	str	w10, [x20, #0x1c]
 12aaac8: b4008fe8     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12aaacc: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12aaad0: b940190b     	ldr	w11, [x8, #0x18]
 12aaad4: 6b0b015f     	cmp	w10, w11
 12aaad8: 54000142     	b.hs	0x12aab00 <__start_il2cpp+0x10333c>
 12aaadc: 1100054b     	add	w11, w10, #0x1
 12aaae0: 8b0a090a     	add	x10, x8, x10, lsl #2
 12aaae4: 52801f4c     	mov	w12, #0xfa              // =250
 12aaae8: b9001a8b     	str	w11, [x20, #0x18]
 12aaaec: b900214c     	str	w12, [x10, #0x20]
 12aaaf0: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aaaf4: 1100054a     	add	w10, w10, #0x1
 12aaaf8: b9001e8a     	str	w10, [x20, #0x1c]
 12aaafc: 1400000d     	b	0x12aab30 <__start_il2cpp+0x10336c>
 12aab00: f9401128     	ldr	x8, [x9, #0x20]
 12aab04: 52801f41     	mov	w1, #0xfa               // =250
 12aab08: aa1403e0     	mov	x0, x20
 12aab0c: f9406108     	ldr	x8, [x8, #0xc0]
 12aab10: f9403902     	ldr	x2, [x8, #0x70]
 12aab14: 9418d5a6     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12aab18: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aab1c: f9400a88     	ldr	x8, [x20, #0x10]
 12aab20: f94002a9     	ldr	x9, [x21]
 12aab24: 1100054a     	add	w10, w10, #0x1
 12aab28: b9001e8a     	str	w10, [x20, #0x1c]
 12aab2c: b4008cc8     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12aab30: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12aab34: b940190b     	ldr	w11, [x8, #0x18]
 12aab38: 6b0b015f     	cmp	w10, w11
 12aab3c: 54000142     	b.hs	0x12aab64 <__start_il2cpp+0x1033a0>
 12aab40: 1100054b     	add	w11, w10, #0x1
 12aab44: 8b0a090a     	add	x10, x8, x10, lsl #2
 12aab48: 52807d0c     	mov	w12, #0x3e8             // =1000
 12aab4c: b9001a8b     	str	w11, [x20, #0x18]
 12aab50: b900214c     	str	w12, [x10, #0x20]
 12aab54: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aab58: 1100054a     	add	w10, w10, #0x1
 12aab5c: b9001e8a     	str	w10, [x20, #0x1c]
 12aab60: 1400000d     	b	0x12aab94 <__start_il2cpp+0x1033d0>
 12aab64: f9401128     	ldr	x8, [x9, #0x20]
 12aab68: 52807d01     	mov	w1, #0x3e8              // =1000
 12aab6c: aa1403e0     	mov	x0, x20
 12aab70: f9406108     	ldr	x8, [x8, #0xc0]
 12aab74: f9403902     	ldr	x2, [x8, #0x70]
 12aab78: 9418d58d     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12aab7c: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aab80: f9400a88     	ldr	x8, [x20, #0x10]
 12aab84: f94002a9     	ldr	x9, [x21]
 12aab88: 1100054a     	add	w10, w10, #0x1
 12aab8c: b9001e8a     	str	w10, [x20, #0x1c]
 12aab90: b40089a8     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12aab94: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12aab98: b940190b     	ldr	w11, [x8, #0x18]
 12aab9c: 6b0b015f     	cmp	w10, w11
 12aaba0: 54000142     	b.hs	0x12aabc8 <__start_il2cpp+0x103404>
 12aaba4: 1100054b     	add	w11, w10, #0x1
 12aaba8: 8b0a090a     	add	x10, x8, x10, lsl #2
 12aabac: 5281388c     	mov	w12, #0x9c4             // =2500
 12aabb0: b9001a8b     	str	w11, [x20, #0x18]
 12aabb4: b900214c     	str	w12, [x10, #0x20]
 12aabb8: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aabbc: 1100054a     	add	w10, w10, #0x1
 12aabc0: b9001e8a     	str	w10, [x20, #0x1c]
 12aabc4: 1400000d     	b	0x12aabf8 <__start_il2cpp+0x103434>
 12aabc8: f9401128     	ldr	x8, [x9, #0x20]
 12aabcc: 52813881     	mov	w1, #0x9c4              // =2500
 12aabd0: aa1403e0     	mov	x0, x20
 12aabd4: f9406108     	ldr	x8, [x8, #0xc0]
 12aabd8: f9403902     	ldr	x2, [x8, #0x70]
 12aabdc: 9418d574     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12aabe0: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aabe4: f9400a88     	ldr	x8, [x20, #0x10]
 12aabe8: f94002a9     	ldr	x9, [x21]
 12aabec: 1100054a     	add	w10, w10, #0x1
 12aabf0: b9001e8a     	str	w10, [x20, #0x1c]
 12aabf4: b4008688     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12aabf8: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12aabfc: b940190b     	ldr	w11, [x8, #0x18]
 12aac00: 6b0b015f     	cmp	w10, w11
 12aac04: 54000142     	b.hs	0x12aac2c <__start_il2cpp+0x103468>
 12aac08: 1100054b     	add	w11, w10, #0x1
 12aac0c: 8b0a090a     	add	x10, x8, x10, lsl #2
 12aac10: 5282710c     	mov	w12, #0x1388            // =5000
 12aac14: b9001a8b     	str	w11, [x20, #0x18]
 12aac18: b900214c     	str	w12, [x10, #0x20]
 12aac1c: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aac20: 1100054a     	add	w10, w10, #0x1
 12aac24: b9001e8a     	str	w10, [x20, #0x1c]
 12aac28: 1400000d     	b	0x12aac5c <__start_il2cpp+0x103498>
 12aac2c: f9401128     	ldr	x8, [x9, #0x20]
 12aac30: 52827101     	mov	w1, #0x1388             // =5000
 12aac34: aa1403e0     	mov	x0, x20
 12aac38: f9406108     	ldr	x8, [x8, #0xc0]
 12aac3c: f9403902     	ldr	x2, [x8, #0x70]
 12aac40: 9418d55b     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12aac44: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aac48: f9400a88     	ldr	x8, [x20, #0x10]
 12aac4c: f94002a9     	ldr	x9, [x21]
 12aac50: 1100054a     	add	w10, w10, #0x1
 12aac54: b9001e8a     	str	w10, [x20, #0x1c]
 12aac58: b4008368     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12aac5c: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12aac60: b940190b     	ldr	w11, [x8, #0x18]
 12aac64: 6b0b015f     	cmp	w10, w11
 12aac68: 54000142     	b.hs	0x12aac90 <__start_il2cpp+0x1034cc>
 12aac6c: 1100054b     	add	w11, w10, #0x1
 12aac70: 8b0a090a     	add	x10, x8, x10, lsl #2
 12aac74: 5283a98c     	mov	w12, #0x1d4c            // =7500
 12aac78: b9001a8b     	str	w11, [x20, #0x18]
 12aac7c: b900214c     	str	w12, [x10, #0x20]
 12aac80: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aac84: 1100054a     	add	w10, w10, #0x1
 12aac88: b9001e8a     	str	w10, [x20, #0x1c]
 12aac8c: 1400000d     	b	0x12aacc0 <__start_il2cpp+0x1034fc>
 12aac90: f9401128     	ldr	x8, [x9, #0x20]
 12aac94: 5283a981     	mov	w1, #0x1d4c             // =7500
 12aac98: aa1403e0     	mov	x0, x20
 12aac9c: f9406108     	ldr	x8, [x8, #0xc0]
 12aaca0: f9403902     	ldr	x2, [x8, #0x70]
 12aaca4: 9418d542     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12aaca8: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aacac: f9400a88     	ldr	x8, [x20, #0x10]
 12aacb0: f94002a9     	ldr	x9, [x21]
 12aacb4: 1100054a     	add	w10, w10, #0x1
 12aacb8: b9001e8a     	str	w10, [x20, #0x1c]
 12aacbc: b4008048     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12aacc0: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12aacc4: b940190b     	ldr	w11, [x8, #0x18]
 12aacc8: 6b0b015f     	cmp	w10, w11
 12aaccc: 540000e2     	b.hs	0x12aace8 <__start_il2cpp+0x103524>
 12aacd0: 11000549     	add	w9, w10, #0x1
 12aacd4: 8b0a0908     	add	x8, x8, x10, lsl #2
 12aacd8: 528c350a     	mov	w10, #0x61a8            // =25000
 12aacdc: b9001a89     	str	w9, [x20, #0x18]
 12aace0: b900210a     	str	w10, [x8, #0x20]
 12aace4: 14000007     	b	0x12aad00 <__start_il2cpp+0x10353c>
 12aace8: f9401128     	ldr	x8, [x9, #0x20]
 12aacec: 528c3501     	mov	w1, #0x61a8             // =25000
 12aacf0: aa1403e0     	mov	x0, x20
 12aacf4: f9406108     	ldr	x8, [x8, #0xc0]
 12aacf8: f9403902     	ldr	x2, [x8, #0x70]
 12aacfc: 9418d52c     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12aad00: f9001a74     	str	x20, [x19, #0x30]
 12aad04: f94002e0     	ldr	x0, [x23]
 12aad08: 97f854fb     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12aad0c: f94002c1     	ldr	x1, [x22]
 12aad10: aa0003f4     	mov	x20, x0
 12aad14: 9418d328     	bl	0x18df9b4 <__start_il2cpp+0x7381f0>
 12aad18: b4007d74     	cbz	x20, 0x12abcc4 <__start_il2cpp+0x104500>
 12aad1c: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aad20: f9400a88     	ldr	x8, [x20, #0x10]
 12aad24: f94002a9     	ldr	x9, [x21]
 12aad28: 1100054a     	add	w10, w10, #0x1
 12aad2c: b9001e8a     	str	w10, [x20, #0x1c]
 12aad30: b4007ca8     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12aad34: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12aad38: b940190b     	ldr	w11, [x8, #0x18]
 12aad3c: 6b0b015f     	cmp	w10, w11
 12aad40: 54000142     	b.hs	0x12aad68 <__start_il2cpp+0x1035a4>
 12aad44: 1100054b     	add	w11, w10, #0x1
 12aad48: 8b0a090a     	add	x10, x8, x10, lsl #2
 12aad4c: 52801f4c     	mov	w12, #0xfa              // =250
 12aad50: b9001a8b     	str	w11, [x20, #0x18]
 12aad54: b900214c     	str	w12, [x10, #0x20]
 12aad58: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aad5c: 1100054a     	add	w10, w10, #0x1
 12aad60: b9001e8a     	str	w10, [x20, #0x1c]
 12aad64: 1400000d     	b	0x12aad98 <__start_il2cpp+0x1035d4>
 12aad68: f9401128     	ldr	x8, [x9, #0x20]
 12aad6c: 52801f41     	mov	w1, #0xfa               // =250
 12aad70: aa1403e0     	mov	x0, x20
 12aad74: f9406108     	ldr	x8, [x8, #0xc0]
 12aad78: f9403902     	ldr	x2, [x8, #0x70]
 12aad7c: 9418d50c     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12aad80: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aad84: f9400a88     	ldr	x8, [x20, #0x10]
 12aad88: f94002a9     	ldr	x9, [x21]
 12aad8c: 1100054a     	add	w10, w10, #0x1
 12aad90: b9001e8a     	str	w10, [x20, #0x1c]
 12aad94: b4007988     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12aad98: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12aad9c: b940190b     	ldr	w11, [x8, #0x18]
 12aada0: 6b0b015f     	cmp	w10, w11
 12aada4: 54000142     	b.hs	0x12aadcc <__start_il2cpp+0x103608>
 12aada8: 1100054b     	add	w11, w10, #0x1
 12aadac: 8b0a090a     	add	x10, x8, x10, lsl #2
 12aadb0: 52807d0c     	mov	w12, #0x3e8             // =1000
 12aadb4: b9001a8b     	str	w11, [x20, #0x18]
 12aadb8: b900214c     	str	w12, [x10, #0x20]
 12aadbc: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aadc0: 1100054a     	add	w10, w10, #0x1
 12aadc4: b9001e8a     	str	w10, [x20, #0x1c]
 12aadc8: 1400000d     	b	0x12aadfc <__start_il2cpp+0x103638>
 12aadcc: f9401128     	ldr	x8, [x9, #0x20]
 12aadd0: 52807d01     	mov	w1, #0x3e8              // =1000
 12aadd4: aa1403e0     	mov	x0, x20
 12aadd8: f9406108     	ldr	x8, [x8, #0xc0]
 12aaddc: f9403902     	ldr	x2, [x8, #0x70]
 12aade0: 9418d4f3     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12aade4: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aade8: f9400a88     	ldr	x8, [x20, #0x10]
 12aadec: f94002a9     	ldr	x9, [x21]
 12aadf0: 1100054a     	add	w10, w10, #0x1
 12aadf4: b9001e8a     	str	w10, [x20, #0x1c]
 12aadf8: b4007668     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12aadfc: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12aae00: b940190b     	ldr	w11, [x8, #0x18]
 12aae04: 6b0b015f     	cmp	w10, w11
 12aae08: 54000142     	b.hs	0x12aae30 <__start_il2cpp+0x10366c>
 12aae0c: 1100054b     	add	w11, w10, #0x1
 12aae10: 8b0a090a     	add	x10, x8, x10, lsl #2
 12aae14: 5281388c     	mov	w12, #0x9c4             // =2500
 12aae18: b9001a8b     	str	w11, [x20, #0x18]
 12aae1c: b900214c     	str	w12, [x10, #0x20]
 12aae20: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aae24: 1100054a     	add	w10, w10, #0x1
 12aae28: b9001e8a     	str	w10, [x20, #0x1c]
 12aae2c: 1400000d     	b	0x12aae60 <__start_il2cpp+0x10369c>
 12aae30: f9401128     	ldr	x8, [x9, #0x20]
 12aae34: 52813881     	mov	w1, #0x9c4              // =2500
 12aae38: aa1403e0     	mov	x0, x20
 12aae3c: f9406108     	ldr	x8, [x8, #0xc0]
 12aae40: f9403902     	ldr	x2, [x8, #0x70]
 12aae44: 9418d4da     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12aae48: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aae4c: f9400a88     	ldr	x8, [x20, #0x10]
 12aae50: f94002a9     	ldr	x9, [x21]
 12aae54: 1100054a     	add	w10, w10, #0x1
 12aae58: b9001e8a     	str	w10, [x20, #0x1c]
 12aae5c: b4007348     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12aae60: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12aae64: b940190b     	ldr	w11, [x8, #0x18]
 12aae68: 6b0b015f     	cmp	w10, w11
 12aae6c: 54000142     	b.hs	0x12aae94 <__start_il2cpp+0x1036d0>
 12aae70: 1100054b     	add	w11, w10, #0x1
 12aae74: 8b0a090a     	add	x10, x8, x10, lsl #2
 12aae78: 5282710c     	mov	w12, #0x1388            // =5000
 12aae7c: b9001a8b     	str	w11, [x20, #0x18]
 12aae80: b900214c     	str	w12, [x10, #0x20]
 12aae84: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aae88: 1100054a     	add	w10, w10, #0x1
 12aae8c: b9001e8a     	str	w10, [x20, #0x1c]
 12aae90: 1400000d     	b	0x12aaec4 <__start_il2cpp+0x103700>
 12aae94: f9401128     	ldr	x8, [x9, #0x20]
 12aae98: 52827101     	mov	w1, #0x1388             // =5000
 12aae9c: aa1403e0     	mov	x0, x20
 12aaea0: f9406108     	ldr	x8, [x8, #0xc0]
 12aaea4: f9403902     	ldr	x2, [x8, #0x70]
 12aaea8: 9418d4c1     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12aaeac: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aaeb0: f9400a88     	ldr	x8, [x20, #0x10]
 12aaeb4: f94002a9     	ldr	x9, [x21]
 12aaeb8: 1100054a     	add	w10, w10, #0x1
 12aaebc: b9001e8a     	str	w10, [x20, #0x1c]
 12aaec0: b4007028     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12aaec4: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12aaec8: b940190b     	ldr	w11, [x8, #0x18]
 12aaecc: 6b0b015f     	cmp	w10, w11
 12aaed0: 54000142     	b.hs	0x12aaef8 <__start_il2cpp+0x103734>
 12aaed4: 1100054b     	add	w11, w10, #0x1
 12aaed8: 8b0a090a     	add	x10, x8, x10, lsl #2
 12aaedc: 5283a98c     	mov	w12, #0x1d4c            // =7500
 12aaee0: b9001a8b     	str	w11, [x20, #0x18]
 12aaee4: b900214c     	str	w12, [x10, #0x20]
 12aaee8: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aaeec: 1100054a     	add	w10, w10, #0x1
 12aaef0: b9001e8a     	str	w10, [x20, #0x1c]
 12aaef4: 1400000d     	b	0x12aaf28 <__start_il2cpp+0x103764>
 12aaef8: f9401128     	ldr	x8, [x9, #0x20]
 12aaefc: 5283a981     	mov	w1, #0x1d4c             // =7500
 12aaf00: aa1403e0     	mov	x0, x20
 12aaf04: f9406108     	ldr	x8, [x8, #0xc0]
 12aaf08: f9403902     	ldr	x2, [x8, #0x70]
 12aaf0c: 9418d4a8     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12aaf10: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aaf14: f9400a88     	ldr	x8, [x20, #0x10]
 12aaf18: f94002a9     	ldr	x9, [x21]
 12aaf1c: 1100054a     	add	w10, w10, #0x1
 12aaf20: b9001e8a     	str	w10, [x20, #0x1c]
 12aaf24: b4006d08     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12aaf28: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12aaf2c: b940190b     	ldr	w11, [x8, #0x18]
 12aaf30: 6b0b015f     	cmp	w10, w11
 12aaf34: 540000e2     	b.hs	0x12aaf50 <__start_il2cpp+0x10378c>
 12aaf38: 11000549     	add	w9, w10, #0x1
 12aaf3c: 8b0a0908     	add	x8, x8, x10, lsl #2
 12aaf40: 528c350a     	mov	w10, #0x61a8            // =25000
 12aaf44: b9001a89     	str	w9, [x20, #0x18]
 12aaf48: b900210a     	str	w10, [x8, #0x20]
 12aaf4c: 14000007     	b	0x12aaf68 <__start_il2cpp+0x1037a4>
 12aaf50: f9401128     	ldr	x8, [x9, #0x20]
 12aaf54: 528c3501     	mov	w1, #0x61a8             // =25000
 12aaf58: aa1403e0     	mov	x0, x20
 12aaf5c: f9406108     	ldr	x8, [x8, #0xc0]
 12aaf60: f9403902     	ldr	x2, [x8, #0x70]
 12aaf64: 9418d492     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12aaf68: f9001e74     	str	x20, [x19, #0x38]
 12aaf6c: f94002e0     	ldr	x0, [x23]
 12aaf70: 97f85461     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12aaf74: f94002c1     	ldr	x1, [x22]
 12aaf78: aa0003f4     	mov	x20, x0
 12aaf7c: 9418d28e     	bl	0x18df9b4 <__start_il2cpp+0x7381f0>
 12aaf80: b4006a34     	cbz	x20, 0x12abcc4 <__start_il2cpp+0x104500>
 12aaf84: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aaf88: f9400a88     	ldr	x8, [x20, #0x10]
 12aaf8c: f94002a9     	ldr	x9, [x21]
 12aaf90: 1100054a     	add	w10, w10, #0x1
 12aaf94: b9001e8a     	str	w10, [x20, #0x1c]
 12aaf98: b4006968     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12aaf9c: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12aafa0: b940190b     	ldr	w11, [x8, #0x18]
 12aafa4: 6b0b015f     	cmp	w10, w11
 12aafa8: 54000142     	b.hs	0x12aafd0 <__start_il2cpp+0x10380c>
 12aafac: 1100054b     	add	w11, w10, #0x1
 12aafb0: 8b0a090a     	add	x10, x8, x10, lsl #2
 12aafb4: 52801f4c     	mov	w12, #0xfa              // =250
 12aafb8: b9001a8b     	str	w11, [x20, #0x18]
 12aafbc: b900214c     	str	w12, [x10, #0x20]
 12aafc0: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aafc4: 1100054a     	add	w10, w10, #0x1
 12aafc8: b9001e8a     	str	w10, [x20, #0x1c]
 12aafcc: 1400000d     	b	0x12ab000 <__start_il2cpp+0x10383c>
 12aafd0: f9401128     	ldr	x8, [x9, #0x20]
 12aafd4: 52801f41     	mov	w1, #0xfa               // =250
 12aafd8: aa1403e0     	mov	x0, x20
 12aafdc: f9406108     	ldr	x8, [x8, #0xc0]
 12aafe0: f9403902     	ldr	x2, [x8, #0x70]
 12aafe4: 9418d472     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12aafe8: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aafec: f9400a88     	ldr	x8, [x20, #0x10]
 12aaff0: f94002a9     	ldr	x9, [x21]
 12aaff4: 1100054a     	add	w10, w10, #0x1
 12aaff8: b9001e8a     	str	w10, [x20, #0x1c]
 12aaffc: b4006648     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12ab000: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12ab004: b940190b     	ldr	w11, [x8, #0x18]
 12ab008: 6b0b015f     	cmp	w10, w11
 12ab00c: 54000142     	b.hs	0x12ab034 <__start_il2cpp+0x103870>
 12ab010: 1100054b     	add	w11, w10, #0x1
 12ab014: 8b0a090a     	add	x10, x8, x10, lsl #2
 12ab018: 52807d0c     	mov	w12, #0x3e8             // =1000
 12ab01c: b9001a8b     	str	w11, [x20, #0x18]
 12ab020: b900214c     	str	w12, [x10, #0x20]
 12ab024: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab028: 1100054a     	add	w10, w10, #0x1
 12ab02c: b9001e8a     	str	w10, [x20, #0x1c]
 12ab030: 1400000d     	b	0x12ab064 <__start_il2cpp+0x1038a0>
 12ab034: f9401128     	ldr	x8, [x9, #0x20]
 12ab038: 52807d01     	mov	w1, #0x3e8              // =1000
 12ab03c: aa1403e0     	mov	x0, x20
 12ab040: f9406108     	ldr	x8, [x8, #0xc0]
 12ab044: f9403902     	ldr	x2, [x8, #0x70]
 12ab048: 9418d459     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12ab04c: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab050: f9400a88     	ldr	x8, [x20, #0x10]
 12ab054: f94002a9     	ldr	x9, [x21]
 12ab058: 1100054a     	add	w10, w10, #0x1
 12ab05c: b9001e8a     	str	w10, [x20, #0x1c]
 12ab060: b4006328     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12ab064: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12ab068: b940190b     	ldr	w11, [x8, #0x18]
 12ab06c: 6b0b015f     	cmp	w10, w11
 12ab070: 54000142     	b.hs	0x12ab098 <__start_il2cpp+0x1038d4>
 12ab074: 1100054b     	add	w11, w10, #0x1
 12ab078: 8b0a090a     	add	x10, x8, x10, lsl #2
 12ab07c: 5281388c     	mov	w12, #0x9c4             // =2500
 12ab080: b9001a8b     	str	w11, [x20, #0x18]
 12ab084: b900214c     	str	w12, [x10, #0x20]
 12ab088: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab08c: 1100054a     	add	w10, w10, #0x1
 12ab090: b9001e8a     	str	w10, [x20, #0x1c]
 12ab094: 1400000d     	b	0x12ab0c8 <__start_il2cpp+0x103904>
 12ab098: f9401128     	ldr	x8, [x9, #0x20]
 12ab09c: 52813881     	mov	w1, #0x9c4              // =2500
 12ab0a0: aa1403e0     	mov	x0, x20
 12ab0a4: f9406108     	ldr	x8, [x8, #0xc0]
 12ab0a8: f9403902     	ldr	x2, [x8, #0x70]
 12ab0ac: 9418d440     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12ab0b0: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab0b4: f9400a88     	ldr	x8, [x20, #0x10]
 12ab0b8: f94002a9     	ldr	x9, [x21]
 12ab0bc: 1100054a     	add	w10, w10, #0x1
 12ab0c0: b9001e8a     	str	w10, [x20, #0x1c]
 12ab0c4: b4006008     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12ab0c8: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12ab0cc: b940190b     	ldr	w11, [x8, #0x18]
 12ab0d0: 6b0b015f     	cmp	w10, w11
 12ab0d4: 54000142     	b.hs	0x12ab0fc <__start_il2cpp+0x103938>
 12ab0d8: 1100054b     	add	w11, w10, #0x1
 12ab0dc: 8b0a090a     	add	x10, x8, x10, lsl #2
 12ab0e0: 5282710c     	mov	w12, #0x1388            // =5000
 12ab0e4: b9001a8b     	str	w11, [x20, #0x18]
 12ab0e8: b900214c     	str	w12, [x10, #0x20]
 12ab0ec: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab0f0: 1100054a     	add	w10, w10, #0x1
 12ab0f4: b9001e8a     	str	w10, [x20, #0x1c]
 12ab0f8: 1400000d     	b	0x12ab12c <__start_il2cpp+0x103968>
 12ab0fc: f9401128     	ldr	x8, [x9, #0x20]
 12ab100: 52827101     	mov	w1, #0x1388             // =5000
 12ab104: aa1403e0     	mov	x0, x20
 12ab108: f9406108     	ldr	x8, [x8, #0xc0]
 12ab10c: f9403902     	ldr	x2, [x8, #0x70]
 12ab110: 9418d427     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12ab114: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab118: f9400a88     	ldr	x8, [x20, #0x10]
 12ab11c: f94002a9     	ldr	x9, [x21]
 12ab120: 1100054a     	add	w10, w10, #0x1
 12ab124: b9001e8a     	str	w10, [x20, #0x1c]
 12ab128: b4005ce8     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12ab12c: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12ab130: b940190b     	ldr	w11, [x8, #0x18]
 12ab134: 6b0b015f     	cmp	w10, w11
 12ab138: 54000142     	b.hs	0x12ab160 <__start_il2cpp+0x10399c>
 12ab13c: 1100054b     	add	w11, w10, #0x1
 12ab140: 8b0a090a     	add	x10, x8, x10, lsl #2
 12ab144: 5283a98c     	mov	w12, #0x1d4c            // =7500
 12ab148: b9001a8b     	str	w11, [x20, #0x18]
 12ab14c: b900214c     	str	w12, [x10, #0x20]
 12ab150: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab154: 1100054a     	add	w10, w10, #0x1
 12ab158: b9001e8a     	str	w10, [x20, #0x1c]
 12ab15c: 1400000d     	b	0x12ab190 <__start_il2cpp+0x1039cc>
 12ab160: f9401128     	ldr	x8, [x9, #0x20]
 12ab164: 5283a981     	mov	w1, #0x1d4c             // =7500
 12ab168: aa1403e0     	mov	x0, x20
 12ab16c: f9406108     	ldr	x8, [x8, #0xc0]
 12ab170: f9403902     	ldr	x2, [x8, #0x70]
 12ab174: 9418d40e     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12ab178: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab17c: f9400a88     	ldr	x8, [x20, #0x10]
 12ab180: f94002a9     	ldr	x9, [x21]
 12ab184: 1100054a     	add	w10, w10, #0x1
 12ab188: b9001e8a     	str	w10, [x20, #0x1c]
 12ab18c: b40059c8     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12ab190: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12ab194: b940190b     	ldr	w11, [x8, #0x18]
 12ab198: 6b0b015f     	cmp	w10, w11
 12ab19c: 540000e2     	b.hs	0x12ab1b8 <__start_il2cpp+0x1039f4>
 12ab1a0: 11000549     	add	w9, w10, #0x1
 12ab1a4: 8b0a0908     	add	x8, x8, x10, lsl #2
 12ab1a8: 528c350a     	mov	w10, #0x61a8            // =25000
 12ab1ac: b9001a89     	str	w9, [x20, #0x18]
 12ab1b0: b900210a     	str	w10, [x8, #0x20]
 12ab1b4: 14000007     	b	0x12ab1d0 <__start_il2cpp+0x103a0c>
 12ab1b8: f9401128     	ldr	x8, [x9, #0x20]
 12ab1bc: 528c3501     	mov	w1, #0x61a8             // =25000
 12ab1c0: aa1403e0     	mov	x0, x20
 12ab1c4: f9406108     	ldr	x8, [x8, #0xc0]
 12ab1c8: f9403902     	ldr	x2, [x8, #0x70]
 12ab1cc: 9418d3f8     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12ab1d0: f9002274     	str	x20, [x19, #0x40]
 12ab1d4: f94002e0     	ldr	x0, [x23]
 12ab1d8: 97f853c7     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12ab1dc: f94002c1     	ldr	x1, [x22]
 12ab1e0: aa0003f4     	mov	x20, x0
 12ab1e4: 9418d1f4     	bl	0x18df9b4 <__start_il2cpp+0x7381f0>
 12ab1e8: b40056f4     	cbz	x20, 0x12abcc4 <__start_il2cpp+0x104500>
 12ab1ec: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab1f0: f9400a88     	ldr	x8, [x20, #0x10]
 12ab1f4: f94002a9     	ldr	x9, [x21]
 12ab1f8: 1100054a     	add	w10, w10, #0x1
 12ab1fc: b9001e8a     	str	w10, [x20, #0x1c]
 12ab200: b4005628     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12ab204: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12ab208: b940190b     	ldr	w11, [x8, #0x18]
 12ab20c: 6b0b015f     	cmp	w10, w11
 12ab210: 54000142     	b.hs	0x12ab238 <__start_il2cpp+0x103a74>
 12ab214: 1100054b     	add	w11, w10, #0x1
 12ab218: 8b0a090a     	add	x10, x8, x10, lsl #2
 12ab21c: 52801f4c     	mov	w12, #0xfa              // =250
 12ab220: b9001a8b     	str	w11, [x20, #0x18]
 12ab224: b900214c     	str	w12, [x10, #0x20]
 12ab228: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab22c: 1100054a     	add	w10, w10, #0x1
 12ab230: b9001e8a     	str	w10, [x20, #0x1c]
 12ab234: 1400000d     	b	0x12ab268 <__start_il2cpp+0x103aa4>
 12ab238: f9401128     	ldr	x8, [x9, #0x20]
 12ab23c: 52801f41     	mov	w1, #0xfa               // =250
 12ab240: aa1403e0     	mov	x0, x20
 12ab244: f9406108     	ldr	x8, [x8, #0xc0]
 12ab248: f9403902     	ldr	x2, [x8, #0x70]
 12ab24c: 9418d3d8     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12ab250: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab254: f9400a88     	ldr	x8, [x20, #0x10]
 12ab258: f94002a9     	ldr	x9, [x21]
 12ab25c: 1100054a     	add	w10, w10, #0x1
 12ab260: b9001e8a     	str	w10, [x20, #0x1c]
 12ab264: b4005308     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12ab268: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12ab26c: b940190b     	ldr	w11, [x8, #0x18]
 12ab270: 6b0b015f     	cmp	w10, w11
 12ab274: 54000142     	b.hs	0x12ab29c <__start_il2cpp+0x103ad8>
 12ab278: 1100054b     	add	w11, w10, #0x1
 12ab27c: 8b0a090a     	add	x10, x8, x10, lsl #2
 12ab280: 52807d0c     	mov	w12, #0x3e8             // =1000
 12ab284: b9001a8b     	str	w11, [x20, #0x18]
 12ab288: b900214c     	str	w12, [x10, #0x20]
 12ab28c: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab290: 1100054a     	add	w10, w10, #0x1
 12ab294: b9001e8a     	str	w10, [x20, #0x1c]
 12ab298: 1400000d     	b	0x12ab2cc <__start_il2cpp+0x103b08>
 12ab29c: f9401128     	ldr	x8, [x9, #0x20]
 12ab2a0: 52807d01     	mov	w1, #0x3e8              // =1000
 12ab2a4: aa1403e0     	mov	x0, x20
 12ab2a8: f9406108     	ldr	x8, [x8, #0xc0]
 12ab2ac: f9403902     	ldr	x2, [x8, #0x70]
 12ab2b0: 9418d3bf     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12ab2b4: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab2b8: f9400a88     	ldr	x8, [x20, #0x10]
 12ab2bc: f94002a9     	ldr	x9, [x21]
 12ab2c0: 1100054a     	add	w10, w10, #0x1
 12ab2c4: b9001e8a     	str	w10, [x20, #0x1c]
 12ab2c8: b4004fe8     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12ab2cc: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12ab2d0: b940190b     	ldr	w11, [x8, #0x18]
 12ab2d4: 6b0b015f     	cmp	w10, w11
 12ab2d8: 54000142     	b.hs	0x12ab300 <__start_il2cpp+0x103b3c>
 12ab2dc: 1100054b     	add	w11, w10, #0x1
 12ab2e0: 8b0a090a     	add	x10, x8, x10, lsl #2
 12ab2e4: 5281388c     	mov	w12, #0x9c4             // =2500
 12ab2e8: b9001a8b     	str	w11, [x20, #0x18]
 12ab2ec: b900214c     	str	w12, [x10, #0x20]
 12ab2f0: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab2f4: 1100054a     	add	w10, w10, #0x1
 12ab2f8: b9001e8a     	str	w10, [x20, #0x1c]
 12ab2fc: 1400000d     	b	0x12ab330 <__start_il2cpp+0x103b6c>
 12ab300: f9401128     	ldr	x8, [x9, #0x20]
 12ab304: 52813881     	mov	w1, #0x9c4              // =2500
 12ab308: aa1403e0     	mov	x0, x20
 12ab30c: f9406108     	ldr	x8, [x8, #0xc0]
 12ab310: f9403902     	ldr	x2, [x8, #0x70]
 12ab314: 9418d3a6     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12ab318: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab31c: f9400a88     	ldr	x8, [x20, #0x10]
 12ab320: f94002a9     	ldr	x9, [x21]
 12ab324: 1100054a     	add	w10, w10, #0x1
 12ab328: b9001e8a     	str	w10, [x20, #0x1c]
 12ab32c: b4004cc8     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12ab330: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12ab334: b940190b     	ldr	w11, [x8, #0x18]
 12ab338: 6b0b015f     	cmp	w10, w11
 12ab33c: 54000142     	b.hs	0x12ab364 <__start_il2cpp+0x103ba0>
 12ab340: 1100054b     	add	w11, w10, #0x1
 12ab344: 8b0a090a     	add	x10, x8, x10, lsl #2
 12ab348: 5282710c     	mov	w12, #0x1388            // =5000
 12ab34c: b9001a8b     	str	w11, [x20, #0x18]
 12ab350: b900214c     	str	w12, [x10, #0x20]
 12ab354: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab358: 1100054a     	add	w10, w10, #0x1
 12ab35c: b9001e8a     	str	w10, [x20, #0x1c]
 12ab360: 1400000d     	b	0x12ab394 <__start_il2cpp+0x103bd0>
 12ab364: f9401128     	ldr	x8, [x9, #0x20]
 12ab368: 52827101     	mov	w1, #0x1388             // =5000
 12ab36c: aa1403e0     	mov	x0, x20
 12ab370: f9406108     	ldr	x8, [x8, #0xc0]
 12ab374: f9403902     	ldr	x2, [x8, #0x70]
 12ab378: 9418d38d     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12ab37c: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab380: f9400a88     	ldr	x8, [x20, #0x10]
 12ab384: f94002a9     	ldr	x9, [x21]
 12ab388: 1100054a     	add	w10, w10, #0x1
 12ab38c: b9001e8a     	str	w10, [x20, #0x1c]
 12ab390: b40049a8     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12ab394: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12ab398: b940190b     	ldr	w11, [x8, #0x18]
 12ab39c: 6b0b015f     	cmp	w10, w11
 12ab3a0: 54000142     	b.hs	0x12ab3c8 <__start_il2cpp+0x103c04>
 12ab3a4: 1100054b     	add	w11, w10, #0x1
 12ab3a8: 8b0a090a     	add	x10, x8, x10, lsl #2
 12ab3ac: 5283a98c     	mov	w12, #0x1d4c            // =7500
 12ab3b0: b9001a8b     	str	w11, [x20, #0x18]
 12ab3b4: b900214c     	str	w12, [x10, #0x20]
 12ab3b8: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab3bc: 1100054a     	add	w10, w10, #0x1
 12ab3c0: b9001e8a     	str	w10, [x20, #0x1c]
 12ab3c4: 1400000d     	b	0x12ab3f8 <__start_il2cpp+0x103c34>
 12ab3c8: f9401128     	ldr	x8, [x9, #0x20]
 12ab3cc: 5283a981     	mov	w1, #0x1d4c             // =7500
 12ab3d0: aa1403e0     	mov	x0, x20
 12ab3d4: f9406108     	ldr	x8, [x8, #0xc0]
 12ab3d8: f9403902     	ldr	x2, [x8, #0x70]
 12ab3dc: 9418d374     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12ab3e0: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab3e4: f9400a88     	ldr	x8, [x20, #0x10]
 12ab3e8: f94002a9     	ldr	x9, [x21]
 12ab3ec: 1100054a     	add	w10, w10, #0x1
 12ab3f0: b9001e8a     	str	w10, [x20, #0x1c]
 12ab3f4: b4004688     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12ab3f8: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12ab3fc: b940190b     	ldr	w11, [x8, #0x18]
 12ab400: 6b0b015f     	cmp	w10, w11
 12ab404: 540000e2     	b.hs	0x12ab420 <__start_il2cpp+0x103c5c>
 12ab408: 11000549     	add	w9, w10, #0x1
 12ab40c: 8b0a0908     	add	x8, x8, x10, lsl #2
 12ab410: 528c350a     	mov	w10, #0x61a8            // =25000
 12ab414: b9001a89     	str	w9, [x20, #0x18]
 12ab418: b900210a     	str	w10, [x8, #0x20]
 12ab41c: 14000007     	b	0x12ab438 <__start_il2cpp+0x103c74>
 12ab420: f9401128     	ldr	x8, [x9, #0x20]
 12ab424: 528c3501     	mov	w1, #0x61a8             // =25000
 12ab428: aa1403e0     	mov	x0, x20
 12ab42c: f9406108     	ldr	x8, [x8, #0xc0]
 12ab430: f9403902     	ldr	x2, [x8, #0x70]
 12ab434: 9418d35e     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12ab438: f9002674     	str	x20, [x19, #0x48]
 12ab43c: f94002e0     	ldr	x0, [x23]
 12ab440: 97f8532d     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12ab444: f94002c1     	ldr	x1, [x22]
 12ab448: aa0003f4     	mov	x20, x0
 12ab44c: 9418d15a     	bl	0x18df9b4 <__start_il2cpp+0x7381f0>
 12ab450: b40043b4     	cbz	x20, 0x12abcc4 <__start_il2cpp+0x104500>
 12ab454: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab458: f9400a88     	ldr	x8, [x20, #0x10]
 12ab45c: f94002a9     	ldr	x9, [x21]
 12ab460: 1100054a     	add	w10, w10, #0x1
 12ab464: b9001e8a     	str	w10, [x20, #0x1c]
 12ab468: b40042e8     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12ab46c: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12ab470: b940190b     	ldr	w11, [x8, #0x18]
 12ab474: 6b0b015f     	cmp	w10, w11
 12ab478: 54000142     	b.hs	0x12ab4a0 <__start_il2cpp+0x103cdc>
 12ab47c: 1100054b     	add	w11, w10, #0x1
 12ab480: 8b0a090a     	add	x10, x8, x10, lsl #2
 12ab484: 52803e8c     	mov	w12, #0x1f4             // =500
 12ab488: b9001a8b     	str	w11, [x20, #0x18]
 12ab48c: b900214c     	str	w12, [x10, #0x20]
 12ab490: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab494: 1100054a     	add	w10, w10, #0x1
 12ab498: b9001e8a     	str	w10, [x20, #0x1c]
 12ab49c: 1400000d     	b	0x12ab4d0 <__start_il2cpp+0x103d0c>
 12ab4a0: f9401128     	ldr	x8, [x9, #0x20]
 12ab4a4: 52803e81     	mov	w1, #0x1f4              // =500
 12ab4a8: aa1403e0     	mov	x0, x20
 12ab4ac: f9406108     	ldr	x8, [x8, #0xc0]
 12ab4b0: f9403902     	ldr	x2, [x8, #0x70]
 12ab4b4: 9418d33e     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12ab4b8: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab4bc: f9400a88     	ldr	x8, [x20, #0x10]
 12ab4c0: f94002a9     	ldr	x9, [x21]
 12ab4c4: 1100054a     	add	w10, w10, #0x1
 12ab4c8: b9001e8a     	str	w10, [x20, #0x1c]
 12ab4cc: b4003fc8     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12ab4d0: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12ab4d4: b940190b     	ldr	w11, [x8, #0x18]
 12ab4d8: 6b0b015f     	cmp	w10, w11
 12ab4dc: 54000142     	b.hs	0x12ab504 <__start_il2cpp+0x103d40>
 12ab4e0: 1100054b     	add	w11, w10, #0x1
 12ab4e4: 8b0a090a     	add	x10, x8, x10, lsl #2
 12ab4e8: 5284e20c     	mov	w12, #0x2710            // =10000
 12ab4ec: b9001a8b     	str	w11, [x20, #0x18]
 12ab4f0: b900214c     	str	w12, [x10, #0x20]
 12ab4f4: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab4f8: 1100054a     	add	w10, w10, #0x1
 12ab4fc: b9001e8a     	str	w10, [x20, #0x1c]
 12ab500: 1400000d     	b	0x12ab534 <__start_il2cpp+0x103d70>
 12ab504: f9401128     	ldr	x8, [x9, #0x20]
 12ab508: 5284e201     	mov	w1, #0x2710             // =10000
 12ab50c: aa1403e0     	mov	x0, x20
 12ab510: f9406108     	ldr	x8, [x8, #0xc0]
 12ab514: f9403902     	ldr	x2, [x8, #0x70]
 12ab518: 9418d325     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12ab51c: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab520: f9400a88     	ldr	x8, [x20, #0x10]
 12ab524: f94002a9     	ldr	x9, [x21]
 12ab528: 1100054a     	add	w10, w10, #0x1
 12ab52c: b9001e8a     	str	w10, [x20, #0x1c]
 12ab530: b4003ca8     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12ab534: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12ab538: b940190b     	ldr	w11, [x8, #0x18]
 12ab53c: 6b0b015f     	cmp	w10, w11
 12ab540: 54000142     	b.hs	0x12ab568 <__start_il2cpp+0x103da4>
 12ab544: 1100054b     	add	w11, w10, #0x1
 12ab548: 8b0a090a     	add	x10, x8, x10, lsl #2
 12ab54c: 5281388c     	mov	w12, #0x9c4             // =2500
 12ab550: b9001a8b     	str	w11, [x20, #0x18]
 12ab554: b900214c     	str	w12, [x10, #0x20]
 12ab558: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab55c: 1100054a     	add	w10, w10, #0x1
 12ab560: b9001e8a     	str	w10, [x20, #0x1c]
 12ab564: 1400000d     	b	0x12ab598 <__start_il2cpp+0x103dd4>
 12ab568: f9401128     	ldr	x8, [x9, #0x20]
 12ab56c: 52813881     	mov	w1, #0x9c4              // =2500
 12ab570: aa1403e0     	mov	x0, x20
 12ab574: f9406108     	ldr	x8, [x8, #0xc0]
 12ab578: f9403902     	ldr	x2, [x8, #0x70]
 12ab57c: 9418d30c     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12ab580: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab584: f9400a88     	ldr	x8, [x20, #0x10]
 12ab588: f94002a9     	ldr	x9, [x21]
 12ab58c: 1100054a     	add	w10, w10, #0x1
 12ab590: b9001e8a     	str	w10, [x20, #0x1c]
 12ab594: b4003988     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12ab598: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12ab59c: b940190b     	ldr	w11, [x8, #0x18]
 12ab5a0: 6b0b015f     	cmp	w10, w11
 12ab5a4: 540000e2     	b.hs	0x12ab5c0 <__start_il2cpp+0x103dfc>
 12ab5a8: 11000549     	add	w9, w10, #0x1
 12ab5ac: 8b0a0908     	add	x8, x8, x10, lsl #2
 12ab5b0: 5284e20a     	mov	w10, #0x2710            // =10000
 12ab5b4: b9001a89     	str	w9, [x20, #0x18]
 12ab5b8: b900210a     	str	w10, [x8, #0x20]
 12ab5bc: 14000007     	b	0x12ab5d8 <__start_il2cpp+0x103e14>
 12ab5c0: f9401128     	ldr	x8, [x9, #0x20]
 12ab5c4: 5284e201     	mov	w1, #0x2710             // =10000
 12ab5c8: aa1403e0     	mov	x0, x20
 12ab5cc: f9406108     	ldr	x8, [x8, #0xc0]
 12ab5d0: f9403902     	ldr	x2, [x8, #0x70]
 12ab5d4: 9418d2f6     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12ab5d8: f9002a74     	str	x20, [x19, #0x50]
 12ab5dc: f94002e0     	ldr	x0, [x23]
 12ab5e0: 97f852c5     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12ab5e4: f94002c1     	ldr	x1, [x22]
 12ab5e8: aa0003f4     	mov	x20, x0
 12ab5ec: 9418d0f2     	bl	0x18df9b4 <__start_il2cpp+0x7381f0>
 12ab5f0: b40036b4     	cbz	x20, 0x12abcc4 <__start_il2cpp+0x104500>
 12ab5f4: aa1403f9     	mov	x25, x20
 12ab5f8: f94002a8     	ldr	x8, [x21]
 12ab5fc: b841cf29     	ldr	w9, [x25, #0x1c]!
 12ab600: 11000529     	add	w9, w9, #0x1
 12ab604: b9000329     	str	w9, [x25]
 12ab608: aa1903f8     	mov	x24, x25
 12ab60c: f85f4329     	ldur	x9, [x25, #-0xc]
 12ab610: b89fcf0a     	ldrsw	x10, [x24, #-0x4]!
 12ab614: b4003589     	cbz	x9, 0x12abcc4 <__start_il2cpp+0x104500>
 12ab618: b940192b     	ldr	w11, [x9, #0x18]
 12ab61c: 6b0b015f     	cmp	w10, w11
 12ab620: 54000142     	b.hs	0x12ab648 <__start_il2cpp+0x103e84>
 12ab624: 1100054b     	add	w11, w10, #0x1
 12ab628: 8b0a092a     	add	x10, x9, x10, lsl #2
 12ab62c: 5284e20c     	mov	w12, #0x2710            // =10000
 12ab630: b900030b     	str	w11, [x24]
 12ab634: b900214c     	str	w12, [x10, #0x20]
 12ab638: b940032a     	ldr	w10, [x25]
 12ab63c: 1100054a     	add	w10, w10, #0x1
 12ab640: b900032a     	str	w10, [x25]
 12ab644: 1400000d     	b	0x12ab678 <__start_il2cpp+0x103eb4>
 12ab648: f9401108     	ldr	x8, [x8, #0x20]
 12ab64c: 5284e201     	mov	w1, #0x2710             // =10000
 12ab650: aa1403e0     	mov	x0, x20
 12ab654: f9406108     	ldr	x8, [x8, #0xc0]
 12ab658: f9403902     	ldr	x2, [x8, #0x70]
 12ab65c: 9418d2d4     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12ab660: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab664: f9400a89     	ldr	x9, [x20, #0x10]
 12ab668: f94002a8     	ldr	x8, [x21]
 12ab66c: 1100054a     	add	w10, w10, #0x1
 12ab670: b9001e8a     	str	w10, [x20, #0x1c]
 12ab674: b4003289     	cbz	x9, 0x12abcc4 <__start_il2cpp+0x104500>
 12ab678: b980030a     	ldrsw	x10, [x24]
 12ab67c: b940192b     	ldr	w11, [x9, #0x18]
 12ab680: 6b0b015f     	cmp	w10, w11
 12ab684: 54000142     	b.hs	0x12ab6ac <__start_il2cpp+0x103ee8>
 12ab688: 1100054b     	add	w11, w10, #0x1
 12ab68c: 8b0a092a     	add	x10, x9, x10, lsl #2
 12ab690: 5284e20c     	mov	w12, #0x2710            // =10000
 12ab694: b900030b     	str	w11, [x24]
 12ab698: b900214c     	str	w12, [x10, #0x20]
 12ab69c: b940032a     	ldr	w10, [x25]
 12ab6a0: 1100054a     	add	w10, w10, #0x1
 12ab6a4: b900032a     	str	w10, [x25]
 12ab6a8: 1400000d     	b	0x12ab6dc <__start_il2cpp+0x103f18>
 12ab6ac: f9401108     	ldr	x8, [x8, #0x20]
 12ab6b0: 5284e201     	mov	w1, #0x2710             // =10000
 12ab6b4: aa1403e0     	mov	x0, x20
 12ab6b8: f9406108     	ldr	x8, [x8, #0xc0]
 12ab6bc: f9403902     	ldr	x2, [x8, #0x70]
 12ab6c0: 9418d2bb     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12ab6c4: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab6c8: f9400a89     	ldr	x9, [x20, #0x10]
 12ab6cc: f94002a8     	ldr	x8, [x21]
 12ab6d0: 1100054a     	add	w10, w10, #0x1
 12ab6d4: b9001e8a     	str	w10, [x20, #0x1c]
 12ab6d8: b4002f69     	cbz	x9, 0x12abcc4 <__start_il2cpp+0x104500>
 12ab6dc: b980030a     	ldrsw	x10, [x24]
 12ab6e0: b940192b     	ldr	w11, [x9, #0x18]
 12ab6e4: 6b0b015f     	cmp	w10, w11
 12ab6e8: 54000142     	b.hs	0x12ab710 <__start_il2cpp+0x103f4c>
 12ab6ec: 1100054b     	add	w11, w10, #0x1
 12ab6f0: 8b0a092a     	add	x10, x9, x10, lsl #2
 12ab6f4: 528c350c     	mov	w12, #0x61a8            // =25000
 12ab6f8: b900030b     	str	w11, [x24]
 12ab6fc: b900214c     	str	w12, [x10, #0x20]
 12ab700: b940032a     	ldr	w10, [x25]
 12ab704: 1100054a     	add	w10, w10, #0x1
 12ab708: b900032a     	str	w10, [x25]
 12ab70c: 1400000d     	b	0x12ab740 <__start_il2cpp+0x103f7c>
 12ab710: f9401108     	ldr	x8, [x8, #0x20]
 12ab714: 528c3501     	mov	w1, #0x61a8             // =25000
 12ab718: aa1403e0     	mov	x0, x20
 12ab71c: f9406108     	ldr	x8, [x8, #0xc0]
 12ab720: f9403902     	ldr	x2, [x8, #0x70]
 12ab724: 9418d2a2     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12ab728: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab72c: f9400a89     	ldr	x9, [x20, #0x10]
 12ab730: f94002a8     	ldr	x8, [x21]
 12ab734: 1100054a     	add	w10, w10, #0x1
 12ab738: b9001e8a     	str	w10, [x20, #0x1c]
 12ab73c: b4002c49     	cbz	x9, 0x12abcc4 <__start_il2cpp+0x104500>
 12ab740: b980030a     	ldrsw	x10, [x24]
 12ab744: b940192b     	ldr	w11, [x9, #0x18]
 12ab748: 6b0b015f     	cmp	w10, w11
 12ab74c: 54000142     	b.hs	0x12ab774 <__start_il2cpp+0x103fb0>
 12ab750: 1100054b     	add	w11, w10, #0x1
 12ab754: 8b0a092a     	add	x10, x9, x10, lsl #2
 12ab758: 528c350c     	mov	w12, #0x61a8            // =25000
 12ab75c: b900030b     	str	w11, [x24]
 12ab760: b900214c     	str	w12, [x10, #0x20]
 12ab764: b940032a     	ldr	w10, [x25]
 12ab768: 1100054a     	add	w10, w10, #0x1
 12ab76c: b900032a     	str	w10, [x25]
 12ab770: 1400000d     	b	0x12ab7a4 <__start_il2cpp+0x103fe0>
 12ab774: f9401108     	ldr	x8, [x8, #0x20]
 12ab778: 528c3501     	mov	w1, #0x61a8             // =25000
 12ab77c: aa1403e0     	mov	x0, x20
 12ab780: f9406108     	ldr	x8, [x8, #0xc0]
 12ab784: f9403902     	ldr	x2, [x8, #0x70]
 12ab788: 9418d289     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12ab78c: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab790: f9400a89     	ldr	x9, [x20, #0x10]
 12ab794: f94002a8     	ldr	x8, [x21]
 12ab798: 1100054a     	add	w10, w10, #0x1
 12ab79c: b9001e8a     	str	w10, [x20, #0x1c]
 12ab7a0: b4002929     	cbz	x9, 0x12abcc4 <__start_il2cpp+0x104500>
 12ab7a4: b980030a     	ldrsw	x10, [x24]
 12ab7a8: b940192b     	ldr	w11, [x9, #0x18]
 12ab7ac: 6b0b015f     	cmp	w10, w11
 12ab7b0: 54000142     	b.hs	0x12ab7d8 <__start_il2cpp+0x104014>
 12ab7b4: 1100054b     	add	w11, w10, #0x1
 12ab7b8: 8b0a092a     	add	x10, x9, x10, lsl #2
 12ab7bc: 528c350c     	mov	w12, #0x61a8            // =25000
 12ab7c0: b900030b     	str	w11, [x24]
 12ab7c4: b900214c     	str	w12, [x10, #0x20]
 12ab7c8: b940032a     	ldr	w10, [x25]
 12ab7cc: 1100054a     	add	w10, w10, #0x1
 12ab7d0: b900032a     	str	w10, [x25]
 12ab7d4: 1400000d     	b	0x12ab808 <__start_il2cpp+0x104044>
 12ab7d8: f9401108     	ldr	x8, [x8, #0x20]
 12ab7dc: 528c3501     	mov	w1, #0x61a8             // =25000
 12ab7e0: aa1403e0     	mov	x0, x20
 12ab7e4: f9406108     	ldr	x8, [x8, #0xc0]
 12ab7e8: f9403902     	ldr	x2, [x8, #0x70]
 12ab7ec: 9418d270     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12ab7f0: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab7f4: f9400a89     	ldr	x9, [x20, #0x10]
 12ab7f8: f94002a8     	ldr	x8, [x21]
 12ab7fc: 1100054a     	add	w10, w10, #0x1
 12ab800: b9001e8a     	str	w10, [x20, #0x1c]
 12ab804: b4002609     	cbz	x9, 0x12abcc4 <__start_il2cpp+0x104500>
 12ab808: b980030a     	ldrsw	x10, [x24]
 12ab80c: b940192b     	ldr	w11, [x9, #0x18]
 12ab810: 6b0b015f     	cmp	w10, w11
 12ab814: 54000142     	b.hs	0x12ab83c <__start_il2cpp+0x104078>
 12ab818: 1100054b     	add	w11, w10, #0x1
 12ab81c: 8b0a092a     	add	x10, x9, x10, lsl #2
 12ab820: 528c350c     	mov	w12, #0x61a8            // =25000
 12ab824: b900030b     	str	w11, [x24]
 12ab828: b900214c     	str	w12, [x10, #0x20]
 12ab82c: b940032a     	ldr	w10, [x25]
 12ab830: 1100054a     	add	w10, w10, #0x1
 12ab834: b900032a     	str	w10, [x25]
 12ab838: 1400000d     	b	0x12ab86c <__start_il2cpp+0x1040a8>
 12ab83c: f9401108     	ldr	x8, [x8, #0x20]
 12ab840: 528c3501     	mov	w1, #0x61a8             // =25000
 12ab844: aa1403e0     	mov	x0, x20
 12ab848: f9406108     	ldr	x8, [x8, #0xc0]
 12ab84c: f9403902     	ldr	x2, [x8, #0x70]
 12ab850: 9418d257     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12ab854: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab858: f9400a89     	ldr	x9, [x20, #0x10]
 12ab85c: f94002a8     	ldr	x8, [x21]
 12ab860: 1100054a     	add	w10, w10, #0x1
 12ab864: b9001e8a     	str	w10, [x20, #0x1c]
 12ab868: b40022e9     	cbz	x9, 0x12abcc4 <__start_il2cpp+0x104500>
 12ab86c: b980030a     	ldrsw	x10, [x24]
 12ab870: b940192b     	ldr	w11, [x9, #0x18]
 12ab874: 6b0b015f     	cmp	w10, w11
 12ab878: 54000142     	b.hs	0x12ab8a0 <__start_il2cpp+0x1040dc>
 12ab87c: 1100054b     	add	w11, w10, #0x1
 12ab880: 8b0a092a     	add	x10, x9, x10, lsl #2
 12ab884: 528c350c     	mov	w12, #0x61a8            // =25000
 12ab888: b900030b     	str	w11, [x24]
 12ab88c: b900214c     	str	w12, [x10, #0x20]
 12ab890: b940032a     	ldr	w10, [x25]
 12ab894: 1100054a     	add	w10, w10, #0x1
 12ab898: b900032a     	str	w10, [x25]
 12ab89c: 1400000d     	b	0x12ab8d0 <__start_il2cpp+0x10410c>
 12ab8a0: f9401108     	ldr	x8, [x8, #0x20]
 12ab8a4: 528c3501     	mov	w1, #0x61a8             // =25000
 12ab8a8: aa1403e0     	mov	x0, x20
 12ab8ac: f9406108     	ldr	x8, [x8, #0xc0]
 12ab8b0: f9403902     	ldr	x2, [x8, #0x70]
 12ab8b4: 9418d23e     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12ab8b8: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab8bc: f9400a89     	ldr	x9, [x20, #0x10]
 12ab8c0: f94002a8     	ldr	x8, [x21]
 12ab8c4: 1100054a     	add	w10, w10, #0x1
 12ab8c8: b9001e8a     	str	w10, [x20, #0x1c]
 12ab8cc: b4001fc9     	cbz	x9, 0x12abcc4 <__start_il2cpp+0x104500>
 12ab8d0: b980030a     	ldrsw	x10, [x24]
 12ab8d4: b940192b     	ldr	w11, [x9, #0x18]
 12ab8d8: 6b0b015f     	cmp	w10, w11
 12ab8dc: 54000142     	b.hs	0x12ab904 <__start_il2cpp+0x104140>
 12ab8e0: 1100054b     	add	w11, w10, #0x1
 12ab8e4: 8b0a092a     	add	x10, x9, x10, lsl #2
 12ab8e8: 528c350c     	mov	w12, #0x61a8            // =25000
 12ab8ec: b900030b     	str	w11, [x24]
 12ab8f0: b900214c     	str	w12, [x10, #0x20]
 12ab8f4: b940032a     	ldr	w10, [x25]
 12ab8f8: 1100054a     	add	w10, w10, #0x1
 12ab8fc: b900032a     	str	w10, [x25]
 12ab900: 1400000d     	b	0x12ab934 <__start_il2cpp+0x104170>
 12ab904: f9401108     	ldr	x8, [x8, #0x20]
 12ab908: 528c3501     	mov	w1, #0x61a8             // =25000
 12ab90c: aa1403e0     	mov	x0, x20
 12ab910: f9406108     	ldr	x8, [x8, #0xc0]
 12ab914: f9403902     	ldr	x2, [x8, #0x70]
 12ab918: 9418d225     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12ab91c: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab920: f9400a89     	ldr	x9, [x20, #0x10]
 12ab924: f94002a8     	ldr	x8, [x21]
 12ab928: 1100054a     	add	w10, w10, #0x1
 12ab92c: b9001e8a     	str	w10, [x20, #0x1c]
 12ab930: b4001ca9     	cbz	x9, 0x12abcc4 <__start_il2cpp+0x104500>
 12ab934: b980030a     	ldrsw	x10, [x24]
 12ab938: b940192b     	ldr	w11, [x9, #0x18]
 12ab93c: 6b0b015f     	cmp	w10, w11
 12ab940: 54000142     	b.hs	0x12ab968 <__start_il2cpp+0x1041a4>
 12ab944: 1100054b     	add	w11, w10, #0x1
 12ab948: 8b0a092a     	add	x10, x9, x10, lsl #2
 12ab94c: 528c350c     	mov	w12, #0x61a8            // =25000
 12ab950: b900030b     	str	w11, [x24]
 12ab954: b900214c     	str	w12, [x10, #0x20]
 12ab958: b940032a     	ldr	w10, [x25]
 12ab95c: 1100054a     	add	w10, w10, #0x1
 12ab960: b900032a     	str	w10, [x25]
 12ab964: 1400000d     	b	0x12ab998 <__start_il2cpp+0x1041d4>
 12ab968: f9401108     	ldr	x8, [x8, #0x20]
 12ab96c: 528c3501     	mov	w1, #0x61a8             // =25000
 12ab970: aa1403e0     	mov	x0, x20
 12ab974: f9406108     	ldr	x8, [x8, #0xc0]
 12ab978: f9403902     	ldr	x2, [x8, #0x70]
 12ab97c: 9418d20c     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12ab980: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab984: f9400a89     	ldr	x9, [x20, #0x10]
 12ab988: f94002a8     	ldr	x8, [x21]
 12ab98c: 1100054a     	add	w10, w10, #0x1
 12ab990: b9001e8a     	str	w10, [x20, #0x1c]
 12ab994: b4001989     	cbz	x9, 0x12abcc4 <__start_il2cpp+0x104500>
 12ab998: b980030a     	ldrsw	x10, [x24]
 12ab99c: b940192b     	ldr	w11, [x9, #0x18]
 12ab9a0: 6b0b015f     	cmp	w10, w11
 12ab9a4: 54000142     	b.hs	0x12ab9cc <__start_il2cpp+0x104208>
 12ab9a8: 1100054b     	add	w11, w10, #0x1
 12ab9ac: 8b0a092a     	add	x10, x9, x10, lsl #2
 12ab9b0: 528c350c     	mov	w12, #0x61a8            // =25000
 12ab9b4: b900030b     	str	w11, [x24]
 12ab9b8: b900214c     	str	w12, [x10, #0x20]
 12ab9bc: b940032a     	ldr	w10, [x25]
 12ab9c0: 1100054a     	add	w10, w10, #0x1
 12ab9c4: b900032a     	str	w10, [x25]
 12ab9c8: 1400000d     	b	0x12ab9fc <__start_il2cpp+0x104238>
 12ab9cc: f9401108     	ldr	x8, [x8, #0x20]
 12ab9d0: 528c3501     	mov	w1, #0x61a8             // =25000
 12ab9d4: aa1403e0     	mov	x0, x20
 12ab9d8: f9406108     	ldr	x8, [x8, #0xc0]
 12ab9dc: f9403902     	ldr	x2, [x8, #0x70]
 12ab9e0: 9418d1f3     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12ab9e4: b9401e8a     	ldr	w10, [x20, #0x1c]
 12ab9e8: f9400a89     	ldr	x9, [x20, #0x10]
 12ab9ec: f94002a8     	ldr	x8, [x21]
 12ab9f0: 1100054a     	add	w10, w10, #0x1
 12ab9f4: b9001e8a     	str	w10, [x20, #0x1c]
 12ab9f8: b4001669     	cbz	x9, 0x12abcc4 <__start_il2cpp+0x104500>
 12ab9fc: b980030a     	ldrsw	x10, [x24]
 12aba00: b940192b     	ldr	w11, [x9, #0x18]
 12aba04: 6b0b015f     	cmp	w10, w11
 12aba08: 54000142     	b.hs	0x12aba30 <__start_il2cpp+0x10426c>
 12aba0c: 1100054b     	add	w11, w10, #0x1
 12aba10: 8b0a092a     	add	x10, x9, x10, lsl #2
 12aba14: 528c350c     	mov	w12, #0x61a8            // =25000
 12aba18: b900030b     	str	w11, [x24]
 12aba1c: b900214c     	str	w12, [x10, #0x20]
 12aba20: b940032a     	ldr	w10, [x25]
 12aba24: 1100054a     	add	w10, w10, #0x1
 12aba28: b900032a     	str	w10, [x25]
 12aba2c: 1400000d     	b	0x12aba60 <__start_il2cpp+0x10429c>
 12aba30: f9401108     	ldr	x8, [x8, #0x20]
 12aba34: 528c3501     	mov	w1, #0x61a8             // =25000
 12aba38: aa1403e0     	mov	x0, x20
 12aba3c: f9406108     	ldr	x8, [x8, #0xc0]
 12aba40: f9403902     	ldr	x2, [x8, #0x70]
 12aba44: 9418d1da     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12aba48: b9401e8a     	ldr	w10, [x20, #0x1c]
 12aba4c: f9400a89     	ldr	x9, [x20, #0x10]
 12aba50: f94002a8     	ldr	x8, [x21]
 12aba54: 1100054a     	add	w10, w10, #0x1
 12aba58: b9001e8a     	str	w10, [x20, #0x1c]
 12aba5c: b4001349     	cbz	x9, 0x12abcc4 <__start_il2cpp+0x104500>
 12aba60: b980030a     	ldrsw	x10, [x24]
 12aba64: b940192b     	ldr	w11, [x9, #0x18]
 12aba68: 6b0b015f     	cmp	w10, w11
 12aba6c: 54000142     	b.hs	0x12aba94 <__start_il2cpp+0x1042d0>
 12aba70: 1100054b     	add	w11, w10, #0x1
 12aba74: 8b0a092a     	add	x10, x9, x10, lsl #2
 12aba78: 528c350c     	mov	w12, #0x61a8            // =25000
 12aba7c: b900030b     	str	w11, [x24]
 12aba80: b900214c     	str	w12, [x10, #0x20]
 12aba84: b940032a     	ldr	w10, [x25]
 12aba88: 1100054a     	add	w10, w10, #0x1
 12aba8c: b900032a     	str	w10, [x25]
 12aba90: 1400000d     	b	0x12abac4 <__start_il2cpp+0x104300>
 12aba94: f9401108     	ldr	x8, [x8, #0x20]
 12aba98: 528c3501     	mov	w1, #0x61a8             // =25000
 12aba9c: aa1403e0     	mov	x0, x20
 12abaa0: f9406108     	ldr	x8, [x8, #0xc0]
 12abaa4: f9403902     	ldr	x2, [x8, #0x70]
 12abaa8: 9418d1c1     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12abaac: b9401e8a     	ldr	w10, [x20, #0x1c]
 12abab0: f9400a89     	ldr	x9, [x20, #0x10]
 12abab4: f94002a8     	ldr	x8, [x21]
 12abab8: 1100054a     	add	w10, w10, #0x1
 12ababc: b9001e8a     	str	w10, [x20, #0x1c]
 12abac0: b4001029     	cbz	x9, 0x12abcc4 <__start_il2cpp+0x104500>
 12abac4: b980030a     	ldrsw	x10, [x24]
 12abac8: b940192b     	ldr	w11, [x9, #0x18]
 12abacc: 6b0b015f     	cmp	w10, w11
 12abad0: 54000142     	b.hs	0x12abaf8 <__start_il2cpp+0x104334>
 12abad4: 1100054b     	add	w11, w10, #0x1
 12abad8: 8b0a092a     	add	x10, x9, x10, lsl #2
 12abadc: 528c350c     	mov	w12, #0x61a8            // =25000
 12abae0: b900030b     	str	w11, [x24]
 12abae4: b900214c     	str	w12, [x10, #0x20]
 12abae8: b940032a     	ldr	w10, [x25]
 12abaec: 1100054a     	add	w10, w10, #0x1
 12abaf0: b900032a     	str	w10, [x25]
 12abaf4: 1400000d     	b	0x12abb28 <__start_il2cpp+0x104364>
 12abaf8: f9401108     	ldr	x8, [x8, #0x20]
 12abafc: 528c3501     	mov	w1, #0x61a8             // =25000
 12abb00: aa1403e0     	mov	x0, x20
 12abb04: f9406108     	ldr	x8, [x8, #0xc0]
 12abb08: f9403902     	ldr	x2, [x8, #0x70]
 12abb0c: 9418d1a8     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12abb10: b9401e8a     	ldr	w10, [x20, #0x1c]
 12abb14: f9400a89     	ldr	x9, [x20, #0x10]
 12abb18: f94002a8     	ldr	x8, [x21]
 12abb1c: 1100054a     	add	w10, w10, #0x1
 12abb20: b9001e8a     	str	w10, [x20, #0x1c]
 12abb24: b4000d09     	cbz	x9, 0x12abcc4 <__start_il2cpp+0x104500>
 12abb28: b980030a     	ldrsw	x10, [x24]
 12abb2c: b940192b     	ldr	w11, [x9, #0x18]
 12abb30: 6b0b015f     	cmp	w10, w11
 12abb34: 540000e2     	b.hs	0x12abb50 <__start_il2cpp+0x10438c>
 12abb38: 11000548     	add	w8, w10, #0x1
 12abb3c: 8b0a0929     	add	x9, x9, x10, lsl #2
 12abb40: 528c350a     	mov	w10, #0x61a8            // =25000
 12abb44: b9000308     	str	w8, [x24]
 12abb48: b900212a     	str	w10, [x9, #0x20]
 12abb4c: 14000007     	b	0x12abb68 <__start_il2cpp+0x1043a4>
 12abb50: f9401108     	ldr	x8, [x8, #0x20]
 12abb54: 528c3501     	mov	w1, #0x61a8             // =25000
 12abb58: aa1403e0     	mov	x0, x20
 12abb5c: f9406108     	ldr	x8, [x8, #0xc0]
 12abb60: f9403902     	ldr	x2, [x8, #0x70]
 12abb64: 9418d192     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12abb68: f9002e74     	str	x20, [x19, #0x58]
 12abb6c: f94002e0     	ldr	x0, [x23]
 12abb70: 97f85161     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12abb74: f94002c1     	ldr	x1, [x22]
 12abb78: aa0003f4     	mov	x20, x0
 12abb7c: 9418cf8e     	bl	0x18df9b4 <__start_il2cpp+0x7381f0>
 12abb80: b4000a34     	cbz	x20, 0x12abcc4 <__start_il2cpp+0x104500>
 12abb84: b9401e8a     	ldr	w10, [x20, #0x1c]
 12abb88: f9400a88     	ldr	x8, [x20, #0x10]
 12abb8c: f94002a9     	ldr	x9, [x21]
 12abb90: 1100054a     	add	w10, w10, #0x1
 12abb94: b9001e8a     	str	w10, [x20, #0x1c]
 12abb98: b4000968     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12abb9c: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12abba0: b940190b     	ldr	w11, [x8, #0x18]
 12abba4: 6b0b015f     	cmp	w10, w11
 12abba8: 54000142     	b.hs	0x12abbd0 <__start_il2cpp+0x10440c>
 12abbac: 1100054b     	add	w11, w10, #0x1
 12abbb0: 8b0a090a     	add	x10, x8, x10, lsl #2
 12abbb4: 5282710c     	mov	w12, #0x1388            // =5000
 12abbb8: b9001a8b     	str	w11, [x20, #0x18]
 12abbbc: b900214c     	str	w12, [x10, #0x20]
 12abbc0: b9401e8a     	ldr	w10, [x20, #0x1c]
 12abbc4: 1100054a     	add	w10, w10, #0x1
 12abbc8: b9001e8a     	str	w10, [x20, #0x1c]
 12abbcc: 1400000d     	b	0x12abc00 <__start_il2cpp+0x10443c>
 12abbd0: f9401128     	ldr	x8, [x9, #0x20]
 12abbd4: 52827101     	mov	w1, #0x1388             // =5000
 12abbd8: aa1403e0     	mov	x0, x20
 12abbdc: f9406108     	ldr	x8, [x8, #0xc0]
 12abbe0: f9403902     	ldr	x2, [x8, #0x70]
 12abbe4: 9418d172     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12abbe8: b9401e8a     	ldr	w10, [x20, #0x1c]
 12abbec: f9400a88     	ldr	x8, [x20, #0x10]
 12abbf0: f94002a9     	ldr	x9, [x21]
 12abbf4: 1100054a     	add	w10, w10, #0x1
 12abbf8: b9001e8a     	str	w10, [x20, #0x1c]
 12abbfc: b4000648     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12abc00: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12abc04: b940190b     	ldr	w11, [x8, #0x18]
 12abc08: 6b0b015f     	cmp	w10, w11
 12abc0c: 54000142     	b.hs	0x12abc34 <__start_il2cpp+0x104470>
 12abc10: 1100054b     	add	w11, w10, #0x1
 12abc14: 8b0a090a     	add	x10, x8, x10, lsl #2
 12abc18: 5282710c     	mov	w12, #0x1388            // =5000
 12abc1c: b9001a8b     	str	w11, [x20, #0x18]
 12abc20: b900214c     	str	w12, [x10, #0x20]
 12abc24: b9401e8a     	ldr	w10, [x20, #0x1c]
 12abc28: 1100054a     	add	w10, w10, #0x1
 12abc2c: b9001e8a     	str	w10, [x20, #0x1c]
 12abc30: 1400000d     	b	0x12abc64 <__start_il2cpp+0x1044a0>
 12abc34: f9401128     	ldr	x8, [x9, #0x20]
 12abc38: 52827101     	mov	w1, #0x1388             // =5000
 12abc3c: aa1403e0     	mov	x0, x20
 12abc40: f9406108     	ldr	x8, [x8, #0xc0]
 12abc44: f9403902     	ldr	x2, [x8, #0x70]
 12abc48: 9418d159     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12abc4c: b9401e8a     	ldr	w10, [x20, #0x1c]
 12abc50: f9400a88     	ldr	x8, [x20, #0x10]
 12abc54: f94002a9     	ldr	x9, [x21]
 12abc58: 1100054a     	add	w10, w10, #0x1
 12abc5c: b9001e8a     	str	w10, [x20, #0x1c]
 12abc60: b4000328     	cbz	x8, 0x12abcc4 <__start_il2cpp+0x104500>
 12abc64: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12abc68: b940190b     	ldr	w11, [x8, #0x18]
 12abc6c: 6b0b015f     	cmp	w10, w11
 12abc70: 540000e2     	b.hs	0x12abc8c <__start_il2cpp+0x1044c8>
 12abc74: 11000549     	add	w9, w10, #0x1
 12abc78: 8b0a0908     	add	x8, x8, x10, lsl #2
 12abc7c: 5282710a     	mov	w10, #0x1388            // =5000
 12abc80: b9001a89     	str	w9, [x20, #0x18]
 12abc84: b900210a     	str	w10, [x8, #0x20]
 12abc88: 14000007     	b	0x12abca4 <__start_il2cpp+0x1044e0>
 12abc8c: f9401128     	ldr	x8, [x9, #0x20]
 12abc90: 52827101     	mov	w1, #0x1388             // =5000
 12abc94: aa1403e0     	mov	x0, x20
 12abc98: f9406108     	ldr	x8, [x8, #0xc0]
 12abc9c: f9403902     	ldr	x2, [x8, #0x70]
 12abca0: 9418d143     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 12abca4: f9003274     	str	x20, [x19, #0x60]
 12abca8: aa1303e0     	mov	x0, x19
 12abcac: a9434ff4     	ldp	x20, x19, [sp, #0x30]
 12abcb0: a94257f6     	ldp	x22, x21, [sp, #0x20]
 12abcb4: a9415ff8     	ldp	x24, x23, [sp, #0x10]
 12abcb8: aa1f03e1     	mov	x1, xzr
 12abcbc: a8c467fe     	ldp	x30, x25, [sp], #0x40
 12abcc0: 17ffb9ab     	b	0x129a36c <__start_il2cpp+0xf2ba8>
 12abcc4: 97f8510f     	bl	0x10c0100 <CloseNLSocket+0x638>
