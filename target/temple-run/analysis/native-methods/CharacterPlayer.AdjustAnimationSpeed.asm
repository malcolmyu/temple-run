
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1297f68: d10143ff     	sub	sp, sp, #0x50
 1297f6c: fd000bea     	str	d10, [sp, #0x10]
 1297f70: 6d01a3e9     	stp	d9, d8, [sp, #0x18]
 1297f74: f90017fe     	str	x30, [sp, #0x28]
 1297f78: a90357f6     	stp	x22, x21, [sp, #0x30]
 1297f7c: a9044ff4     	stp	x20, x19, [sp, #0x40]
 1297f80: d000bcf4     	adrp	x20, 0x2a35000
 1297f84: 39626e88     	ldrb	w8, [x20, #0x89b]
 1297f88: aa0003f3     	mov	x19, x0
 1297f8c: 370001e8     	tbnz	w8, #0x0, 0x1297fc8 <__start_il2cpp+0xf0804>
 1297f90: f000ae20     	adrp	x0, 0x285e000
 1297f94: f943f000     	ldr	x0, [x0, #0x7e0]
 1297f98: 97f89fd0     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1297f9c: 9000ae60     	adrp	x0, 0x2863000
 1297fa0: f946d400     	ldr	x0, [x0, #0xda8]
 1297fa4: 97f89fcd     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1297fa8: b000ae20     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1297fac: f945a800     	ldr	x0, [x0, #0xb50]
 1297fb0: 97f89fca     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1297fb4: d000ae20     	adrp	x0, 0x285d000
 1297fb8: f940f000     	ldr	x0, [x0, #0x1e0]
 1297fbc: 97f89fc7     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1297fc0: 52800028     	mov	w8, #0x1                // =1
 1297fc4: 39226e88     	strb	w8, [x20, #0x89b]
 1297fc8: d000bcf4     	adrp	x20, 0x2a35000
 1297fcc: 39413688     	ldrb	w8, [x20, #0x4d]
 1297fd0: 350000c8     	cbnz	w8, 0x1297fe8 <__start_il2cpp+0xf0824>
 1297fd4: f000ae20     	adrp	x0, 0x285e000
 1297fd8: f9417800     	ldr	x0, [x0, #0x2f0]
 1297fdc: 97f89fbf     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1297fe0: 52800028     	mov	w8, #0x1                // =1
 1297fe4: 39013688     	strb	w8, [x20, #0x4d]
 1297fe8: f000ae28     	adrp	x8, 0x285e000
 1297fec: f9417908     	ldr	x8, [x8, #0x2f0]
 1297ff0: 2d46a66a     	ldp	s10, s9, [x19, #0x34]
 1297ff4: bd403e68     	ldr	s8, [x19, #0x3c]
 1297ff8: f9400100     	ldr	x0, [x8]
 1297ffc: b940e008     	ldr	w8, [x0, #0xe0]
 1298000: 35000048     	cbnz	w8, 0x1298008 <__start_il2cpp+0xf0844>
 1298004: 97f89ff7     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1298008: f9405260     	ldr	x0, [x19, #0xa0]
 129800c: b4000f20     	cbz	x0, 0x12981f0 <__start_il2cpp+0xf0a2c>
 1298010: f000ae48     	adrp	x8, 0x2863000
 1298014: f946d508     	ldr	x8, [x8, #0xda8]
 1298018: f9400101     	ldr	x1, [x8]
 129801c: 94042aa0     	bl	0x13a2a9c <__start_il2cpp+0x1fb2d8>
 1298020: b4000e80     	cbz	x0, 0x12981f0 <__start_il2cpp+0xf0a2c>
 1298024: 9000ae35     	adrp	x21, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 1298028: f945aab5     	ldr	x21, [x21, #0xb50]
 129802c: aa1f03e1     	mov	x1, xzr
 1298030: 9447d42e     	bl	0x248d0e8 <__start_il2cpp+0x12e5924>
 1298034: aa0003f3     	mov	x19, x0
 1298038: b4000de0     	cbz	x0, 0x12981f4 <__start_il2cpp+0xf0a30>
 129803c: 1e2a0940     	fmul	s0, s10, s10
 1298040: 1e290921     	fmul	s1, s9, s9
 1298044: f0ff9fe9     	adrp	x9, 0x697000
 1298048: 1e280902     	fmul	s2, s8, s8
 129804c: b000ae34     	adrp	x20, 0x285d000
 1298050: 1e212800     	fadd	s0, s0, s1
 1298054: bd45f123     	ldr	s3, [x9, #0x5f0]
 1298058: d000ae36     	adrp	x22, 0x285e000
 129805c: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 1298060: f940f294     	ldr	x20, [x20, #0x1e0]
 1298064: 1e222800     	fadd	s0, s0, s2
 1298068: f943f2d6     	ldr	x22, [x22, #0x7e0]
 129806c: 1e270101     	fmov	s1, w8
 1298070: 1e21c000     	fsqrt	s0, s0
 1298074: 1e211800     	fdiv	s0, s0, s1
 1298078: 1e230808     	fmul	s8, s0, s3
 129807c: f9400268     	ldr	x8, [x19]
 1298080: f9400281     	ldr	x1, [x20]
 1298084: 79425d09     	ldrh	w9, [x8, #0x12e]
 1298088: b4000129     	cbz	x9, 0x12980ac <__start_il2cpp+0xf08e8>
 129808c: f940590a     	ldr	x10, [x8, #0xb0]
 1298090: 9100214a     	add	x10, x10, #0x8
 1298094: f85f814b     	ldur	x11, [x10, #-0x8]
 1298098: eb01017f     	cmp	x11, x1
 129809c: 54000100     	b.eq	0x12980bc <__start_il2cpp+0xf08f8>
 12980a0: f1000529     	subs	x9, x9, #0x1
 12980a4: 9100414a     	add	x10, x10, #0x10
 12980a8: 54ffff61     	b.ne	0x1298094 <__start_il2cpp+0xf08d0>
 12980ac: aa1303e0     	mov	x0, x19
 12980b0: 2a1f03e2     	mov	w2, wzr
 12980b4: 97f7f8a6     	bl	0x109634c <.text+0x14b3d0>
 12980b8: 14000004     	b	0x12980c8 <__start_il2cpp+0xf0904>
 12980bc: b9800149     	ldrsw	x9, [x10]
 12980c0: 8b091108     	add	x8, x8, x9, lsl #4
 12980c4: 9104e100     	add	x0, x8, #0x138
 12980c8: a9400408     	ldp	x8, x1, [x0]
 12980cc: aa1303e0     	mov	x0, x19
 12980d0: d63f0100     	blr	x8
 12980d4: 36000420     	tbz	w0, #0x0, 0x1298158 <__start_il2cpp+0xf0994>
 12980d8: f9400268     	ldr	x8, [x19]
 12980dc: f9400281     	ldr	x1, [x20]
 12980e0: 79425d09     	ldrh	w9, [x8, #0x12e]
 12980e4: b4000129     	cbz	x9, 0x1298108 <__start_il2cpp+0xf0944>
 12980e8: f940590a     	ldr	x10, [x8, #0xb0]
 12980ec: 9100214a     	add	x10, x10, #0x8
 12980f0: f85f814b     	ldur	x11, [x10, #-0x8]
 12980f4: eb01017f     	cmp	x11, x1
 12980f8: 54000100     	b.eq	0x1298118 <__start_il2cpp+0xf0954>
 12980fc: f1000529     	subs	x9, x9, #0x1
 1298100: 9100414a     	add	x10, x10, #0x10
 1298104: 54ffff61     	b.ne	0x12980f0 <__start_il2cpp+0xf092c>
 1298108: 52800022     	mov	w2, #0x1                // =1
 129810c: aa1303e0     	mov	x0, x19
 1298110: 97f7f88f     	bl	0x109634c <.text+0x14b3d0>
 1298114: 14000005     	b	0x1298128 <__start_il2cpp+0xf0964>
 1298118: b9400149     	ldr	w9, [x10]
 129811c: 11000529     	add	w9, w9, #0x1
 1298120: 8b29d108     	add	x8, x8, w9, sxtw #4
 1298124: 9104e100     	add	x0, x8, #0x138
 1298128: a9400408     	ldp	x8, x1, [x0]
 129812c: aa1303e0     	mov	x0, x19
 1298130: d63f0100     	blr	x8
 1298134: b40005c0     	cbz	x0, 0x12981ec <__start_il2cpp+0xf0a28>
 1298138: f94002c1     	ldr	x1, [x22]
 129813c: f9400008     	ldr	x8, [x0]
 1298140: eb01011f     	cmp	x8, x1
 1298144: 54000521     	b.ne	0x12981e8 <__start_il2cpp+0xf0a24>
 1298148: 4ea81d00     	mov	v0.16b, v8.16b
 129814c: aa1f03e1     	mov	x1, xzr
 1298150: 9447d49f     	bl	0x248d3cc <__start_il2cpp+0x12e5c08>
 1298154: 17ffffca     	b	0x129807c <__start_il2cpp+0xf08b8>
 1298158: aa1f03f4     	mov	x20, xzr
 129815c: f94002a1     	ldr	x1, [x21]
 1298160: aa1303e0     	mov	x0, x19
 1298164: 97f89fa0     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 1298168: b4000300     	cbz	x0, 0x12981c8 <__start_il2cpp+0xf0a04>
 129816c: f9400008     	ldr	x8, [x0]
 1298170: f94002a1     	ldr	x1, [x21]
 1298174: aa0003f3     	mov	x19, x0
 1298178: 79425d09     	ldrh	w9, [x8, #0x12e]
 129817c: b4000129     	cbz	x9, 0x12981a0 <__start_il2cpp+0xf09dc>
 1298180: f940590a     	ldr	x10, [x8, #0xb0]
 1298184: 9100214a     	add	x10, x10, #0x8
 1298188: f85f814b     	ldur	x11, [x10, #-0x8]
 129818c: eb01017f     	cmp	x11, x1
 1298190: 54000100     	b.eq	0x12981b0 <__start_il2cpp+0xf09ec>
 1298194: f1000529     	subs	x9, x9, #0x1
 1298198: 9100414a     	add	x10, x10, #0x10
 129819c: 54ffff61     	b.ne	0x1298188 <__start_il2cpp+0xf09c4>
 12981a0: aa1303e0     	mov	x0, x19
 12981a4: 2a1f03e2     	mov	w2, wzr
 12981a8: 97f7f869     	bl	0x109634c <.text+0x14b3d0>
 12981ac: 14000004     	b	0x12981bc <__start_il2cpp+0xf09f8>
 12981b0: b9800149     	ldrsw	x9, [x10]
 12981b4: 8b091108     	add	x8, x8, x9, lsl #4
 12981b8: 9104e100     	add	x0, x8, #0x138
 12981bc: a9400408     	ldp	x8, x1, [x0]
 12981c0: aa1303e0     	mov	x0, x19
 12981c4: d63f0100     	blr	x8
 12981c8: b5000194     	cbnz	x20, 0x12981f8 <__start_il2cpp+0xf0a34>
 12981cc: a9444ff4     	ldp	x20, x19, [sp, #0x40]
 12981d0: a94357f6     	ldp	x22, x21, [sp, #0x30]
 12981d4: f94017fe     	ldr	x30, [sp, #0x28]
 12981d8: 6d41a3e9     	ldp	d9, d8, [sp, #0x18]
 12981dc: fd400bea     	ldr	d10, [sp, #0x10]
 12981e0: 910143ff     	add	sp, sp, #0x50
 12981e4: d65f03c0     	ret
 12981e8: 97f8a0ad     	bl	0x10c049c <CloseNLSocket+0x9d4>
 12981ec: 97f89fc5     	bl	0x10c0100 <CloseNLSocket+0x638>
 12981f0: 97f89fc4     	bl	0x10c0100 <CloseNLSocket+0x638>
 12981f4: 97f89fc3     	bl	0x10c0100 <CloseNLSocket+0x638>
 12981f8: aa1403e0     	mov	x0, x20
 12981fc: 97f89fbf     	bl	0x10c00f8 <CloseNLSocket+0x630>
 1298200: 14000004     	b	0x1298210 <__start_il2cpp+0xf0a4c>
 1298204: 14000003     	b	0x1298210 <__start_il2cpp+0xf0a4c>
 1298208: 14000002     	b	0x1298210 <__start_il2cpp+0xf0a4c>
 129820c: 14000001     	b	0x1298210 <__start_il2cpp+0xf0a4c>
 1298210: 7100043f     	cmp	w1, #0x1
 1298214: 540000a1     	b.ne	0x1298228 <__start_il2cpp+0xf0a64>
 1298218: 9451beb6     	bl	0x2707cf0 <__cxa_begin_catch@plt>
 129821c: f9400014     	ldr	x20, [x0]
 1298220: 9451beb8     	bl	0x2707d00 <__cxa_end_catch@plt>
 1298224: 17ffffce     	b	0x129815c <__start_il2cpp+0xf0998>
 1298228: f90007e0     	str	x0, [sp, #0x8]
 129822c: aa1f03f4     	mov	x20, xzr
 1298230: 14000002     	b	0x1298238 <__start_il2cpp+0xf0a74>
 1298234: f90007e0     	str	x0, [sp, #0x8]
 1298238: f94002a1     	ldr	x1, [x21]
 129823c: aa1303e0     	mov	x0, x19
 1298240: 97f89f69     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 1298244: aa0003f3     	mov	x19, x0
 1298248: b40002e0     	cbz	x0, 0x12982a4 <__start_il2cpp+0xf0ae0>
 129824c: f9400268     	ldr	x8, [x19]
 1298250: f94002a1     	ldr	x1, [x21]
 1298254: 79425d09     	ldrh	w9, [x8, #0x12e]
 1298258: b4000129     	cbz	x9, 0x129827c <__start_il2cpp+0xf0ab8>
 129825c: f940590a     	ldr	x10, [x8, #0xb0]
 1298260: 9100214a     	add	x10, x10, #0x8
 1298264: f85f814b     	ldur	x11, [x10, #-0x8]
 1298268: eb01017f     	cmp	x11, x1
 129826c: 54000100     	b.eq	0x129828c <__start_il2cpp+0xf0ac8>
 1298270: f1000529     	subs	x9, x9, #0x1
 1298274: 9100414a     	add	x10, x10, #0x10
 1298278: 54ffff61     	b.ne	0x1298264 <__start_il2cpp+0xf0aa0>
 129827c: aa1303e0     	mov	x0, x19
 1298280: 2a1f03e2     	mov	w2, wzr
 1298284: 97f7f832     	bl	0x109634c <.text+0x14b3d0>
 1298288: 14000004     	b	0x1298298 <__start_il2cpp+0xf0ad4>
 129828c: b9800149     	ldrsw	x9, [x10]
 1298290: 8b091108     	add	x8, x8, x9, lsl #4
 1298294: 9104e100     	add	x0, x8, #0x138
 1298298: a9400408     	ldp	x8, x1, [x0]
 129829c: aa1303e0     	mov	x0, x19
 12982a0: d63f0100     	blr	x8
 12982a4: b5000074     	cbnz	x20, 0x12982b0 <__start_il2cpp+0xf0aec>
 12982a8: f94007e0     	ldr	x0, [sp, #0x8]
 12982ac: 97fc2d14     	bl	0x11a36fc <__emutls_get_address+0x4b8>
 12982b0: aa1403e0     	mov	x0, x20
 12982b4: 97f89f91     	bl	0x10c00f8 <CloseNLSocket+0x630>
 12982b8: 97f2cb8f     	bl	0xf4b0f4 <.text+0x178>
