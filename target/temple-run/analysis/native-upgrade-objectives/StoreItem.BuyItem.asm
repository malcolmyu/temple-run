
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12d4f60: d10183ff     	sub	sp, sp, #0x60
 12d4f64: a9016ffe     	stp	x30, x27, [sp, #0x10]
 12d4f68: a90267fa     	stp	x26, x25, [sp, #0x20]
 12d4f6c: a9035ff8     	stp	x24, x23, [sp, #0x30]
 12d4f70: a90457f6     	stp	x22, x21, [sp, #0x40]
 12d4f74: a9054ff4     	stp	x20, x19, [sp, #0x50]
 12d4f78: b000bb14     	adrp	x20, 0x2a35000
 12d4f7c: 396a8688     	ldrb	w8, [x20, #0xaa1]
 12d4f80: aa0003f3     	mov	x19, x0
 12d4f84: 37001808     	tbnz	w8, #0x0, 0x12d5284 <__start_il2cpp+0x12dac0>
 12d4f88: b000ac40     	adrp	x0, 0x285d000
 12d4f8c: f943dc00     	ldr	x0, [x0, #0x7b8]
 12d4f90: 97f7abd2     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d4f94: d000ac60     	adrp	x0, 0x2862000
 12d4f98: f942c800     	ldr	x0, [x0, #0x590]
 12d4f9c: 97f7abcf     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d4fa0: b000ac80     	adrp	x0, 0x2865000
 12d4fa4: f941b800     	ldr	x0, [x0, #0x370]
 12d4fa8: 97f7abcc     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d4fac: b000ac80     	adrp	x0, 0x2865000
 12d4fb0: f9441400     	ldr	x0, [x0, #0x828]
 12d4fb4: 97f7abc9     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d4fb8: b000ac80     	adrp	x0, 0x2865000
 12d4fbc: f9421800     	ldr	x0, [x0, #0x430]
 12d4fc0: 97f7abc6     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d4fc4: b000ac80     	adrp	x0, 0x2865000
 12d4fc8: f9441800     	ldr	x0, [x0, #0x830]
 12d4fcc: 97f7abc3     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d4fd0: b000ac80     	adrp	x0, 0x2865000
 12d4fd4: f9441c00     	ldr	x0, [x0, #0x838]
 12d4fd8: 97f7abc0     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d4fdc: b000ac80     	adrp	x0, 0x2865000
 12d4fe0: f9442000     	ldr	x0, [x0, #0x840]
 12d4fe4: 97f7abbd     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d4fe8: b000ac80     	adrp	x0, 0x2865000
 12d4fec: f942c400     	ldr	x0, [x0, #0x588]
 12d4ff0: 97f7abba     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d4ff4: b000ac80     	adrp	x0, 0x2865000
 12d4ff8: f9442400     	ldr	x0, [x0, #0x848]
 12d4ffc: 97f7abb7     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d5000: 9000ac80     	adrp	x0, 0x2865000
 12d5004: f9442800     	ldr	x0, [x0, #0x850]
 12d5008: 97f7abb4     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d500c: 9000ac80     	adrp	x0, 0x2865000
 12d5010: f9442c00     	ldr	x0, [x0, #0x858]
 12d5014: 97f7abb1     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d5018: 9000ac80     	adrp	x0, 0x2865000
 12d501c: f942cc00     	ldr	x0, [x0, #0x598]
 12d5020: 97f7abae     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d5024: 9000ac80     	adrp	x0, 0x2865000
 12d5028: f9443000     	ldr	x0, [x0, #0x860]
 12d502c: 97f7abab     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d5030: f000ac60     	adrp	x0, 0x2864000
 12d5034: f9476400     	ldr	x0, [x0, #0xec8]
 12d5038: 97f7aba8     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d503c: 9000ac80     	adrp	x0, 0x2865000
 12d5040: f9443400     	ldr	x0, [x0, #0x868]
 12d5044: 97f7aba5     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d5048: 9000ac80     	adrp	x0, 0x2865000
 12d504c: f9443800     	ldr	x0, [x0, #0x870]
 12d5050: 97f7aba2     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d5054: f000ac60     	adrp	x0, 0x2864000
 12d5058: f9476c00     	ldr	x0, [x0, #0xed8]
 12d505c: 97f7ab9f     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d5060: 9000ac80     	adrp	x0, 0x2865000
 12d5064: f9443c00     	ldr	x0, [x0, #0x878]
 12d5068: 97f7ab9c     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d506c: 9000ac80     	adrp	x0, 0x2865000
 12d5070: f9431400     	ldr	x0, [x0, #0x628]
 12d5074: 97f7ab99     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d5078: 9000ac80     	adrp	x0, 0x2865000
 12d507c: f9444000     	ldr	x0, [x0, #0x880]
 12d5080: 97f7ab96     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d5084: b000ac60     	adrp	x0, 0x2862000
 12d5088: f944bc00     	ldr	x0, [x0, #0x978]
 12d508c: 97f7ab93     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d5090: 9000ac80     	adrp	x0, 0x2865000
 12d5094: f9444400     	ldr	x0, [x0, #0x888]
 12d5098: 97f7ab90     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d509c: f000ac40     	adrp	x0, 0x2860000
 12d50a0: f9436c00     	ldr	x0, [x0, #0x6d8]
 12d50a4: 97f7ab8d     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d50a8: 9000ac80     	adrp	x0, 0x2865000
 12d50ac: f9444800     	ldr	x0, [x0, #0x890]
 12d50b0: 97f7ab8a     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d50b4: 9000ac80     	adrp	x0, 0x2865000
 12d50b8: f9444c00     	ldr	x0, [x0, #0x898]
 12d50bc: 97f7ab87     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d50c0: 9000ac80     	adrp	x0, 0x2865000
 12d50c4: f9445000     	ldr	x0, [x0, #0x8a0]
 12d50c8: 97f7ab84     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d50cc: 9000ac80     	adrp	x0, 0x2865000
 12d50d0: f9445400     	ldr	x0, [x0, #0x8a8]
 12d50d4: 97f7ab81     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d50d8: d000ac60     	adrp	x0, 0x2863000
 12d50dc: f9433400     	ldr	x0, [x0, #0x668]
 12d50e0: 97f7ab7e     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d50e4: 9000ac80     	adrp	x0, 0x2865000
 12d50e8: f9445800     	ldr	x0, [x0, #0x8b0]
 12d50ec: 97f7ab7b     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d50f0: 9000ac80     	adrp	x0, 0x2865000
 12d50f4: f9445c00     	ldr	x0, [x0, #0x8b8]
 12d50f8: 97f7ab78     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d50fc: 9000ac80     	adrp	x0, 0x2865000
 12d5100: f9446000     	ldr	x0, [x0, #0x8c0]
 12d5104: 97f7ab75     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d5108: 9000ac80     	adrp	x0, 0x2865000
 12d510c: f9446400     	ldr	x0, [x0, #0x8c8]
 12d5110: 97f7ab72     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d5114: b000ac60     	adrp	x0, 0x2862000
 12d5118: f944b400     	ldr	x0, [x0, #0x968]
 12d511c: 97f7ab6f     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d5120: 9000ac80     	adrp	x0, 0x2865000
 12d5124: f9446800     	ldr	x0, [x0, #0x8d0]
 12d5128: 97f7ab6c     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d512c: 9000ac80     	adrp	x0, 0x2865000
 12d5130: f9446c00     	ldr	x0, [x0, #0x8d8]
 12d5134: 97f7ab69     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d5138: 9000ac80     	adrp	x0, 0x2865000
 12d513c: f9447000     	ldr	x0, [x0, #0x8e0]
 12d5140: 97f7ab66     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d5144: 9000ac80     	adrp	x0, 0x2865000
 12d5148: f9447400     	ldr	x0, [x0, #0x8e8]
 12d514c: 97f7ab63     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d5150: 9000ac80     	adrp	x0, 0x2865000
 12d5154: f9447800     	ldr	x0, [x0, #0x8f0]
 12d5158: 97f7ab60     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d515c: 9000ac80     	adrp	x0, 0x2865000
 12d5160: f9447c00     	ldr	x0, [x0, #0x8f8]
 12d5164: 97f7ab5d     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d5168: 9000ac80     	adrp	x0, 0x2865000
 12d516c: f9448000     	ldr	x0, [x0, #0x900]
 12d5170: 97f7ab5a     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d5174: d000ac60     	adrp	x0, 0x2863000
 12d5178: f9432000     	ldr	x0, [x0, #0x640]
 12d517c: 97f7ab57     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d5180: 9000ac80     	adrp	x0, 0x2865000
 12d5184: f9448400     	ldr	x0, [x0, #0x908]
 12d5188: 97f7ab54     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d518c: b000ac60     	adrp	x0, 0x2862000
 12d5190: f944c800     	ldr	x0, [x0, #0x990]
 12d5194: 97f7ab51     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d5198: 9000ac80     	adrp	x0, 0x2865000
 12d519c: f9448800     	ldr	x0, [x0, #0x910]
 12d51a0: 97f7ab4e     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d51a4: 9000ac80     	adrp	x0, 0x2865000
 12d51a8: f9448c00     	ldr	x0, [x0, #0x918]
 12d51ac: 97f7ab4b     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d51b0: 9000ac80     	adrp	x0, 0x2865000
 12d51b4: f9449000     	ldr	x0, [x0, #0x920]
 12d51b8: 97f7ab48     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d51bc: 9000ac80     	adrp	x0, 0x2865000
 12d51c0: f9449400     	ldr	x0, [x0, #0x928]
 12d51c4: 97f7ab45     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d51c8: 9000ac80     	adrp	x0, 0x2865000
 12d51cc: f9449800     	ldr	x0, [x0, #0x930]
 12d51d0: 97f7ab42     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d51d4: 9000ac80     	adrp	x0, 0x2865000
 12d51d8: f9449c00     	ldr	x0, [x0, #0x938]
 12d51dc: 97f7ab3f     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d51e0: f000ac60     	adrp	x0, 0x2864000
 12d51e4: f946a400     	ldr	x0, [x0, #0xd48]
 12d51e8: 97f7ab3c     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d51ec: 9000ac80     	adrp	x0, 0x2865000
 12d51f0: f944a000     	ldr	x0, [x0, #0x940]
 12d51f4: 97f7ab39     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d51f8: 9000ac80     	adrp	x0, 0x2865000
 12d51fc: f944a400     	ldr	x0, [x0, #0x948]
 12d5200: 97f7ab36     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d5204: b000ac60     	adrp	x0, 0x2862000
 12d5208: f944b000     	ldr	x0, [x0, #0x960]
 12d520c: 97f7ab33     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d5210: 9000ac80     	adrp	x0, 0x2865000
 12d5214: f944a800     	ldr	x0, [x0, #0x950]
 12d5218: 97f7ab30     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d521c: 9000ac80     	adrp	x0, 0x2865000
 12d5220: f944ac00     	ldr	x0, [x0, #0x958]
 12d5224: 97f7ab2d     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d5228: f000ac60     	adrp	x0, 0x2864000
 12d522c: f942cc00     	ldr	x0, [x0, #0x598]
 12d5230: 97f7ab2a     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d5234: f000ac60     	adrp	x0, 0x2864000
 12d5238: f9479800     	ldr	x0, [x0, #0xf30]
 12d523c: 97f7ab27     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d5240: 9000ac80     	adrp	x0, 0x2865000
 12d5244: f944b000     	ldr	x0, [x0, #0x960]
 12d5248: 97f7ab24     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d524c: 9000ac80     	adrp	x0, 0x2865000
 12d5250: f944b400     	ldr	x0, [x0, #0x968]
 12d5254: 97f7ab21     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d5258: 9000ac80     	adrp	x0, 0x2865000
 12d525c: f944b800     	ldr	x0, [x0, #0x970]
 12d5260: 97f7ab1e     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d5264: f000ac60     	adrp	x0, 0x2864000
 12d5268: f946a800     	ldr	x0, [x0, #0xd50]
 12d526c: 97f7ab1b     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d5270: 9000ac80     	adrp	x0, 0x2865000
 12d5274: f944bc00     	ldr	x0, [x0, #0x978]
 12d5278: 97f7ab18     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12d527c: 52800028     	mov	w8, #0x1                // =1
 12d5280: 392a8688     	strb	w8, [x20, #0xaa1]
 12d5284: b9000fff     	str	wzr, [sp, #0xc]
 12d5288: aa1303f6     	mov	x22, x19
 12d528c: f84a8ed4     	ldr	x20, [x22, #0xa8]!
 12d5290: f85f82c0     	ldur	x0, [x22, #-0x8]
 12d5294: b4005d20     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d5298: aa1f03e1     	mov	x1, xzr
 12d529c: 97ff44dc     	bl	0x12a660c <__start_il2cpp+0xfee48>
 12d52a0: b4005cd4     	cbz	x20, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d52a4: 2a0003e1     	mov	w1, w0
 12d52a8: aa1403e0     	mov	x0, x20
 12d52ac: aa1f03e2     	mov	x2, xzr
 12d52b0: 97fee504     	bl	0x128e6c0 <__start_il2cpp+0xe6efc>
 12d52b4: b9402a68     	ldr	w8, [x19, #0x28]
 12d52b8: 6b080014     	subs	w20, w0, w8
 12d52bc: 540008ea     	b.ge	0x12d53d8 <__start_il2cpp+0x12dc14>
 12d52c0: 9000ac88     	adrp	x8, 0x2865000
 12d52c4: f9404e74     	ldr	x20, [x19, #0x98]
 12d52c8: f9444108     	ldr	x8, [x8, #0x880]
 12d52cc: 2a1f03e1     	mov	w1, wzr
 12d52d0: aa1f03e2     	mov	x2, xzr
 12d52d4: f9400100     	ldr	x0, [x8]
 12d52d8: 94005664     	bl	0x12eac68 <__start_il2cpp+0x1434a4>
 12d52dc: 9000ac88     	adrp	x8, 0x2865000
 12d52e0: f944a108     	ldr	x8, [x8, #0x940]
 12d52e4: aa0003f5     	mov	x21, x0
 12d52e8: 2a1f03e1     	mov	w1, wzr
 12d52ec: aa1f03e2     	mov	x2, xzr
 12d52f0: f9400108     	ldr	x8, [x8]
 12d52f4: aa0803e0     	mov	x0, x8
 12d52f8: 9400565c     	bl	0x12eac68 <__start_il2cpp+0x1434a4>
 12d52fc: f000ac68     	adrp	x8, 0x2864000
 12d5300: f946a908     	ldr	x8, [x8, #0xd50]
 12d5304: aa0003f6     	mov	x22, x0
 12d5308: 2a1f03e1     	mov	w1, wzr
 12d530c: aa1f03e2     	mov	x2, xzr
 12d5310: f9400108     	ldr	x8, [x8]
 12d5314: aa0803e0     	mov	x0, x8
 12d5318: 94005654     	bl	0x12eac68 <__start_il2cpp+0x1434a4>
 12d531c: f000ac68     	adrp	x8, 0x2864000
 12d5320: f946a508     	ldr	x8, [x8, #0xd48]
 12d5324: aa0003f7     	mov	x23, x0
 12d5328: 2a1f03e1     	mov	w1, wzr
 12d532c: aa1f03e2     	mov	x2, xzr
 12d5330: f9400108     	ldr	x8, [x8]
 12d5334: aa0803e0     	mov	x0, x8
 12d5338: 9400564c     	bl	0x12eac68 <__start_il2cpp+0x1434a4>
 12d533c: 9000ac88     	adrp	x8, 0x2865000
 12d5340: f9421908     	ldr	x8, [x8, #0x430]
 12d5344: 9000ac5b     	adrp	x27, 0x285d000
 12d5348: aa0003f8     	mov	x24, x0
 12d534c: f9400108     	ldr	x8, [x8]
 12d5350: f9405d08     	ldr	x8, [x8, #0xb8]
 12d5354: f943df7b     	ldr	x27, [x27, #0x7b8]
 12d5358: f940011a     	ldr	x26, [x8]
 12d535c: f9400368     	ldr	x8, [x27]
 12d5360: aa0803e0     	mov	x0, x8
 12d5364: 97f7ab64     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12d5368: 9000ac88     	adrp	x8, 0x2865000
 12d536c: f9441508     	ldr	x8, [x8, #0x828]
 12d5370: aa1a03e1     	mov	x1, x26
 12d5374: aa1f03e3     	mov	x3, xzr
 12d5378: aa0003f9     	mov	x25, x0
 12d537c: f9400102     	ldr	x2, [x8]
 12d5380: 942d4bd4     	bl	0x1e282d0 <__start_il2cpp+0xc80b0c>
 12d5384: f9400360     	ldr	x0, [x27]
 12d5388: 97f7ab5b     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12d538c: 9000ac88     	adrp	x8, 0x2865000
 12d5390: f9441908     	ldr	x8, [x8, #0x830]
 12d5394: aa1303e1     	mov	x1, x19
 12d5398: aa1f03e3     	mov	x3, xzr
 12d539c: aa0003fa     	mov	x26, x0
 12d53a0: f9400102     	ldr	x2, [x8]
 12d53a4: 942d4bcb     	bl	0x1e282d0 <__start_il2cpp+0xc80b0c>
 12d53a8: b4005494     	cbz	x20, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d53ac: 52800027     	mov	w7, #0x1                // =1
 12d53b0: aa1403e0     	mov	x0, x20
 12d53b4: aa1503e1     	mov	x1, x21
 12d53b8: aa1603e2     	mov	x2, x22
 12d53bc: aa1703e3     	mov	x3, x23
 12d53c0: aa1803e4     	mov	x4, x24
 12d53c4: aa1903e5     	mov	x5, x25
 12d53c8: aa1a03e6     	mov	x6, x26
 12d53cc: f90003ff     	str	xzr, [sp]
 12d53d0: 97ff49f8     	bl	0x12a7bb0 <__start_il2cpp+0x1003ec>
 12d53d4: 14000292     	b	0x12d5e1c <__start_il2cpp+0x12e658>
 12d53d8: f9405260     	ldr	x0, [x19, #0xa0]
 12d53dc: b40052e0     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d53e0: f9405675     	ldr	x21, [x19, #0xa8]
 12d53e4: aa1f03e1     	mov	x1, xzr
 12d53e8: 97ff4489     	bl	0x12a660c <__start_il2cpp+0xfee48>
 12d53ec: b4005275     	cbz	x21, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d53f0: 2a0003e1     	mov	w1, w0
 12d53f4: aa1503e0     	mov	x0, x21
 12d53f8: 2a1403e2     	mov	w2, w20
 12d53fc: aa1f03e3     	mov	x3, xzr
 12d5400: 97fee4b6     	bl	0x128e6d8 <__start_il2cpp+0xe6f14>
 12d5404: f9405260     	ldr	x0, [x19, #0xa0]
 12d5408: b4005180     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d540c: f9405674     	ldr	x20, [x19, #0xa8]
 12d5410: aa1f03e1     	mov	x1, xzr
 12d5414: 97ff447e     	bl	0x12a660c <__start_il2cpp+0xfee48>
 12d5418: b4005114     	cbz	x20, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d541c: b9402262     	ldr	w2, [x19, #0x20]
 12d5420: 2a0003e1     	mov	w1, w0
 12d5424: aa1403e0     	mov	x0, x20
 12d5428: aa1f03e3     	mov	x3, xzr
 12d542c: 97fee04f     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 12d5430: b9402268     	ldr	w8, [x19, #0x20]
 12d5434: 2a0003f4     	mov	w20, w0
 12d5438: 51001509     	sub	w9, w8, #0x5
 12d543c: 71000d3f     	cmp	w9, #0x3
 12d5440: 54000082     	b.hs	0x12d5450 <__start_il2cpp+0x12dc8c>
 12d5444: 71001e9f     	cmp	w20, #0x7
 12d5448: 540000ca     	b.ge	0x12d5460 <__start_il2cpp+0x12dc9c>
 12d544c: 1400001b     	b	0x12d54b8 <__start_il2cpp+0x12dcf4>
 12d5450: 71001e9f     	cmp	w20, #0x7
 12d5454: 5400032b     	b.lt	0x12d54b8 <__start_il2cpp+0x12dcf4>
 12d5458: 7100251f     	cmp	w8, #0x9
 12d545c: 540002e1     	b.ne	0x12d54b8 <__start_il2cpp+0x12dcf4>
 12d5460: f9405260     	ldr	x0, [x19, #0xa0]
 12d5464: b4004ea0     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d5468: f9405675     	ldr	x21, [x19, #0xa8]
 12d546c: aa1f03e1     	mov	x1, xzr
 12d5470: 97ff4467     	bl	0x12a660c <__start_il2cpp+0xfee48>
 12d5474: b4004e35     	cbz	x21, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d5478: b9402262     	ldr	w2, [x19, #0x20]
 12d547c: 2a0003e1     	mov	w1, w0
 12d5480: 528000c3     	mov	w3, #0x6                // =6
 12d5484: aa1503e0     	mov	x0, x21
 12d5488: aa1f03e4     	mov	x4, xzr
 12d548c: 97fee0cc     	bl	0x128d7bc <__start_il2cpp+0xe5ff8>
 12d5490: b9402268     	ldr	w8, [x19, #0x20]
 12d5494: 7100151f     	cmp	w8, #0x5
 12d5498: 54000500     	b.eq	0x12d5538 <__start_il2cpp+0x12dd74>
 12d549c: 7100191f     	cmp	w8, #0x6
 12d54a0: 54000520     	b.eq	0x12d5544 <__start_il2cpp+0x12dd80>
 12d54a4: 71001d1f     	cmp	w8, #0x7
 12d54a8: 54000541     	b.ne	0x12d5550 <__start_il2cpp+0x12dd8c>
 12d54ac: 9000ac88     	adrp	x8, 0x2865000
 12d54b0: f9445d08     	ldr	x8, [x8, #0x8b8]
 12d54b4: 1400002d     	b	0x12d5568 <__start_il2cpp+0x12dda4>
 12d54b8: f9405260     	ldr	x0, [x19, #0xa0]
 12d54bc: b4004be0     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d54c0: f9405675     	ldr	x21, [x19, #0xa8]
 12d54c4: aa1f03e1     	mov	x1, xzr
 12d54c8: 97ff4451     	bl	0x12a660c <__start_il2cpp+0xfee48>
 12d54cc: b4004b75     	cbz	x21, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d54d0: b9402262     	ldr	w2, [x19, #0x20]
 12d54d4: 2a0003e1     	mov	w1, w0
 12d54d8: 11000683     	add	w3, w20, #0x1
 12d54dc: aa1503e0     	mov	x0, x21
 12d54e0: aa1f03e4     	mov	x4, xzr
 12d54e4: 97fee0b6     	bl	0x128d7bc <__start_il2cpp+0xe5ff8>
 12d54e8: b9402268     	ldr	w8, [x19, #0x20]
 12d54ec: 71001d1f     	cmp	w8, #0x7
 12d54f0: 540000c1     	b.ne	0x12d5508 <__start_il2cpp+0x12dd44>
 12d54f4: 71001a9f     	cmp	w20, #0x6
 12d54f8: 540005c1     	b.ne	0x12d55b0 <__start_il2cpp+0x12ddec>
 12d54fc: 9000ac88     	adrp	x8, 0x2865000
 12d5500: f944a908     	ldr	x8, [x8, #0x950]
 12d5504: 14000023     	b	0x12d5590 <__start_il2cpp+0x12ddcc>
 12d5508: 51001509     	sub	w9, w8, #0x5
 12d550c: 7100093f     	cmp	w9, #0x2
 12d5510: 54000342     	b.hs	0x12d5578 <__start_il2cpp+0x12ddb4>
 12d5514: 71001a9f     	cmp	w20, #0x6
 12d5518: 540004c1     	b.ne	0x12d55b0 <__start_il2cpp+0x12ddec>
 12d551c: 9000ac89     	adrp	x9, 0x2865000
 12d5520: 9000ac8a     	adrp	x10, 0x2865000
 12d5524: f9443d29     	ldr	x9, [x9, #0x878]
 12d5528: f9446d4a     	ldr	x10, [x10, #0x8d8]
 12d552c: 7100151f     	cmp	w8, #0x5
 12d5530: 9a890148     	csel	x8, x10, x9, eq
 12d5534: 14000017     	b	0x12d5590 <__start_il2cpp+0x12ddcc>
 12d5538: 9000ac88     	adrp	x8, 0x2865000
 12d553c: f9449d08     	ldr	x8, [x8, #0x938]
 12d5540: 1400000a     	b	0x12d5568 <__start_il2cpp+0x12dda4>
 12d5544: 9000ac88     	adrp	x8, 0x2865000
 12d5548: f9445508     	ldr	x8, [x8, #0x8a8]
 12d554c: 14000007     	b	0x12d5568 <__start_il2cpp+0x12dda4>
 12d5550: f000ac49     	adrp	x9, 0x2860000
 12d5554: 9000ac8a     	adrp	x10, 0x2865000
 12d5558: f9436d29     	ldr	x9, [x9, #0x6d8]
 12d555c: f944654a     	ldr	x10, [x10, #0x8c8]
 12d5560: 7100251f     	cmp	w8, #0x9
 12d5564: 9a890148     	csel	x8, x10, x9, eq
 12d5568: f9400101     	ldr	x1, [x8]
 12d556c: f94002c0     	ldr	x0, [x22]
 12d5570: b5000160     	cbnz	x0, 0x12d559c <__start_il2cpp+0x12ddd8>
 12d5574: 14000231     	b	0x12d5e38 <__start_il2cpp+0x12e674>
 12d5578: 71001a9f     	cmp	w20, #0x6
 12d557c: 540001a1     	b.ne	0x12d55b0 <__start_il2cpp+0x12ddec>
 12d5580: 7100251f     	cmp	w8, #0x9
 12d5584: 54000161     	b.ne	0x12d55b0 <__start_il2cpp+0x12ddec>
 12d5588: 9000ac88     	adrp	x8, 0x2865000
 12d558c: f944bd08     	ldr	x8, [x8, #0x978]
 12d5590: f94002c0     	ldr	x0, [x22]
 12d5594: b4004520     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d5598: f9400101     	ldr	x1, [x8]
 12d559c: 9000ac88     	adrp	x8, 0x2865000
 12d55a0: f9441d08     	ldr	x8, [x8, #0x838]
 12d55a4: aa1f03e3     	mov	x3, xzr
 12d55a8: f9400102     	ldr	x2, [x8]
 12d55ac: 97fece03     	bl	0x1288db8 <__start_il2cpp+0xe15f4>
 12d55b0: 9000ac88     	adrp	x8, 0x2865000
 12d55b4: f9442d08     	ldr	x8, [x8, #0x858]
 12d55b8: aa1303e0     	mov	x0, x19
 12d55bc: aa1f03e2     	mov	x2, xzr
 12d55c0: f9400101     	ldr	x1, [x8]
 12d55c4: 94478422     	bl	0x24b664c <__start_il2cpp+0x130ee88>
 12d55c8: f9405660     	ldr	x0, [x19, #0xa8]
 12d55cc: b4004360     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d55d0: aa1f03e1     	mov	x1, xzr
 12d55d4: 97fee0e8     	bl	0x128d974 <__start_il2cpp+0xe61b0>
 12d55d8: b9402a75     	ldr	w21, [x19, #0x28]
 12d55dc: 710006bf     	cmp	w21, #0x1
 12d55e0: 5400206b     	b.lt	0x12d59ec <__start_il2cpp+0x12e228>
 12d55e4: 11000688     	add	w8, w20, #0x1
 12d55e8: b9000fe8     	str	w8, [sp, #0xc]
 12d55ec: b9402268     	ldr	w8, [x19, #0x20]
 12d55f0: 71008d1f     	cmp	w8, #0x23
 12d55f4: 54001fc8     	b.hi	0x12d59ec <__start_il2cpp+0x12e228>
 12d55f8: d0ff9f09     	adrp	x9, 0x6b7000
 12d55fc: 912cc929     	add	x9, x9, #0xb32
 12d5600: 1000008a     	adr	x10, 0x12d5610 <__start_il2cpp+0x12de4c>
 12d5604: 3868692b     	ldrb	w11, [x9, x8]
 12d5608: 8b0b094a     	add	x10, x10, x11, lsl #2
 12d560c: d61f0140     	br	x10
 12d5610: f94002c0     	ldr	x0, [x22]
 12d5614: b4004120     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d5618: d000ac68     	adrp	x8, 0x2863000
 12d561c: 9000ac89     	adrp	x9, 0x2865000
 12d5620: f9432108     	ldr	x8, [x8, #0x640]
 12d5624: f9444529     	ldr	x9, [x9, #0x888]
 12d5628: 2a1503e1     	mov	w1, w21
 12d562c: aa1f03e4     	mov	x4, xzr
 12d5630: f9400102     	ldr	x2, [x8]
 12d5634: f9400123     	ldr	x3, [x9]
 12d5638: 97fecc59     	bl	0x128879c <__start_il2cpp+0xe0fd8>
 12d563c: f94002c0     	ldr	x0, [x22]
 12d5640: b4003fc0     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d5644: b000ac68     	adrp	x8, 0x2862000
 12d5648: f944b108     	ldr	x8, [x8, #0x960]
 12d564c: 14000030     	b	0x12d570c <__start_il2cpp+0x12df48>
 12d5650: f94002c0     	ldr	x0, [x22]
 12d5654: b4003f20     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d5658: d000ac68     	adrp	x8, 0x2863000
 12d565c: 9000ac89     	adrp	x9, 0x2865000
 12d5660: f9432108     	ldr	x8, [x8, #0x640]
 12d5664: f9442129     	ldr	x9, [x9, #0x840]
 12d5668: 2a1503e1     	mov	w1, w21
 12d566c: aa1f03e4     	mov	x4, xzr
 12d5670: f9400102     	ldr	x2, [x8]
 12d5674: f9400123     	ldr	x3, [x9]
 12d5678: 97fecc49     	bl	0x128879c <__start_il2cpp+0xe0fd8>
 12d567c: f94002c0     	ldr	x0, [x22]
 12d5680: b4003dc0     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d5684: b000ac68     	adrp	x8, 0x2862000
 12d5688: f944bd08     	ldr	x8, [x8, #0x978]
 12d568c: 14000020     	b	0x12d570c <__start_il2cpp+0x12df48>
 12d5690: f94002c0     	ldr	x0, [x22]
 12d5694: b4003d20     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d5698: d000ac68     	adrp	x8, 0x2863000
 12d569c: 9000ac89     	adrp	x9, 0x2865000
 12d56a0: f9432108     	ldr	x8, [x8, #0x640]
 12d56a4: f9449529     	ldr	x9, [x9, #0x928]
 12d56a8: 2a1503e1     	mov	w1, w21
 12d56ac: aa1f03e4     	mov	x4, xzr
 12d56b0: f9400102     	ldr	x2, [x8]
 12d56b4: f9400123     	ldr	x3, [x9]
 12d56b8: 97fecc39     	bl	0x128879c <__start_il2cpp+0xe0fd8>
 12d56bc: f94002c0     	ldr	x0, [x22]
 12d56c0: b4003bc0     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d56c4: b000ac68     	adrp	x8, 0x2862000
 12d56c8: f944c908     	ldr	x8, [x8, #0x990]
 12d56cc: 14000010     	b	0x12d570c <__start_il2cpp+0x12df48>
 12d56d0: f94002c0     	ldr	x0, [x22]
 12d56d4: b4003b20     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d56d8: d000ac68     	adrp	x8, 0x2863000
 12d56dc: 9000ac89     	adrp	x9, 0x2865000
 12d56e0: f9432108     	ldr	x8, [x8, #0x640]
 12d56e4: f9442929     	ldr	x9, [x9, #0x850]
 12d56e8: 2a1503e1     	mov	w1, w21
 12d56ec: aa1f03e4     	mov	x4, xzr
 12d56f0: f9400102     	ldr	x2, [x8]
 12d56f4: f9400123     	ldr	x3, [x9]
 12d56f8: 97fecc29     	bl	0x128879c <__start_il2cpp+0xe0fd8>
 12d56fc: f94002c0     	ldr	x0, [x22]
 12d5700: b40039c0     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d5704: b000ac68     	adrp	x8, 0x2862000
 12d5708: f944b508     	ldr	x8, [x8, #0x968]
 12d570c: d000ac69     	adrp	x9, 0x2863000
 12d5710: f9433529     	ldr	x9, [x9, #0x668]
 12d5714: f9400102     	ldr	x2, [x8]
 12d5718: 52800021     	mov	w1, #0x1                // =1
 12d571c: aa1f03e4     	mov	x4, xzr
 12d5720: f9400123     	ldr	x3, [x9]
 12d5724: 97fecb85     	bl	0x1288538 <__start_il2cpp+0xe0d74>
 12d5728: 140000b1     	b	0x12d59ec <__start_il2cpp+0x12e228>
 12d572c: f94002d6     	ldr	x22, [x22]
 12d5730: 910033e0     	add	x0, sp, #0xc
 12d5734: aa1f03e1     	mov	x1, xzr
 12d5738: 942f32f7     	bl	0x1ea2314 <__start_il2cpp+0xcfab50>
 12d573c: 9000ac88     	adrp	x8, 0x2865000
 12d5740: f9448108     	ldr	x8, [x8, #0x900]
 12d5744: 1400001c     	b	0x12d57b4 <__start_il2cpp+0x12dff0>
 12d5748: f94002d6     	ldr	x22, [x22]
 12d574c: 910033e0     	add	x0, sp, #0xc
 12d5750: aa1f03e1     	mov	x1, xzr
 12d5754: 942f32f0     	bl	0x1ea2314 <__start_il2cpp+0xcfab50>
 12d5758: 9000ac88     	adrp	x8, 0x2865000
 12d575c: f9443908     	ldr	x8, [x8, #0x870]
 12d5760: 14000015     	b	0x12d57b4 <__start_il2cpp+0x12dff0>
 12d5764: f94002d6     	ldr	x22, [x22]
 12d5768: 910033e0     	add	x0, sp, #0xc
 12d576c: aa1f03e1     	mov	x1, xzr
 12d5770: 942f32e9     	bl	0x1ea2314 <__start_il2cpp+0xcfab50>
 12d5774: 9000ac88     	adrp	x8, 0x2865000
 12d5778: f944a508     	ldr	x8, [x8, #0x948]
 12d577c: 1400000e     	b	0x12d57b4 <__start_il2cpp+0x12dff0>
 12d5780: f94002d6     	ldr	x22, [x22]
 12d5784: 910033e0     	add	x0, sp, #0xc
 12d5788: aa1f03e1     	mov	x1, xzr
 12d578c: 942f32e2     	bl	0x1ea2314 <__start_il2cpp+0xcfab50>
 12d5790: 9000ac88     	adrp	x8, 0x2865000
 12d5794: f9446908     	ldr	x8, [x8, #0x8d0]
 12d5798: 14000007     	b	0x12d57b4 <__start_il2cpp+0x12dff0>
 12d579c: f94002d6     	ldr	x22, [x22]
 12d57a0: 910033e0     	add	x0, sp, #0xc
 12d57a4: aa1f03e1     	mov	x1, xzr
 12d57a8: 942f32db     	bl	0x1ea2314 <__start_il2cpp+0xcfab50>
 12d57ac: 9000ac88     	adrp	x8, 0x2865000
 12d57b0: f944b908     	ldr	x8, [x8, #0x970]
 12d57b4: f9400108     	ldr	x8, [x8]
 12d57b8: aa0003e1     	mov	x1, x0
 12d57bc: aa1f03e2     	mov	x2, xzr
 12d57c0: aa0803e0     	mov	x0, x8
 12d57c4: 942995b6     	bl	0x1d3ae9c <__start_il2cpp+0xb936d8>
 12d57c8: b4003396     	cbz	x22, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d57cc: d000ac68     	adrp	x8, 0x2863000
 12d57d0: f9432108     	ldr	x8, [x8, #0x640]
 12d57d4: aa0003e3     	mov	x3, x0
 12d57d8: aa1603e0     	mov	x0, x22
 12d57dc: f9400102     	ldr	x2, [x8]
 12d57e0: 14000080     	b	0x12d59e0 <__start_il2cpp+0x12e21c>
 12d57e4: f94002c0     	ldr	x0, [x22]
 12d57e8: b4003280     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d57ec: d000ac68     	adrp	x8, 0x2863000
 12d57f0: 9000ac89     	adrp	x9, 0x2865000
 12d57f4: f9432108     	ldr	x8, [x8, #0x640]
 12d57f8: f9445929     	ldr	x9, [x9, #0x8b0]
 12d57fc: 14000077     	b	0x12d59d8 <__start_il2cpp+0x12e214>
 12d5800: f94002c0     	ldr	x0, [x22]
 12d5804: b40031a0     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d5808: d000ac68     	adrp	x8, 0x2863000
 12d580c: 9000ac89     	adrp	x9, 0x2865000
 12d5810: f9432108     	ldr	x8, [x8, #0x640]
 12d5814: f944b529     	ldr	x9, [x9, #0x968]
 12d5818: 14000070     	b	0x12d59d8 <__start_il2cpp+0x12e214>
 12d581c: f94002c0     	ldr	x0, [x22]
 12d5820: b40030c0     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d5824: d000ac68     	adrp	x8, 0x2863000
 12d5828: 9000ac89     	adrp	x9, 0x2865000
 12d582c: f9432108     	ldr	x8, [x8, #0x640]
 12d5830: f9445129     	ldr	x9, [x9, #0x8a0]
 12d5834: 14000069     	b	0x12d59d8 <__start_il2cpp+0x12e214>
 12d5838: f94002c0     	ldr	x0, [x22]
 12d583c: b4002fe0     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d5840: d000ac68     	adrp	x8, 0x2863000
 12d5844: 9000ac89     	adrp	x9, 0x2865000
 12d5848: f9432108     	ldr	x8, [x8, #0x640]
 12d584c: f9442529     	ldr	x9, [x9, #0x848]
 12d5850: 14000062     	b	0x12d59d8 <__start_il2cpp+0x12e214>
 12d5854: f94002c0     	ldr	x0, [x22]
 12d5858: b4002f00     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d585c: d000ac68     	adrp	x8, 0x2863000
 12d5860: 9000ac89     	adrp	x9, 0x2865000
 12d5864: f9432108     	ldr	x8, [x8, #0x640]
 12d5868: f9444929     	ldr	x9, [x9, #0x890]
 12d586c: 1400005b     	b	0x12d59d8 <__start_il2cpp+0x12e214>
 12d5870: f94002c0     	ldr	x0, [x22]
 12d5874: b4002e20     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d5878: d000ac68     	adrp	x8, 0x2863000
 12d587c: 9000ac89     	adrp	x9, 0x2865000
 12d5880: f9432108     	ldr	x8, [x8, #0x640]
 12d5884: f9448929     	ldr	x9, [x9, #0x910]
 12d5888: 14000054     	b	0x12d59d8 <__start_il2cpp+0x12e214>
 12d588c: f94002c0     	ldr	x0, [x22]
 12d5890: b4002d40     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d5894: d000ac68     	adrp	x8, 0x2863000
 12d5898: 9000ac89     	adrp	x9, 0x2865000
 12d589c: f9432108     	ldr	x8, [x8, #0x640]
 12d58a0: f9444d29     	ldr	x9, [x9, #0x898]
 12d58a4: 1400004d     	b	0x12d59d8 <__start_il2cpp+0x12e214>
 12d58a8: f94002c0     	ldr	x0, [x22]
 12d58ac: b4002c60     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d58b0: d000ac68     	adrp	x8, 0x2863000
 12d58b4: 9000ac89     	adrp	x9, 0x2865000
 12d58b8: f9432108     	ldr	x8, [x8, #0x640]
 12d58bc: f9448d29     	ldr	x9, [x9, #0x918]
 12d58c0: 14000046     	b	0x12d59d8 <__start_il2cpp+0x12e214>
 12d58c4: f94002c0     	ldr	x0, [x22]
 12d58c8: b4002b80     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d58cc: d000ac68     	adrp	x8, 0x2863000
 12d58d0: 9000ac89     	adrp	x9, 0x2865000
 12d58d4: f9432108     	ldr	x8, [x8, #0x640]
 12d58d8: f944b129     	ldr	x9, [x9, #0x960]
 12d58dc: 1400003f     	b	0x12d59d8 <__start_il2cpp+0x12e214>
 12d58e0: f94002c0     	ldr	x0, [x22]
 12d58e4: b4002aa0     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d58e8: d000ac68     	adrp	x8, 0x2863000
 12d58ec: 9000ac89     	adrp	x9, 0x2865000
 12d58f0: f9432108     	ldr	x8, [x8, #0x640]
 12d58f4: f9447529     	ldr	x9, [x9, #0x8e8]
 12d58f8: 14000038     	b	0x12d59d8 <__start_il2cpp+0x12e214>
 12d58fc: f94002c0     	ldr	x0, [x22]
 12d5900: b40029c0     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d5904: d000ac68     	adrp	x8, 0x2863000
 12d5908: 9000ac89     	adrp	x9, 0x2865000
 12d590c: f9432108     	ldr	x8, [x8, #0x640]
 12d5910: f9443529     	ldr	x9, [x9, #0x868]
 12d5914: 14000031     	b	0x12d59d8 <__start_il2cpp+0x12e214>
 12d5918: f94002c0     	ldr	x0, [x22]
 12d591c: b40028e0     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d5920: d000ac68     	adrp	x8, 0x2863000
 12d5924: 9000ac89     	adrp	x9, 0x2865000
 12d5928: f9432108     	ldr	x8, [x8, #0x640]
 12d592c: f9446129     	ldr	x9, [x9, #0x8c0]
 12d5930: 1400002a     	b	0x12d59d8 <__start_il2cpp+0x12e214>
 12d5934: f94002c0     	ldr	x0, [x22]
 12d5938: b4002800     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d593c: d000ac68     	adrp	x8, 0x2863000
 12d5940: 9000ac89     	adrp	x9, 0x2865000
 12d5944: f9432108     	ldr	x8, [x8, #0x640]
 12d5948: f9447d29     	ldr	x9, [x9, #0x8f8]
 12d594c: 14000023     	b	0x12d59d8 <__start_il2cpp+0x12e214>
 12d5950: f94002c0     	ldr	x0, [x22]
 12d5954: b4002720     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d5958: d000ac68     	adrp	x8, 0x2863000
 12d595c: 9000ac89     	adrp	x9, 0x2865000
 12d5960: f9432108     	ldr	x8, [x8, #0x640]
 12d5964: f9449129     	ldr	x9, [x9, #0x920]
 12d5968: 1400001c     	b	0x12d59d8 <__start_il2cpp+0x12e214>
 12d596c: f94002c0     	ldr	x0, [x22]
 12d5970: b4002640     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d5974: d000ac68     	adrp	x8, 0x2863000
 12d5978: 9000ac89     	adrp	x9, 0x2865000
 12d597c: f9432108     	ldr	x8, [x8, #0x640]
 12d5980: f9447929     	ldr	x9, [x9, #0x8f0]
 12d5984: 14000015     	b	0x12d59d8 <__start_il2cpp+0x12e214>
 12d5988: f94002c0     	ldr	x0, [x22]
 12d598c: b4002560     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d5990: d000ac68     	adrp	x8, 0x2863000
 12d5994: 9000ac89     	adrp	x9, 0x2865000
 12d5998: f9432108     	ldr	x8, [x8, #0x640]
 12d599c: f9449929     	ldr	x9, [x9, #0x930]
 12d59a0: 1400000e     	b	0x12d59d8 <__start_il2cpp+0x12e214>
 12d59a4: f94002c0     	ldr	x0, [x22]
 12d59a8: b4002480     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d59ac: d000ac68     	adrp	x8, 0x2863000
 12d59b0: 9000ac89     	adrp	x9, 0x2865000
 12d59b4: f9432108     	ldr	x8, [x8, #0x640]
 12d59b8: f9447129     	ldr	x9, [x9, #0x8e0]
 12d59bc: 14000007     	b	0x12d59d8 <__start_il2cpp+0x12e214>
 12d59c0: f94002c0     	ldr	x0, [x22]
 12d59c4: b40023a0     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d59c8: d000ac68     	adrp	x8, 0x2863000
 12d59cc: 9000ac89     	adrp	x9, 0x2865000
 12d59d0: f9432108     	ldr	x8, [x8, #0x640]
 12d59d4: f9448529     	ldr	x9, [x9, #0x908]
 12d59d8: f9400102     	ldr	x2, [x8]
 12d59dc: f9400123     	ldr	x3, [x9]
 12d59e0: 2a1503e1     	mov	w1, w21
 12d59e4: aa1f03e4     	mov	x4, xzr
 12d59e8: 97fecb6d     	bl	0x128879c <__start_il2cpp+0xe0fd8>
 12d59ec: 52800488     	mov	w8, #0x24               // =36
 12d59f0: 2f00e5e0     	movi	d0, #0x000000ffffffff
 12d59f4: aa1303e0     	mov	x0, x19
 12d59f8: b900ba68     	str	w8, [x19, #0xb8]
 12d59fc: fd005a60     	str	d0, [x19, #0xb0]
 12d5a00: 97fff70e     	bl	0x12d3638 <__start_il2cpp+0x12be74>
 12d5a04: b000ac68     	adrp	x8, 0x2862000
 12d5a08: f942c908     	ldr	x8, [x8, #0x590]
 12d5a0c: f9400108     	ldr	x8, [x8]
 12d5a10: f9405d08     	ldr	x8, [x8, #0xb8]
 12d5a14: f9400100     	ldr	x0, [x8]
 12d5a18: b4002100     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d5a1c: 1e2e1000     	fmov	s0, #1.00000000
 12d5a20: 528000a1     	mov	w1, #0x5                // =5
 12d5a24: aa1f03e2     	mov	x2, xzr
 12d5a28: 97fefee5     	bl	0x12955bc <__start_il2cpp+0xeddf8>
 12d5a2c: b9402268     	ldr	w8, [x19, #0x20]
 12d5a30: 2a140109     	orr	w9, w8, w20
 12d5a34: 34000069     	cbz	w9, 0x12d5a40 <__start_il2cpp+0x12e27c>
 12d5a38: 34000794     	cbz	w20, 0x12d5b28 <__start_il2cpp+0x12e364>
 12d5a3c: 14000076     	b	0x12d5c14 <__start_il2cpp+0x12e450>
 12d5a40: 9000ac98     	adrp	x24, 0x2865000
 12d5a44: f9421b18     	ldr	x24, [x24, #0x430]
 12d5a48: f9400308     	ldr	x8, [x24]
 12d5a4c: f9405d08     	ldr	x8, [x8, #0xb8]
 12d5a50: f9400100     	ldr	x0, [x8]
 12d5a54: b4001f20     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d5a58: aa1f03e1     	mov	x1, xzr
 12d5a5c: 97ff8719     	bl	0x12b76c0 <__start_il2cpp+0x10fefc>
 12d5a60: f000ac68     	adrp	x8, 0x2864000
 12d5a64: f9404e75     	ldr	x21, [x19, #0x98]
 12d5a68: f9476d08     	ldr	x8, [x8, #0xed8]
 12d5a6c: 2a1f03e1     	mov	w1, wzr
 12d5a70: aa1f03e2     	mov	x2, xzr
 12d5a74: f9400100     	ldr	x0, [x8]
 12d5a78: 9400547c     	bl	0x12eac68 <__start_il2cpp+0x1434a4>
 12d5a7c: 9000ac88     	adrp	x8, 0x2865000
 12d5a80: f942c508     	ldr	x8, [x8, #0x588]
 12d5a84: aa0003f6     	mov	x22, x0
 12d5a88: 2a1f03e1     	mov	w1, wzr
 12d5a8c: aa1f03e2     	mov	x2, xzr
 12d5a90: f9400108     	ldr	x8, [x8]
 12d5a94: aa0803e0     	mov	x0, x8
 12d5a98: 94005474     	bl	0x12eac68 <__start_il2cpp+0x1434a4>
 12d5a9c: f000ac68     	adrp	x8, 0x2864000
 12d5aa0: f942cd08     	ldr	x8, [x8, #0x598]
 12d5aa4: aa0003f7     	mov	x23, x0
 12d5aa8: 2a1f03e1     	mov	w1, wzr
 12d5aac: aa1f03e2     	mov	x2, xzr
 12d5ab0: f9400108     	ldr	x8, [x8]
 12d5ab4: aa0803e0     	mov	x0, x8
 12d5ab8: 9400546c     	bl	0x12eac68 <__start_il2cpp+0x1434a4>
 12d5abc: f9400308     	ldr	x8, [x24]
 12d5ac0: 9000ac49     	adrp	x9, 0x285d000
 12d5ac4: aa0003f8     	mov	x24, x0
 12d5ac8: f9405d08     	ldr	x8, [x8, #0xb8]
 12d5acc: f943dd29     	ldr	x9, [x9, #0x7b8]
 12d5ad0: f940011a     	ldr	x26, [x8]
 12d5ad4: f9400128     	ldr	x8, [x9]
 12d5ad8: aa0803e0     	mov	x0, x8
 12d5adc: 97f7a986     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12d5ae0: 9000ac88     	adrp	x8, 0x2865000
 12d5ae4: f941b908     	ldr	x8, [x8, #0x370]
 12d5ae8: aa1a03e1     	mov	x1, x26
 12d5aec: aa1f03e3     	mov	x3, xzr
 12d5af0: aa0003f9     	mov	x25, x0
 12d5af4: f9400102     	ldr	x2, [x8]
 12d5af8: 942d49f6     	bl	0x1e282d0 <__start_il2cpp+0xc80b0c>
 12d5afc: b40019f5     	cbz	x21, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d5b00: 52800025     	mov	w5, #0x1                // =1
 12d5b04: aa1503e0     	mov	x0, x21
 12d5b08: aa1603e1     	mov	x1, x22
 12d5b0c: aa1703e2     	mov	x2, x23
 12d5b10: aa1803e3     	mov	x3, x24
 12d5b14: aa1903e4     	mov	x4, x25
 12d5b18: aa1f03e6     	mov	x6, xzr
 12d5b1c: 97ff4448     	bl	0x12a6c3c <__start_il2cpp+0xff478>
 12d5b20: b9402268     	ldr	w8, [x19, #0x20]
 12d5b24: 35000794     	cbnz	w20, 0x12d5c14 <__start_il2cpp+0x12e450>
 12d5b28: 71000d1f     	cmp	w8, #0x3
 12d5b2c: 54000741     	b.ne	0x12d5c14 <__start_il2cpp+0x12e450>
 12d5b30: 9000ac98     	adrp	x24, 0x2865000
 12d5b34: f9421b18     	ldr	x24, [x24, #0x430]
 12d5b38: f9400308     	ldr	x8, [x24]
 12d5b3c: f9405d08     	ldr	x8, [x8, #0xb8]
 12d5b40: f9400100     	ldr	x0, [x8]
 12d5b44: b40017a0     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d5b48: aa1f03e1     	mov	x1, xzr
 12d5b4c: 97ff86dd     	bl	0x12b76c0 <__start_il2cpp+0x10fefc>
 12d5b50: f000ac68     	adrp	x8, 0x2864000
 12d5b54: f9404e75     	ldr	x21, [x19, #0x98]
 12d5b58: f9476508     	ldr	x8, [x8, #0xec8]
 12d5b5c: 2a1f03e1     	mov	w1, wzr
 12d5b60: aa1f03e2     	mov	x2, xzr
 12d5b64: f9400100     	ldr	x0, [x8]
 12d5b68: 94005440     	bl	0x12eac68 <__start_il2cpp+0x1434a4>
 12d5b6c: 9000ac88     	adrp	x8, 0x2865000
 12d5b70: f944ad08     	ldr	x8, [x8, #0x958]
 12d5b74: aa0003f6     	mov	x22, x0
 12d5b78: 2a1f03e1     	mov	w1, wzr
 12d5b7c: aa1f03e2     	mov	x2, xzr
 12d5b80: f9400108     	ldr	x8, [x8]
 12d5b84: aa0803e0     	mov	x0, x8
 12d5b88: 94005438     	bl	0x12eac68 <__start_il2cpp+0x1434a4>
 12d5b8c: f000ac68     	adrp	x8, 0x2864000
 12d5b90: f942cd08     	ldr	x8, [x8, #0x598]
 12d5b94: aa0003f7     	mov	x23, x0
 12d5b98: 2a1f03e1     	mov	w1, wzr
 12d5b9c: aa1f03e2     	mov	x2, xzr
 12d5ba0: f9400108     	ldr	x8, [x8]
 12d5ba4: aa0803e0     	mov	x0, x8
 12d5ba8: 94005430     	bl	0x12eac68 <__start_il2cpp+0x1434a4>
 12d5bac: f9400308     	ldr	x8, [x24]
 12d5bb0: 9000ac49     	adrp	x9, 0x285d000
 12d5bb4: aa0003f8     	mov	x24, x0
 12d5bb8: f9405d08     	ldr	x8, [x8, #0xb8]
 12d5bbc: f943dd29     	ldr	x9, [x9, #0x7b8]
 12d5bc0: f940011a     	ldr	x26, [x8]
 12d5bc4: f9400128     	ldr	x8, [x9]
 12d5bc8: aa0803e0     	mov	x0, x8
 12d5bcc: 97f7a94a     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12d5bd0: 9000ac88     	adrp	x8, 0x2865000
 12d5bd4: f941b908     	ldr	x8, [x8, #0x370]
 12d5bd8: aa1a03e1     	mov	x1, x26
 12d5bdc: aa1f03e3     	mov	x3, xzr
 12d5be0: aa0003f9     	mov	x25, x0
 12d5be4: f9400102     	ldr	x2, [x8]
 12d5be8: 942d49ba     	bl	0x1e282d0 <__start_il2cpp+0xc80b0c>
 12d5bec: b4001275     	cbz	x21, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d5bf0: 52800025     	mov	w5, #0x1                // =1
 12d5bf4: aa1503e0     	mov	x0, x21
 12d5bf8: aa1603e1     	mov	x1, x22
 12d5bfc: aa1703e2     	mov	x2, x23
 12d5c00: aa1803e3     	mov	x3, x24
 12d5c04: aa1903e4     	mov	x4, x25
 12d5c08: aa1f03e6     	mov	x6, xzr
 12d5c0c: 97ff440c     	bl	0x12a6c3c <__start_il2cpp+0xff478>
 12d5c10: b9402268     	ldr	w8, [x19, #0x20]
 12d5c14: 35000794     	cbnz	w20, 0x12d5d04 <__start_il2cpp+0x12e540>
 12d5c18: 7100051f     	cmp	w8, #0x1
 12d5c1c: 54000741     	b.ne	0x12d5d04 <__start_il2cpp+0x12e540>
 12d5c20: 9000ac98     	adrp	x24, 0x2865000
 12d5c24: f9421b18     	ldr	x24, [x24, #0x430]
 12d5c28: f9400308     	ldr	x8, [x24]
 12d5c2c: f9405d08     	ldr	x8, [x8, #0xb8]
 12d5c30: f9400100     	ldr	x0, [x8]
 12d5c34: b4001020     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d5c38: aa1f03e1     	mov	x1, xzr
 12d5c3c: 97ff86a1     	bl	0x12b76c0 <__start_il2cpp+0x10fefc>
 12d5c40: f000ac68     	adrp	x8, 0x2864000
 12d5c44: f9404e75     	ldr	x21, [x19, #0x98]
 12d5c48: f9479908     	ldr	x8, [x8, #0xf30]
 12d5c4c: 2a1f03e1     	mov	w1, wzr
 12d5c50: aa1f03e2     	mov	x2, xzr
 12d5c54: f9400100     	ldr	x0, [x8]
 12d5c58: 94005404     	bl	0x12eac68 <__start_il2cpp+0x1434a4>
 12d5c5c: 9000ac88     	adrp	x8, 0x2865000
 12d5c60: f942cd08     	ldr	x8, [x8, #0x598]
 12d5c64: aa0003f6     	mov	x22, x0
 12d5c68: 2a1f03e1     	mov	w1, wzr
 12d5c6c: aa1f03e2     	mov	x2, xzr
 12d5c70: f9400108     	ldr	x8, [x8]
 12d5c74: aa0803e0     	mov	x0, x8
 12d5c78: 940053fc     	bl	0x12eac68 <__start_il2cpp+0x1434a4>
 12d5c7c: f000ac68     	adrp	x8, 0x2864000
 12d5c80: f942cd08     	ldr	x8, [x8, #0x598]
 12d5c84: aa0003f7     	mov	x23, x0
 12d5c88: 2a1f03e1     	mov	w1, wzr
 12d5c8c: aa1f03e2     	mov	x2, xzr
 12d5c90: f9400108     	ldr	x8, [x8]
 12d5c94: aa0803e0     	mov	x0, x8
 12d5c98: 940053f4     	bl	0x12eac68 <__start_il2cpp+0x1434a4>
 12d5c9c: f9400308     	ldr	x8, [x24]
 12d5ca0: 9000ac49     	adrp	x9, 0x285d000
 12d5ca4: aa0003f8     	mov	x24, x0
 12d5ca8: f9405d08     	ldr	x8, [x8, #0xb8]
 12d5cac: f943dd29     	ldr	x9, [x9, #0x7b8]
 12d5cb0: f940011a     	ldr	x26, [x8]
 12d5cb4: f9400128     	ldr	x8, [x9]
 12d5cb8: aa0803e0     	mov	x0, x8
 12d5cbc: 97f7a90e     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12d5cc0: 9000ac88     	adrp	x8, 0x2865000
 12d5cc4: f941b908     	ldr	x8, [x8, #0x370]
 12d5cc8: aa1a03e1     	mov	x1, x26
 12d5ccc: aa1f03e3     	mov	x3, xzr
 12d5cd0: aa0003f9     	mov	x25, x0
 12d5cd4: f9400102     	ldr	x2, [x8]
 12d5cd8: 942d497e     	bl	0x1e282d0 <__start_il2cpp+0xc80b0c>
 12d5cdc: b4000af5     	cbz	x21, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d5ce0: 52800025     	mov	w5, #0x1                // =1
 12d5ce4: aa1503e0     	mov	x0, x21
 12d5ce8: aa1603e1     	mov	x1, x22
 12d5cec: aa1703e2     	mov	x2, x23
 12d5cf0: aa1803e3     	mov	x3, x24
 12d5cf4: aa1903e4     	mov	x4, x25
 12d5cf8: aa1f03e6     	mov	x6, xzr
 12d5cfc: 97ff43d0     	bl	0x12a6c3c <__start_il2cpp+0xff478>
 12d5d00: b9402268     	ldr	w8, [x19, #0x20]
 12d5d04: 35000774     	cbnz	w20, 0x12d5df0 <__start_il2cpp+0x12e62c>
 12d5d08: 7100091f     	cmp	w8, #0x2
 12d5d0c: 54000721     	b.ne	0x12d5df0 <__start_il2cpp+0x12e62c>
 12d5d10: 9000ac97     	adrp	x23, 0x2865000
 12d5d14: f9421af7     	ldr	x23, [x23, #0x430]
 12d5d18: f94002e8     	ldr	x8, [x23]
 12d5d1c: f9405d08     	ldr	x8, [x8, #0xb8]
 12d5d20: f9400100     	ldr	x0, [x8]
 12d5d24: b40008a0     	cbz	x0, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d5d28: aa1f03e1     	mov	x1, xzr
 12d5d2c: 97ff8665     	bl	0x12b76c0 <__start_il2cpp+0x10fefc>
 12d5d30: 9000ac88     	adrp	x8, 0x2865000
 12d5d34: f9404e74     	ldr	x20, [x19, #0x98]
 12d5d38: f9443108     	ldr	x8, [x8, #0x860]
 12d5d3c: 2a1f03e1     	mov	w1, wzr
 12d5d40: aa1f03e2     	mov	x2, xzr
 12d5d44: f9400100     	ldr	x0, [x8]
 12d5d48: 940053c8     	bl	0x12eac68 <__start_il2cpp+0x1434a4>
 12d5d4c: 9000ac88     	adrp	x8, 0x2865000
 12d5d50: f9431508     	ldr	x8, [x8, #0x628]
 12d5d54: aa0003f5     	mov	x21, x0
 12d5d58: 2a1f03e1     	mov	w1, wzr
 12d5d5c: aa1f03e2     	mov	x2, xzr
 12d5d60: f9400108     	ldr	x8, [x8]
 12d5d64: aa0803e0     	mov	x0, x8
 12d5d68: 940053c0     	bl	0x12eac68 <__start_il2cpp+0x1434a4>
 12d5d6c: f000ac68     	adrp	x8, 0x2864000
 12d5d70: f942cd08     	ldr	x8, [x8, #0x598]
 12d5d74: aa0003f6     	mov	x22, x0
 12d5d78: 2a1f03e1     	mov	w1, wzr
 12d5d7c: aa1f03e2     	mov	x2, xzr
 12d5d80: f9400108     	ldr	x8, [x8]
 12d5d84: aa0803e0     	mov	x0, x8
 12d5d88: 940053b8     	bl	0x12eac68 <__start_il2cpp+0x1434a4>
 12d5d8c: f94002e8     	ldr	x8, [x23]
 12d5d90: 9000ac49     	adrp	x9, 0x285d000
 12d5d94: aa0003f7     	mov	x23, x0
 12d5d98: f9405d08     	ldr	x8, [x8, #0xb8]
 12d5d9c: f943dd29     	ldr	x9, [x9, #0x7b8]
 12d5da0: f9400119     	ldr	x25, [x8]
 12d5da4: f9400128     	ldr	x8, [x9]
 12d5da8: aa0803e0     	mov	x0, x8
 12d5dac: 97f7a8d2     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12d5db0: 9000ac88     	adrp	x8, 0x2865000
 12d5db4: f941b908     	ldr	x8, [x8, #0x370]
 12d5db8: aa1903e1     	mov	x1, x25
 12d5dbc: aa1f03e3     	mov	x3, xzr
 12d5dc0: aa0003f8     	mov	x24, x0
 12d5dc4: f9400102     	ldr	x2, [x8]
 12d5dc8: 942d4942     	bl	0x1e282d0 <__start_il2cpp+0xc80b0c>
 12d5dcc: b4000374     	cbz	x20, 0x12d5e38 <__start_il2cpp+0x12e674>
 12d5dd0: 52800025     	mov	w5, #0x1                // =1
 12d5dd4: aa1403e0     	mov	x0, x20
 12d5dd8: aa1503e1     	mov	x1, x21
 12d5ddc: aa1603e2     	mov	x2, x22
 12d5de0: aa1703e3     	mov	x3, x23
 12d5de4: aa1803e4     	mov	x4, x24
 12d5de8: aa1f03e6     	mov	x6, xzr
 12d5dec: 97ff4394     	bl	0x12a6c3c <__start_il2cpp+0xff478>
 12d5df0: b9402668     	ldr	w8, [x19, #0x24]
 12d5df4: 71000d1f     	cmp	w8, #0x3
 12d5df8: 540000a1     	b.ne	0x12d5e0c <__start_il2cpp+0x12e648>
 12d5dfc: b9402261     	ldr	w1, [x19, #0x20]
 12d5e00: aa1303e0     	mov	x0, x19
 12d5e04: 97fffbbc     	bl	0x12d4cf4 <__start_il2cpp+0x12d530>
 12d5e08: b9402668     	ldr	w8, [x19, #0x24]
 12d5e0c: 7100111f     	cmp	w8, #0x4
 12d5e10: 54000061     	b.ne	0x12d5e1c <__start_il2cpp+0x12e658>
 12d5e14: b9402261     	ldr	w1, [x19, #0x20]
 12d5e18: 97fffc1f     	bl	0x12d4e94 <__start_il2cpp+0x12d6d0>
 12d5e1c: a9454ff4     	ldp	x20, x19, [sp, #0x50]
 12d5e20: a94457f6     	ldp	x22, x21, [sp, #0x40]
 12d5e24: a9435ff8     	ldp	x24, x23, [sp, #0x30]
 12d5e28: a94267fa     	ldp	x26, x25, [sp, #0x20]
 12d5e2c: a9416ffe     	ldp	x30, x27, [sp, #0x10]
 12d5e30: 910183ff     	add	sp, sp, #0x60
 12d5e34: d65f03c0     	ret
 12d5e38: 97f7a8b2     	bl	0x10c0100 <CloseNLSocket+0x638>
