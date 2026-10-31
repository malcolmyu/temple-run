
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1265fa0: d10283ff     	sub	sp, sp, #0xa0
 1265fa4: 6d022beb     	stp	d11, d10, [sp, #0x20]
 1265fa8: 6d0323e9     	stp	d9, d8, [sp, #0x30]
 1265fac: a9047bfd     	stp	x29, x30, [sp, #0x40]
 1265fb0: a9056ffc     	stp	x28, x27, [sp, #0x50]
 1265fb4: a90667fa     	stp	x26, x25, [sp, #0x60]
 1265fb8: a9075ff8     	stp	x24, x23, [sp, #0x70]
 1265fbc: a90857f6     	stp	x22, x21, [sp, #0x80]
 1265fc0: a9094ff4     	stp	x20, x19, [sp, #0x90]
 1265fc4: 9000be94     	adrp	x20, 0x2a35000
 1265fc8: f000afb5     	adrp	x21, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1265fcc: 395c4a88     	ldrb	w8, [x20, #0x712]
 1265fd0: f94562b5     	ldr	x21, [x21, #0xac0]
 1265fd4: aa0003f3     	mov	x19, x0
 1265fd8: 37000a88     	tbnz	w8, #0x0, 0x1266128 <__start_il2cpp+0xbe964>
 1265fdc: b000afe0     	adrp	x0, 0x2862000
 1265fe0: f940e800     	ldr	x0, [x0, #0x1d0]
 1265fe4: 97f967bd     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1265fe8: b000afe0     	adrp	x0, 0x2862000
 1265fec: f940ec00     	ldr	x0, [x0, #0x1d8]
 1265ff0: 97f967ba     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1265ff4: f000afa0     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1265ff8: f9456000     	ldr	x0, [x0, #0xac0]
 1265ffc: 97f967b7     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1266000: 9000afe0     	adrp	x0, 0x2862000
 1266004: f940dc00     	ldr	x0, [x0, #0x1b8]
 1266008: 97f967b4     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126600c: 9000afe0     	adrp	x0, 0x2862000
 1266010: f940f000     	ldr	x0, [x0, #0x1e0]
 1266014: 97f967b1     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1266018: 9000afe0     	adrp	x0, 0x2862000
 126601c: f940f400     	ldr	x0, [x0, #0x1e8]
 1266020: 97f967ae     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1266024: 9000afe0     	adrp	x0, 0x2862000
 1266028: f940f800     	ldr	x0, [x0, #0x1f0]
 126602c: 97f967ab     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1266030: 9000afe0     	adrp	x0, 0x2862000
 1266034: f940fc00     	ldr	x0, [x0, #0x1f8]
 1266038: 97f967a8     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126603c: 9000afe0     	adrp	x0, 0x2862000
 1266040: f9410000     	ldr	x0, [x0, #0x200]
 1266044: 97f967a5     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1266048: 9000afe0     	adrp	x0, 0x2862000
 126604c: f9410400     	ldr	x0, [x0, #0x208]
 1266050: 97f967a2     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1266054: 9000afe0     	adrp	x0, 0x2862000
 1266058: f9410800     	ldr	x0, [x0, #0x210]
 126605c: 97f9679f     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1266060: 9000afe0     	adrp	x0, 0x2862000
 1266064: f9410c00     	ldr	x0, [x0, #0x218]
 1266068: 97f9679c     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126606c: 9000afe0     	adrp	x0, 0x2862000
 1266070: f9411000     	ldr	x0, [x0, #0x220]
 1266074: 97f96799     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1266078: 9000afe0     	adrp	x0, 0x2862000
 126607c: f9411400     	ldr	x0, [x0, #0x228]
 1266080: 97f96796     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1266084: 9000afe0     	adrp	x0, 0x2862000
 1266088: f9411800     	ldr	x0, [x0, #0x230]
 126608c: 97f96793     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1266090: 9000afe0     	adrp	x0, 0x2862000
 1266094: f9411c00     	ldr	x0, [x0, #0x238]
 1266098: 97f96790     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126609c: 9000afe0     	adrp	x0, 0x2862000
 12660a0: f9412000     	ldr	x0, [x0, #0x240]
 12660a4: 97f9678d     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12660a8: 9000afe0     	adrp	x0, 0x2862000
 12660ac: f9412400     	ldr	x0, [x0, #0x248]
 12660b0: 97f9678a     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12660b4: 9000afe0     	adrp	x0, 0x2862000
 12660b8: f9412800     	ldr	x0, [x0, #0x250]
 12660bc: 97f96787     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12660c0: 9000afe0     	adrp	x0, 0x2862000
 12660c4: f9412c00     	ldr	x0, [x0, #0x258]
 12660c8: 97f96784     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12660cc: 9000afe0     	adrp	x0, 0x2862000
 12660d0: f9413000     	ldr	x0, [x0, #0x260]
 12660d4: 97f96781     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12660d8: 9000afe0     	adrp	x0, 0x2862000
 12660dc: f9413400     	ldr	x0, [x0, #0x268]
 12660e0: 97f9677e     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12660e4: 9000afe0     	adrp	x0, 0x2862000
 12660e8: f9413800     	ldr	x0, [x0, #0x270]
 12660ec: 97f9677b     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12660f0: 9000afe0     	adrp	x0, 0x2862000
 12660f4: f9413c00     	ldr	x0, [x0, #0x278]
 12660f8: 97f96778     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12660fc: 9000afe0     	adrp	x0, 0x2862000
 1266100: f9414000     	ldr	x0, [x0, #0x280]
 1266104: 97f96775     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1266108: 9000afe0     	adrp	x0, 0x2862000
 126610c: f9414400     	ldr	x0, [x0, #0x288]
 1266110: 97f96772     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1266114: 9000afe0     	adrp	x0, 0x2862000
 1266118: f9414800     	ldr	x0, [x0, #0x290]
 126611c: 97f9676f     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1266120: 52800028     	mov	w8, #0x1                // =1
 1266124: 391c4a88     	strb	w8, [x20, #0x712]
 1266128: f94002a0     	ldr	x0, [x21]
 126612c: bd40d269     	ldr	s9, [x19, #0xd0]
 1266130: bd411e6a     	ldr	s10, [x19, #0x11c]
 1266134: f9404674     	ldr	x20, [x19, #0x88]
 1266138: b940e008     	ldr	w8, [x0, #0xe0]
 126613c: 35000048     	cbnz	w8, 0x1266144 <__start_il2cpp+0xbe980>
 1266140: 97f967a8     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1266144: aa1403e0     	mov	x0, x20
 1266148: aa1f03e1     	mov	x1, xzr
 126614c: aa1f03e2     	mov	x2, xzr
 1266150: 944949be     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 1266154: 36000080     	tbz	w0, #0x0, 0x1266164 <__start_il2cpp+0xbe9a0>
 1266158: f9404668     	ldr	x8, [x19, #0x88]
 126615c: b50001c8     	cbnz	x8, 0x1266194 <__start_il2cpp+0xbe9d0>
 1266160: 14000273     	b	0x1266b2c <__start_il2cpp+0xbf368>
 1266164: f94002a0     	ldr	x0, [x21]
 1266168: f9404a74     	ldr	x20, [x19, #0x90]
 126616c: b940e008     	ldr	w8, [x0, #0xe0]
 1266170: 35000048     	cbnz	w8, 0x1266178 <__start_il2cpp+0xbe9b4>
 1266174: 97f9679b     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1266178: aa1403e0     	mov	x0, x20
 126617c: aa1f03e1     	mov	x1, xzr
 1266180: aa1f03e2     	mov	x2, xzr
 1266184: 944949b1     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 1266188: 360000a0     	tbz	w0, #0x0, 0x126619c <__start_il2cpp+0xbe9d8>
 126618c: f9404a68     	ldr	x8, [x19, #0x90]
 1266190: b4004ce8     	cbz	x8, 0x1266b2c <__start_il2cpp+0xbf368>
 1266194: b9403118     	ldr	w24, [x8, #0x30]
 1266198: 14000002     	b	0x12661a0 <__start_il2cpp+0xbe9dc>
 126619c: 2a1f03f8     	mov	w24, wzr
 12661a0: f9405e60     	ldr	x0, [x19, #0xb8]
 12661a4: b4004c40     	cbz	x0, 0x1266b2c <__start_il2cpp+0xbf368>
 12661a8: f9405a74     	ldr	x20, [x19, #0xb0]
 12661ac: aa1f03e1     	mov	x1, xzr
 12661b0: 94010117     	bl	0x12a660c <__start_il2cpp+0xfee48>
 12661b4: b4004bd4     	cbz	x20, 0x1266b2c <__start_il2cpp+0xbf368>
 12661b8: 2a0003e1     	mov	w1, w0
 12661bc: aa1403e0     	mov	x0, x20
 12661c0: aa1f03e2     	mov	x2, xzr
 12661c4: 94009576     	bl	0x128b79c <__start_il2cpp+0xe3fd8>
 12661c8: f9403a68     	ldr	x8, [x19, #0x70]
 12661cc: b4004b08     	cbz	x8, 0x1266b2c <__start_il2cpp+0xbf368>
 12661d0: 2a0003f6     	mov	w22, w0
 12661d4: b940e100     	ldr	w0, [x8, #0xe0]
 12661d8: bd40e908     	ldr	s8, [x8, #0xe8]
 12661dc: aa1f03e1     	mov	x1, xzr
 12661e0: 9400b442     	bl	0x12932e8 <__start_il2cpp+0xebb24>
 12661e4: b9409a68     	ldr	w8, [x19, #0x98]
 12661e8: aa0003fb     	mov	x27, x0
 12661ec: aa1f03e1     	mov	x1, xzr
 12661f0: 2a0803e0     	mov	w0, w8
 12661f4: 9400b470     	bl	0x12933b4 <__start_il2cpp+0xebbf0>
 12661f8: aa0003fa     	mov	x26, x0
 12661fc: 2a1803e0     	mov	w0, w24
 1266200: aa1f03e1     	mov	x1, xzr
 1266204: 9400b48f     	bl	0x1293440 <__start_il2cpp+0xebc7c>
 1266208: f9403a68     	ldr	x8, [x19, #0x70]
 126620c: b4004908     	cbz	x8, 0x1266b2c <__start_il2cpp+0xbf368>
 1266210: aa0003fd     	mov	x29, x0
 1266214: b9418900     	ldr	w0, [x8, #0x188]
 1266218: 9000aff4     	adrp	x20, 0x2862000
 126621c: f940ea94     	ldr	x20, [x20, #0x1d0]
 1266220: aa1f03e1     	mov	x1, xzr
 1266224: 9400b4bf     	bl	0x1293520 <__start_il2cpp+0xebd5c>
 1266228: 3943d269     	ldrb	w9, [x19, #0xf4]
 126622c: 3943d668     	ldrb	w8, [x19, #0xf5]
 1266230: aa0003fc     	mov	x28, x0
 1266234: 528002e1     	mov	w1, #0x17               // =23
 1266238: a900a7e8     	stp	x8, x9, [sp, #0x8]
 126623c: f9400288     	ldr	x8, [x20]
 1266240: aa0803e0     	mov	x0, x8
 1266244: 97f96743     	bl	0x10bff50 <CloseNLSocket+0x488>
 1266248: f000be74     	adrp	x20, 0x2a35000
 126624c: 395dde88     	ldrb	w8, [x20, #0x777]
 1266250: aa0003f5     	mov	x21, x0
 1266254: 350000c8     	cbnz	w8, 0x126626c <__start_il2cpp+0xbeaa8>
 1266258: f000afc0     	adrp	x0, 0x2861000
 126625c: f941bc00     	ldr	x0, [x0, #0x378]
 1266260: 97f9671e     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1266264: 52800028     	mov	w8, #0x1                // =1
 1266268: 391dde88     	strb	w8, [x20, #0x777]
 126626c: f000afd4     	adrp	x20, 0x2861000
 1266270: f941be94     	ldr	x20, [x20, #0x378]
 1266274: 9000aff9     	adrp	x25, 0x2862000
 1266278: f9400280     	ldr	x0, [x20]
 126627c: aa1403f7     	mov	x23, x20
 1266280: b940e008     	ldr	w8, [x0, #0xe0]
 1266284: f940ef39     	ldr	x25, [x25, #0x1d8]
 1266288: f90003f6     	str	x22, [sp]
 126628c: f9000ffd     	str	x29, [sp, #0x18]
 1266290: 35000068     	cbnz	w8, 0x126629c <__start_il2cpp+0xbead8>
 1266294: 97f96753     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1266298: f9400280     	ldr	x0, [x20]
 126629c: f9405c08     	ldr	x8, [x0, #0xb8]
 12662a0: f9400320     	ldr	x0, [x25]
 12662a4: f940b516     	ldr	x22, [x8, #0x168]
 12662a8: 97f96793     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12662ac: aa1603e1     	mov	x1, x22
 12662b0: aa1c03e2     	mov	x2, x28
 12662b4: aa1f03e3     	mov	x3, xzr
 12662b8: aa0003fd     	mov	x29, x0
 12662bc: 97ff976c     	bl	0x124c06c <__start_il2cpp+0xa48a8>
 12662c0: b4004375     	cbz	x21, 0x1266b2c <__start_il2cpp+0xbf368>
 12662c4: b40000dd     	cbz	x29, 0x12662dc <__start_il2cpp+0xbeb18>
 12662c8: f94002a8     	ldr	x8, [x21]
 12662cc: aa1d03e0     	mov	x0, x29
 12662d0: f9402101     	ldr	x1, [x8, #0x40]
 12662d4: 97f96744     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 12662d8: b4004240     	cbz	x0, 0x1266b20 <__start_il2cpp+0xbf35c>
 12662dc: aa1503f4     	mov	x20, x21
 12662e0: b8418e88     	ldr	w8, [x20, #0x18]!
 12662e4: 340041c8     	cbz	w8, 0x1266b1c <__start_il2cpp+0xbf358>
 12662e8: f90012bd     	str	x29, [x21, #0x20]
 12662ec: f000be76     	adrp	x22, 0x2a35000
 12662f0: 395de2c8     	ldrb	w8, [x22, #0x778]
 12662f4: aa1903fc     	mov	x28, x25
 12662f8: 350000c8     	cbnz	w8, 0x1266310 <__start_il2cpp+0xbeb4c>
 12662fc: f000afc0     	adrp	x0, 0x2861000
 1266300: f941bc00     	ldr	x0, [x0, #0x378]
 1266304: 97f966f5     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1266308: 52800028     	mov	w8, #0x1                // =1
 126630c: 391de2c8     	strb	w8, [x22, #0x778]
 1266310: f94002e0     	ldr	x0, [x23]
 1266314: b940e008     	ldr	w8, [x0, #0xe0]
 1266318: 35000088     	cbnz	w8, 0x1266328 <__start_il2cpp+0xbeb64>
 126631c: aa1703f6     	mov	x22, x23
 1266320: 97f96730     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1266324: f94002e0     	ldr	x0, [x23]
 1266328: f9403a68     	ldr	x8, [x19, #0x70]
 126632c: b4004008     	cbz	x8, 0x1266b2c <__start_il2cpp+0xbf368>
 1266330: f9405c09     	ldr	x9, [x0, #0xb8]
 1266334: f9400380     	ldr	x0, [x28]
 1266338: b9813916     	ldrsw	x22, [x8, #0x138]
 126633c: f941613d     	ldr	x29, [x9, #0x2c0]
 1266340: 97f9676d     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 1266344: aa1d03e1     	mov	x1, x29
 1266348: aa1603e2     	mov	x2, x22
 126634c: aa1f03e3     	mov	x3, xzr
 1266350: aa0003fc     	mov	x28, x0
 1266354: 97ff9791     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 1266358: b40000dc     	cbz	x28, 0x1266370 <__start_il2cpp+0xbebac>
 126635c: f94002a8     	ldr	x8, [x21]
 1266360: aa1c03e0     	mov	x0, x28
 1266364: f9402101     	ldr	x1, [x8, #0x40]
 1266368: 97f9671f     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 126636c: b4003da0     	cbz	x0, 0x1266b20 <__start_il2cpp+0xbf35c>
 1266370: b9400288     	ldr	w8, [x20]
 1266374: 7100051f     	cmp	w8, #0x1
 1266378: 54003d29     	b.ls	0x1266b1c <__start_il2cpp+0xbf358>
 126637c: f90016bc     	str	x28, [x21, #0x28]
 1266380: f9403a68     	ldr	x8, [x19, #0x70]
 1266384: b4003d48     	cbz	x8, 0x1266b2c <__start_il2cpp+0xbf368>
 1266388: f9400320     	ldr	x0, [x25]
 126638c: 9000affc     	adrp	x28, 0x2862000
 1266390: b9814916     	ldrsw	x22, [x8, #0x148]
 1266394: f940ff9c     	ldr	x28, [x28, #0x1f8]
 1266398: 97f96757     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 126639c: f9400381     	ldr	x1, [x28]
 12663a0: aa1603e2     	mov	x2, x22
 12663a4: aa1f03e3     	mov	x3, xzr
 12663a8: aa0003fc     	mov	x28, x0
 12663ac: 97ff977b     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 12663b0: b40000dc     	cbz	x28, 0x12663c8 <__start_il2cpp+0xbec04>
 12663b4: f94002a8     	ldr	x8, [x21]
 12663b8: aa1c03e0     	mov	x0, x28
 12663bc: f9402101     	ldr	x1, [x8, #0x40]
 12663c0: 97f96709     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 12663c4: b4003ae0     	cbz	x0, 0x1266b20 <__start_il2cpp+0xbf35c>
 12663c8: b9400288     	ldr	w8, [x20]
 12663cc: 7100091f     	cmp	w8, #0x2
 12663d0: 54003a69     	b.ls	0x1266b1c <__start_il2cpp+0xbf358>
 12663d4: f9001abc     	str	x28, [x21, #0x30]
 12663d8: f9400320     	ldr	x0, [x25]
 12663dc: 9000aff6     	adrp	x22, 0x2862000
 12663e0: bd41266b     	ldr	s11, [x19, #0x124]
 12663e4: f9413ed6     	ldr	x22, [x22, #0x278]
 12663e8: 97f96743     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12663ec: f94002c1     	ldr	x1, [x22]
 12663f0: 52aff009     	mov	w9, #0x7f800000         // =2139095040
 12663f4: 1e380168     	fcvtzs	w8, s11
 12663f8: 1e270120     	fmov	s0, w9
 12663fc: 93407d08     	sxtw	x8, w8
 1266400: 1e202160     	fcmp	s11, s0
 1266404: b26183e9     	mov	x9, #-0x80000000        // =-2147483648
 1266408: 9a880122     	csel	x2, x9, x8, eq
 126640c: aa1f03e3     	mov	x3, xzr
 1266410: aa0003fc     	mov	x28, x0
 1266414: 97ff9761     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 1266418: b40000dc     	cbz	x28, 0x1266430 <__start_il2cpp+0xbec6c>
 126641c: f94002a8     	ldr	x8, [x21]
 1266420: aa1c03e0     	mov	x0, x28
 1266424: f9402101     	ldr	x1, [x8, #0x40]
 1266428: 97f966ef     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 126642c: b40037a0     	cbz	x0, 0x1266b20 <__start_il2cpp+0xbf35c>
 1266430: b9400288     	ldr	w8, [x20]
 1266434: 71000d1f     	cmp	w8, #0x3
 1266438: 54003729     	b.ls	0x1266b1c <__start_il2cpp+0xbf358>
 126643c: f9001ebc     	str	x28, [x21, #0x38]
 1266440: f9400320     	ldr	x0, [x25]
 1266444: 9000aff6     	adrp	x22, 0x2862000
 1266448: f9412ad6     	ldr	x22, [x22, #0x250]
 126644c: 1e2a3929     	fsub	s9, s9, s10
 1266450: 1e38013d     	fcvtzs	w29, s9
 1266454: 97f96728     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 1266458: f94002c1     	ldr	x1, [x22]
 126645c: 52aff008     	mov	w8, #0x7f800000         // =2139095040
 1266460: 1e270100     	fmov	s0, w8
 1266464: 93407fa9     	sxtw	x9, w29
 1266468: 1e202120     	fcmp	s9, s0
 126646c: b26183e8     	mov	x8, #-0x80000000        // =-2147483648
 1266470: 9a890102     	csel	x2, x8, x9, eq
 1266474: aa1f03e3     	mov	x3, xzr
 1266478: aa0003fc     	mov	x28, x0
 126647c: 97ff9747     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 1266480: b40000dc     	cbz	x28, 0x1266498 <__start_il2cpp+0xbecd4>
 1266484: f94002a8     	ldr	x8, [x21]
 1266488: aa1c03e0     	mov	x0, x28
 126648c: f9402101     	ldr	x1, [x8, #0x40]
 1266490: 97f966d5     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 1266494: b4003460     	cbz	x0, 0x1266b20 <__start_il2cpp+0xbf35c>
 1266498: b9400288     	ldr	w8, [x20]
 126649c: 7100111f     	cmp	w8, #0x4
 12664a0: 540033e9     	b.ls	0x1266b1c <__start_il2cpp+0xbf358>
 12664a4: f90022bc     	str	x28, [x21, #0x40]
 12664a8: f9400320     	ldr	x0, [x25]
 12664ac: 9000affc     	adrp	x28, 0x2862000
 12664b0: b9816a76     	ldrsw	x22, [x19, #0x168]
 12664b4: f9410b9c     	ldr	x28, [x28, #0x210]
 12664b8: aa1703fd     	mov	x29, x23
 12664bc: 97f9670e     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12664c0: f9400381     	ldr	x1, [x28]
 12664c4: aa1603e2     	mov	x2, x22
 12664c8: aa1f03e3     	mov	x3, xzr
 12664cc: aa0003fc     	mov	x28, x0
 12664d0: 97ff9732     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 12664d4: b40000dc     	cbz	x28, 0x12664ec <__start_il2cpp+0xbed28>
 12664d8: f94002a8     	ldr	x8, [x21]
 12664dc: aa1c03e0     	mov	x0, x28
 12664e0: f9402101     	ldr	x1, [x8, #0x40]
 12664e4: 97f966c0     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 12664e8: b40031c0     	cbz	x0, 0x1266b20 <__start_il2cpp+0xbf35c>
 12664ec: b9400288     	ldr	w8, [x20]
 12664f0: 7100151f     	cmp	w8, #0x5
 12664f4: 54003149     	b.ls	0x1266b1c <__start_il2cpp+0xbf358>
 12664f8: f90026bc     	str	x28, [x21, #0x48]
 12664fc: f9400320     	ldr	x0, [x25]
 1266500: 9000aff6     	adrp	x22, 0x2862000
 1266504: f94122d6     	ldr	x22, [x22, #0x240]
 1266508: 97f966fb     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 126650c: f94002c1     	ldr	x1, [x22]
 1266510: aa1b03e2     	mov	x2, x27
 1266514: aa1f03e3     	mov	x3, xzr
 1266518: aa0003fc     	mov	x28, x0
 126651c: 97ff96d4     	bl	0x124c06c <__start_il2cpp+0xa48a8>
 1266520: b40000dc     	cbz	x28, 0x1266538 <__start_il2cpp+0xbed74>
 1266524: f94002a8     	ldr	x8, [x21]
 1266528: aa1c03e0     	mov	x0, x28
 126652c: f9402101     	ldr	x1, [x8, #0x40]
 1266530: 97f966ad     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 1266534: b4002f60     	cbz	x0, 0x1266b20 <__start_il2cpp+0xbf35c>
 1266538: b9400288     	ldr	w8, [x20]
 126653c: 7100191f     	cmp	w8, #0x6
 1266540: 54002ee9     	b.ls	0x1266b1c <__start_il2cpp+0xbf358>
 1266544: f9002abc     	str	x28, [x21, #0x50]
 1266548: f9400320     	ldr	x0, [x25]
 126654c: 9000aff6     	adrp	x22, 0x2862000
 1266550: f94142d6     	ldr	x22, [x22, #0x280]
 1266554: aa1903fc     	mov	x28, x25
 1266558: 97f966e7     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 126655c: f94002c1     	ldr	x1, [x22]
 1266560: aa1a03e2     	mov	x2, x26
 1266564: aa1f03e3     	mov	x3, xzr
 1266568: aa0003fb     	mov	x27, x0
 126656c: 97ff96c0     	bl	0x124c06c <__start_il2cpp+0xa48a8>
 1266570: b40000db     	cbz	x27, 0x1266588 <__start_il2cpp+0xbedc4>
 1266574: f94002a8     	ldr	x8, [x21]
 1266578: aa1b03e0     	mov	x0, x27
 126657c: f9402101     	ldr	x1, [x8, #0x40]
 1266580: 97f96699     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 1266584: b4002ce0     	cbz	x0, 0x1266b20 <__start_il2cpp+0xbf35c>
 1266588: b9400288     	ldr	w8, [x20]
 126658c: 71001d1f     	cmp	w8, #0x7
 1266590: 54002c69     	b.ls	0x1266b1c <__start_il2cpp+0xbf358>
 1266594: f9002ebb     	str	x27, [x21, #0x58]
 1266598: f9400380     	ldr	x0, [x28]
 126659c: 9000aff6     	adrp	x22, 0x2862000
 12665a0: f94136d6     	ldr	x22, [x22, #0x268]
 12665a4: 97f966d4     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12665a8: f94002c1     	ldr	x1, [x22]
 12665ac: f9400fe2     	ldr	x2, [sp, #0x18]
 12665b0: aa1f03e3     	mov	x3, xzr
 12665b4: aa0003fa     	mov	x26, x0
 12665b8: 97ff96ad     	bl	0x124c06c <__start_il2cpp+0xa48a8>
 12665bc: b40000da     	cbz	x26, 0x12665d4 <__start_il2cpp+0xbee10>
 12665c0: f94002a8     	ldr	x8, [x21]
 12665c4: aa1a03e0     	mov	x0, x26
 12665c8: f9402101     	ldr	x1, [x8, #0x40]
 12665cc: 97f96686     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 12665d0: b4002a80     	cbz	x0, 0x1266b20 <__start_il2cpp+0xbf35c>
 12665d4: b9400288     	ldr	w8, [x20]
 12665d8: 7100211f     	cmp	w8, #0x8
 12665dc: 54002a09     	b.ls	0x1266b1c <__start_il2cpp+0xbf358>
 12665e0: f90032ba     	str	x26, [x21, #0x60]
 12665e4: f9400380     	ldr	x0, [x28]
 12665e8: 9000aff6     	adrp	x22, 0x2862000
 12665ec: f9414ad6     	ldr	x22, [x22, #0x290]
 12665f0: 97f966c1     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12665f4: f94002c1     	ldr	x1, [x22]
 12665f8: 93407f02     	sxtw	x2, w24
 12665fc: aa1f03e3     	mov	x3, xzr
 1266600: aa0003f9     	mov	x25, x0
 1266604: 97ff96e5     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 1266608: b40000d9     	cbz	x25, 0x1266620 <__start_il2cpp+0xbee5c>
 126660c: f94002a8     	ldr	x8, [x21]
 1266610: aa1903e0     	mov	x0, x25
 1266614: f9402101     	ldr	x1, [x8, #0x40]
 1266618: 97f96673     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 126661c: b4002820     	cbz	x0, 0x1266b20 <__start_il2cpp+0xbf35c>
 1266620: b9400288     	ldr	w8, [x20]
 1266624: 7100251f     	cmp	w8, #0x9
 1266628: 540027a9     	b.ls	0x1266b1c <__start_il2cpp+0xbf358>
 126662c: f90036b9     	str	x25, [x21, #0x68]
 1266630: f9400380     	ldr	x0, [x28]
 1266634: 9000aff6     	adrp	x22, 0x2862000
 1266638: f94112d6     	ldr	x22, [x22, #0x220]
 126663c: 97f966ae     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 1266640: f94002c1     	ldr	x1, [x22]
 1266644: 1e22c100     	fcvt	d0, s8
 1266648: aa1f03e2     	mov	x2, xzr
 126664c: aa0003f8     	mov	x24, x0
 1266650: 97ff9702     	bl	0x124c258 <__start_il2cpp+0xa4a94>
 1266654: b40000d8     	cbz	x24, 0x126666c <__start_il2cpp+0xbeea8>
 1266658: f94002a8     	ldr	x8, [x21]
 126665c: aa1803e0     	mov	x0, x24
 1266660: f9402101     	ldr	x1, [x8, #0x40]
 1266664: 97f96660     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 1266668: b40025c0     	cbz	x0, 0x1266b20 <__start_il2cpp+0xbf35c>
 126666c: b9400288     	ldr	w8, [x20]
 1266670: 7100291f     	cmp	w8, #0xa
 1266674: 54002549     	b.ls	0x1266b1c <__start_il2cpp+0xbf358>
 1266678: f9003ab8     	str	x24, [x21, #0x70]
 126667c: f9400380     	ldr	x0, [x28]
 1266680: 9000aff6     	adrp	x22, 0x2862000
 1266684: f940f2d6     	ldr	x22, [x22, #0x1e0]
 1266688: 97f9669b     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 126668c: f94002c1     	ldr	x1, [x22]
 1266690: f9400be2     	ldr	x2, [sp, #0x10]
 1266694: aa1f03e3     	mov	x3, xzr
 1266698: aa0003f8     	mov	x24, x0
 126669c: 97ff96bf     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 12666a0: b40000d8     	cbz	x24, 0x12666b8 <__start_il2cpp+0xbeef4>
 12666a4: f94002a8     	ldr	x8, [x21]
 12666a8: aa1803e0     	mov	x0, x24
 12666ac: f9402101     	ldr	x1, [x8, #0x40]
 12666b0: 97f9664d     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 12666b4: b4002360     	cbz	x0, 0x1266b20 <__start_il2cpp+0xbf35c>
 12666b8: b9400288     	ldr	w8, [x20]
 12666bc: 71002d1f     	cmp	w8, #0xb
 12666c0: 540022e9     	b.ls	0x1266b1c <__start_il2cpp+0xbf358>
 12666c4: f9003eb8     	str	x24, [x21, #0x78]
 12666c8: f9400380     	ldr	x0, [x28]
 12666cc: 9000aff6     	adrp	x22, 0x2862000
 12666d0: f940fad6     	ldr	x22, [x22, #0x1f0]
 12666d4: 97f96688     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12666d8: f94002c1     	ldr	x1, [x22]
 12666dc: f94007e2     	ldr	x2, [sp, #0x8]
 12666e0: aa1f03e3     	mov	x3, xzr
 12666e4: aa0003f7     	mov	x23, x0
 12666e8: 97ff96ac     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 12666ec: b40000d7     	cbz	x23, 0x1266704 <__start_il2cpp+0xbef40>
 12666f0: f94002a8     	ldr	x8, [x21]
 12666f4: aa1703e0     	mov	x0, x23
 12666f8: f9402101     	ldr	x1, [x8, #0x40]
 12666fc: 97f9663a     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 1266700: b4002100     	cbz	x0, 0x1266b20 <__start_il2cpp+0xbf35c>
 1266704: b9400288     	ldr	w8, [x20]
 1266708: 7100311f     	cmp	w8, #0xc
 126670c: 54002089     	b.ls	0x1266b1c <__start_il2cpp+0xbf358>
 1266710: f90042b7     	str	x23, [x21, #0x80]
 1266714: f9400380     	ldr	x0, [x28]
 1266718: 9000aff6     	adrp	x22, 0x2862000
 126671c: b980ea77     	ldrsw	x23, [x19, #0xe8]
 1266720: f9410ed6     	ldr	x22, [x22, #0x218]
 1266724: 97f96674     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 1266728: f94002c1     	ldr	x1, [x22]
 126672c: aa1703e2     	mov	x2, x23
 1266730: aa1f03e3     	mov	x3, xzr
 1266734: aa0003f6     	mov	x22, x0
 1266738: 97ff9698     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 126673c: b40000d6     	cbz	x22, 0x1266754 <__start_il2cpp+0xbef90>
 1266740: f94002a8     	ldr	x8, [x21]
 1266744: aa1603e0     	mov	x0, x22
 1266748: f9402101     	ldr	x1, [x8, #0x40]
 126674c: 97f96626     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 1266750: b4001e80     	cbz	x0, 0x1266b20 <__start_il2cpp+0xbf35c>
 1266754: b9400288     	ldr	w8, [x20]
 1266758: 7100351f     	cmp	w8, #0xd
 126675c: 54001e09     	b.ls	0x1266b1c <__start_il2cpp+0xbf358>
 1266760: f90046b6     	str	x22, [x21, #0x88]
 1266764: f9400380     	ldr	x0, [x28]
 1266768: 9000aff6     	adrp	x22, 0x2862000
 126676c: b980ee77     	ldrsw	x23, [x19, #0xec]
 1266770: f94126d6     	ldr	x22, [x22, #0x248]
 1266774: 97f96660     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 1266778: f94002c1     	ldr	x1, [x22]
 126677c: aa1703e2     	mov	x2, x23
 1266780: aa1f03e3     	mov	x3, xzr
 1266784: aa0003f6     	mov	x22, x0
 1266788: 97ff9684     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 126678c: b40000d6     	cbz	x22, 0x12667a4 <__start_il2cpp+0xbefe0>
 1266790: f94002a8     	ldr	x8, [x21]
 1266794: aa1603e0     	mov	x0, x22
 1266798: f9402101     	ldr	x1, [x8, #0x40]
 126679c: 97f96612     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 12667a0: b4001c00     	cbz	x0, 0x1266b20 <__start_il2cpp+0xbf35c>
 12667a4: b9400288     	ldr	w8, [x20]
 12667a8: 7100391f     	cmp	w8, #0xe
 12667ac: 54001b89     	b.ls	0x1266b1c <__start_il2cpp+0xbf358>
 12667b0: f9004ab6     	str	x22, [x21, #0x90]
 12667b4: f9400380     	ldr	x0, [x28]
 12667b8: 9000aff6     	adrp	x22, 0x2862000
 12667bc: b9817677     	ldrsw	x23, [x19, #0x174]
 12667c0: f9411ed6     	ldr	x22, [x22, #0x238]
 12667c4: 97f9664c     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12667c8: f94002c1     	ldr	x1, [x22]
 12667cc: aa1703e2     	mov	x2, x23
 12667d0: aa1f03e3     	mov	x3, xzr
 12667d4: aa0003f6     	mov	x22, x0
 12667d8: 97ff9670     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 12667dc: b40000d6     	cbz	x22, 0x12667f4 <__start_il2cpp+0xbf030>
 12667e0: f94002a8     	ldr	x8, [x21]
 12667e4: aa1603e0     	mov	x0, x22
 12667e8: f9402101     	ldr	x1, [x8, #0x40]
 12667ec: 97f965fe     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 12667f0: b4001980     	cbz	x0, 0x1266b20 <__start_il2cpp+0xbf35c>
 12667f4: b9400288     	ldr	w8, [x20]
 12667f8: 71003d1f     	cmp	w8, #0xf
 12667fc: 54001909     	b.ls	0x1266b1c <__start_il2cpp+0xbf358>
 1266800: f9004eb6     	str	x22, [x21, #0x98]
 1266804: f9400380     	ldr	x0, [x28]
 1266808: 9000aff6     	adrp	x22, 0x2862000
 126680c: b9818277     	ldrsw	x23, [x19, #0x180]
 1266810: f94146d6     	ldr	x22, [x22, #0x288]
 1266814: 97f96638     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 1266818: f94002c1     	ldr	x1, [x22]
 126681c: aa1703e2     	mov	x2, x23
 1266820: aa1f03e3     	mov	x3, xzr
 1266824: aa0003f6     	mov	x22, x0
 1266828: 97ff965c     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 126682c: b40000d6     	cbz	x22, 0x1266844 <__start_il2cpp+0xbf080>
 1266830: f94002a8     	ldr	x8, [x21]
 1266834: aa1603e0     	mov	x0, x22
 1266838: f9402101     	ldr	x1, [x8, #0x40]
 126683c: 97f965ea     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 1266840: b4001700     	cbz	x0, 0x1266b20 <__start_il2cpp+0xbf35c>
 1266844: b9400288     	ldr	w8, [x20]
 1266848: 7100411f     	cmp	w8, #0x10
 126684c: 54001689     	b.ls	0x1266b1c <__start_il2cpp+0xbf358>
 1266850: f90052b6     	str	x22, [x21, #0xa0]
 1266854: f9400380     	ldr	x0, [x28]
 1266858: 9000aff6     	adrp	x22, 0x2862000
 126685c: b9817e77     	ldrsw	x23, [x19, #0x17c]
 1266860: f940f6d6     	ldr	x22, [x22, #0x1e8]
 1266864: 97f96624     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 1266868: f94002c1     	ldr	x1, [x22]
 126686c: aa1703e2     	mov	x2, x23
 1266870: aa1f03e3     	mov	x3, xzr
 1266874: aa0003f6     	mov	x22, x0
 1266878: 97ff9648     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 126687c: b40000d6     	cbz	x22, 0x1266894 <__start_il2cpp+0xbf0d0>
 1266880: f94002a8     	ldr	x8, [x21]
 1266884: aa1603e0     	mov	x0, x22
 1266888: f9402101     	ldr	x1, [x8, #0x40]
 126688c: 97f965d6     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 1266890: b4001480     	cbz	x0, 0x1266b20 <__start_il2cpp+0xbf35c>
 1266894: b9400288     	ldr	w8, [x20]
 1266898: 7100451f     	cmp	w8, #0x11
 126689c: 54001409     	b.ls	0x1266b1c <__start_il2cpp+0xbf358>
 12668a0: f90056b6     	str	x22, [x21, #0xa8]
 12668a4: f9400380     	ldr	x0, [x28]
 12668a8: 9000aff6     	adrp	x22, 0x2862000
 12668ac: b9817a77     	ldrsw	x23, [x19, #0x178]
 12668b0: f94116d6     	ldr	x22, [x22, #0x228]
 12668b4: 97f96610     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12668b8: f94002c1     	ldr	x1, [x22]
 12668bc: aa1703e2     	mov	x2, x23
 12668c0: aa1f03e3     	mov	x3, xzr
 12668c4: aa0003f6     	mov	x22, x0
 12668c8: 97ff9634     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 12668cc: b40000d6     	cbz	x22, 0x12668e4 <__start_il2cpp+0xbf120>
 12668d0: f94002a8     	ldr	x8, [x21]
 12668d4: aa1603e0     	mov	x0, x22
 12668d8: f9402101     	ldr	x1, [x8, #0x40]
 12668dc: 97f965c2     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 12668e0: b4001200     	cbz	x0, 0x1266b20 <__start_il2cpp+0xbf35c>
 12668e4: b9400288     	ldr	w8, [x20]
 12668e8: 7100491f     	cmp	w8, #0x12
 12668ec: 54001189     	b.ls	0x1266b1c <__start_il2cpp+0xbf358>
 12668f0: f9005ab6     	str	x22, [x21, #0xb0]
 12668f4: f9400380     	ldr	x0, [x28]
 12668f8: 9000aff6     	adrp	x22, 0x2862000
 12668fc: b980f277     	ldrsw	x23, [x19, #0xf0]
 1266900: f9411ad6     	ldr	x22, [x22, #0x230]
 1266904: 97f965fc     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 1266908: f94002c1     	ldr	x1, [x22]
 126690c: aa1703e2     	mov	x2, x23
 1266910: aa1f03e3     	mov	x3, xzr
 1266914: aa0003f6     	mov	x22, x0
 1266918: 97ff9620     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 126691c: b40000d6     	cbz	x22, 0x1266934 <__start_il2cpp+0xbf170>
 1266920: f94002a8     	ldr	x8, [x21]
 1266924: aa1603e0     	mov	x0, x22
 1266928: f9402101     	ldr	x1, [x8, #0x40]
 126692c: 97f965ae     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 1266930: b4000f80     	cbz	x0, 0x1266b20 <__start_il2cpp+0xbf35c>
 1266934: b9400288     	ldr	w8, [x20]
 1266938: 71004d1f     	cmp	w8, #0x13
 126693c: 54000f09     	b.ls	0x1266b1c <__start_il2cpp+0xbf358>
 1266940: f9005eb6     	str	x22, [x21, #0xb8]
 1266944: f9400380     	ldr	x0, [x28]
 1266948: 9000aff6     	adrp	x22, 0x2862000
 126694c: b981e677     	ldrsw	x23, [x19, #0x1e4]
 1266950: f94132d6     	ldr	x22, [x22, #0x260]
 1266954: 97f965e8     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 1266958: f94002c1     	ldr	x1, [x22]
 126695c: aa1703e2     	mov	x2, x23
 1266960: aa1f03e3     	mov	x3, xzr
 1266964: aa0003f6     	mov	x22, x0
 1266968: 97ff960c     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 126696c: b40000d6     	cbz	x22, 0x1266984 <__start_il2cpp+0xbf1c0>
 1266970: f94002a8     	ldr	x8, [x21]
 1266974: aa1603e0     	mov	x0, x22
 1266978: f9402101     	ldr	x1, [x8, #0x40]
 126697c: 97f9659a     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 1266980: b4000d00     	cbz	x0, 0x1266b20 <__start_il2cpp+0xbf35c>
 1266984: b9400288     	ldr	w8, [x20]
 1266988: 7100511f     	cmp	w8, #0x14
 126698c: 54000c89     	b.ls	0x1266b1c <__start_il2cpp+0xbf358>
 1266990: f90062b6     	str	x22, [x21, #0xc0]
 1266994: f9403a68     	ldr	x8, [x19, #0x70]
 1266998: b4000ca8     	cbz	x8, 0x1266b2c <__start_il2cpp+0xbf368>
 126699c: f9400380     	ldr	x0, [x28]
 12669a0: 9000aff3     	adrp	x19, 0x2862000
 12669a4: b9813d16     	ldrsw	x22, [x8, #0x13c]
 12669a8: f9413a73     	ldr	x19, [x19, #0x270]
 12669ac: 97f965d2     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12669b0: f9400261     	ldr	x1, [x19]
 12669b4: aa1603e2     	mov	x2, x22
 12669b8: aa1f03e3     	mov	x3, xzr
 12669bc: aa0003f3     	mov	x19, x0
 12669c0: 97ff95f6     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 12669c4: b40000d3     	cbz	x19, 0x12669dc <__start_il2cpp+0xbf218>
 12669c8: f94002a8     	ldr	x8, [x21]
 12669cc: aa1303e0     	mov	x0, x19
 12669d0: f9402101     	ldr	x1, [x8, #0x40]
 12669d4: 97f96584     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 12669d8: b4000a40     	cbz	x0, 0x1266b20 <__start_il2cpp+0xbf35c>
 12669dc: b9400288     	ldr	w8, [x20]
 12669e0: 7100551f     	cmp	w8, #0x15
 12669e4: 540009c9     	b.ls	0x1266b1c <__start_il2cpp+0xbf358>
 12669e8: f90066b3     	str	x19, [x21, #0xc8]
 12669ec: f9400380     	ldr	x0, [x28]
 12669f0: 9000aff6     	adrp	x22, 0x2862000
 12669f4: f9412ed6     	ldr	x22, [x22, #0x258]
 12669f8: 97f965bf     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12669fc: f94002c1     	ldr	x1, [x22]
 1266a00: f94003f6     	ldr	x22, [sp]
 1266a04: aa1f03e3     	mov	x3, xzr
 1266a08: aa0003f3     	mov	x19, x0
 1266a0c: 93407ec2     	sxtw	x2, w22
 1266a10: 97ff95e2     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 1266a14: b40000d3     	cbz	x19, 0x1266a2c <__start_il2cpp+0xbf268>
 1266a18: f94002a8     	ldr	x8, [x21]
 1266a1c: aa1303e0     	mov	x0, x19
 1266a20: f9402101     	ldr	x1, [x8, #0x40]
 1266a24: 97f96570     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 1266a28: b40007c0     	cbz	x0, 0x1266b20 <__start_il2cpp+0xbf35c>
 1266a2c: b9400288     	ldr	w8, [x20]
 1266a30: 7100591f     	cmp	w8, #0x16
 1266a34: 54000749     	b.ls	0x1266b1c <__start_il2cpp+0xbf358>
 1266a38: 9000aff4     	adrp	x20, 0x2862000
 1266a3c: f940de94     	ldr	x20, [x20, #0x1b8]
 1266a40: f9006ab3     	str	x19, [x21, #0xd0]
 1266a44: 9000aff3     	adrp	x19, 0x2862000
 1266a48: f9400280     	ldr	x0, [x20]
 1266a4c: b940e008     	ldr	w8, [x0, #0xe0]
 1266a50: f9410273     	ldr	x19, [x19, #0x200]
 1266a54: 35000048     	cbnz	w8, 0x1266a5c <__start_il2cpp+0xbf298>
 1266a58: 97f96562     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1266a5c: f9400260     	ldr	x0, [x19]
 1266a60: aa1503e1     	mov	x1, x21
 1266a64: aa1f03e2     	mov	x2, xzr
 1266a68: 9400aacd     	bl	0x129159c <__start_il2cpp+0xe9dd8>
 1266a6c: f000be73     	adrp	x19, 0x2a35000
 1266a70: 395de668     	ldrb	w8, [x19, #0x779]
 1266a74: 350000c8     	cbnz	w8, 0x1266a8c <__start_il2cpp+0xbf2c8>
 1266a78: f000afc0     	adrp	x0, 0x2861000
 1266a7c: f941bc00     	ldr	x0, [x0, #0x378]
 1266a80: 97f96516     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1266a84: 52800028     	mov	w8, #0x1                // =1
 1266a88: 391de668     	strb	w8, [x19, #0x779]
 1266a8c: f94003a0     	ldr	x0, [x29]
 1266a90: b940e008     	ldr	w8, [x0, #0xe0]
 1266a94: 35000068     	cbnz	w8, 0x1266aa0 <__start_il2cpp+0xbf2dc>
 1266a98: 97f96552     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1266a9c: f94003a0     	ldr	x0, [x29]
 1266aa0: f9405c08     	ldr	x8, [x0, #0xb8]
 1266aa4: aa1503e1     	mov	x1, x21
 1266aa8: aa1f03e2     	mov	x2, xzr
 1266aac: f9403d00     	ldr	x0, [x8, #0x78]
 1266ab0: 9400aabb     	bl	0x129159c <__start_il2cpp+0xe9dd8>
 1266ab4: 710006df     	cmp	w22, #0x1
 1266ab8: 54000161     	b.ne	0x1266ae4 <__start_il2cpp+0xbf320>
 1266abc: f9400280     	ldr	x0, [x20]
 1266ac0: b940e008     	ldr	w8, [x0, #0xe0]
 1266ac4: 35000048     	cbnz	w8, 0x1266acc <__start_il2cpp+0xbf308>
 1266ac8: 97f96546     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1266acc: 9000afe8     	adrp	x8, 0x2862000
 1266ad0: f9410508     	ldr	x8, [x8, #0x208]
 1266ad4: aa1503e1     	mov	x1, x21
 1266ad8: aa1f03e2     	mov	x2, xzr
 1266adc: f9400100     	ldr	x0, [x8]
 1266ae0: 9400aaaf     	bl	0x129159c <__start_il2cpp+0xe9dd8>
 1266ae4: 2a1603e0     	mov	w0, w22
 1266ae8: aa1f03e1     	mov	x1, xzr
 1266aec: 9400b52e     	bl	0x1293fa4 <__start_il2cpp+0xec7e0>
 1266af0: 2a1603e1     	mov	w1, w22
 1266af4: a9494ff4     	ldp	x20, x19, [sp, #0x90]
 1266af8: a94857f6     	ldp	x22, x21, [sp, #0x80]
 1266afc: a9475ff8     	ldp	x24, x23, [sp, #0x70]
 1266b00: a94667fa     	ldp	x26, x25, [sp, #0x60]
 1266b04: a9456ffc     	ldp	x28, x27, [sp, #0x50]
 1266b08: a9447bfd     	ldp	x29, x30, [sp, #0x40]
 1266b0c: 6d4323e9     	ldp	d9, d8, [sp, #0x30]
 1266b10: 6d422beb     	ldp	d11, d10, [sp, #0x20]
 1266b14: 910283ff     	add	sp, sp, #0xa0
 1266b18: 14000006     	b	0x1266b30 <__start_il2cpp+0xbf36c>
 1266b1c: 97f9657b     	bl	0x10c0108 <CloseNLSocket+0x640>
 1266b20: 97f96581     	bl	0x10c0124 <CloseNLSocket+0x65c>
 1266b24: aa1f03e1     	mov	x1, xzr
 1266b28: 97f9652a     	bl	0x10bffd0 <CloseNLSocket+0x508>
 1266b2c: 97f96575     	bl	0x10c0100 <CloseNLSocket+0x638>
