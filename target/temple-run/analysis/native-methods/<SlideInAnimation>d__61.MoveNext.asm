
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12be6fc: 6dbc23e9     	stp	d9, d8, [sp, #-0x40]!
 12be700: a9015ffe     	stp	x30, x23, [sp, #0x10]
 12be704: a90257f6     	stp	x22, x21, [sp, #0x20]
 12be708: a9034ff4     	stp	x20, x19, [sp, #0x30]
 12be70c: f000bbb4     	adrp	x20, 0x2a35000
 12be710: 39680a88     	ldrb	w8, [x20, #0xa02]
 12be714: aa0003f3     	mov	x19, x0
 12be718: 370005a8     	tbnz	w8, #0x0, 0x12be7cc <__start_il2cpp+0x117008>
 12be71c: 9000ad00     	adrp	x0, 0x285e000
 12be720: f9414c00     	ldr	x0, [x0, #0x298]
 12be724: 97f805ed     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12be728: 9000ad20     	adrp	x0, 0x2862000
 12be72c: f942c800     	ldr	x0, [x0, #0x590]
 12be730: 97f805ea     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12be734: 9000ad00     	adrp	x0, 0x285e000
 12be738: f9474c00     	ldr	x0, [x0, #0xe98]
 12be73c: 97f805e7     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12be740: 9000ad00     	adrp	x0, 0x285e000
 12be744: f9479400     	ldr	x0, [x0, #0xf28]
 12be748: 97f805e4     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12be74c: 9000ad00     	adrp	x0, 0x285e000
 12be750: f9414000     	ldr	x0, [x0, #0x280]
 12be754: 97f805e1     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12be758: 9000ad20     	adrp	x0, 0x2862000
 12be75c: f942b000     	ldr	x0, [x0, #0x560]
 12be760: 97f805de     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12be764: d000ad20     	adrp	x0, 0x2864000
 12be768: f9450800     	ldr	x0, [x0, #0xa10]
 12be76c: 97f805db     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12be770: d000ad20     	adrp	x0, 0x2864000
 12be774: f940fc00     	ldr	x0, [x0, #0x1f8]
 12be778: 97f805d8     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12be77c: d000ace0     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12be780: f9456000     	ldr	x0, [x0, #0xac0]
 12be784: 97f805d5     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12be788: 9000ad20     	adrp	x0, 0x2862000
 12be78c: f941e800     	ldr	x0, [x0, #0x3d0]
 12be790: 97f805d2     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12be794: 9000ad00     	adrp	x0, 0x285e000
 12be798: f9467c00     	ldr	x0, [x0, #0xcf8]
 12be79c: 97f805cf     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12be7a0: 9000ad00     	adrp	x0, 0x285e000
 12be7a4: f940d400     	ldr	x0, [x0, #0x1a8]
 12be7a8: 97f805cc     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12be7ac: d000ad20     	adrp	x0, 0x2864000
 12be7b0: f9435000     	ldr	x0, [x0, #0x6a0]
 12be7b4: 97f805c9     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12be7b8: 9000ad20     	adrp	x0, 0x2862000
 12be7bc: f941b800     	ldr	x0, [x0, #0x370]
 12be7c0: 97f805c6     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12be7c4: 52800028     	mov	w8, #0x1                // =1
 12be7c8: 39280a88     	strb	w8, [x20, #0xa02]
 12be7cc: b9401268     	ldr	w8, [x19, #0x10]
 12be7d0: 7100151f     	cmp	w8, #0x5
 12be7d4: 54003728     	b.hi	0x12beeb8 <__start_il2cpp+0x1176f4>
 12be7d8: f9401274     	ldr	x20, [x19, #0x20]
 12be7dc: b0ff9fc9     	adrp	x9, 0x6b7000
 12be7e0: 912a7129     	add	x9, x9, #0xa9c
 12be7e4: 1000008a     	adr	x10, 0x12be7f4 <__start_il2cpp+0x117030>
 12be7e8: 7868792b     	ldrh	w11, [x9, x8, lsl #1]
 12be7ec: 8b0b094a     	add	x10, x10, x11, lsl #2
 12be7f0: d61f0140     	br	x10
 12be7f4: 12800008     	mov	w8, #-0x1               // =-1
 12be7f8: b9001268     	str	w8, [x19, #0x10]
 12be7fc: 9000ad08     	adrp	x8, 0x285e000
 12be800: f9414108     	ldr	x8, [x8, #0x280]
 12be804: f9400100     	ldr	x0, [x8]
 12be808: b940e008     	ldr	w8, [x0, #0xe0]
 12be80c: 35000048     	cbnz	w8, 0x12be814 <__start_il2cpp+0x117050>
 12be810: 97f805f4     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12be814: aa1f03e0     	mov	x0, xzr
 12be818: 97feaba6     	bl	0x12696b0 <__start_il2cpp+0xc1eec>
 12be81c: 2a0003f5     	mov	w21, w0
 12be820: 370004c0     	tbnz	w0, #0x0, 0x12be8b8 <__start_il2cpp+0x1170f4>
 12be824: 9000ad17     	adrp	x23, 0x285e000
 12be828: f9414ef7     	ldr	x23, [x23, #0x298]
 12be82c: f94002e0     	ldr	x0, [x23]
 12be830: b940e008     	ldr	w8, [x0, #0xe0]
 12be834: 35000048     	cbnz	w8, 0x12be83c <__start_il2cpp+0x117078>
 12be838: 97f805ea     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12be83c: aa1f03e0     	mov	x0, xzr
 12be840: 97fe71ea     	bl	0x125afe8 <__start_il2cpp+0xb3824>
 12be844: d000ace8     	adrp	x8, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12be848: f9456108     	ldr	x8, [x8, #0xac0]
 12be84c: aa0003f6     	mov	x22, x0
 12be850: f9400108     	ldr	x8, [x8]
 12be854: b940e109     	ldr	w9, [x8, #0xe0]
 12be858: 35000069     	cbnz	w9, 0x12be864 <__start_il2cpp+0x1170a0>
 12be85c: aa0803e0     	mov	x0, x8
 12be860: 97f805e0     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12be864: aa1603e0     	mov	x0, x22
 12be868: aa1f03e1     	mov	x1, xzr
 12be86c: aa1f03e2     	mov	x2, xzr
 12be870: 9447e7f6     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12be874: 36000220     	tbz	w0, #0x0, 0x12be8b8 <__start_il2cpp+0x1170f4>
 12be878: f94002e0     	ldr	x0, [x23]
 12be87c: b940e008     	ldr	w8, [x0, #0xe0]
 12be880: 35000048     	cbnz	w8, 0x12be888 <__start_il2cpp+0x1170c4>
 12be884: 97f805d7     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12be888: aa1f03e0     	mov	x0, xzr
 12be88c: 97fe71d7     	bl	0x125afe8 <__start_il2cpp+0xb3824>
 12be890: b4005540     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12be894: 9000ad09     	adrp	x9, 0x285e000
 12be898: f9400008     	ldr	x8, [x0]
 12be89c: f940d529     	ldr	x9, [x9, #0x1a8]
 12be8a0: 528000a3     	mov	w3, #0x5                // =5
 12be8a4: 2a1f03e1     	mov	w1, wzr
 12be8a8: f9415904     	ldr	x4, [x8, #0x2b0]
 12be8ac: f9400122     	ldr	x2, [x9]
 12be8b0: f9415509     	ldr	x9, [x8, #0x2a8]
 12be8b4: d63f0120     	blr	x9
 12be8b8: 9000ad08     	adrp	x8, 0x285e000
 12be8bc: f9479508     	ldr	x8, [x8, #0xf28]
 12be8c0: f9400100     	ldr	x0, [x8]
 12be8c4: b940e008     	ldr	w8, [x0, #0xe0]
 12be8c8: 35000048     	cbnz	w8, 0x12be8d0 <__start_il2cpp+0x11710c>
 12be8cc: 97f805c5     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12be8d0: d000ad28     	adrp	x8, 0x2864000
 12be8d4: f9435108     	ldr	x8, [x8, #0x6a0]
 12be8d8: aa1f03e1     	mov	x1, xzr
 12be8dc: f9400100     	ldr	x0, [x8]
 12be8e0: 97ffbf38     	bl	0x12ae5c0 <__start_il2cpp+0x106dfc>
 12be8e4: 36002ee0     	tbz	w0, #0x0, 0x12beec0 <__start_il2cpp+0x1176fc>
 12be8e8: b4005294     	cbz	x20, 0x12bf338 <__start_il2cpp+0x117b74>
 12be8ec: 3944ae88     	ldrb	w8, [x20, #0x12b]
 12be8f0: 35002ea8     	cbnz	w8, 0x12beec4 <__start_il2cpp+0x117700>
 12be8f4: f9401288     	ldr	x8, [x20, #0x20]
 12be8f8: b4005208     	cbz	x8, 0x12bf338 <__start_il2cpp+0x117b74>
 12be8fc: f9403908     	ldr	x8, [x8, #0x70]
 12be900: b40051c8     	cbz	x8, 0x12bf338 <__start_il2cpp+0x117b74>
 12be904: b9414916     	ldr	w22, [x8, #0x148]
 12be908: aa1f03e0     	mov	x0, xzr
 12be90c: 97ffc1aa     	bl	0x12aefb4 <__start_il2cpp+0x1077f0>
 12be910: 6b0002df     	cmp	w22, w0
 12be914: 54002d8d     	b.le	0x12beec4 <__start_il2cpp+0x117700>
 12be918: f9401288     	ldr	x8, [x20, #0x20]
 12be91c: b40050e8     	cbz	x8, 0x12bf338 <__start_il2cpp+0x117b74>
 12be920: f9403908     	ldr	x8, [x8, #0x70]
 12be924: b40050a8     	cbz	x8, 0x12bf338 <__start_il2cpp+0x117b74>
 12be928: b9414916     	ldr	w22, [x8, #0x148]
 12be92c: aa1f03e0     	mov	x0, xzr
 12be930: 97ffc1b7     	bl	0x12af00c <__start_il2cpp+0x107848>
 12be934: 6b0002df     	cmp	w22, w0
 12be938: 1a9fa7e8     	cset	w8, lt
 12be93c: 0a0802a1     	and	w1, w21, w8
 12be940: 14000162     	b	0x12beec8 <__start_il2cpp+0x117704>
 12be944: 12800008     	mov	w8, #-0x1               // =-1
 12be948: b9001268     	str	w8, [x19, #0x10]
 12be94c: b4004f74     	cbz	x20, 0x12bf338 <__start_il2cpp+0x117b74>
 12be950: f9403a80     	ldr	x0, [x20, #0x70]
 12be954: b4004f20     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12be958: 9000ad28     	adrp	x8, 0x2862000
 12be95c: f942b108     	ldr	x8, [x8, #0x560]
 12be960: f9400101     	ldr	x1, [x8]
 12be964: 94046998     	bl	0x13d8fc4 <__start_il2cpp+0x231800>
 12be968: b4004e80     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12be96c: 52800021     	mov	w1, #0x1                // =1
 12be970: aa1f03e2     	mov	x2, xzr
 12be974: 9447db47     	bl	0x24b5690 <__start_il2cpp+0x130decc>
 12be978: f9403a80     	ldr	x0, [x20, #0x70]
 12be97c: b4004de0     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12be980: d000ad28     	adrp	x8, 0x2864000
 12be984: f9450908     	ldr	x8, [x8, #0xa10]
 12be988: f9400101     	ldr	x1, [x8]
 12be98c: 9404698e     	bl	0x13d8fc4 <__start_il2cpp+0x231800>
 12be990: b4004d40     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12be994: 52800021     	mov	w1, #0x1                // =1
 12be998: aa1f03e2     	mov	x2, xzr
 12be99c: 9447db3d     	bl	0x24b5690 <__start_il2cpp+0x130decc>
 12be9a0: f9403a80     	ldr	x0, [x20, #0x70]
 12be9a4: 2d468a61     	ldp	s1, s2, [x19, #0x34]
 12be9a8: bd403e63     	ldr	s3, [x19, #0x3c]
 12be9ac: 1e2a1000     	fmov	s0, #0.25000000
 12be9b0: aa1f03e1     	mov	x1, xzr
 12be9b4: 97fcc0b5     	bl	0x11eec88 <__start_il2cpp+0x474c4>
 12be9b8: 9000ad28     	adrp	x8, 0x2862000
 12be9bc: f942c908     	ldr	x8, [x8, #0x590]
 12be9c0: f9400108     	ldr	x8, [x8]
 12be9c4: f9405d08     	ldr	x8, [x8, #0xb8]
 12be9c8: f9400100     	ldr	x0, [x8]
 12be9cc: b4004b60     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12be9d0: 1e2e1000     	fmov	s0, #1.00000000
 12be9d4: 528003e1     	mov	w1, #0x1f               // =31
 12be9d8: aa1f03e2     	mov	x2, xzr
 12be9dc: 97ff5af8     	bl	0x12955bc <__start_il2cpp+0xeddf8>
 12be9e0: 1e2a1000     	fmov	s0, #0.25000000
 12be9e4: aa1f03e0     	mov	x0, xzr
 12be9e8: 97fc3aeb     	bl	0x11cd594 <__start_il2cpp+0x25dd0>
 12be9ec: aa0003e1     	mov	x1, x0
 12be9f0: aa1403e0     	mov	x0, x20
 12be9f4: aa1f03e2     	mov	x2, xzr
 12be9f8: 9447ec55     	bl	0x24b9b4c <__start_il2cpp+0x1312388>
 12be9fc: 52800048     	mov	w8, #0x2                // =2
 12bea00: f9000e60     	str	x0, [x19, #0x18]
 12bea04: 14000106     	b	0x12bee1c <__start_il2cpp+0x117658>
 12bea08: 12800008     	mov	w8, #-0x1               // =-1
 12bea0c: b9001268     	str	w8, [x19, #0x10]
 12bea10: b4004954     	cbz	x20, 0x12bf338 <__start_il2cpp+0x117b74>
 12bea14: f9403680     	ldr	x0, [x20, #0x68]
 12bea18: b4004900     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bea1c: 9000ad28     	adrp	x8, 0x2862000
 12bea20: f942b108     	ldr	x8, [x8, #0x560]
 12bea24: f9400101     	ldr	x1, [x8]
 12bea28: 94046967     	bl	0x13d8fc4 <__start_il2cpp+0x231800>
 12bea2c: b4004860     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bea30: 52800021     	mov	w1, #0x1                // =1
 12bea34: aa1f03e2     	mov	x2, xzr
 12bea38: 9447db16     	bl	0x24b5690 <__start_il2cpp+0x130decc>
 12bea3c: f9403680     	ldr	x0, [x20, #0x68]
 12bea40: b40047c0     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bea44: d000ad28     	adrp	x8, 0x2864000
 12bea48: f9450908     	ldr	x8, [x8, #0xa10]
 12bea4c: f9400101     	ldr	x1, [x8]
 12bea50: 9404695d     	bl	0x13d8fc4 <__start_il2cpp+0x231800>
 12bea54: b4004720     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bea58: 52800021     	mov	w1, #0x1                // =1
 12bea5c: aa1f03e2     	mov	x2, xzr
 12bea60: 9447db0c     	bl	0x24b5690 <__start_il2cpp+0x130decc>
 12bea64: f9403680     	ldr	x0, [x20, #0x68]
 12bea68: 2d450a61     	ldp	s1, s2, [x19, #0x28]
 12bea6c: bd403263     	ldr	s3, [x19, #0x30]
 12bea70: 1e2a1000     	fmov	s0, #0.25000000
 12bea74: aa1f03e1     	mov	x1, xzr
 12bea78: 97fcc084     	bl	0x11eec88 <__start_il2cpp+0x474c4>
 12bea7c: 9000ad28     	adrp	x8, 0x2862000
 12bea80: f942c908     	ldr	x8, [x8, #0x590]
 12bea84: f9400108     	ldr	x8, [x8]
 12bea88: f9405d08     	ldr	x8, [x8, #0xb8]
 12bea8c: f9400100     	ldr	x0, [x8]
 12bea90: b4004540     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bea94: 1e2e1000     	fmov	s0, #1.00000000
 12bea98: 528003e1     	mov	w1, #0x1f               // =31
 12bea9c: aa1f03e2     	mov	x2, xzr
 12beaa0: 97ff5ac7     	bl	0x12955bc <__start_il2cpp+0xeddf8>
 12beaa4: 1e2a1000     	fmov	s0, #0.25000000
 12beaa8: aa1f03e0     	mov	x0, xzr
 12beaac: 97fc3aba     	bl	0x11cd594 <__start_il2cpp+0x25dd0>
 12beab0: aa0003e1     	mov	x1, x0
 12beab4: aa1403e0     	mov	x0, x20
 12beab8: aa1f03e2     	mov	x2, xzr
 12beabc: 9447ec24     	bl	0x24b9b4c <__start_il2cpp+0x1312388>
 12beac0: f9000e60     	str	x0, [x19, #0x18]
 12beac4: 52800068     	mov	w8, #0x3                // =3
 12beac8: 140000d5     	b	0x12bee1c <__start_il2cpp+0x117658>
 12beacc: 12800008     	mov	w8, #-0x1               // =-1
 12bead0: b9001268     	str	w8, [x19, #0x10]
 12bead4: b4004334     	cbz	x20, 0x12bf338 <__start_il2cpp+0x117b74>
 12bead8: f9405e80     	ldr	x0, [x20, #0xb8]
 12beadc: 2d4b0a61     	ldp	s1, s2, [x19, #0x58]
 12beae0: bd406263     	ldr	s3, [x19, #0x60]
 12beae4: 1e2a1000     	fmov	s0, #0.25000000
 12beae8: aa1f03e1     	mov	x1, xzr
 12beaec: 97fcc067     	bl	0x11eec88 <__start_il2cpp+0x474c4>
 12beaf0: 39445288     	ldrb	w8, [x20, #0x114]
 12beaf4: 340000e8     	cbz	w8, 0x12beb10 <__start_il2cpp+0x11734c>
 12beaf8: f9406280     	ldr	x0, [x20, #0xc0]
 12beafc: 2d4e0a61     	ldp	s1, s2, [x19, #0x70]
 12beb00: bd407a63     	ldr	s3, [x19, #0x78]
 12beb04: 1e2a1000     	fmov	s0, #0.25000000
 12beb08: aa1f03e1     	mov	x1, xzr
 12beb0c: 97fcc05f     	bl	0x11eec88 <__start_il2cpp+0x474c4>
 12beb10: d000ad36     	adrp	x22, 0x2864000
 12beb14: f940fed6     	ldr	x22, [x22, #0x1f8]
 12beb18: f94002c0     	ldr	x0, [x22]
 12beb1c: b940e008     	ldr	w8, [x0, #0xe0]
 12beb20: 35000068     	cbnz	w8, 0x12beb2c <__start_il2cpp+0x117368>
 12beb24: 97f8052f     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12beb28: f94002c0     	ldr	x0, [x22]
 12beb2c: f9405c08     	ldr	x8, [x0, #0xb8]
 12beb30: f9400108     	ldr	x8, [x8]
 12beb34: b4000b48     	cbz	x8, 0x12bec9c <__start_il2cpp+0x1174d8>
 12beb38: b940e009     	ldr	w9, [x0, #0xe0]
 12beb3c: 350000c9     	cbnz	w9, 0x12beb54 <__start_il2cpp+0x117390>
 12beb40: 97f80528     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12beb44: f94002c8     	ldr	x8, [x22]
 12beb48: f9405d08     	ldr	x8, [x8, #0xb8]
 12beb4c: f9400108     	ldr	x8, [x8]
 12beb50: b4003f48     	cbz	x8, 0x12bf338 <__start_il2cpp+0x117b74>
 12beb54: f9401908     	ldr	x8, [x8, #0x30]
 12beb58: b4003f08     	cbz	x8, 0x12bf338 <__start_il2cpp+0x117b74>
 12beb5c: 9000ad35     	adrp	x21, 0x2862000
 12beb60: f941eab5     	ldr	x21, [x21, #0x3d0]
 12beb64: b9401117     	ldr	w23, [x8, #0x10]
 12beb68: f94002a0     	ldr	x0, [x21]
 12beb6c: b940e009     	ldr	w9, [x0, #0xe0]
 12beb70: 35000069     	cbnz	w9, 0x12beb7c <__start_il2cpp+0x1173b8>
 12beb74: 97f8051b     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12beb78: f94002a0     	ldr	x0, [x21]
 12beb7c: f9405c08     	ldr	x8, [x0, #0xb8]
 12beb80: aa1f03e0     	mov	x0, xzr
 12beb84: f9400115     	ldr	x21, [x8]
 12beb88: 97ff9e70     	bl	0x12a6548 <__start_il2cpp+0xfed84>
 12beb8c: b4003d60     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12beb90: aa1f03e1     	mov	x1, xzr
 12beb94: 97ff9e9e     	bl	0x12a660c <__start_il2cpp+0xfee48>
 12beb98: b4003d15     	cbz	x21, 0x12bf338 <__start_il2cpp+0x117b74>
 12beb9c: 2a0003e1     	mov	w1, w0
 12beba0: aa1503e0     	mov	x0, x21
 12beba4: aa1f03e2     	mov	x2, xzr
 12beba8: 97ff409a     	bl	0x128ee10 <__start_il2cpp+0xe764c>
 12bebac: 6b0002ff     	cmp	w23, w0
 12bebb0: 5400076b     	b.lt	0x12bec9c <__start_il2cpp+0x1174d8>
 12bebb4: 9000ad17     	adrp	x23, 0x285e000
 12bebb8: f9474ef7     	ldr	x23, [x23, #0xe98]
 12bebbc: f94002e0     	ldr	x0, [x23]
 12bebc0: b940e008     	ldr	w8, [x0, #0xe0]
 12bebc4: 35000048     	cbnz	w8, 0x12bebcc <__start_il2cpp+0x117408>
 12bebc8: 97f80506     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12bebcc: aa1f03e0     	mov	x0, xzr
 12bebd0: 942f1ee4     	bl	0x1e86760 <__start_il2cpp+0xcdef9c>
 12bebd4: f94002c8     	ldr	x8, [x22]
 12bebd8: aa0003f5     	mov	x21, x0
 12bebdc: b940e109     	ldr	w9, [x8, #0xe0]
 12bebe0: 35000089     	cbnz	w9, 0x12bebf0 <__start_il2cpp+0x11742c>
 12bebe4: aa0803e0     	mov	x0, x8
 12bebe8: 97f804fe     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12bebec: f94002c8     	ldr	x8, [x22]
 12bebf0: f9405d08     	ldr	x8, [x8, #0xb8]
 12bebf4: f9400108     	ldr	x8, [x8]
 12bebf8: b4003a08     	cbz	x8, 0x12bf338 <__start_il2cpp+0x117b74>
 12bebfc: f9401908     	ldr	x8, [x8, #0x30]
 12bec00: b40039c8     	cbz	x8, 0x12bf338 <__start_il2cpp+0x117b74>
 12bec04: f9400d08     	ldr	x8, [x8, #0x18]
 12bec08: b4003988     	cbz	x8, 0x12bf338 <__start_il2cpp+0x117b74>
 12bec0c: f9400d01     	ldr	x1, [x8, #0x18]
 12bec10: aa1503e0     	mov	x0, x21
 12bec14: aa1f03e2     	mov	x2, xzr
 12bec18: 942f257d     	bl	0x1e8820c <__start_il2cpp+0xce0a48>
 12bec1c: 36000400     	tbz	w0, #0x0, 0x12bec9c <__start_il2cpp+0x1174d8>
 12bec20: f94002e0     	ldr	x0, [x23]
 12bec24: b940e008     	ldr	w8, [x0, #0xe0]
 12bec28: 35000048     	cbnz	w8, 0x12bec30 <__start_il2cpp+0x11746c>
 12bec2c: 97f804ed     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12bec30: aa1f03e0     	mov	x0, xzr
 12bec34: 942f1ecb     	bl	0x1e86760 <__start_il2cpp+0xcdef9c>
 12bec38: f94002c8     	ldr	x8, [x22]
 12bec3c: aa0003f5     	mov	x21, x0
 12bec40: b940e109     	ldr	w9, [x8, #0xe0]
 12bec44: 35000089     	cbnz	w9, 0x12bec54 <__start_il2cpp+0x117490>
 12bec48: aa0803e0     	mov	x0, x8
 12bec4c: 97f804e5     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12bec50: f94002c8     	ldr	x8, [x22]
 12bec54: f9405d08     	ldr	x8, [x8, #0xb8]
 12bec58: f9400108     	ldr	x8, [x8]
 12bec5c: b40036e8     	cbz	x8, 0x12bf338 <__start_il2cpp+0x117b74>
 12bec60: f9401908     	ldr	x8, [x8, #0x30]
 12bec64: b40036a8     	cbz	x8, 0x12bf338 <__start_il2cpp+0x117b74>
 12bec68: f9400d08     	ldr	x8, [x8, #0x18]
 12bec6c: b4003668     	cbz	x8, 0x12bf338 <__start_il2cpp+0x117b74>
 12bec70: f9401101     	ldr	x1, [x8, #0x20]
 12bec74: aa1503e0     	mov	x0, x21
 12bec78: aa1f03e2     	mov	x2, xzr
 12bec7c: 942f252e     	bl	0x1e88134 <__start_il2cpp+0xce0970>
 12bec80: 360000e0     	tbz	w0, #0x0, 0x12bec9c <__start_il2cpp+0x1174d8>
 12bec84: f9406a80     	ldr	x0, [x20, #0xd0]
 12bec88: 2d4f8a61     	ldp	s1, s2, [x19, #0x7c]
 12bec8c: bd408663     	ldr	s3, [x19, #0x84]
 12bec90: 1e2a1000     	fmov	s0, #0.25000000
 12bec94: aa1f03e1     	mov	x1, xzr
 12bec98: 97fcbffc     	bl	0x11eec88 <__start_il2cpp+0x474c4>
 12bec9c: 9000ad28     	adrp	x8, 0x2862000
 12beca0: f942c908     	ldr	x8, [x8, #0x590]
 12beca4: f9400108     	ldr	x8, [x8]
 12beca8: f9405d08     	ldr	x8, [x8, #0xb8]
 12becac: f9400100     	ldr	x0, [x8]
 12becb0: b4003440     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12becb4: 1e2e1000     	fmov	s0, #1.00000000
 12becb8: 528003e1     	mov	w1, #0x1f               // =31
 12becbc: aa1f03e2     	mov	x2, xzr
 12becc0: 97ff5a3f     	bl	0x12955bc <__start_il2cpp+0xeddf8>
 12becc4: 1e2a1000     	fmov	s0, #0.25000000
 12becc8: aa1f03e0     	mov	x0, xzr
 12beccc: 97fc3a32     	bl	0x11cd594 <__start_il2cpp+0x25dd0>
 12becd0: aa0003e1     	mov	x1, x0
 12becd4: aa1403e0     	mov	x0, x20
 12becd8: aa1f03e2     	mov	x2, xzr
 12becdc: 9447eb9c     	bl	0x24b9b4c <__start_il2cpp+0x1312388>
 12bece0: f9000e60     	str	x0, [x19, #0x18]
 12bece4: 52800088     	mov	w8, #0x4                // =4
 12bece8: 1400004d     	b	0x12bee1c <__start_il2cpp+0x117658>
 12becec: 12800008     	mov	w8, #-0x1               // =-1
 12becf0: b9001268     	str	w8, [x19, #0x10]
 12becf4: b4003234     	cbz	x20, 0x12bf338 <__start_il2cpp+0x117b74>
 12becf8: f9405a80     	ldr	x0, [x20, #0xb0]
 12becfc: 2d498a61     	ldp	s1, s2, [x19, #0x4c]
 12bed00: bd405663     	ldr	s3, [x19, #0x54]
 12bed04: 1e2a1000     	fmov	s0, #0.25000000
 12bed08: aa1f03e1     	mov	x1, xzr
 12bed0c: 97fcbfdf     	bl	0x11eec88 <__start_il2cpp+0x474c4>
 12bed10: 39445688     	ldrb	w8, [x20, #0x115]
 12bed14: 340005e8     	cbz	w8, 0x12bedd0 <__start_il2cpp+0x11760c>
 12bed18: 9000ad08     	adrp	x8, 0x285e000
 12bed1c: f9414108     	ldr	x8, [x8, #0x280]
 12bed20: f9400100     	ldr	x0, [x8]
 12bed24: b940e008     	ldr	w8, [x0, #0xe0]
 12bed28: 35000048     	cbnz	w8, 0x12bed30 <__start_il2cpp+0x11756c>
 12bed2c: 97f804ad     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12bed30: 9000ad28     	adrp	x8, 0x2862000
 12bed34: f941b908     	ldr	x8, [x8, #0x370]
 12bed38: aa1f03e1     	mov	x1, xzr
 12bed3c: f9400100     	ldr	x0, [x8]
 12bed40: 97fea4e5     	bl	0x12680d4 <__start_il2cpp+0xc0910>
 12bed44: 34000460     	cbz	w0, 0x12bedd0 <__start_il2cpp+0x11760c>
 12bed48: f9408e80     	ldr	x0, [x20, #0x118]
 12bed4c: aa1f03e1     	mov	x1, xzr
 12bed50: 942a1470     	bl	0x1d43f10 <__start_il2cpp+0xb9c74c>
 12bed54: 37000320     	tbnz	w0, #0x0, 0x12bedb8 <__start_il2cpp+0x1175f4>
 12bed58: f9406680     	ldr	x0, [x20, #0xc8]
 12bed5c: b4002ee0     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bed60: d000ad28     	adrp	x8, 0x2864000
 12bed64: f9450908     	ldr	x8, [x8, #0xa10]
 12bed68: f9400101     	ldr	x1, [x8]
 12bed6c: 94046896     	bl	0x13d8fc4 <__start_il2cpp+0x231800>
 12bed70: d000ace8     	adrp	x8, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12bed74: f9456108     	ldr	x8, [x8, #0xac0]
 12bed78: aa0003f5     	mov	x21, x0
 12bed7c: f9400108     	ldr	x8, [x8]
 12bed80: b940e109     	ldr	w9, [x8, #0xe0]
 12bed84: 35000069     	cbnz	w9, 0x12bed90 <__start_il2cpp+0x1175cc>
 12bed88: aa0803e0     	mov	x0, x8
 12bed8c: 97f80495     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12bed90: aa1503e0     	mov	x0, x21
 12bed94: aa1f03e1     	mov	x1, xzr
 12bed98: aa1f03e2     	mov	x2, xzr
 12bed9c: 9447e6ab     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12beda0: 360000c0     	tbz	w0, #0x0, 0x12bedb8 <__start_il2cpp+0x1175f4>
 12beda4: b4002cb5     	cbz	x21, 0x12bf338 <__start_il2cpp+0x117b74>
 12beda8: f9408e81     	ldr	x1, [x20, #0x118]
 12bedac: aa1503e0     	mov	x0, x21
 12bedb0: aa1f03e2     	mov	x2, xzr
 12bedb4: 97fefe19     	bl	0x127e618 <__start_il2cpp+0xd6e54>
 12bedb8: f9406680     	ldr	x0, [x20, #0xc8]
 12bedbc: 2d4c8a61     	ldp	s1, s2, [x19, #0x64]
 12bedc0: bd406e63     	ldr	s3, [x19, #0x6c]
 12bedc4: 1e2a1000     	fmov	s0, #0.25000000
 12bedc8: aa1f03e1     	mov	x1, xzr
 12bedcc: 97fcbfaf     	bl	0x11eec88 <__start_il2cpp+0x474c4>
 12bedd0: 9000ad28     	adrp	x8, 0x2862000
 12bedd4: f942c908     	ldr	x8, [x8, #0x590]
 12bedd8: f9400108     	ldr	x8, [x8]
 12beddc: f9405d08     	ldr	x8, [x8, #0xb8]
 12bede0: f9400100     	ldr	x0, [x8]
 12bede4: b4002aa0     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bede8: 1e2e1000     	fmov	s0, #1.00000000
 12bedec: 528003e1     	mov	w1, #0x1f               // =31
 12bedf0: aa1f03e2     	mov	x2, xzr
 12bedf4: 97ff59f2     	bl	0x12955bc <__start_il2cpp+0xeddf8>
 12bedf8: 1e2a1000     	fmov	s0, #0.25000000
 12bedfc: aa1f03e0     	mov	x0, xzr
 12bee00: 97fc39e5     	bl	0x11cd594 <__start_il2cpp+0x25dd0>
 12bee04: aa0003e1     	mov	x1, x0
 12bee08: aa1403e0     	mov	x0, x20
 12bee0c: aa1f03e2     	mov	x2, xzr
 12bee10: 9447eb4f     	bl	0x24b9b4c <__start_il2cpp+0x1312388>
 12bee14: f9000e60     	str	x0, [x19, #0x18]
 12bee18: 528000a8     	mov	w8, #0x5                // =5
 12bee1c: b9001268     	str	w8, [x19, #0x10]
 12bee20: 52800020     	mov	w0, #0x1                // =1
 12bee24: 14000140     	b	0x12bf324 <__start_il2cpp+0x117b60>
 12bee28: 12800008     	mov	w8, #-0x1               // =-1
 12bee2c: b9001268     	str	w8, [x19, #0x10]
 12bee30: b4002854     	cbz	x20, 0x12bf338 <__start_il2cpp+0x117b74>
 12bee34: f9401a80     	ldr	x0, [x20, #0x30]
 12bee38: b4002800     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bee3c: aa1f03e1     	mov	x1, xzr
 12bee40: 9447dcc2     	bl	0x24b6148 <__start_il2cpp+0x130e984>
 12bee44: 2d480a61     	ldp	s1, s2, [x19, #0x40]
 12bee48: bd404a63     	ldr	s3, [x19, #0x48]
 12bee4c: 1e2a1000     	fmov	s0, #0.25000000
 12bee50: aa1f03e1     	mov	x1, xzr
 12bee54: 97fcbf8d     	bl	0x11eec88 <__start_il2cpp+0x474c4>
 12bee58: 9000ad28     	adrp	x8, 0x2862000
 12bee5c: f942c908     	ldr	x8, [x8, #0x590]
 12bee60: f9400108     	ldr	x8, [x8]
 12bee64: f9405d08     	ldr	x8, [x8, #0xb8]
 12bee68: f9400100     	ldr	x0, [x8]
 12bee6c: b4002660     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bee70: 1e2e1000     	fmov	s0, #1.00000000
 12bee74: 528003e1     	mov	w1, #0x1f               // =31
 12bee78: aa1f03e2     	mov	x2, xzr
 12bee7c: 97ff59d0     	bl	0x12955bc <__start_il2cpp+0xeddf8>
 12bee80: f9407e80     	ldr	x0, [x20, #0xf8]
 12bee84: b40025a0     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bee88: aa1f03e1     	mov	x1, xzr
 12bee8c: 9447dcaf     	bl	0x24b6148 <__start_il2cpp+0x130e984>
 12bee90: b4002540     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bee94: aa1f03e1     	mov	x1, xzr
 12bee98: 9447e768     	bl	0x24b8c38 <__start_il2cpp+0x1311474>
 12bee9c: 360000e0     	tbz	w0, #0x0, 0x12beeb8 <__start_il2cpp+0x1176f4>
 12beea0: aa1403e0     	mov	x0, x20
 12beea4: 97fff464     	bl	0x12bc034 <__start_il2cpp+0x114870>
 12beea8: aa0003e1     	mov	x1, x0
 12beeac: aa1403e0     	mov	x0, x20
 12beeb0: aa1f03e2     	mov	x2, xzr
 12beeb4: 9447eb26     	bl	0x24b9b4c <__start_il2cpp+0x1312388>
 12beeb8: 2a1f03e0     	mov	w0, wzr
 12beebc: 1400011a     	b	0x12bf324 <__start_il2cpp+0x117b60>
 12beec0: b40023d4     	cbz	x20, 0x12bf338 <__start_il2cpp+0x117b74>
 12beec4: 2a1f03e1     	mov	w1, wzr
 12beec8: aa1403e0     	mov	x0, x20
 12beecc: 97fff174     	bl	0x12bb49c <__start_il2cpp+0x113cd8>
 12beed0: d000ace8     	adrp	x8, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12beed4: f9456108     	ldr	x8, [x8, #0xac0]
 12beed8: f9401e95     	ldr	x21, [x20, #0x38]
 12beedc: f9400100     	ldr	x0, [x8]
 12beee0: b940e008     	ldr	w8, [x0, #0xe0]
 12beee4: 35000048     	cbnz	w8, 0x12beeec <__start_il2cpp+0x117728>
 12beee8: 97f8043e     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12beeec: aa1503e0     	mov	x0, x21
 12beef0: aa1f03e1     	mov	x1, xzr
 12beef4: aa1f03e2     	mov	x2, xzr
 12beef8: 9447e654     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12beefc: 36000100     	tbz	w0, #0x0, 0x12bef1c <__start_il2cpp+0x117758>
 12bef00: 3944c288     	ldrb	w8, [x20, #0x130]
 12bef04: 35000068     	cbnz	w8, 0x12bef10 <__start_il2cpp+0x11774c>
 12bef08: aa1403e0     	mov	x0, x20
 12bef0c: 97fff46c     	bl	0x12bc0bc <__start_il2cpp+0x1148f8>
 12bef10: aa1403e0     	mov	x0, x20
 12bef14: 97fff4e9     	bl	0x12bc2b8 <__start_il2cpp+0x114af4>
 12bef18: f9001e9f     	str	xzr, [x20, #0x38]
 12bef1c: 3944aa88     	ldrb	w8, [x20, #0x12a]
 12bef20: aa1403e0     	mov	x0, x20
 12bef24: 7100011f     	cmp	w8, #0x0
 12bef28: 1a9f17e1     	cset	w1, eq
 12bef2c: 97fff12f     	bl	0x12bb3e8 <__start_il2cpp+0x113c24>
 12bef30: aa1403e0     	mov	x0, x20
 12bef34: 97fff346     	bl	0x12bbc4c <__start_il2cpp+0x114488>
 12bef38: f9403280     	ldr	x0, [x20, #0x60]
 12bef3c: b4001fe0     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bef40: 9000ad15     	adrp	x21, 0x285e000
 12bef44: f9467eb5     	ldr	x21, [x21, #0xcf8]
 12bef48: aa1f03e1     	mov	x1, xzr
 12bef4c: f94002a8     	ldr	x8, [x21]
 12bef50: f9405d08     	ldr	x8, [x8, #0xb8]
 12bef54: bd400508     	ldr	s8, [x8, #0x4]
 12bef58: bd400d09     	ldr	s9, [x8, #0xc]
 12bef5c: 9447e6e8     	bl	0x24b8afc <__start_il2cpp+0x1311338>
 12bef60: b4001ec0     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bef64: b0ff9ec8     	adrp	x8, 0x697000
 12bef68: bd45a101     	ldr	s1, [x8, #0x5a0]
 12bef6c: 52b84408     	mov	w8, #-0x3de00000        // =-1038090240
 12bef70: 1e293909     	fsub	s9, s8, s9
 12bef74: 1e270108     	fmov	s8, w8
 12bef78: 1e2703e0     	fmov	s0, wzr
 12bef7c: 4ea81d02     	mov	v2.16b, v8.16b
 12bef80: aa1f03e1     	mov	x1, xzr
 12bef84: 94480ba9     	bl	0x24c1e28 <__start_il2cpp+0x131a664>
 12bef88: f9403280     	ldr	x0, [x20, #0x60]
 12bef8c: 1e214122     	fneg	s2, s9
 12bef90: 1e2c1000     	fmov	s0, #0.50000000
 12bef94: 1e2703e1     	fmov	s1, wzr
 12bef98: 4ea81d03     	mov	v3.16b, v8.16b
 12bef9c: aa1f03e1     	mov	x1, xzr
 12befa0: 97fcbf3a     	bl	0x11eec88 <__start_il2cpp+0x474c4>
 12befa4: b4001ca0     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12befa8: 52800028     	mov	w8, #0x1                // =1
 12befac: b9002c08     	str	w8, [x0, #0x2c]
 12befb0: f9403680     	ldr	x0, [x20, #0x68]
 12befb4: b4001c20     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12befb8: aa1f03e1     	mov	x1, xzr
 12befbc: 9447e6d0     	bl	0x24b8afc <__start_il2cpp+0x1311338>
 12befc0: b4001bc0     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12befc4: aa1f03e1     	mov	x1, xzr
 12befc8: 94480b75     	bl	0x24c1d9c <__start_il2cpp+0x131a5d8>
 12befcc: 2d050660     	stp	s0, s1, [x19, #0x28]
 12befd0: bd003262     	str	s2, [x19, #0x30]
 12befd4: f9403a80     	ldr	x0, [x20, #0x70]
 12befd8: b4001b00     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12befdc: aa1f03e1     	mov	x1, xzr
 12befe0: 9447e6c7     	bl	0x24b8afc <__start_il2cpp+0x1311338>
 12befe4: b4001aa0     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12befe8: aa1f03e1     	mov	x1, xzr
 12befec: 94480b6c     	bl	0x24c1d9c <__start_il2cpp+0x131a5d8>
 12beff0: 2d068660     	stp	s0, s1, [x19, #0x34]
 12beff4: bd003e62     	str	s2, [x19, #0x3c]
 12beff8: f9401a80     	ldr	x0, [x20, #0x30]
 12beffc: b40019e0     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf000: aa1f03e1     	mov	x1, xzr
 12bf004: 9447dc42     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12bf008: b4001980     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf00c: aa1f03e1     	mov	x1, xzr
 12bf010: 94480b63     	bl	0x24c1d9c <__start_il2cpp+0x131a5d8>
 12bf014: 2d080660     	stp	s0, s1, [x19, #0x40]
 12bf018: bd004a62     	str	s2, [x19, #0x48]
 12bf01c: f9405a80     	ldr	x0, [x20, #0xb0]
 12bf020: b40018c0     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf024: aa1f03e1     	mov	x1, xzr
 12bf028: 9447e6b5     	bl	0x24b8afc <__start_il2cpp+0x1311338>
 12bf02c: b4001860     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf030: aa1f03e1     	mov	x1, xzr
 12bf034: 94480b5a     	bl	0x24c1d9c <__start_il2cpp+0x131a5d8>
 12bf038: 2d098660     	stp	s0, s1, [x19, #0x4c]
 12bf03c: bd005662     	str	s2, [x19, #0x54]
 12bf040: f9405e80     	ldr	x0, [x20, #0xb8]
 12bf044: b40017a0     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf048: aa1f03e1     	mov	x1, xzr
 12bf04c: 9447e6ac     	bl	0x24b8afc <__start_il2cpp+0x1311338>
 12bf050: b4001740     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf054: aa1f03e1     	mov	x1, xzr
 12bf058: 94480b51     	bl	0x24c1d9c <__start_il2cpp+0x131a5d8>
 12bf05c: 2d0b0660     	stp	s0, s1, [x19, #0x58]
 12bf060: bd006262     	str	s2, [x19, #0x60]
 12bf064: f9406680     	ldr	x0, [x20, #0xc8]
 12bf068: b4001680     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf06c: aa1f03e1     	mov	x1, xzr
 12bf070: 9447e6a3     	bl	0x24b8afc <__start_il2cpp+0x1311338>
 12bf074: b4001620     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf078: aa1f03e1     	mov	x1, xzr
 12bf07c: 94480b48     	bl	0x24c1d9c <__start_il2cpp+0x131a5d8>
 12bf080: 2d0c8660     	stp	s0, s1, [x19, #0x64]
 12bf084: bd006e62     	str	s2, [x19, #0x6c]
 12bf088: f9406280     	ldr	x0, [x20, #0xc0]
 12bf08c: b4001560     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf090: aa1f03e1     	mov	x1, xzr
 12bf094: 9447e69a     	bl	0x24b8afc <__start_il2cpp+0x1311338>
 12bf098: b4001500     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf09c: aa1f03e1     	mov	x1, xzr
 12bf0a0: 94480b3f     	bl	0x24c1d9c <__start_il2cpp+0x131a5d8>
 12bf0a4: 2d0e0660     	stp	s0, s1, [x19, #0x70]
 12bf0a8: bd007a62     	str	s2, [x19, #0x78]
 12bf0ac: f9406a80     	ldr	x0, [x20, #0xd0]
 12bf0b0: b4001440     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf0b4: aa1f03e1     	mov	x1, xzr
 12bf0b8: 9447e691     	bl	0x24b8afc <__start_il2cpp+0x1311338>
 12bf0bc: b40013e0     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf0c0: aa1f03e1     	mov	x1, xzr
 12bf0c4: 94480b36     	bl	0x24c1d9c <__start_il2cpp+0x131a5d8>
 12bf0c8: 2d0f8660     	stp	s0, s1, [x19, #0x7c]
 12bf0cc: bd008662     	str	s2, [x19, #0x84]
 12bf0d0: f9403680     	ldr	x0, [x20, #0x68]
 12bf0d4: b4001320     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf0d8: f000ad16     	adrp	x22, 0x2862000
 12bf0dc: f942b2d6     	ldr	x22, [x22, #0x560]
 12bf0e0: f94002c1     	ldr	x1, [x22]
 12bf0e4: 940467b8     	bl	0x13d8fc4 <__start_il2cpp+0x231800>
 12bf0e8: b4001280     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf0ec: 2a1f03e1     	mov	w1, wzr
 12bf0f0: aa1f03e2     	mov	x2, xzr
 12bf0f4: 9447d967     	bl	0x24b5690 <__start_il2cpp+0x130decc>
 12bf0f8: f9403680     	ldr	x0, [x20, #0x68]
 12bf0fc: b40011e0     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf100: b000ad37     	adrp	x23, 0x2864000
 12bf104: f9450af7     	ldr	x23, [x23, #0xa10]
 12bf108: f94002e1     	ldr	x1, [x23]
 12bf10c: 940467ae     	bl	0x13d8fc4 <__start_il2cpp+0x231800>
 12bf110: b4001140     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf114: 2a1f03e1     	mov	w1, wzr
 12bf118: aa1f03e2     	mov	x2, xzr
 12bf11c: 9447d95d     	bl	0x24b5690 <__start_il2cpp+0x130decc>
 12bf120: f9403680     	ldr	x0, [x20, #0x68]
 12bf124: b40010a0     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf128: aa1f03e1     	mov	x1, xzr
 12bf12c: 9447e674     	bl	0x24b8afc <__start_il2cpp+0x1311338>
 12bf130: b4001040     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf134: 52b86908     	mov	w8, #-0x3cb80000        // =-1018691584
 12bf138: 1e2703e0     	fmov	s0, wzr
 12bf13c: 1e2703e2     	fmov	s2, wzr
 12bf140: 1e270101     	fmov	s1, w8
 12bf144: aa1f03e1     	mov	x1, xzr
 12bf148: 94481033     	bl	0x24c3214 <__start_il2cpp+0x131ba50>
 12bf14c: f9403a80     	ldr	x0, [x20, #0x70]
 12bf150: b4000f40     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf154: f94002c1     	ldr	x1, [x22]
 12bf158: 9404679b     	bl	0x13d8fc4 <__start_il2cpp+0x231800>
 12bf15c: b4000ee0     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf160: 2a1f03e1     	mov	w1, wzr
 12bf164: aa1f03e2     	mov	x2, xzr
 12bf168: 9447d94a     	bl	0x24b5690 <__start_il2cpp+0x130decc>
 12bf16c: f9403a80     	ldr	x0, [x20, #0x70]
 12bf170: b4000e40     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf174: f94002e1     	ldr	x1, [x23]
 12bf178: 94046793     	bl	0x13d8fc4 <__start_il2cpp+0x231800>
 12bf17c: b4000de0     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf180: 2a1f03e1     	mov	w1, wzr
 12bf184: aa1f03e2     	mov	x2, xzr
 12bf188: 9447d942     	bl	0x24b5690 <__start_il2cpp+0x130decc>
 12bf18c: f9403a80     	ldr	x0, [x20, #0x70]
 12bf190: b4000d40     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf194: aa1f03e1     	mov	x1, xzr
 12bf198: 9447e659     	bl	0x24b8afc <__start_il2cpp+0x1311338>
 12bf19c: b4000ce0     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf1a0: 52b86908     	mov	w8, #-0x3cb80000        // =-1018691584
 12bf1a4: 1e2703e0     	fmov	s0, wzr
 12bf1a8: 1e2703e2     	fmov	s2, wzr
 12bf1ac: 1e270101     	fmov	s1, w8
 12bf1b0: aa1f03e1     	mov	x1, xzr
 12bf1b4: 94481018     	bl	0x24c3214 <__start_il2cpp+0x131ba50>
 12bf1b8: f9401a80     	ldr	x0, [x20, #0x30]
 12bf1bc: b4000be0     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf1c0: aa1f03e1     	mov	x1, xzr
 12bf1c4: 9447dbd2     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12bf1c8: b4000b80     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf1cc: f94002a8     	ldr	x8, [x21]
 12bf1d0: 1e2703e2     	fmov	s2, wzr
 12bf1d4: aa1f03e1     	mov	x1, xzr
 12bf1d8: f9405d08     	ldr	x8, [x8, #0xb8]
 12bf1dc: bd401d00     	ldr	s0, [x8, #0x1c]
 12bf1e0: 52a882c8     	mov	w8, #0x44160000         // =1142292480
 12bf1e4: 1e270101     	fmov	s1, w8
 12bf1e8: 1e212928     	fadd	s8, s9, s1
 12bf1ec: 1e202901     	fadd	s1, s8, s0
 12bf1f0: 1e2703e0     	fmov	s0, wzr
 12bf1f4: 94481008     	bl	0x24c3214 <__start_il2cpp+0x131ba50>
 12bf1f8: f9405a80     	ldr	x0, [x20, #0xb0]
 12bf1fc: b40009e0     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf200: aa1f03e1     	mov	x1, xzr
 12bf204: 9447e63e     	bl	0x24b8afc <__start_il2cpp+0x1311338>
 12bf208: b4000980     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf20c: f94002a8     	ldr	x8, [x21]
 12bf210: 1e2703e2     	fmov	s2, wzr
 12bf214: aa1f03e1     	mov	x1, xzr
 12bf218: f9405d08     	ldr	x8, [x8, #0xb8]
 12bf21c: bd401d00     	ldr	s0, [x8, #0x1c]
 12bf220: 1e202901     	fadd	s1, s8, s0
 12bf224: 1e2703e0     	fmov	s0, wzr
 12bf228: 94480ffb     	bl	0x24c3214 <__start_il2cpp+0x131ba50>
 12bf22c: f9405e80     	ldr	x0, [x20, #0xb8]
 12bf230: b4000840     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf234: aa1f03e1     	mov	x1, xzr
 12bf238: 9447e631     	bl	0x24b8afc <__start_il2cpp+0x1311338>
 12bf23c: b40007e0     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf240: f94002a8     	ldr	x8, [x21]
 12bf244: 1e2703e2     	fmov	s2, wzr
 12bf248: aa1f03e1     	mov	x1, xzr
 12bf24c: f9405d08     	ldr	x8, [x8, #0xb8]
 12bf250: bd401d00     	ldr	s0, [x8, #0x1c]
 12bf254: 1e202901     	fadd	s1, s8, s0
 12bf258: 1e2703e0     	fmov	s0, wzr
 12bf25c: 94480fee     	bl	0x24c3214 <__start_il2cpp+0x131ba50>
 12bf260: f9406680     	ldr	x0, [x20, #0xc8]
 12bf264: b40006a0     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf268: aa1f03e1     	mov	x1, xzr
 12bf26c: 9447e624     	bl	0x24b8afc <__start_il2cpp+0x1311338>
 12bf270: b4000640     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf274: f94002a8     	ldr	x8, [x21]
 12bf278: 1e2703e2     	fmov	s2, wzr
 12bf27c: aa1f03e1     	mov	x1, xzr
 12bf280: f9405d08     	ldr	x8, [x8, #0xb8]
 12bf284: bd401d00     	ldr	s0, [x8, #0x1c]
 12bf288: 1e202901     	fadd	s1, s8, s0
 12bf28c: 1e2703e0     	fmov	s0, wzr
 12bf290: 94480fe1     	bl	0x24c3214 <__start_il2cpp+0x131ba50>
 12bf294: f9406280     	ldr	x0, [x20, #0xc0]
 12bf298: b4000500     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf29c: aa1f03e1     	mov	x1, xzr
 12bf2a0: 9447e617     	bl	0x24b8afc <__start_il2cpp+0x1311338>
 12bf2a4: b40004a0     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf2a8: f94002a8     	ldr	x8, [x21]
 12bf2ac: 1e2703e2     	fmov	s2, wzr
 12bf2b0: aa1f03e1     	mov	x1, xzr
 12bf2b4: f9405d08     	ldr	x8, [x8, #0xb8]
 12bf2b8: bd401d00     	ldr	s0, [x8, #0x1c]
 12bf2bc: 1e202901     	fadd	s1, s8, s0
 12bf2c0: 1e2703e0     	fmov	s0, wzr
 12bf2c4: 94480fd4     	bl	0x24c3214 <__start_il2cpp+0x131ba50>
 12bf2c8: f9406a80     	ldr	x0, [x20, #0xd0]
 12bf2cc: b4000360     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf2d0: aa1f03e1     	mov	x1, xzr
 12bf2d4: 9447e60a     	bl	0x24b8afc <__start_il2cpp+0x1311338>
 12bf2d8: b4000300     	cbz	x0, 0x12bf338 <__start_il2cpp+0x117b74>
 12bf2dc: f94002a8     	ldr	x8, [x21]
 12bf2e0: 1e2703e2     	fmov	s2, wzr
 12bf2e4: aa1f03e1     	mov	x1, xzr
 12bf2e8: f9405d08     	ldr	x8, [x8, #0xb8]
 12bf2ec: bd401d00     	ldr	s0, [x8, #0x1c]
 12bf2f0: 1e202901     	fadd	s1, s8, s0
 12bf2f4: 1e2703e0     	fmov	s0, wzr
 12bf2f8: 94480fc7     	bl	0x24c3214 <__start_il2cpp+0x131ba50>
 12bf2fc: 1e2d1000     	fmov	s0, #0.75000000
 12bf300: aa1f03e0     	mov	x0, xzr
 12bf304: 97fc38a4     	bl	0x11cd594 <__start_il2cpp+0x25dd0>
 12bf308: aa0003e1     	mov	x1, x0
 12bf30c: aa1403e0     	mov	x0, x20
 12bf310: aa1f03e2     	mov	x2, xzr
 12bf314: 9447ea0e     	bl	0x24b9b4c <__start_il2cpp+0x1312388>
 12bf318: f9000e60     	str	x0, [x19, #0x18]
 12bf31c: 52800020     	mov	w0, #0x1                // =1
 12bf320: b9001260     	str	w0, [x19, #0x10]
 12bf324: a9434ff4     	ldp	x20, x19, [sp, #0x30]
 12bf328: a94257f6     	ldp	x22, x21, [sp, #0x20]
 12bf32c: a9415ffe     	ldp	x30, x23, [sp, #0x10]
 12bf330: 6cc423e9     	ldp	d9, d8, [sp], #0x40
 12bf334: d65f03c0     	ret
 12bf338: 97f80372     	bl	0x10c0100 <CloseNLSocket+0x638>
