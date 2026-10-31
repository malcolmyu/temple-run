
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12f6858: d101c3ff     	sub	sp, sp, #0x70
 12f685c: a9017bfd     	stp	x29, x30, [sp, #0x10]
 12f6860: a9026ffc     	stp	x28, x27, [sp, #0x20]
 12f6864: a90367fa     	stp	x26, x25, [sp, #0x30]
 12f6868: a9045ff8     	stp	x24, x23, [sp, #0x40]
 12f686c: a90557f6     	stp	x22, x21, [sp, #0x50]
 12f6870: a9064ff4     	stp	x20, x19, [sp, #0x60]
 12f6874: f000b9f5     	adrp	x21, 0x2a35000
 12f6878: 9000ab97     	adrp	x23, 0x2866000
 12f687c: 9000ab94     	adrp	x20, 0x2866000
 12f6880: 396edea8     	ldrb	w8, [x21, #0xbb7]
 12f6884: f94406f7     	ldr	x23, [x23, #0x808]
 12f6888: f9441694     	ldr	x20, [x20, #0x828]
 12f688c: aa0003f3     	mov	x19, x0
 12f6890: 37000788     	tbnz	w8, #0x0, 0x12f6980 <__start_il2cpp+0x14f1bc>
 12f6894: d000ab20     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12f6898: f9456000     	ldr	x0, [x0, #0xac0]
 12f689c: 97f7258f     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f68a0: 9000ab80     	adrp	x0, 0x2866000
 12f68a4: f9441400     	ldr	x0, [x0, #0x828]
 12f68a8: 97f7258c     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f68ac: 9000ab80     	adrp	x0, 0x2866000
 12f68b0: f9440400     	ldr	x0, [x0, #0x808]
 12f68b4: 97f72589     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f68b8: f000ab20     	adrp	x0, 0x285d000
 12f68bc: f9411800     	ldr	x0, [x0, #0x230]
 12f68c0: 97f72586     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f68c4: 9000ab80     	adrp	x0, 0x2866000
 12f68c8: f9441800     	ldr	x0, [x0, #0x830]
 12f68cc: 97f72583     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f68d0: 9000ab80     	adrp	x0, 0x2866000
 12f68d4: f9441c00     	ldr	x0, [x0, #0x838]
 12f68d8: 97f72580     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f68dc: 9000ab80     	adrp	x0, 0x2866000
 12f68e0: f9442000     	ldr	x0, [x0, #0x840]
 12f68e4: 97f7257d     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f68e8: 9000ab80     	adrp	x0, 0x2866000
 12f68ec: f9442400     	ldr	x0, [x0, #0x848]
 12f68f0: 97f7257a     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f68f4: 9000ab80     	adrp	x0, 0x2866000
 12f68f8: f9442800     	ldr	x0, [x0, #0x850]
 12f68fc: 97f72577     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f6900: 9000ab80     	adrp	x0, 0x2866000
 12f6904: f9442c00     	ldr	x0, [x0, #0x858]
 12f6908: 97f72574     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f690c: 9000ab80     	adrp	x0, 0x2866000
 12f6910: f9443000     	ldr	x0, [x0, #0x860]
 12f6914: 97f72571     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f6918: 9000ab80     	adrp	x0, 0x2866000
 12f691c: f9443400     	ldr	x0, [x0, #0x868]
 12f6920: 97f7256e     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f6924: 9000ab80     	adrp	x0, 0x2866000
 12f6928: f9443800     	ldr	x0, [x0, #0x870]
 12f692c: 97f7256b     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f6930: 9000ab80     	adrp	x0, 0x2866000
 12f6934: f9443c00     	ldr	x0, [x0, #0x878]
 12f6938: 97f72568     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f693c: 9000ab80     	adrp	x0, 0x2866000
 12f6940: f9444000     	ldr	x0, [x0, #0x880]
 12f6944: 97f72565     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f6948: 9000ab80     	adrp	x0, 0x2866000
 12f694c: f9444400     	ldr	x0, [x0, #0x888]
 12f6950: 97f72562     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f6954: 9000ab80     	adrp	x0, 0x2866000
 12f6958: f9444800     	ldr	x0, [x0, #0x890]
 12f695c: 97f7255f     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f6960: 9000ab80     	adrp	x0, 0x2866000
 12f6964: f9444c00     	ldr	x0, [x0, #0x898]
 12f6968: 97f7255c     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f696c: 9000ab80     	adrp	x0, 0x2866000
 12f6970: f9445000     	ldr	x0, [x0, #0x8a0]
 12f6974: 97f72559     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f6978: 52800028     	mov	w8, #0x1                // =1
 12f697c: 392edea8     	strb	w8, [x21, #0xbb7]
 12f6980: f000ab38     	adrp	x24, 0x285d000
 12f6984: d000ab36     	adrp	x22, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12f6988: f9411b18     	ldr	x24, [x24, #0x230]
 12f698c: f94562d6     	ldr	x22, [x22, #0xac0]
 12f6990: f94002e8     	ldr	x8, [x23]
 12f6994: 9000ab99     	adrp	x25, 0x2866000
 12f6998: 9000ab9a     	adrp	x26, 0x2866000
 12f699c: f9444b39     	ldr	x25, [x25, #0x890]
 12f69a0: f944235a     	ldr	x26, [x26, #0x840]
 12f69a4: f9405d08     	ldr	x8, [x8, #0xb8]
 12f69a8: 528f2c29     	mov	w9, #0x7961             // =31073
 12f69ac: 72bfffc9     	movk	w9, #0xfffe, lsl #16
 12f69b0: 52a7d00a     	mov	w10, #0x3e800000        // =1048576000
 12f69b4: 0e040d20     	dup	v0.2s, w9
 12f69b8: f9000113     	str	x19, [x8]
 12f69bc: fd001660     	str	d0, [x19, #0x28]
 12f69c0: b900326a     	str	w10, [x19, #0x30]
 12f69c4: f9400280     	ldr	x0, [x20]
 12f69c8: 9000ab9b     	adrp	x27, 0x2866000
 12f69cc: 9000ab9c     	adrp	x28, 0x2866000
 12f69d0: 9000ab9d     	adrp	x29, 0x2866000
 12f69d4: f9444f7b     	ldr	x27, [x27, #0x898]
 12f69d8: f944479c     	ldr	x28, [x28, #0x888]
 12f69dc: f9441bbd     	ldr	x29, [x29, #0x830]
 12f69e0: 52802d21     	mov	w1, #0x169              // =361
 12f69e4: 97f7255b     	bl	0x10bff50 <CloseNLSocket+0x488>
 12f69e8: f9001e60     	str	x0, [x19, #0x38]
 12f69ec: b9000fff     	str	wzr, [sp, #0xc]
 12f69f0: 528002a1     	mov	w1, #0x15               // =21
 12f69f4: 2a1f03e0     	mov	w0, wzr
 12f69f8: aa1f03e2     	mov	x2, xzr
 12f69fc: 9446f53b     	bl	0x24b3ee8 <__start_il2cpp+0x130c724>
 12f6a00: 7100281f     	cmp	w0, #0xa
 12f6a04: 5400026d     	b.le	0x12f6a50 <__start_il2cpp+0x14f28c>
 12f6a08: 7100381f     	cmp	w0, #0xe
 12f6a0c: 5400068d     	b.le	0x12f6adc <__start_il2cpp+0x14f318>
 12f6a10: 7100401f     	cmp	w0, #0x10
 12f6a14: 54000aed     	b.le	0x12f6b70 <__start_il2cpp+0x14f3ac>
 12f6a18: 7100481f     	cmp	w0, #0x12
 12f6a1c: 540015ed     	b.le	0x12f6cd8 <__start_il2cpp+0x14f514>
 12f6a20: 7100501f     	cmp	w0, #0x14
 12f6a24: 54001620     	b.eq	0x12f6ce8 <__start_il2cpp+0x14f524>
 12f6a28: 71004c1f     	cmp	w0, #0x13
 12f6a2c: 540016e1     	b.ne	0x12f6d08 <__start_il2cpp+0x14f544>
 12f6a30: 9000ab88     	adrp	x8, 0x2866000
 12f6a34: f9441d08     	ldr	x8, [x8, #0x838]
 12f6a38: f9400100     	ldr	x0, [x8]
 12f6a3c: 97fffeec     	bl	0x12f65ec <__start_il2cpp+0x14ee28>
 12f6a40: b40017a0     	cbz	x0, 0x12f6d34 <__start_il2cpp+0x14f570>
 12f6a44: aa0003f4     	mov	x20, x0
 12f6a48: 528000a8     	mov	w8, #0x5                // =5
 12f6a4c: 1400006d     	b	0x12f6c00 <__start_il2cpp+0x14f43c>
 12f6a50: f9400300     	ldr	x0, [x24]
 12f6a54: 52800081     	mov	w1, #0x4                // =4
 12f6a58: 97f7253e     	bl	0x10bff50 <CloseNLSocket+0x488>
 12f6a5c: b40016c0     	cbz	x0, 0x12f6d34 <__start_il2cpp+0x14f570>
 12f6a60: b9401808     	ldr	w8, [x0, #0x18]
 12f6a64: aa0003f4     	mov	x20, x0
 12f6a68: 34001648     	cbz	w8, 0x12f6d30 <__start_il2cpp+0x14f56c>
 12f6a6c: f9400349     	ldr	x9, [x26]
 12f6a70: 7100051f     	cmp	w8, #0x1
 12f6a74: f9001289     	str	x9, [x20, #0x20]
 12f6a78: 540015c0     	b.eq	0x12f6d30 <__start_il2cpp+0x14f56c>
 12f6a7c: f9400369     	ldr	x9, [x27]
 12f6a80: 7100091f     	cmp	w8, #0x2
 12f6a84: f9001689     	str	x9, [x20, #0x28]
 12f6a88: 54001549     	b.ls	0x12f6d30 <__start_il2cpp+0x14f56c>
 12f6a8c: f9400389     	ldr	x9, [x28]
 12f6a90: 71000d1f     	cmp	w8, #0x3
 12f6a94: f9001a89     	str	x9, [x20, #0x30]
 12f6a98: 540014c0     	b.eq	0x12f6d30 <__start_il2cpp+0x14f56c>
 12f6a9c: f94003a8     	ldr	x8, [x29]
 12f6aa0: 52800081     	mov	w1, #0x4                // =4
 12f6aa4: 2a1f03e0     	mov	w0, wzr
 12f6aa8: aa1f03e2     	mov	x2, xzr
 12f6aac: f9001e88     	str	x8, [x20, #0x38]
 12f6ab0: 9446f50e     	bl	0x24b3ee8 <__start_il2cpp+0x130c724>
 12f6ab4: b9401a88     	ldr	w8, [x20, #0x18]
 12f6ab8: 6b08001f     	cmp	w0, w8
 12f6abc: 540013a2     	b.hs	0x12f6d30 <__start_il2cpp+0x14f56c>
 12f6ac0: 8b20ce88     	add	x8, x20, w0, sxtw #3
 12f6ac4: f9401100     	ldr	x0, [x8, #0x20]
 12f6ac8: 97fffec9     	bl	0x12f65ec <__start_il2cpp+0x14ee28>
 12f6acc: b4001340     	cbz	x0, 0x12f6d34 <__start_il2cpp+0x14f570>
 12f6ad0: aa0003f4     	mov	x20, x0
 12f6ad4: 52800028     	mov	w8, #0x1                // =1
 12f6ad8: 1400004a     	b	0x12f6c00 <__start_il2cpp+0x14f43c>
 12f6adc: f9400300     	ldr	x0, [x24]
 12f6ae0: 52800061     	mov	w1, #0x3                // =3
 12f6ae4: 97f7251b     	bl	0x10bff50 <CloseNLSocket+0x488>
 12f6ae8: b4001260     	cbz	x0, 0x12f6d34 <__start_il2cpp+0x14f570>
 12f6aec: b9401808     	ldr	w8, [x0, #0x18]
 12f6af0: aa0003f4     	mov	x20, x0
 12f6af4: 340011e8     	cbz	w8, 0x12f6d30 <__start_il2cpp+0x14f56c>
 12f6af8: 9000ab89     	adrp	x9, 0x2866000
 12f6afc: f9442d29     	ldr	x9, [x9, #0x858]
 12f6b00: 7100051f     	cmp	w8, #0x1
 12f6b04: f9400129     	ldr	x9, [x9]
 12f6b08: f9001289     	str	x9, [x20, #0x20]
 12f6b0c: 54001120     	b.eq	0x12f6d30 <__start_il2cpp+0x14f56c>
 12f6b10: 9000ab89     	adrp	x9, 0x2866000
 12f6b14: f9442929     	ldr	x9, [x9, #0x850]
 12f6b18: 7100091f     	cmp	w8, #0x2
 12f6b1c: f9400129     	ldr	x9, [x9]
 12f6b20: f9001689     	str	x9, [x20, #0x28]
 12f6b24: 54001069     	b.ls	0x12f6d30 <__start_il2cpp+0x14f56c>
 12f6b28: 9000ab88     	adrp	x8, 0x2866000
 12f6b2c: f9443508     	ldr	x8, [x8, #0x868]
 12f6b30: 52800061     	mov	w1, #0x3                // =3
 12f6b34: 2a1f03e0     	mov	w0, wzr
 12f6b38: aa1f03e2     	mov	x2, xzr
 12f6b3c: f9400108     	ldr	x8, [x8]
 12f6b40: f9001a88     	str	x8, [x20, #0x30]
 12f6b44: 9446f4e9     	bl	0x24b3ee8 <__start_il2cpp+0x130c724>
 12f6b48: b9401a88     	ldr	w8, [x20, #0x18]
 12f6b4c: 6b08001f     	cmp	w0, w8
 12f6b50: 54000f02     	b.hs	0x12f6d30 <__start_il2cpp+0x14f56c>
 12f6b54: 8b20ce88     	add	x8, x20, w0, sxtw #3
 12f6b58: f9401100     	ldr	x0, [x8, #0x20]
 12f6b5c: 97fffea4     	bl	0x12f65ec <__start_il2cpp+0x14ee28>
 12f6b60: b4000ea0     	cbz	x0, 0x12f6d34 <__start_il2cpp+0x14f570>
 12f6b64: aa0003f4     	mov	x20, x0
 12f6b68: 52800048     	mov	w8, #0x2                // =2
 12f6b6c: 14000025     	b	0x12f6c00 <__start_il2cpp+0x14f43c>
 12f6b70: f9400300     	ldr	x0, [x24]
 12f6b74: 52800061     	mov	w1, #0x3                // =3
 12f6b78: 97f724f6     	bl	0x10bff50 <CloseNLSocket+0x488>
 12f6b7c: b4000dc0     	cbz	x0, 0x12f6d34 <__start_il2cpp+0x14f570>
 12f6b80: b9401808     	ldr	w8, [x0, #0x18]
 12f6b84: aa0003f4     	mov	x20, x0
 12f6b88: 34000d48     	cbz	w8, 0x12f6d30 <__start_il2cpp+0x14f56c>
 12f6b8c: 9000ab89     	adrp	x9, 0x2866000
 12f6b90: f9444129     	ldr	x9, [x9, #0x880]
 12f6b94: 7100051f     	cmp	w8, #0x1
 12f6b98: f9400129     	ldr	x9, [x9]
 12f6b9c: f9001289     	str	x9, [x20, #0x20]
 12f6ba0: 54000c80     	b.eq	0x12f6d30 <__start_il2cpp+0x14f56c>
 12f6ba4: 9000ab89     	adrp	x9, 0x2866000
 12f6ba8: f9443d29     	ldr	x9, [x9, #0x878]
 12f6bac: 7100091f     	cmp	w8, #0x2
 12f6bb0: f9400129     	ldr	x9, [x9]
 12f6bb4: f9001689     	str	x9, [x20, #0x28]
 12f6bb8: 54000bc9     	b.ls	0x12f6d30 <__start_il2cpp+0x14f56c>
 12f6bbc: 9000ab88     	adrp	x8, 0x2866000
 12f6bc0: f9445108     	ldr	x8, [x8, #0x8a0]
 12f6bc4: 52800061     	mov	w1, #0x3                // =3
 12f6bc8: 2a1f03e0     	mov	w0, wzr
 12f6bcc: aa1f03e2     	mov	x2, xzr
 12f6bd0: f9400108     	ldr	x8, [x8]
 12f6bd4: f9001a88     	str	x8, [x20, #0x30]
 12f6bd8: 9446f4c4     	bl	0x24b3ee8 <__start_il2cpp+0x130c724>
 12f6bdc: b9401a88     	ldr	w8, [x20, #0x18]
 12f6be0: 6b08001f     	cmp	w0, w8
 12f6be4: 54000a62     	b.hs	0x12f6d30 <__start_il2cpp+0x14f56c>
 12f6be8: 8b20ce88     	add	x8, x20, w0, sxtw #3
 12f6bec: f9401100     	ldr	x0, [x8, #0x20]
 12f6bf0: 97fffe7f     	bl	0x12f65ec <__start_il2cpp+0x14ee28>
 12f6bf4: b4000a00     	cbz	x0, 0x12f6d34 <__start_il2cpp+0x14f570>
 12f6bf8: aa0003f4     	mov	x20, x0
 12f6bfc: 52800068     	mov	w8, #0x3                // =3
 12f6c00: b9002a88     	str	w8, [x20, #0x28]
 12f6c04: f94002c0     	ldr	x0, [x22]
 12f6c08: b940e008     	ldr	w8, [x0, #0xe0]
 12f6c0c: 35000048     	cbnz	w8, 0x12f6c14 <__start_il2cpp+0x14f450>
 12f6c10: 97f724f4     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12f6c14: aa1403e0     	mov	x0, x20
 12f6c18: aa1f03e1     	mov	x1, xzr
 12f6c1c: aa1f03e2     	mov	x2, xzr
 12f6c20: 94470a1e     	bl	0x24b9498 <__start_il2cpp+0x1311cd4>
 12f6c24: 360001a0     	tbz	w0, #0x0, 0x12f6c58 <__start_il2cpp+0x14f494>
 12f6c28: 910033e0     	add	x0, sp, #0xc
 12f6c2c: aa1f03e1     	mov	x1, xzr
 12f6c30: 942eadb9     	bl	0x1ea2314 <__start_il2cpp+0xcfab50>
 12f6c34: 9000ab88     	adrp	x8, 0x2866000
 12f6c38: f9443108     	ldr	x8, [x8, #0x860]
 12f6c3c: aa0003e1     	mov	x1, x0
 12f6c40: aa1f03e2     	mov	x2, xzr
 12f6c44: f9400108     	ldr	x8, [x8]
 12f6c48: aa0803e0     	mov	x0, x8
 12f6c4c: 94291094     	bl	0x1d3ae9c <__start_il2cpp+0xb936d8>
 12f6c50: aa1303e1     	mov	x1, x19
 12f6c54: 9400003c     	bl	0x12f6d44 <__start_il2cpp+0x14f580>
 12f6c58: 910033e0     	add	x0, sp, #0xc
 12f6c5c: aa1f03e1     	mov	x1, xzr
 12f6c60: 942eadad     	bl	0x1ea2314 <__start_il2cpp+0xcfab50>
 12f6c64: f9400328     	ldr	x8, [x25]
 12f6c68: aa0003e1     	mov	x1, x0
 12f6c6c: aa1f03e2     	mov	x2, xzr
 12f6c70: aa0803e0     	mov	x0, x8
 12f6c74: 9429108a     	bl	0x1d3ae9c <__start_il2cpp+0xb936d8>
 12f6c78: b40005f4     	cbz	x20, 0x12f6d34 <__start_il2cpp+0x14f570>
 12f6c7c: aa0003e1     	mov	x1, x0
 12f6c80: aa1403e0     	mov	x0, x20
 12f6c84: aa1f03e2     	mov	x2, xzr
 12f6c88: 9447154c     	bl	0x24bc1b8 <__start_il2cpp+0x13149f4>
 12f6c8c: f9401e75     	ldr	x21, [x19, #0x38]
 12f6c90: b4000535     	cbz	x21, 0x12f6d34 <__start_il2cpp+0x14f570>
 12f6c94: f94002a8     	ldr	x8, [x21]
 12f6c98: b9800ff7     	ldrsw	x23, [sp, #0xc]
 12f6c9c: aa1403e0     	mov	x0, x20
 12f6ca0: f9402101     	ldr	x1, [x8, #0x40]
 12f6ca4: 97f724d0     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 12f6ca8: b4000480     	cbz	x0, 0x12f6d38 <__start_il2cpp+0x14f574>
 12f6cac: b9401aa8     	ldr	w8, [x21, #0x18]
 12f6cb0: 6b0802ff     	cmp	w23, w8
 12f6cb4: 540003e2     	b.hs	0x12f6d30 <__start_il2cpp+0x14f56c>
 12f6cb8: 8b170ea8     	add	x8, x21, x23, lsl #3
 12f6cbc: f9001114     	str	x20, [x8, #0x20]
 12f6cc0: b9400fe8     	ldr	w8, [sp, #0xc]
 12f6cc4: 11000508     	add	w8, w8, #0x1
 12f6cc8: 7105a51f     	cmp	w8, #0x169
 12f6ccc: b9000fe8     	str	w8, [sp, #0xc]
 12f6cd0: 54ffe90b     	b.lt	0x12f69f0 <__start_il2cpp+0x14f22c>
 12f6cd4: 1400000f     	b	0x12f6d10 <__start_il2cpp+0x14f54c>
 12f6cd8: 9000ab88     	adrp	x8, 0x2866000
 12f6cdc: f9443908     	ldr	x8, [x8, #0x870]
 12f6ce0: f9400100     	ldr	x0, [x8]
 12f6ce4: 17ffff79     	b	0x12f6ac8 <__start_il2cpp+0x14f304>
 12f6ce8: 9000ab88     	adrp	x8, 0x2866000
 12f6cec: f9442508     	ldr	x8, [x8, #0x848]
 12f6cf0: f9400100     	ldr	x0, [x8]
 12f6cf4: 97fffe3e     	bl	0x12f65ec <__start_il2cpp+0x14ee28>
 12f6cf8: b40001e0     	cbz	x0, 0x12f6d34 <__start_il2cpp+0x14f570>
 12f6cfc: aa0003f4     	mov	x20, x0
 12f6d00: 52800088     	mov	w8, #0x4                // =4
 12f6d04: 17ffffbf     	b	0x12f6c00 <__start_il2cpp+0x14f43c>
 12f6d08: aa1f03f4     	mov	x20, xzr
 12f6d0c: 17ffffbe     	b	0x12f6c04 <__start_il2cpp+0x14f440>
 12f6d10: a9464ff4     	ldp	x20, x19, [sp, #0x60]
 12f6d14: a94557f6     	ldp	x22, x21, [sp, #0x50]
 12f6d18: a9445ff8     	ldp	x24, x23, [sp, #0x40]
 12f6d1c: a94367fa     	ldp	x26, x25, [sp, #0x30]
 12f6d20: a9426ffc     	ldp	x28, x27, [sp, #0x20]
 12f6d24: a9417bfd     	ldp	x29, x30, [sp, #0x10]
 12f6d28: 9101c3ff     	add	sp, sp, #0x70
 12f6d2c: d65f03c0     	ret
 12f6d30: 97f724f6     	bl	0x10c0108 <CloseNLSocket+0x640>
 12f6d34: 97f724f3     	bl	0x10c0100 <CloseNLSocket+0x638>
 12f6d38: 97f724fb     	bl	0x10c0124 <CloseNLSocket+0x65c>
 12f6d3c: aa1f03e1     	mov	x1, xzr
 12f6d40: 97f724a4     	bl	0x10bffd0 <CloseNLSocket+0x508>
