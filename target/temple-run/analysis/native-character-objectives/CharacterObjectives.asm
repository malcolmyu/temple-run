
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1275844: f94002e0     	ldr	x0, [x23]
 1275848: b400ec60     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 127584c: b000af68     	adrp	x8, 0x2862000
 1275850: f9440108     	ldr	x8, [x8, #0x800]
 1275854: 2a1403e1     	mov	w1, w20
 1275858: aa1f03e3     	mov	x3, xzr
 127585c: f9400102     	ldr	x2, [x8]
 1275860: 94005db5     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1275864: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1275868: 1e270101     	fmov	s1, w8
 127586c: 1e212000     	fcmp	s0, s1
 1275870: f90017fc     	str	x28, [sp, #0x28]
 1275874: f9000ff8     	str	x24, [sp, #0x18]
 1275878: 54001825     	b.pl	0x1275b7c <__start_il2cpp+0xce3b8>
 127587c: f94002e0     	ldr	x0, [x23]
 1275880: b400eaa0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275884: 52800202     	mov	w2, #0x10               // =16
 1275888: 2a1403e1     	mov	w1, w20
 127588c: aa1f03e3     	mov	x3, xzr
 1275890: 94005f36     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275894: f94002e8     	ldr	x8, [x23]
 1275898: b400e9e8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 127589c: 2a0003f5     	mov	w21, w0
 12758a0: 52800222     	mov	w2, #0x11               // =17
 12758a4: aa0803e0     	mov	x0, x8
 12758a8: 2a1403e1     	mov	w1, w20
 12758ac: aa1f03e3     	mov	x3, xzr
 12758b0: 94005f2e     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 12758b4: f94002e8     	ldr	x8, [x23]
 12758b8: b400e8e8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12758bc: 2a0003f6     	mov	w22, w0
 12758c0: 52800242     	mov	w2, #0x12               // =18
 12758c4: aa0803e0     	mov	x0, x8
 12758c8: 2a1403e1     	mov	w1, w20
 12758cc: aa1f03e3     	mov	x3, xzr
 12758d0: 94005f26     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 12758d4: f94002e8     	ldr	x8, [x23]
 12758d8: b400e7e8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12758dc: 2a0003f3     	mov	w19, w0
 12758e0: 52800262     	mov	w2, #0x13               // =19
 12758e4: aa0803e0     	mov	x0, x8
 12758e8: 2a1403e1     	mov	w1, w20
 12758ec: aa1f03e3     	mov	x3, xzr
 12758f0: 94005f1e     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 12758f4: f94002e8     	ldr	x8, [x23]
 12758f8: b400e6e8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12758fc: 2a0003f9     	mov	w25, w0
 1275900: 52800282     	mov	w2, #0x14               // =20
 1275904: aa0803e0     	mov	x0, x8
 1275908: 2a1403e1     	mov	w1, w20
 127590c: aa1f03e3     	mov	x3, xzr
 1275910: 94005f16     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275914: f94002e8     	ldr	x8, [x23]
 1275918: b400e5e8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 127591c: 2a0003fa     	mov	w26, w0
 1275920: 528002c2     	mov	w2, #0x16               // =22
 1275924: aa0803e0     	mov	x0, x8
 1275928: 2a1403e1     	mov	w1, w20
 127592c: aa1f03e3     	mov	x3, xzr
 1275930: 94005f0e     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275934: f94002e8     	ldr	x8, [x23]
 1275938: b400e4e8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 127593c: 2a0003fb     	mov	w27, w0
 1275940: 52800382     	mov	w2, #0x1c               // =28
 1275944: aa0803e0     	mov	x0, x8
 1275948: 2a1403e1     	mov	w1, w20
 127594c: aa1f03e3     	mov	x3, xzr
 1275950: 94005f06     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275954: f94002e8     	ldr	x8, [x23]
 1275958: b400e3e8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 127595c: b90017e0     	str	w0, [sp, #0x14]
 1275960: 528003a2     	mov	w2, #0x1d               // =29
 1275964: aa0803e0     	mov	x0, x8
 1275968: 2a1403e1     	mov	w1, w20
 127596c: aa1f03e3     	mov	x3, xzr
 1275970: 94005efe     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275974: f94002e8     	ldr	x8, [x23]
 1275978: b90013e0     	str	w0, [sp, #0x10]
 127597c: b400e2c8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275980: 528003c2     	mov	w2, #0x1e               // =30
 1275984: aa0803e0     	mov	x0, x8
 1275988: 2a1403e1     	mov	w1, w20
 127598c: aa1f03e3     	mov	x3, xzr
 1275990: b9000ffb     	str	w27, [sp, #0xc]
 1275994: 2a1a03fc     	mov	w28, w26
 1275998: 94005ef4     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 127599c: f94002e8     	ldr	x8, [x23]
 12759a0: b400e1a8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12759a4: 2a0003fd     	mov	w29, w0
 12759a8: 528003e2     	mov	w2, #0x1f               // =31
 12759ac: aa0803e0     	mov	x0, x8
 12759b0: 2a1403e1     	mov	w1, w20
 12759b4: aa1f03e3     	mov	x3, xzr
 12759b8: 2a1903fb     	mov	w27, w25
 12759bc: 94005eeb     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 12759c0: f94002e8     	ldr	x8, [x23]
 12759c4: b400e088     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12759c8: 2a0003fa     	mov	w26, w0
 12759cc: 52800402     	mov	w2, #0x20               // =32
 12759d0: aa0803e0     	mov	x0, x8
 12759d4: 2a1403e1     	mov	w1, w20
 12759d8: aa1f03e3     	mov	x3, xzr
 12759dc: 2a1603f8     	mov	w24, w22
 12759e0: 94005ee2     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 12759e4: f94002e8     	ldr	x8, [x23]
 12759e8: b400df68     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 12759ec: 2a0003f9     	mov	w25, w0
 12759f0: 52800422     	mov	w2, #0x21               // =33
 12759f4: aa0803e0     	mov	x0, x8
 12759f8: 2a1403e1     	mov	w1, w20
 12759fc: aa1f03e3     	mov	x3, xzr
 1275a00: 94005eda     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275a04: f94002e8     	ldr	x8, [x23]
 1275a08: b400de68     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275a0c: 2a0003f6     	mov	w22, w0
 1275a10: 52800442     	mov	w2, #0x22               // =34
 1275a14: aa0803e0     	mov	x0, x8
 1275a18: 2a1403e1     	mov	w1, w20
 1275a1c: aa1f03e3     	mov	x3, xzr
 1275a20: 94005ed2     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275a24: f94002e8     	ldr	x8, [x23]
 1275a28: b400dd68     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275a2c: 710002bf     	cmp	w21, #0x0
 1275a30: 52800029     	mov	w9, #0x1                // =1
 1275a34: 1a9fd7ea     	cset	w10, gt
 1275a38: 1a89d529     	cinc	w9, w9, gt
 1275a3c: 7100071f     	cmp	w24, #0x1
 1275a40: 1a89b149     	csel	w9, w10, w9, lt
 1275a44: b9400fea     	ldr	w10, [sp, #0xc]
 1275a48: 7100027f     	cmp	w19, #0x0
 1275a4c: 1a89d529     	cinc	w9, w9, gt
 1275a50: 7100037f     	cmp	w27, #0x0
 1275a54: 1a89d529     	cinc	w9, w9, gt
 1275a58: 7100039f     	cmp	w28, #0x0
 1275a5c: 1a89d529     	cinc	w9, w9, gt
 1275a60: 7100015f     	cmp	w10, #0x0
 1275a64: b94017ea     	ldr	w10, [sp, #0x14]
 1275a68: 1a89d529     	cinc	w9, w9, gt
 1275a6c: 52800462     	mov	w2, #0x23               // =35
 1275a70: 2a1403e1     	mov	w1, w20
 1275a74: 7100015f     	cmp	w10, #0x0
 1275a78: b94013ea     	ldr	w10, [sp, #0x10]
 1275a7c: 1a89d529     	cinc	w9, w9, gt
 1275a80: aa1f03e3     	mov	x3, xzr
 1275a84: 7100015f     	cmp	w10, #0x0
 1275a88: 1a89d529     	cinc	w9, w9, gt
 1275a8c: 710003bf     	cmp	w29, #0x0
 1275a90: 1a89d529     	cinc	w9, w9, gt
 1275a94: 7100035f     	cmp	w26, #0x0
 1275a98: 1a89d529     	cinc	w9, w9, gt
 1275a9c: 7100033f     	cmp	w25, #0x0
 1275aa0: 1a89d529     	cinc	w9, w9, gt
 1275aa4: 710002df     	cmp	w22, #0x0
 1275aa8: 1a89d529     	cinc	w9, w9, gt
 1275aac: 7100001f     	cmp	w0, #0x0
 1275ab0: aa0803e0     	mov	x0, x8
 1275ab4: 1a89d533     	cinc	w19, w9, gt
 1275ab8: 94005eac     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275abc: 7100001f     	cmp	w0, #0x0
 1275ac0: 1a93d668     	cinc	w8, w19, gt
 1275ac4: b000af73     	adrp	x19, 0x2862000
 1275ac8: 1e2c1000     	fmov	s0, #0.50000000
 1275acc: 1e220101     	scvtf	s1, w8
 1275ad0: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1275ad4: f94017fc     	ldr	x28, [sp, #0x28]
 1275ad8: f9440273     	ldr	x19, [x19, #0x800]
 1275adc: f9400ff8     	ldr	x24, [sp, #0x18]
 1275ae0: 1e200820     	fmul	s0, s1, s0
 1275ae4: 1e270101     	fmov	s1, w8
 1275ae8: 1e210800     	fmul	s0, s0, s1
 1275aec: 1e212000     	fcmp	s0, s1
 1275af0: 540003ab     	b.lt	0x1275b64 <__start_il2cpp+0xce3a0>
 1275af4: f9400300     	ldr	x0, [x24]
 1275af8: b400d6e0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275afc: f000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1275b00: f9400261     	ldr	x1, [x19]
 1275b04: f947a529     	ldr	x9, [x9, #0xf48]
 1275b08: b9401c0a     	ldr	w10, [x0, #0x1c]
 1275b0c: f9400808     	ldr	x8, [x0, #0x10]
 1275b10: f9400129     	ldr	x9, [x9]
 1275b14: 1100054a     	add	w10, w10, #0x1
 1275b18: b9001c0a     	str	w10, [x0, #0x1c]
 1275b1c: b400d5c8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275b20: b980180a     	ldrsw	x10, [x0, #0x18]
 1275b24: b940190b     	ldr	w11, [x8, #0x18]
 1275b28: 6b0b015f     	cmp	w10, w11
 1275b2c: 54000102     	b.hs	0x1275b4c <__start_il2cpp+0xce388>
 1275b30: 11000549     	add	w9, w10, #0x1
 1275b34: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1275b38: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1275b3c: b9001809     	str	w9, [x0, #0x18]
 1275b40: f9001101     	str	x1, [x8, #0x20]
 1275b44: 1e270140     	fmov	s0, w10
 1275b48: 14000007     	b	0x1275b64 <__start_il2cpp+0xce3a0>
 1275b4c: f9401128     	ldr	x8, [x9, #0x20]
 1275b50: f9406108     	ldr	x8, [x8, #0xc0]
 1275b54: f9403902     	ldr	x2, [x8, #0x70]
 1275b58: 941a122f     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1275b5c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1275b60: 1e270100     	fmov	s0, w8
 1275b64: f94002e0     	ldr	x0, [x23]
 1275b68: b400d360     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275b6c: f9400262     	ldr	x2, [x19]
 1275b70: 2a1403e1     	mov	w1, w20
 1275b74: aa1f03e3     	mov	x3, xzr
 1275b78: 94005cf7     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1275b7c: f94002e0     	ldr	x0, [x23]
 1275b80: b400d2a0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275b84: b000af68     	adrp	x8, 0x2862000
 1275b88: f944a108     	ldr	x8, [x8, #0x940]
 1275b8c: 2a1403e1     	mov	w1, w20
 1275b90: aa1f03e3     	mov	x3, xzr
 1275b94: f9400102     	ldr	x2, [x8]
 1275b98: 94005ce7     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1275b9c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1275ba0: 1e270101     	fmov	s1, w8
 1275ba4: 1e212000     	fcmp	s0, s1
 1275ba8: 54001805     	b.pl	0x1275ea8 <__start_il2cpp+0xce6e4>
 1275bac: f94002e0     	ldr	x0, [x23]
 1275bb0: b400d120     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275bb4: 52800202     	mov	w2, #0x10               // =16
 1275bb8: 2a1403e1     	mov	w1, w20
 1275bbc: aa1f03e3     	mov	x3, xzr
 1275bc0: 94005e6a     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275bc4: f94002e8     	ldr	x8, [x23]
 1275bc8: b400d068     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275bcc: 2a0003f5     	mov	w21, w0
 1275bd0: 52800222     	mov	w2, #0x11               // =17
 1275bd4: aa0803e0     	mov	x0, x8
 1275bd8: 2a1403e1     	mov	w1, w20
 1275bdc: aa1f03e3     	mov	x3, xzr
 1275be0: 94005e62     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275be4: f94002e8     	ldr	x8, [x23]
 1275be8: b400cf68     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275bec: 2a0003f6     	mov	w22, w0
 1275bf0: 52800242     	mov	w2, #0x12               // =18
 1275bf4: aa0803e0     	mov	x0, x8
 1275bf8: 2a1403e1     	mov	w1, w20
 1275bfc: aa1f03e3     	mov	x3, xzr
 1275c00: 94005e5a     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275c04: f94002e8     	ldr	x8, [x23]
 1275c08: b400ce68     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275c0c: 2a0003f3     	mov	w19, w0
 1275c10: 52800262     	mov	w2, #0x13               // =19
 1275c14: aa0803e0     	mov	x0, x8
 1275c18: 2a1403e1     	mov	w1, w20
 1275c1c: aa1f03e3     	mov	x3, xzr
 1275c20: 94005e52     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275c24: f94002e8     	ldr	x8, [x23]
 1275c28: b400cd68     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275c2c: 2a0003f9     	mov	w25, w0
 1275c30: 52800282     	mov	w2, #0x14               // =20
 1275c34: aa0803e0     	mov	x0, x8
 1275c38: 2a1403e1     	mov	w1, w20
 1275c3c: aa1f03e3     	mov	x3, xzr
 1275c40: 94005e4a     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275c44: f94002e8     	ldr	x8, [x23]
 1275c48: b400cc68     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275c4c: 2a0003fa     	mov	w26, w0
 1275c50: 528002c2     	mov	w2, #0x16               // =22
 1275c54: aa0803e0     	mov	x0, x8
 1275c58: 2a1403e1     	mov	w1, w20
 1275c5c: aa1f03e3     	mov	x3, xzr
 1275c60: 94005e42     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275c64: f94002e8     	ldr	x8, [x23]
 1275c68: b400cb68     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275c6c: 2a0003fb     	mov	w27, w0
 1275c70: 52800382     	mov	w2, #0x1c               // =28
 1275c74: aa0803e0     	mov	x0, x8
 1275c78: 2a1403e1     	mov	w1, w20
 1275c7c: aa1f03e3     	mov	x3, xzr
 1275c80: 94005e3a     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275c84: f94002e8     	ldr	x8, [x23]
 1275c88: b400ca68     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275c8c: b90017e0     	str	w0, [sp, #0x14]
 1275c90: 528003a2     	mov	w2, #0x1d               // =29
 1275c94: aa0803e0     	mov	x0, x8
 1275c98: 2a1403e1     	mov	w1, w20
 1275c9c: aa1f03e3     	mov	x3, xzr
 1275ca0: 94005e32     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275ca4: f94002e8     	ldr	x8, [x23]
 1275ca8: b400c968     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275cac: 2901efe0     	stp	w0, w27, [sp, #0xc]
 1275cb0: 528003c2     	mov	w2, #0x1e               // =30
 1275cb4: aa0803e0     	mov	x0, x8
 1275cb8: 2a1403e1     	mov	w1, w20
 1275cbc: aa1f03e3     	mov	x3, xzr
 1275cc0: 94005e2a     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275cc4: f94002e8     	ldr	x8, [x23]
 1275cc8: b400c868     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275ccc: 2a0003fd     	mov	w29, w0
 1275cd0: 528003e2     	mov	w2, #0x1f               // =31
 1275cd4: aa0803e0     	mov	x0, x8
 1275cd8: 2a1403e1     	mov	w1, w20
 1275cdc: aa1f03e3     	mov	x3, xzr
 1275ce0: 2a1a03fc     	mov	w28, w26
 1275ce4: 2a1903fb     	mov	w27, w25
 1275ce8: 94005e20     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275cec: f94002e8     	ldr	x8, [x23]
 1275cf0: b400c728     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275cf4: 2a0003f8     	mov	w24, w0
 1275cf8: 52800402     	mov	w2, #0x20               // =32
 1275cfc: aa0803e0     	mov	x0, x8
 1275d00: 2a1403e1     	mov	w1, w20
 1275d04: aa1f03e3     	mov	x3, xzr
 1275d08: 2a1603fa     	mov	w26, w22
 1275d0c: 94005e17     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275d10: f94002e8     	ldr	x8, [x23]
 1275d14: b400c608     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275d18: 2a0003f9     	mov	w25, w0
 1275d1c: 52800422     	mov	w2, #0x21               // =33
 1275d20: aa0803e0     	mov	x0, x8
 1275d24: 2a1403e1     	mov	w1, w20
 1275d28: aa1f03e3     	mov	x3, xzr
 1275d2c: 94005e0f     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275d30: f94002e8     	ldr	x8, [x23]
 1275d34: b400c508     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275d38: 2a0003f6     	mov	w22, w0
 1275d3c: 52800442     	mov	w2, #0x22               // =34
 1275d40: aa0803e0     	mov	x0, x8
 1275d44: 2a1403e1     	mov	w1, w20
 1275d48: aa1f03e3     	mov	x3, xzr
 1275d4c: 94005e07     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275d50: f94002e8     	ldr	x8, [x23]
 1275d54: b400c408     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275d58: 710002bf     	cmp	w21, #0x0
 1275d5c: 52800029     	mov	w9, #0x1                // =1
 1275d60: 1a9fd7ea     	cset	w10, gt
 1275d64: 1a89d529     	cinc	w9, w9, gt
 1275d68: 7100075f     	cmp	w26, #0x1
 1275d6c: 1a89b149     	csel	w9, w10, w9, lt
 1275d70: b94013ea     	ldr	w10, [sp, #0x10]
 1275d74: 7100027f     	cmp	w19, #0x0
 1275d78: 1a89d529     	cinc	w9, w9, gt
 1275d7c: 7100037f     	cmp	w27, #0x0
 1275d80: 1a89d529     	cinc	w9, w9, gt
 1275d84: 7100039f     	cmp	w28, #0x0
 1275d88: 1a89d529     	cinc	w9, w9, gt
 1275d8c: 7100015f     	cmp	w10, #0x0
 1275d90: b94017ea     	ldr	w10, [sp, #0x14]
 1275d94: 1a89d529     	cinc	w9, w9, gt
 1275d98: 52800462     	mov	w2, #0x23               // =35
 1275d9c: 2a1403e1     	mov	w1, w20
 1275da0: 7100015f     	cmp	w10, #0x0
 1275da4: b9400fea     	ldr	w10, [sp, #0xc]
 1275da8: 1a89d529     	cinc	w9, w9, gt
 1275dac: aa1f03e3     	mov	x3, xzr
 1275db0: 7100015f     	cmp	w10, #0x0
 1275db4: 1a89d529     	cinc	w9, w9, gt
 1275db8: 710003bf     	cmp	w29, #0x0
 1275dbc: 1a89d529     	cinc	w9, w9, gt
 1275dc0: 7100031f     	cmp	w24, #0x0
 1275dc4: 1a89d529     	cinc	w9, w9, gt
 1275dc8: 7100033f     	cmp	w25, #0x0
 1275dcc: 1a89d529     	cinc	w9, w9, gt
 1275dd0: 710002df     	cmp	w22, #0x0
 1275dd4: 1a89d529     	cinc	w9, w9, gt
 1275dd8: 7100001f     	cmp	w0, #0x0
 1275ddc: aa0803e0     	mov	x0, x8
 1275de0: 1a89d533     	cinc	w19, w9, gt
 1275de4: 94005de1     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275de8: 7100001f     	cmp	w0, #0x0
 1275dec: 1a93d668     	cinc	w8, w19, gt
 1275df0: b000af73     	adrp	x19, 0x2862000
 1275df4: 1e2a1000     	fmov	s0, #0.25000000
 1275df8: 1e220101     	scvtf	s1, w8
 1275dfc: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1275e00: f94017fc     	ldr	x28, [sp, #0x28]
 1275e04: f944a273     	ldr	x19, [x19, #0x940]
 1275e08: f9400ff8     	ldr	x24, [sp, #0x18]
 1275e0c: 1e200820     	fmul	s0, s1, s0
 1275e10: 1e270101     	fmov	s1, w8
 1275e14: 1e210800     	fmul	s0, s0, s1
 1275e18: 1e212000     	fcmp	s0, s1
 1275e1c: 540003ab     	b.lt	0x1275e90 <__start_il2cpp+0xce6cc>
 1275e20: f9400300     	ldr	x0, [x24]
 1275e24: b400bd80     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275e28: f000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1275e2c: f9400261     	ldr	x1, [x19]
 1275e30: f947a529     	ldr	x9, [x9, #0xf48]
 1275e34: b9401c0a     	ldr	w10, [x0, #0x1c]
 1275e38: f9400808     	ldr	x8, [x0, #0x10]
 1275e3c: f9400129     	ldr	x9, [x9]
 1275e40: 1100054a     	add	w10, w10, #0x1
 1275e44: b9001c0a     	str	w10, [x0, #0x1c]
 1275e48: b400bc68     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275e4c: b980180a     	ldrsw	x10, [x0, #0x18]
 1275e50: b940190b     	ldr	w11, [x8, #0x18]
 1275e54: 6b0b015f     	cmp	w10, w11
 1275e58: 54000102     	b.hs	0x1275e78 <__start_il2cpp+0xce6b4>
 1275e5c: 11000549     	add	w9, w10, #0x1
 1275e60: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1275e64: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1275e68: b9001809     	str	w9, [x0, #0x18]
 1275e6c: f9001101     	str	x1, [x8, #0x20]
 1275e70: 1e270140     	fmov	s0, w10
 1275e74: 14000007     	b	0x1275e90 <__start_il2cpp+0xce6cc>
 1275e78: f9401128     	ldr	x8, [x9, #0x20]
 1275e7c: f9406108     	ldr	x8, [x8, #0xc0]
 1275e80: f9403902     	ldr	x2, [x8, #0x70]
 1275e84: 941a1164     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 1275e88: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1275e8c: 1e270100     	fmov	s0, w8
 1275e90: f94002e0     	ldr	x0, [x23]
 1275e94: b400ba00     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275e98: f9400262     	ldr	x2, [x19]
 1275e9c: 2a1403e1     	mov	w1, w20
 1275ea0: aa1f03e3     	mov	x3, xzr
 1275ea4: 94005c2c     	bl	0x128cf54 <__start_il2cpp+0xe5790>
 1275ea8: f94002e0     	ldr	x0, [x23]
 1275eac: b400b940     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275eb0: b000af68     	adrp	x8, 0x2862000
 1275eb4: f9447d08     	ldr	x8, [x8, #0x8f8]
 1275eb8: 2a1403e1     	mov	w1, w20
 1275ebc: aa1f03e3     	mov	x3, xzr
 1275ec0: f9400102     	ldr	x2, [x8]
 1275ec4: 94005c1c     	bl	0x128cf34 <__start_il2cpp+0xe5770>
 1275ec8: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1275ecc: 1e270101     	fmov	s1, w8
 1275ed0: 1e212000     	fcmp	s0, s1
 1275ed4: 54001805     	b.pl	0x12761d4 <__start_il2cpp+0xcea10>
 1275ed8: f94002e0     	ldr	x0, [x23]
 1275edc: b400b7c0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275ee0: 52800202     	mov	w2, #0x10               // =16
 1275ee4: 2a1403e1     	mov	w1, w20
 1275ee8: aa1f03e3     	mov	x3, xzr
 1275eec: 94005d9f     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275ef0: f94002e8     	ldr	x8, [x23]
 1275ef4: b400b708     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275ef8: 2a0003f5     	mov	w21, w0
 1275efc: 52800222     	mov	w2, #0x11               // =17
 1275f00: aa0803e0     	mov	x0, x8
 1275f04: 2a1403e1     	mov	w1, w20
 1275f08: aa1f03e3     	mov	x3, xzr
 1275f0c: 94005d97     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275f10: f94002e8     	ldr	x8, [x23]
 1275f14: b400b608     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275f18: 2a0003f6     	mov	w22, w0
 1275f1c: 52800242     	mov	w2, #0x12               // =18
 1275f20: aa0803e0     	mov	x0, x8
 1275f24: 2a1403e1     	mov	w1, w20
 1275f28: aa1f03e3     	mov	x3, xzr
 1275f2c: 94005d8f     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275f30: f94002e8     	ldr	x8, [x23]
 1275f34: b400b508     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275f38: 2a0003f3     	mov	w19, w0
 1275f3c: 52800262     	mov	w2, #0x13               // =19
 1275f40: aa0803e0     	mov	x0, x8
 1275f44: 2a1403e1     	mov	w1, w20
 1275f48: aa1f03e3     	mov	x3, xzr
 1275f4c: 94005d87     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275f50: f94002e8     	ldr	x8, [x23]
 1275f54: b400b408     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275f58: 2a0003f9     	mov	w25, w0
 1275f5c: 52800282     	mov	w2, #0x14               // =20
 1275f60: aa0803e0     	mov	x0, x8
 1275f64: 2a1403e1     	mov	w1, w20
 1275f68: aa1f03e3     	mov	x3, xzr
 1275f6c: 94005d7f     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275f70: f94002e8     	ldr	x8, [x23]
 1275f74: b400b308     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275f78: 2a0003fa     	mov	w26, w0
 1275f7c: 528002c2     	mov	w2, #0x16               // =22
 1275f80: aa0803e0     	mov	x0, x8
 1275f84: 2a1403e1     	mov	w1, w20
 1275f88: aa1f03e3     	mov	x3, xzr
 1275f8c: 94005d77     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275f90: f94002e8     	ldr	x8, [x23]
 1275f94: b400b208     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275f98: 2a0003fb     	mov	w27, w0
 1275f9c: 52800382     	mov	w2, #0x1c               // =28
 1275fa0: aa0803e0     	mov	x0, x8
 1275fa4: 2a1403e1     	mov	w1, w20
 1275fa8: aa1f03e3     	mov	x3, xzr
 1275fac: 94005d6f     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275fb0: f94002e8     	ldr	x8, [x23]
 1275fb4: b400b108     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275fb8: b90017e0     	str	w0, [sp, #0x14]
 1275fbc: 52800462     	mov	w2, #0x23               // =35
 1275fc0: aa0803e0     	mov	x0, x8
 1275fc4: 2a1403e1     	mov	w1, w20
 1275fc8: aa1f03e3     	mov	x3, xzr
 1275fcc: 94005d67     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275fd0: f94002e8     	ldr	x8, [x23]
 1275fd4: b400b008     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275fd8: 2901efe0     	stp	w0, w27, [sp, #0xc]
 1275fdc: 528003a2     	mov	w2, #0x1d               // =29
 1275fe0: aa0803e0     	mov	x0, x8
 1275fe4: 2a1403e1     	mov	w1, w20
 1275fe8: aa1f03e3     	mov	x3, xzr
 1275fec: 94005d5f     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1275ff0: f94002e8     	ldr	x8, [x23]
 1275ff4: b400af08     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1275ff8: 2a0003fd     	mov	w29, w0
 1275ffc: 528003c2     	mov	w2, #0x1e               // =30
 1276000: aa0803e0     	mov	x0, x8
 1276004: 2a1403e1     	mov	w1, w20
 1276008: aa1f03e3     	mov	x3, xzr
 127600c: 2a1a03fc     	mov	w28, w26
 1276010: 2a1903fb     	mov	w27, w25
 1276014: 94005d55     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1276018: f94002e8     	ldr	x8, [x23]
 127601c: b400adc8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276020: 2a0003f8     	mov	w24, w0
 1276024: 528003e2     	mov	w2, #0x1f               // =31
 1276028: aa0803e0     	mov	x0, x8
 127602c: 2a1403e1     	mov	w1, w20
 1276030: aa1f03e3     	mov	x3, xzr
 1276034: 2a1603fa     	mov	w26, w22
 1276038: 94005d4c     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 127603c: f94002e8     	ldr	x8, [x23]
 1276040: b400aca8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276044: 2a0003f9     	mov	w25, w0
 1276048: 52800422     	mov	w2, #0x21               // =33
 127604c: aa0803e0     	mov	x0, x8
 1276050: 2a1403e1     	mov	w1, w20
 1276054: aa1f03e3     	mov	x3, xzr
 1276058: 94005d44     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 127605c: f94002e8     	ldr	x8, [x23]
 1276060: b400aba8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276064: 2a0003f6     	mov	w22, w0
 1276068: 52800442     	mov	w2, #0x22               // =34
 127606c: aa0803e0     	mov	x0, x8
 1276070: 2a1403e1     	mov	w1, w20
 1276074: aa1f03e3     	mov	x3, xzr
 1276078: 94005d3c     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 127607c: f94002e8     	ldr	x8, [x23]
 1276080: b400aaa8     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276084: 710002bf     	cmp	w21, #0x0
 1276088: 52800029     	mov	w9, #0x1                // =1
 127608c: 1a9fd7ea     	cset	w10, gt
 1276090: 1a89d529     	cinc	w9, w9, gt
 1276094: 7100075f     	cmp	w26, #0x1
 1276098: 1a89b149     	csel	w9, w10, w9, lt
 127609c: b94013ea     	ldr	w10, [sp, #0x10]
 12760a0: 7100027f     	cmp	w19, #0x0
 12760a4: 1a89d529     	cinc	w9, w9, gt
 12760a8: 7100037f     	cmp	w27, #0x0
 12760ac: 1a89d529     	cinc	w9, w9, gt
 12760b0: 7100039f     	cmp	w28, #0x0
 12760b4: 1a89d529     	cinc	w9, w9, gt
 12760b8: 7100015f     	cmp	w10, #0x0
 12760bc: b94017ea     	ldr	w10, [sp, #0x14]
 12760c0: 1a89d529     	cinc	w9, w9, gt
 12760c4: 52800402     	mov	w2, #0x20               // =32
 12760c8: 2a1403e1     	mov	w1, w20
 12760cc: 7100015f     	cmp	w10, #0x0
 12760d0: b9400fea     	ldr	w10, [sp, #0xc]
 12760d4: 1a89d529     	cinc	w9, w9, gt
 12760d8: aa1f03e3     	mov	x3, xzr
 12760dc: 7100015f     	cmp	w10, #0x0
 12760e0: 1a89d529     	cinc	w9, w9, gt
 12760e4: 710003bf     	cmp	w29, #0x0
 12760e8: 1a89d529     	cinc	w9, w9, gt
 12760ec: 7100031f     	cmp	w24, #0x0
 12760f0: 1a89d529     	cinc	w9, w9, gt
 12760f4: 7100033f     	cmp	w25, #0x0
 12760f8: 1a89d529     	cinc	w9, w9, gt
 12760fc: 710002df     	cmp	w22, #0x0
 1276100: 1a89d529     	cinc	w9, w9, gt
 1276104: 7100001f     	cmp	w0, #0x0
 1276108: aa0803e0     	mov	x0, x8
 127610c: 1a89d533     	cinc	w19, w9, gt
 1276110: 94005d16     	bl	0x128d568 <__start_il2cpp+0xe5da4>
 1276114: 7100001f     	cmp	w0, #0x0
 1276118: 1a93d668     	cinc	w8, w19, gt
 127611c: 9000af73     	adrp	x19, 0x2862000
 1276120: 1e231000     	fmov	s0, #6.00000000
 1276124: 1e220101     	scvtf	s1, w8
 1276128: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 127612c: f94017fc     	ldr	x28, [sp, #0x28]
 1276130: f9447e73     	ldr	x19, [x19, #0x8f8]
 1276134: f9400ff8     	ldr	x24, [sp, #0x18]
 1276138: 1e201820     	fdiv	s0, s1, s0
 127613c: 1e270101     	fmov	s1, w8
 1276140: 1e210800     	fmul	s0, s0, s1
 1276144: 1e212000     	fcmp	s0, s1
 1276148: 540003ab     	b.lt	0x12761bc <__start_il2cpp+0xce9f8>
 127614c: f9400300     	ldr	x0, [x24]
 1276150: b400a420     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276154: d000af29     	adrp	x9, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1276158: f9400261     	ldr	x1, [x19]
 127615c: f947a529     	ldr	x9, [x9, #0xf48]
 1276160: b9401c0a     	ldr	w10, [x0, #0x1c]
 1276164: f9400808     	ldr	x8, [x0, #0x10]
 1276168: f9400129     	ldr	x9, [x9]
 127616c: 1100054a     	add	w10, w10, #0x1
 1276170: b9001c0a     	str	w10, [x0, #0x1c]
 1276174: b400a308     	cbz	x8, 0x12775d4 <__start_il2cpp+0xcfe10>
 1276178: b980180a     	ldrsw	x10, [x0, #0x18]
 127617c: b940190b     	ldr	w11, [x8, #0x18]
 1276180: 6b0b015f     	cmp	w10, w11
 1276184: 54000102     	b.hs	0x12761a4 <__start_il2cpp+0xce9e0>
 1276188: 11000549     	add	w9, w10, #0x1
 127618c: 8b0a0d08     	add	x8, x8, x10, lsl #3
 1276190: 52a8590a     	mov	w10, #0x42c80000        // =1120403456
 1276194: b9001809     	str	w9, [x0, #0x18]
 1276198: f9001101     	str	x1, [x8, #0x20]
 127619c: 1e270140     	fmov	s0, w10
 12761a0: 14000007     	b	0x12761bc <__start_il2cpp+0xce9f8>
 12761a4: f9401128     	ldr	x8, [x9, #0x20]
 12761a8: f9406108     	ldr	x8, [x8, #0xc0]
 12761ac: f9403902     	ldr	x2, [x8, #0x70]
 12761b0: 941a1099     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 12761b4: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12761b8: 1e270100     	fmov	s0, w8
 12761bc: f94002e0     	ldr	x0, [x23]
 12761c0: b400a0a0     	cbz	x0, 0x12775d4 <__start_il2cpp+0xcfe10>
 12761c4: f9400262     	ldr	x2, [x19]
 12761c8: 2a1403e1     	mov	w1, w20
 12761cc: aa1f03e3     	mov	x3, xzr
 12761d0: 94005b61     	bl	0x128cf54 <__start_il2cpp+0xe5790>
