
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1267020: fc1b0fe8     	str	d8, [sp, #-0x50]!
 1267024: a90167fe     	stp	x30, x25, [sp, #0x10]
 1267028: a9025ff8     	stp	x24, x23, [sp, #0x20]
 126702c: a90357f6     	stp	x22, x21, [sp, #0x30]
 1267030: a9044ff4     	stp	x20, x19, [sp, #0x40]
 1267034: d000be74     	adrp	x20, 0x2a35000
 1267038: 395c5688     	ldrb	w8, [x20, #0x715]
 126703c: aa0003f3     	mov	x19, x0
 1267040: 370003c8     	tbnz	w8, #0x0, 0x12670b8 <__start_il2cpp+0xbf8f4>
 1267044: f000afc0     	adrp	x0, 0x2862000
 1267048: f940e800     	ldr	x0, [x0, #0x1d0]
 126704c: 97f963a3     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1267050: f000afc0     	adrp	x0, 0x2862000
 1267054: f940ec00     	ldr	x0, [x0, #0x1d8]
 1267058: 97f963a0     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126705c: f000afc0     	adrp	x0, 0x2862000
 1267060: f940dc00     	ldr	x0, [x0, #0x1b8]
 1267064: 97f9639d     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1267068: f000afc0     	adrp	x0, 0x2862000
 126706c: f9410800     	ldr	x0, [x0, #0x210]
 1267070: 97f9639a     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1267074: f000afc0     	adrp	x0, 0x2862000
 1267078: f9417000     	ldr	x0, [x0, #0x2e0]
 126707c: 97f96397     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1267080: f000afc0     	adrp	x0, 0x2862000
 1267084: f9412000     	ldr	x0, [x0, #0x240]
 1267088: 97f96394     	bl	0x10bfed8 <CloseNLSocket+0x410>
 126708c: f000afc0     	adrp	x0, 0x2862000
 1267090: f9412800     	ldr	x0, [x0, #0x250]
 1267094: 97f96391     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1267098: f000afc0     	adrp	x0, 0x2862000
 126709c: f9416c00     	ldr	x0, [x0, #0x2d8]
 12670a0: 97f9638e     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12670a4: f000afc0     	adrp	x0, 0x2862000
 12670a8: f9417400     	ldr	x0, [x0, #0x2e8]
 12670ac: 97f9638b     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12670b0: 52800028     	mov	w8, #0x1                // =1
 12670b4: 391c5688     	strb	w8, [x20, #0x715]
 12670b8: b9404a60     	ldr	w0, [x19, #0x48]
 12670bc: aa1f03e1     	mov	x1, xzr
 12670c0: 9400b064     	bl	0x1293250 <__start_il2cpp+0xeba8c>
 12670c4: f9403a68     	ldr	x8, [x19, #0x70]
 12670c8: b40011a8     	cbz	x8, 0x12672fc <__start_il2cpp+0xbfb38>
 12670cc: aa0003f6     	mov	x22, x0
 12670d0: b940e100     	ldr	w0, [x8, #0xe0]
 12670d4: f000afd4     	adrp	x20, 0x2862000
 12670d8: f000afd8     	adrp	x24, 0x2862000
 12670dc: f000afd9     	adrp	x25, 0x2862000
 12670e0: f940ea94     	ldr	x20, [x20, #0x1d0]
 12670e4: f940ef18     	ldr	x24, [x24, #0x1d8]
 12670e8: f9412b39     	ldr	x25, [x25, #0x250]
 12670ec: aa1f03e1     	mov	x1, xzr
 12670f0: 9400b07e     	bl	0x12932e8 <__start_il2cpp+0xebb24>
 12670f4: f9400288     	ldr	x8, [x20]
 12670f8: aa0003f5     	mov	x21, x0
 12670fc: 528000a1     	mov	w1, #0x5                // =5
 1267100: aa0803e0     	mov	x0, x8
 1267104: 97f96393     	bl	0x10bff50 <CloseNLSocket+0x488>
 1267108: f9400308     	ldr	x8, [x24]
 126710c: bd411668     	ldr	s8, [x19, #0x114]
 1267110: aa0003f4     	mov	x20, x0
 1267114: aa0803e0     	mov	x0, x8
 1267118: 97f963f7     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 126711c: f9400321     	ldr	x1, [x25]
 1267120: 52aff009     	mov	w9, #0x7f800000         // =2139095040
 1267124: 1e380108     	fcvtzs	w8, s8
 1267128: 1e270120     	fmov	s0, w9
 126712c: 93407d08     	sxtw	x8, w8
 1267130: 1e202100     	fcmp	s8, s0
 1267134: b26183e9     	mov	x9, #-0x80000000        // =-2147483648
 1267138: 9a880122     	csel	x2, x9, x8, eq
 126713c: aa1f03e3     	mov	x3, xzr
 1267140: aa0003f7     	mov	x23, x0
 1267144: 97ff9415     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 1267148: b4000db4     	cbz	x20, 0x12672fc <__start_il2cpp+0xbfb38>
 126714c: b40000d7     	cbz	x23, 0x1267164 <__start_il2cpp+0xbf9a0>
 1267150: f9400288     	ldr	x8, [x20]
 1267154: aa1703e0     	mov	x0, x23
 1267158: f9402101     	ldr	x1, [x8, #0x40]
 126715c: 97f963a2     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 1267160: b4000c80     	cbz	x0, 0x12672f0 <__start_il2cpp+0xbfb2c>
 1267164: b9401a88     	ldr	w8, [x20, #0x18]
 1267168: 34000c28     	cbz	w8, 0x12672ec <__start_il2cpp+0xbfb28>
 126716c: f9001297     	str	x23, [x20, #0x20]
 1267170: f9400300     	ldr	x0, [x24]
 1267174: f000afd7     	adrp	x23, 0x2862000
 1267178: f94172f7     	ldr	x23, [x23, #0x2e0]
 126717c: 97f963de     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 1267180: f94002e1     	ldr	x1, [x23]
 1267184: aa1603e2     	mov	x2, x22
 1267188: aa1f03e3     	mov	x3, xzr
 126718c: aa0003f7     	mov	x23, x0
 1267190: 97ff93b7     	bl	0x124c06c <__start_il2cpp+0xa48a8>
 1267194: b40000d7     	cbz	x23, 0x12671ac <__start_il2cpp+0xbf9e8>
 1267198: f9400288     	ldr	x8, [x20]
 126719c: aa1703e0     	mov	x0, x23
 12671a0: f9402101     	ldr	x1, [x8, #0x40]
 12671a4: 97f96390     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 12671a8: b4000a40     	cbz	x0, 0x12672f0 <__start_il2cpp+0xbfb2c>
 12671ac: b9401a88     	ldr	w8, [x20, #0x18]
 12671b0: 7100051f     	cmp	w8, #0x1
 12671b4: 540009c9     	b.ls	0x12672ec <__start_il2cpp+0xbfb28>
 12671b8: f9001697     	str	x23, [x20, #0x28]
 12671bc: f9400300     	ldr	x0, [x24]
 12671c0: f000afd6     	adrp	x22, 0x2862000
 12671c4: f94122d6     	ldr	x22, [x22, #0x240]
 12671c8: 97f963cb     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12671cc: f94002c1     	ldr	x1, [x22]
 12671d0: aa1503e2     	mov	x2, x21
 12671d4: aa1f03e3     	mov	x3, xzr
 12671d8: aa0003f6     	mov	x22, x0
 12671dc: 97ff93a4     	bl	0x124c06c <__start_il2cpp+0xa48a8>
 12671e0: b40000d6     	cbz	x22, 0x12671f8 <__start_il2cpp+0xbfa34>
 12671e4: f9400288     	ldr	x8, [x20]
 12671e8: aa1603e0     	mov	x0, x22
 12671ec: f9402101     	ldr	x1, [x8, #0x40]
 12671f0: 97f9637d     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 12671f4: b40007e0     	cbz	x0, 0x12672f0 <__start_il2cpp+0xbfb2c>
 12671f8: b9401a88     	ldr	w8, [x20, #0x18]
 12671fc: 7100091f     	cmp	w8, #0x2
 1267200: 54000769     	b.ls	0x12672ec <__start_il2cpp+0xbfb28>
 1267204: f9001a96     	str	x22, [x20, #0x30]
 1267208: f9400300     	ldr	x0, [x24]
 126720c: f000afd5     	adrp	x21, 0x2862000
 1267210: b9811276     	ldrsw	x22, [x19, #0x110]
 1267214: f9416eb5     	ldr	x21, [x21, #0x2d8]
 1267218: 97f963b7     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 126721c: f94002a1     	ldr	x1, [x21]
 1267220: aa1603e2     	mov	x2, x22
 1267224: aa1f03e3     	mov	x3, xzr
 1267228: aa0003f5     	mov	x21, x0
 126722c: 97ff93db     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 1267230: b40000d5     	cbz	x21, 0x1267248 <__start_il2cpp+0xbfa84>
 1267234: f9400288     	ldr	x8, [x20]
 1267238: aa1503e0     	mov	x0, x21
 126723c: f9402101     	ldr	x1, [x8, #0x40]
 1267240: 97f96369     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 1267244: b4000560     	cbz	x0, 0x12672f0 <__start_il2cpp+0xbfb2c>
 1267248: b9401a88     	ldr	w8, [x20, #0x18]
 126724c: 71000d1f     	cmp	w8, #0x3
 1267250: 540004e9     	b.ls	0x12672ec <__start_il2cpp+0xbfb28>
 1267254: f9001e95     	str	x21, [x20, #0x38]
 1267258: b9816a75     	ldrsw	x21, [x19, #0x168]
 126725c: f9400300     	ldr	x0, [x24]
 1267260: f000afd3     	adrp	x19, 0x2862000
 1267264: f9410a73     	ldr	x19, [x19, #0x210]
 1267268: 97f963a3     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 126726c: f9400261     	ldr	x1, [x19]
 1267270: aa1503e2     	mov	x2, x21
 1267274: aa1f03e3     	mov	x3, xzr
 1267278: aa0003f3     	mov	x19, x0
 126727c: 97ff93c7     	bl	0x124c198 <__start_il2cpp+0xa49d4>
 1267280: b40000d3     	cbz	x19, 0x1267298 <__start_il2cpp+0xbfad4>
 1267284: f9400288     	ldr	x8, [x20]
 1267288: aa1303e0     	mov	x0, x19
 126728c: f9402101     	ldr	x1, [x8, #0x40]
 1267290: 97f96355     	bl	0x10bffe4 <CloseNLSocket+0x51c>
 1267294: b40002e0     	cbz	x0, 0x12672f0 <__start_il2cpp+0xbfb2c>
 1267298: b9401a88     	ldr	w8, [x20, #0x18]
 126729c: 7100111f     	cmp	w8, #0x4
 12672a0: 54000269     	b.ls	0x12672ec <__start_il2cpp+0xbfb28>
 12672a4: f000afc8     	adrp	x8, 0x2862000
 12672a8: f940dd08     	ldr	x8, [x8, #0x1b8]
 12672ac: f9002293     	str	x19, [x20, #0x40]
 12672b0: f000afd3     	adrp	x19, 0x2862000
 12672b4: f9400100     	ldr	x0, [x8]
 12672b8: b940e008     	ldr	w8, [x0, #0xe0]
 12672bc: f9417673     	ldr	x19, [x19, #0x2e8]
 12672c0: 35000048     	cbnz	w8, 0x12672c8 <__start_il2cpp+0xbfb04>
 12672c4: 97f96347     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12672c8: f9400260     	ldr	x0, [x19]
 12672cc: aa1403e1     	mov	x1, x20
 12672d0: a9444ff4     	ldp	x20, x19, [sp, #0x40]
 12672d4: a94357f6     	ldp	x22, x21, [sp, #0x30]
 12672d8: a9425ff8     	ldp	x24, x23, [sp, #0x20]
 12672dc: a94167fe     	ldp	x30, x25, [sp, #0x10]
 12672e0: aa1f03e2     	mov	x2, xzr
 12672e4: fc4507e8     	ldr	d8, [sp], #0x50
 12672e8: 1400a8ad     	b	0x129159c <__start_il2cpp+0xe9dd8>
 12672ec: 97f96387     	bl	0x10c0108 <CloseNLSocket+0x640>
 12672f0: 97f9638d     	bl	0x10c0124 <CloseNLSocket+0x65c>
 12672f4: aa1f03e1     	mov	x1, xzr
 12672f8: 97f96336     	bl	0x10bffd0 <CloseNLSocket+0x508>
 12672fc: 97f96381     	bl	0x10c0100 <CloseNLSocket+0x638>
