
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 129d324: f81c0ffe     	str	x30, [sp, #-0x40]!
 129d328: a9015ff8     	stp	x24, x23, [sp, #0x10]
 129d32c: a90257f6     	stp	x22, x21, [sp, #0x20]
 129d330: a9034ff4     	stp	x20, x19, [sp, #0x30]
 129d334: 9000bcd4     	adrp	x20, 0x2a35000
 129d338: b000ae18     	adrp	x24, 0x285e000
 129d33c: b000ae17     	adrp	x23, 0x285e000
 129d340: 39637688     	ldrb	w8, [x20, #0x8dd]
 129d344: f941cf18     	ldr	x24, [x24, #0x398]
 129d348: f941caf7     	ldr	x23, [x23, #0x390]
 129d34c: aa0003f3     	mov	x19, x0
 129d350: 37000188     	tbnz	w8, #0x0, 0x129d380 <__start_il2cpp+0xf5bbc>
 129d354: b000ae00     	adrp	x0, 0x285e000
 129d358: f941c000     	ldr	x0, [x0, #0x380]
 129d35c: 97f88adf     	bl	0x10bfed8 <CloseNLSocket+0x410>
 129d360: b000ae00     	adrp	x0, 0x285e000
 129d364: f941c800     	ldr	x0, [x0, #0x390]
 129d368: 97f88adc     	bl	0x10bfed8 <CloseNLSocket+0x410>
 129d36c: b000ae00     	adrp	x0, 0x285e000
 129d370: f941cc00     	ldr	x0, [x0, #0x398]
 129d374: 97f88ad9     	bl	0x10bfed8 <CloseNLSocket+0x410>
 129d378: 52800028     	mov	w8, #0x1                // =1
 129d37c: 39237688     	strb	w8, [x20, #0x8dd]
 129d380: f9400300     	ldr	x0, [x24]
 129d384: 97f88b5c     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 129d388: f94002e1     	ldr	x1, [x23]
 129d38c: aa0003f4     	mov	x20, x0
 129d390: 94190989     	bl	0x18df9b4 <__start_il2cpp+0x7381f0>
 129d394: b4002794     	cbz	x20, 0x129d884 <__start_il2cpp+0xf60c0>
 129d398: b000ae15     	adrp	x21, 0x285e000
 129d39c: f941c2b5     	ldr	x21, [x21, #0x380]
 129d3a0: b9401e8a     	ldr	w10, [x20, #0x1c]
 129d3a4: f9400a88     	ldr	x8, [x20, #0x10]
 129d3a8: f94002a9     	ldr	x9, [x21]
 129d3ac: 1100054a     	add	w10, w10, #0x1
 129d3b0: b9001e8a     	str	w10, [x20, #0x1c]
 129d3b4: b4002688     	cbz	x8, 0x129d884 <__start_il2cpp+0xf60c0>
 129d3b8: b9801a8a     	ldrsw	x10, [x20, #0x18]
 129d3bc: b940190b     	ldr	w11, [x8, #0x18]
 129d3c0: 52993ff6     	mov	w22, #0xc9ff            // =51711
 129d3c4: 72a77356     	movk	w22, #0x3b9a, lsl #16
 129d3c8: 6b0b015f     	cmp	w10, w11
 129d3cc: 54000122     	b.hs	0x129d3f0 <__start_il2cpp+0xf5c2c>
 129d3d0: 1100054b     	add	w11, w10, #0x1
 129d3d4: 8b0a090a     	add	x10, x8, x10, lsl #2
 129d3d8: b9001a8b     	str	w11, [x20, #0x18]
 129d3dc: b9002156     	str	w22, [x10, #0x20]
 129d3e0: b9401e8a     	ldr	w10, [x20, #0x1c]
 129d3e4: 1100054a     	add	w10, w10, #0x1
 129d3e8: b9001e8a     	str	w10, [x20, #0x1c]
 129d3ec: 1400000e     	b	0x129d424 <__start_il2cpp+0xf5c60>
 129d3f0: f9401128     	ldr	x8, [x9, #0x20]
 129d3f4: 52993fe1     	mov	w1, #0xc9ff             // =51711
 129d3f8: 72a77341     	movk	w1, #0x3b9a, lsl #16
 129d3fc: aa1403e0     	mov	x0, x20
 129d400: f9406108     	ldr	x8, [x8, #0xc0]
 129d404: f9403902     	ldr	x2, [x8, #0x70]
 129d408: 94190b69     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 129d40c: b9401e8a     	ldr	w10, [x20, #0x1c]
 129d410: f9400a88     	ldr	x8, [x20, #0x10]
 129d414: f94002a9     	ldr	x9, [x21]
 129d418: 1100054a     	add	w10, w10, #0x1
 129d41c: b9001e8a     	str	w10, [x20, #0x1c]
 129d420: b4002328     	cbz	x8, 0x129d884 <__start_il2cpp+0xf60c0>
 129d424: b9801a8a     	ldrsw	x10, [x20, #0x18]
 129d428: b940190b     	ldr	w11, [x8, #0x18]
 129d42c: 6b0b015f     	cmp	w10, w11
 129d430: 54000142     	b.hs	0x129d458 <__start_il2cpp+0xf5c94>
 129d434: 1100054b     	add	w11, w10, #0x1
 129d438: 8b0a090a     	add	x10, x8, x10, lsl #2
 129d43c: 5280bb8c     	mov	w12, #0x5dc             // =1500
 129d440: b9001a8b     	str	w11, [x20, #0x18]
 129d444: b900214c     	str	w12, [x10, #0x20]
 129d448: b9401e8a     	ldr	w10, [x20, #0x1c]
 129d44c: 1100054a     	add	w10, w10, #0x1
 129d450: b9001e8a     	str	w10, [x20, #0x1c]
 129d454: 1400000d     	b	0x129d488 <__start_il2cpp+0xf5cc4>
 129d458: f9401128     	ldr	x8, [x9, #0x20]
 129d45c: 5280bb81     	mov	w1, #0x5dc              // =1500
 129d460: aa1403e0     	mov	x0, x20
 129d464: f9406108     	ldr	x8, [x8, #0xc0]
 129d468: f9403902     	ldr	x2, [x8, #0x70]
 129d46c: 94190b50     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 129d470: b9401e8a     	ldr	w10, [x20, #0x1c]
 129d474: f9400a88     	ldr	x8, [x20, #0x10]
 129d478: f94002a9     	ldr	x9, [x21]
 129d47c: 1100054a     	add	w10, w10, #0x1
 129d480: b9001e8a     	str	w10, [x20, #0x1c]
 129d484: b4002008     	cbz	x8, 0x129d884 <__start_il2cpp+0xf60c0>
 129d488: b9801a8a     	ldrsw	x10, [x20, #0x18]
 129d48c: b940190b     	ldr	w11, [x8, #0x18]
 129d490: 6b0b015f     	cmp	w10, w11
 129d494: 54000142     	b.hs	0x129d4bc <__start_il2cpp+0xf5cf8>
 129d498: 1100054b     	add	w11, w10, #0x1
 129d49c: 8b0a090a     	add	x10, x8, x10, lsl #2
 129d4a0: 52807d0c     	mov	w12, #0x3e8             // =1000
 129d4a4: b9001a8b     	str	w11, [x20, #0x18]
 129d4a8: b900214c     	str	w12, [x10, #0x20]
 129d4ac: b9401e8a     	ldr	w10, [x20, #0x1c]
 129d4b0: 1100054a     	add	w10, w10, #0x1
 129d4b4: b9001e8a     	str	w10, [x20, #0x1c]
 129d4b8: 1400000d     	b	0x129d4ec <__start_il2cpp+0xf5d28>
 129d4bc: f9401128     	ldr	x8, [x9, #0x20]
 129d4c0: 52807d01     	mov	w1, #0x3e8              // =1000
 129d4c4: aa1403e0     	mov	x0, x20
 129d4c8: f9406108     	ldr	x8, [x8, #0xc0]
 129d4cc: f9403902     	ldr	x2, [x8, #0x70]
 129d4d0: 94190b37     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 129d4d4: b9401e8a     	ldr	w10, [x20, #0x1c]
 129d4d8: f9400a88     	ldr	x8, [x20, #0x10]
 129d4dc: f94002a9     	ldr	x9, [x21]
 129d4e0: 1100054a     	add	w10, w10, #0x1
 129d4e4: b9001e8a     	str	w10, [x20, #0x1c]
 129d4e8: b4001ce8     	cbz	x8, 0x129d884 <__start_il2cpp+0xf60c0>
 129d4ec: b9801a8a     	ldrsw	x10, [x20, #0x18]
 129d4f0: b940190b     	ldr	w11, [x8, #0x18]
 129d4f4: 6b0b015f     	cmp	w10, w11
 129d4f8: 54000142     	b.hs	0x129d520 <__start_il2cpp+0xf5d5c>
 129d4fc: 1100054b     	add	w11, w10, #0x1
 129d500: 8b0a090a     	add	x10, x8, x10, lsl #2
 129d504: 52807d0c     	mov	w12, #0x3e8             // =1000
 129d508: b9001a8b     	str	w11, [x20, #0x18]
 129d50c: b900214c     	str	w12, [x10, #0x20]
 129d510: b9401e8a     	ldr	w10, [x20, #0x1c]
 129d514: 1100054a     	add	w10, w10, #0x1
 129d518: b9001e8a     	str	w10, [x20, #0x1c]
 129d51c: 1400000d     	b	0x129d550 <__start_il2cpp+0xf5d8c>
 129d520: f9401128     	ldr	x8, [x9, #0x20]
 129d524: 52807d01     	mov	w1, #0x3e8              // =1000
 129d528: aa1403e0     	mov	x0, x20
 129d52c: f9406108     	ldr	x8, [x8, #0xc0]
 129d530: f9403902     	ldr	x2, [x8, #0x70]
 129d534: 94190b1e     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 129d538: b9401e8a     	ldr	w10, [x20, #0x1c]
 129d53c: f9400a88     	ldr	x8, [x20, #0x10]
 129d540: f94002a9     	ldr	x9, [x21]
 129d544: 1100054a     	add	w10, w10, #0x1
 129d548: b9001e8a     	str	w10, [x20, #0x1c]
 129d54c: b40019c8     	cbz	x8, 0x129d884 <__start_il2cpp+0xf60c0>
 129d550: b9801a8a     	ldrsw	x10, [x20, #0x18]
 129d554: b940190b     	ldr	w11, [x8, #0x18]
 129d558: 6b0b015f     	cmp	w10, w11
 129d55c: 54000142     	b.hs	0x129d584 <__start_il2cpp+0xf5dc0>
 129d560: 1100054b     	add	w11, w10, #0x1
 129d564: 8b0a090a     	add	x10, x8, x10, lsl #2
 129d568: 52807d0c     	mov	w12, #0x3e8             // =1000
 129d56c: b9001a8b     	str	w11, [x20, #0x18]
 129d570: b900214c     	str	w12, [x10, #0x20]
 129d574: b9401e8a     	ldr	w10, [x20, #0x1c]
 129d578: 1100054a     	add	w10, w10, #0x1
 129d57c: b9001e8a     	str	w10, [x20, #0x1c]
 129d580: 1400000d     	b	0x129d5b4 <__start_il2cpp+0xf5df0>
 129d584: f9401128     	ldr	x8, [x9, #0x20]
 129d588: 52807d01     	mov	w1, #0x3e8              // =1000
 129d58c: aa1403e0     	mov	x0, x20
 129d590: f9406108     	ldr	x8, [x8, #0xc0]
 129d594: f9403902     	ldr	x2, [x8, #0x70]
 129d598: 94190b05     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 129d59c: b9401e8a     	ldr	w10, [x20, #0x1c]
 129d5a0: f9400a88     	ldr	x8, [x20, #0x10]
 129d5a4: f94002a9     	ldr	x9, [x21]
 129d5a8: 1100054a     	add	w10, w10, #0x1
 129d5ac: b9001e8a     	str	w10, [x20, #0x1c]
 129d5b0: b40016a8     	cbz	x8, 0x129d884 <__start_il2cpp+0xf60c0>
 129d5b4: b9801a8a     	ldrsw	x10, [x20, #0x18]
 129d5b8: b940190b     	ldr	w11, [x8, #0x18]
 129d5bc: 6b0b015f     	cmp	w10, w11
 129d5c0: 540000e2     	b.hs	0x129d5dc <__start_il2cpp+0xf5e18>
 129d5c4: 11000549     	add	w9, w10, #0x1
 129d5c8: 8b0a0908     	add	x8, x8, x10, lsl #2
 129d5cc: 52807d0a     	mov	w10, #0x3e8             // =1000
 129d5d0: b9001a89     	str	w9, [x20, #0x18]
 129d5d4: b900210a     	str	w10, [x8, #0x20]
 129d5d8: 14000007     	b	0x129d5f4 <__start_il2cpp+0xf5e30>
 129d5dc: f9401128     	ldr	x8, [x9, #0x20]
 129d5e0: 52807d01     	mov	w1, #0x3e8              // =1000
 129d5e4: aa1403e0     	mov	x0, x20
 129d5e8: f9406108     	ldr	x8, [x8, #0xc0]
 129d5ec: f9403902     	ldr	x2, [x8, #0x70]
 129d5f0: 94190aef     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 129d5f4: f9001674     	str	x20, [x19, #0x28]
 129d5f8: f9400300     	ldr	x0, [x24]
 129d5fc: 97f88abe     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 129d600: f94002e1     	ldr	x1, [x23]
 129d604: aa0003f4     	mov	x20, x0
 129d608: 941908eb     	bl	0x18df9b4 <__start_il2cpp+0x7381f0>
 129d60c: b40013d4     	cbz	x20, 0x129d884 <__start_il2cpp+0xf60c0>
 129d610: b9401e8a     	ldr	w10, [x20, #0x1c]
 129d614: f9400a88     	ldr	x8, [x20, #0x10]
 129d618: f94002a9     	ldr	x9, [x21]
 129d61c: 1100054a     	add	w10, w10, #0x1
 129d620: b9001e8a     	str	w10, [x20, #0x1c]
 129d624: b4001308     	cbz	x8, 0x129d884 <__start_il2cpp+0xf60c0>
 129d628: b9801a8a     	ldrsw	x10, [x20, #0x18]
 129d62c: b940190b     	ldr	w11, [x8, #0x18]
 129d630: 6b0b015f     	cmp	w10, w11
 129d634: 54000122     	b.hs	0x129d658 <__start_il2cpp+0xf5e94>
 129d638: 1100054b     	add	w11, w10, #0x1
 129d63c: 8b0a090a     	add	x10, x8, x10, lsl #2
 129d640: b9001a8b     	str	w11, [x20, #0x18]
 129d644: b9002156     	str	w22, [x10, #0x20]
 129d648: b9401e8a     	ldr	w10, [x20, #0x1c]
 129d64c: 1100054a     	add	w10, w10, #0x1
 129d650: b9001e8a     	str	w10, [x20, #0x1c]
 129d654: 1400000e     	b	0x129d68c <__start_il2cpp+0xf5ec8>
 129d658: f9401128     	ldr	x8, [x9, #0x20]
 129d65c: 52993fe1     	mov	w1, #0xc9ff             // =51711
 129d660: 72a77341     	movk	w1, #0x3b9a, lsl #16
 129d664: aa1403e0     	mov	x0, x20
 129d668: f9406108     	ldr	x8, [x8, #0xc0]
 129d66c: f9403902     	ldr	x2, [x8, #0x70]
 129d670: 94190acf     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 129d674: b9401e8a     	ldr	w10, [x20, #0x1c]
 129d678: f9400a88     	ldr	x8, [x20, #0x10]
 129d67c: f94002a9     	ldr	x9, [x21]
 129d680: 1100054a     	add	w10, w10, #0x1
 129d684: b9001e8a     	str	w10, [x20, #0x1c]
 129d688: b4000fe8     	cbz	x8, 0x129d884 <__start_il2cpp+0xf60c0>
 129d68c: b9801a8a     	ldrsw	x10, [x20, #0x18]
 129d690: b940190b     	ldr	w11, [x8, #0x18]
 129d694: 6b0b015f     	cmp	w10, w11
 129d698: 54000122     	b.hs	0x129d6bc <__start_il2cpp+0xf5ef8>
 129d69c: 1100054b     	add	w11, w10, #0x1
 129d6a0: 8b0a090a     	add	x10, x8, x10, lsl #2
 129d6a4: b9001a8b     	str	w11, [x20, #0x18]
 129d6a8: b9002156     	str	w22, [x10, #0x20]
 129d6ac: b9401e8a     	ldr	w10, [x20, #0x1c]
 129d6b0: 1100054a     	add	w10, w10, #0x1
 129d6b4: b9001e8a     	str	w10, [x20, #0x1c]
 129d6b8: 1400000e     	b	0x129d6f0 <__start_il2cpp+0xf5f2c>
 129d6bc: f9401128     	ldr	x8, [x9, #0x20]
 129d6c0: 52993fe1     	mov	w1, #0xc9ff             // =51711
 129d6c4: 72a77341     	movk	w1, #0x3b9a, lsl #16
 129d6c8: aa1403e0     	mov	x0, x20
 129d6cc: f9406108     	ldr	x8, [x8, #0xc0]
 129d6d0: f9403902     	ldr	x2, [x8, #0x70]
 129d6d4: 94190ab6     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 129d6d8: b9401e8a     	ldr	w10, [x20, #0x1c]
 129d6dc: f9400a88     	ldr	x8, [x20, #0x10]
 129d6e0: f94002a9     	ldr	x9, [x21]
 129d6e4: 1100054a     	add	w10, w10, #0x1
 129d6e8: b9001e8a     	str	w10, [x20, #0x1c]
 129d6ec: b4000cc8     	cbz	x8, 0x129d884 <__start_il2cpp+0xf60c0>
 129d6f0: b9801a8a     	ldrsw	x10, [x20, #0x18]
 129d6f4: b940190b     	ldr	w11, [x8, #0x18]
 129d6f8: 6b0b015f     	cmp	w10, w11
 129d6fc: 54000122     	b.hs	0x129d720 <__start_il2cpp+0xf5f5c>
 129d700: 1100054b     	add	w11, w10, #0x1
 129d704: 8b0a090a     	add	x10, x8, x10, lsl #2
 129d708: b9001a8b     	str	w11, [x20, #0x18]
 129d70c: b9002156     	str	w22, [x10, #0x20]
 129d710: b9401e8a     	ldr	w10, [x20, #0x1c]
 129d714: 1100054a     	add	w10, w10, #0x1
 129d718: b9001e8a     	str	w10, [x20, #0x1c]
 129d71c: 1400000e     	b	0x129d754 <__start_il2cpp+0xf5f90>
 129d720: f9401128     	ldr	x8, [x9, #0x20]
 129d724: 52993fe1     	mov	w1, #0xc9ff             // =51711
 129d728: 72a77341     	movk	w1, #0x3b9a, lsl #16
 129d72c: aa1403e0     	mov	x0, x20
 129d730: f9406108     	ldr	x8, [x8, #0xc0]
 129d734: f9403902     	ldr	x2, [x8, #0x70]
 129d738: 94190a9d     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 129d73c: b9401e8a     	ldr	w10, [x20, #0x1c]
 129d740: f9400a88     	ldr	x8, [x20, #0x10]
 129d744: f94002a9     	ldr	x9, [x21]
 129d748: 1100054a     	add	w10, w10, #0x1
 129d74c: b9001e8a     	str	w10, [x20, #0x1c]
 129d750: b40009a8     	cbz	x8, 0x129d884 <__start_il2cpp+0xf60c0>
 129d754: b9801a8a     	ldrsw	x10, [x20, #0x18]
 129d758: b940190b     	ldr	w11, [x8, #0x18]
 129d75c: 6b0b015f     	cmp	w10, w11
 129d760: 54000142     	b.hs	0x129d788 <__start_il2cpp+0xf5fc4>
 129d764: 1100054b     	add	w11, w10, #0x1
 129d768: 8b0a090a     	add	x10, x8, x10, lsl #2
 129d76c: 5281770c     	mov	w12, #0xbb8             // =3000
 129d770: b9001a8b     	str	w11, [x20, #0x18]
 129d774: b900214c     	str	w12, [x10, #0x20]
 129d778: b9401e8a     	ldr	w10, [x20, #0x1c]
 129d77c: 1100054a     	add	w10, w10, #0x1
 129d780: b9001e8a     	str	w10, [x20, #0x1c]
 129d784: 1400000d     	b	0x129d7b8 <__start_il2cpp+0xf5ff4>
 129d788: f9401128     	ldr	x8, [x9, #0x20]
 129d78c: 52817701     	mov	w1, #0xbb8              // =3000
 129d790: aa1403e0     	mov	x0, x20
 129d794: f9406108     	ldr	x8, [x8, #0xc0]
 129d798: f9403902     	ldr	x2, [x8, #0x70]
 129d79c: 94190a84     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 129d7a0: b9401e8a     	ldr	w10, [x20, #0x1c]
 129d7a4: f9400a88     	ldr	x8, [x20, #0x10]
 129d7a8: f94002a9     	ldr	x9, [x21]
 129d7ac: 1100054a     	add	w10, w10, #0x1
 129d7b0: b9001e8a     	str	w10, [x20, #0x1c]
 129d7b4: b4000688     	cbz	x8, 0x129d884 <__start_il2cpp+0xf60c0>
 129d7b8: b9801a8a     	ldrsw	x10, [x20, #0x18]
 129d7bc: b940190b     	ldr	w11, [x8, #0x18]
 129d7c0: 6b0b015f     	cmp	w10, w11
 129d7c4: 54000142     	b.hs	0x129d7ec <__start_il2cpp+0xf6028>
 129d7c8: 1100054b     	add	w11, w10, #0x1
 129d7cc: 8b0a090a     	add	x10, x8, x10, lsl #2
 129d7d0: 5281388c     	mov	w12, #0x9c4             // =2500
 129d7d4: b9001a8b     	str	w11, [x20, #0x18]
 129d7d8: b900214c     	str	w12, [x10, #0x20]
 129d7dc: b9401e8a     	ldr	w10, [x20, #0x1c]
 129d7e0: 1100054a     	add	w10, w10, #0x1
 129d7e4: b9001e8a     	str	w10, [x20, #0x1c]
 129d7e8: 1400000d     	b	0x129d81c <__start_il2cpp+0xf6058>
 129d7ec: f9401128     	ldr	x8, [x9, #0x20]
 129d7f0: 52813881     	mov	w1, #0x9c4              // =2500
 129d7f4: aa1403e0     	mov	x0, x20
 129d7f8: f9406108     	ldr	x8, [x8, #0xc0]
 129d7fc: f9403902     	ldr	x2, [x8, #0x70]
 129d800: 94190a6b     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 129d804: b9401e8a     	ldr	w10, [x20, #0x1c]
 129d808: f9400a88     	ldr	x8, [x20, #0x10]
 129d80c: f94002a9     	ldr	x9, [x21]
 129d810: 1100054a     	add	w10, w10, #0x1
 129d814: b9001e8a     	str	w10, [x20, #0x1c]
 129d818: b4000368     	cbz	x8, 0x129d884 <__start_il2cpp+0xf60c0>
 129d81c: b9801a8a     	ldrsw	x10, [x20, #0x18]
 129d820: b940190b     	ldr	w11, [x8, #0x18]
 129d824: 6b0b015f     	cmp	w10, w11
 129d828: 540000e2     	b.hs	0x129d844 <__start_il2cpp+0xf6080>
 129d82c: 11000549     	add	w9, w10, #0x1
 129d830: 8b0a0908     	add	x8, x8, x10, lsl #2
 129d834: 5280fa0a     	mov	w10, #0x7d0             // =2000
 129d838: b9001a89     	str	w9, [x20, #0x18]
 129d83c: b900210a     	str	w10, [x8, #0x20]
 129d840: 14000007     	b	0x129d85c <__start_il2cpp+0xf6098>
 129d844: f9401128     	ldr	x8, [x9, #0x20]
 129d848: 5280fa01     	mov	w1, #0x7d0              // =2000
 129d84c: aa1403e0     	mov	x0, x20
 129d850: f9406108     	ldr	x8, [x8, #0xc0]
 129d854: f9403902     	ldr	x2, [x8, #0x70]
 129d858: 94190a55     	bl	0x18e01ac <__start_il2cpp+0x7389e8>
 129d85c: 52800028     	mov	w8, #0x1                // =1
 129d860: f9001a74     	str	x20, [x19, #0x30]
 129d864: 39004268     	strb	w8, [x19, #0x10]
 129d868: aa1303e0     	mov	x0, x19
 129d86c: a9434ff4     	ldp	x20, x19, [sp, #0x30]
 129d870: a94257f6     	ldp	x22, x21, [sp, #0x20]
 129d874: a9415ff8     	ldp	x24, x23, [sp, #0x10]
 129d878: aa1f03e1     	mov	x1, xzr
 129d87c: f84407fe     	ldr	x30, [sp], #0x40
 129d880: 143122e1     	b	0x1ee6404 <__start_il2cpp+0xd3ec40>
 129d884: 97f88a1f     	bl	0x10c0100 <CloseNLSocket+0x638>
