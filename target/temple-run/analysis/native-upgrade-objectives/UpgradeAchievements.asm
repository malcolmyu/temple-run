
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1275514: b000af79     	adrp	x25, 0x2862000
 1275518: f944ab39     	ldr	x25, [x25, #0x950]
 127551c: 2a1403e1     	mov	w1, w20
 1275520: aa1f03e3     	mov	x3, xzr
 1275524: f9400322     	ldr	x2, [x25]
 1275528: 94005e83     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 127552c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1275530: 1e270101     	fmov	s1, w8
 1275534: 1e212000     	fcmp	s0, s1
 1275538: 54000b85     	b.pl	0x12756a8 <__start_il2cpp+0xcdee4>
 127553c: f94002e0     	ldr	x0, [x23]
 1275540: b40104a0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275544: 528000c2     	mov	w2, #0x6                // =6
 1275548: 2a1403e1     	mov	w1, w20
 127554c: aa1f03e3     	mov	x3, xzr
 1275550: 94006006     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275554: f94002e8     	ldr	x8, [x23]
 1275558: b40103e8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 127555c: 2a0003f3     	mov	w19, w0
 1275560: 528000e2     	mov	w2, #0x7                // =7
 1275564: aa0803e0     	mov	x0, x8
 1275568: 2a1403e1     	mov	w1, w20
 127556c: aa1f03e3     	mov	x3, xzr
 1275570: 94005ffe     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275574: f94002e8     	ldr	x8, [x23]
 1275578: b40102e8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 127557c: 2a0003f5     	mov	w21, w0
 1275580: 52800102     	mov	w2, #0x8                // =8
 1275584: aa0803e0     	mov	x0, x8
 1275588: 2a1403e1     	mov	w1, w20
 127558c: aa1f03e3     	mov	x3, xzr
 1275590: 94005ff6     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275594: f94002e8     	ldr	x8, [x23]
 1275598: b40101e8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 127559c: 2a0003f6     	mov	w22, w0
 12755a0: 528000a2     	mov	w2, #0x5                // =5
 12755a4: aa0803e0     	mov	x0, x8
 12755a8: 2a1403e1     	mov	w1, w20
 12755ac: aa1f03e3     	mov	x3, xzr
 12755b0: 94005fee     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 12755b4: f94002e8     	ldr	x8, [x23]
 12755b8: b40100e8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12755bc: 7100027f     	cmp	w19, #0x0
 12755c0: 52800029     	mov	w9, #0x1                // =1
 12755c4: 1a9fd7ea     	cset	w10, gt
 12755c8: 1a89d529     	cinc	w9, w9, gt
 12755cc: 710006bf     	cmp	w21, #0x1
 12755d0: 1a89b149     	csel	w9, w10, w9, lt
 12755d4: 710002df     	cmp	w22, #0x0
 12755d8: 1a89d529     	cinc	w9, w9, gt
 12755dc: 7100001f     	cmp	w0, #0x0
 12755e0: 52800122     	mov	w2, #0x9                // =9
 12755e4: aa0803e0     	mov	x0, x8
 12755e8: 2a1403e1     	mov	w1, w20
 12755ec: aa1f03e3     	mov	x3, xzr
 12755f0: 1a89d533     	cinc	w19, w9, gt
 12755f4: 94005fdd     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 12755f8: 7100001f     	cmp	w0, #0x0
 12755fc: 1a93d668     	cinc	w8, w19, gt
 1275600: 1e229000     	fmov	s0, #5.00000000
 1275604: 1e220101     	scvtf	s1, w8
 1275608: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 127560c: 1e201820     	fdiv	s0, s1, s0
 1275610: 1e270101     	fmov	s1, w8
 1275614: 1e210800     	fmul	s0, s0, s1
 1275618: 1e212000     	fcmp	s0, s1
 127561c: 540003ab     	b.lt	0x1275690 <__start_il2cpp+0xcdecc>
 1275620: f9400300     	ldr	x0, [x24]
 1275624: b400fd80     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275628: f000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 127562c: f9400321     	ldr	x1, [x25]
 1275630: f947a529     	ldr	x9, [x9, #0xf48]
 1275634: b9401c0a     	ldr	w10, [x0, #0x1c]
 1275638: f9400808     	ldr	x8, [x0, #0x10]
 127563c: f9400129     	ldr	x9, [x9]
 1275640: 1100054a     	add	w10, w10, #0x1
 1275644: b9001c0a     	str	w10, [x0, #0x1c]
 1275648: b400fc68     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 127564c: b980180a     	ldrsw	x10, [x0, #0x18]
 1275650: b940190b     	ldr	w11, [x8, #0x18]
 1275654: 6b0b015f     	cmp	w10, w11
 1275658: 54000102     	b.hs	0x1275678 <__start_il2cpp+0xcdeb4>
 127565c: 11000549     	add	w9, w10, #0x1
 1275660: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1275664: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1275668: b9001809     	str	w9, [x0, #0x18]
 127566c: f9001101     	str	x1, [x8, #0x20]
 1275670: 1e270140     	fmov	s0, w10
 1275674: 14000007     	b	0x1275690 <__start_il2cpp+0xcdecc>
 1275678: f9401128     	ldr	x8, [x9, #0x20]
 127567c: f9406108     	ldr	x8, [x8, #0xc0]
 1275680: f9403902     	ldr	x2, [x8, #0x70]
 1275684: 941a1364     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1275688: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 127568c: 1e270100     	fmov	s0, w8
 1275690: f94002e0     	ldr	x0, [x23]
 1275694: b400fa00     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275698: f9400322     	ldr	x2, [x25]
 127569c: 2a1403e1     	mov	w1, w20
 12756a0: aa1f03e3     	mov	x3, xzr
 12756a4: 94005e2c     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 12756a8: f94002e0     	ldr	x0, [x23]
 12756ac: b400f940     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12756b0: b000af79     	adrp	x25, 0x2862000
 12756b4: f9443339     	ldr	x25, [x25, #0x860]
 12756b8: 2a1403e1     	mov	w1, w20
 12756bc: aa1f03e3     	mov	x3, xzr
 12756c0: f9400322     	ldr	x2, [x25]
 12756c4: 94005e1c     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 12756c8: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12756cc: 1e270101     	fmov	s1, w8
 12756d0: 1e212000     	fcmp	s0, s1
 12756d4: 54000b85     	b.pl	0x1275844 <__start_il2cpp+0xce080>
 12756d8: f94002e0     	ldr	x0, [x23]
 12756dc: b400f7c0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12756e0: 528000c2     	mov	w2, #0x6                // =6
 12756e4: 2a1403e1     	mov	w1, w20
 12756e8: aa1f03e3     	mov	x3, xzr
 12756ec: 94005f9f     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 12756f0: f94002e8     	ldr	x8, [x23]
 12756f4: b400f708     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12756f8: 2a0003f3     	mov	w19, w0
 12756fc: 528000e2     	mov	w2, #0x7                // =7
 1275700: aa0803e0     	mov	x0, x8
 1275704: 2a1403e1     	mov	w1, w20
 1275708: aa1f03e3     	mov	x3, xzr
 127570c: 94005f97     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275710: f94002e8     	ldr	x8, [x23]
 1275714: b400f608     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275718: 2a0003f5     	mov	w21, w0
 127571c: 52800102     	mov	w2, #0x8                // =8
 1275720: aa0803e0     	mov	x0, x8
 1275724: 2a1403e1     	mov	w1, w20
 1275728: aa1f03e3     	mov	x3, xzr
 127572c: 94005f8f     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275730: f94002e8     	ldr	x8, [x23]
 1275734: b400f508     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275738: 2a0003f6     	mov	w22, w0
 127573c: 528000a2     	mov	w2, #0x5                // =5
 1275740: aa0803e0     	mov	x0, x8
 1275744: 2a1403e1     	mov	w1, w20
 1275748: aa1f03e3     	mov	x3, xzr
 127574c: 94005f87     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275750: f94002e8     	ldr	x8, [x23]
 1275754: b400f408     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275758: 7100127f     	cmp	w19, #0x4
 127575c: 52800029     	mov	w9, #0x1                // =1
 1275760: 1a9fd7ea     	cset	w10, gt
 1275764: 1a89d529     	cinc	w9, w9, gt
 1275768: 710016bf     	cmp	w21, #0x5
 127576c: 1a89b149     	csel	w9, w10, w9, lt
 1275770: 710012df     	cmp	w22, #0x4
 1275774: 1a89d529     	cinc	w9, w9, gt
 1275778: 7100101f     	cmp	w0, #0x4
 127577c: 52800122     	mov	w2, #0x9                // =9
 1275780: aa0803e0     	mov	x0, x8
 1275784: 2a1403e1     	mov	w1, w20
 1275788: aa1f03e3     	mov	x3, xzr
 127578c: 1a89d533     	cinc	w19, w9, gt
 1275790: 94005f76     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275794: 7100101f     	cmp	w0, #0x4
 1275798: 1a93d668     	cinc	w8, w19, gt
 127579c: 1e229000     	fmov	s0, #5.00000000
 12757a0: 1e220101     	scvtf	s1, w8
 12757a4: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12757a8: 1e201820     	fdiv	s0, s1, s0
 12757ac: 1e270101     	fmov	s1, w8
 12757b0: 1e210800     	fmul	s0, s0, s1
 12757b4: 1e212000     	fcmp	s0, s1
 12757b8: 540003ab     	b.lt	0x127582c <__start_il2cpp+0xce068>
 12757bc: f9400300     	ldr	x0, [x24]
 12757c0: b400f0a0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12757c4: f000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12757c8: f9400321     	ldr	x1, [x25]
 12757cc: f947a529     	ldr	x9, [x9, #0xf48]
 12757d0: b9401c0a     	ldr	w10, [x0, #0x1c]
 12757d4: f9400808     	ldr	x8, [x0, #0x10]
 12757d8: f9400129     	ldr	x9, [x9]
 12757dc: 1100054a     	add	w10, w10, #0x1
 12757e0: b9001c0a     	str	w10, [x0, #0x1c]
 12757e4: b400ef88     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12757e8: b980180a     	ldrsw	x10, [x0, #0x18]
 12757ec: b940190b     	ldr	w11, [x8, #0x18]
 12757f0: 6b0b015f     	cmp	w10, w11
 12757f4: 54000102     	b.hs	0x1275814 <__start_il2cpp+0xce050>
 12757f8: 11000549     	add	w9, w10, #0x1
 12757fc: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1275800: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1275804: b9001809     	str	w9, [x0, #0x18]
 1275808: f9001101     	str	x1, [x8, #0x20]
 127580c: 1e270140     	fmov	s0, w10
 1275810: 14000007     	b	0x127582c <__start_il2cpp+0xce068>
 1275814: f9401128     	ldr	x8, [x9, #0x20]
 1275818: f9406108     	ldr	x8, [x8, #0xc0]
 127581c: f9403902     	ldr	x2, [x8, #0x70]
 1275820: 941a12fd     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1275824: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1275828: 1e270100     	fmov	s0, w8
 127582c: f94002e0     	ldr	x0, [x23]
 1275830: b400ed20     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275834: f9400322     	ldr	x2, [x25]
 1275838: 2a1403e1     	mov	w1, w20
 127583c: aa1f03e3     	mov	x3, xzr
 1275840: 94005dc5     	bl	0x128cf54 <__start_il2cpp+0xe5790>
