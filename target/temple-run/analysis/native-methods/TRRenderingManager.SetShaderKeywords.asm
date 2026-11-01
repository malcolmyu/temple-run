
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12f8304: f81d0ffe     	str	x30, [sp, #-0x30]!
 12f8308: a90157f6     	stp	x22, x21, [sp, #0x10]
 12f830c: a9024ff4     	stp	x20, x19, [sp, #0x20]
 12f8310: b000b9f4     	adrp	x20, 0x2a35000
 12f8314: 9000ab36     	adrp	x22, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12f8318: 9000ab33     	adrp	x19, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12f831c: d000ab55     	adrp	x21, 0x2862000
 12f8320: 396f2288     	ldrb	w8, [x20, #0xbc8]
 12f8324: f947aed6     	ldr	x22, [x22, #0xf58]
 12f8328: f947aa73     	ldr	x19, [x19, #0xf50]
 12f832c: f9422ab5     	ldr	x21, [x21, #0x450]
 12f8330: 370002a8     	tbnz	w8, #0x0, 0x12f8384 <__start_il2cpp+0x150bc0>
 12f8334: 9000ab20     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12f8338: f947a400     	ldr	x0, [x0, #0xf48]
 12f833c: 97f71ee7     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f8340: 9000ab20     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12f8344: f947a800     	ldr	x0, [x0, #0xf50]
 12f8348: 97f71ee4     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f834c: d000ab20     	adrp	x0, 0x285e000
 12f8350: f9432400     	ldr	x0, [x0, #0x648]
 12f8354: 97f71ee1     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f8358: d000ab20     	adrp	x0, 0x285e000
 12f835c: f9432800     	ldr	x0, [x0, #0x650]
 12f8360: 97f71ede     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f8364: 9000ab20     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12f8368: f947ac00     	ldr	x0, [x0, #0xf58]
 12f836c: 97f71edb     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f8370: d000ab40     	adrp	x0, 0x2862000
 12f8374: f9422800     	ldr	x0, [x0, #0x450]
 12f8378: 97f71ed8     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12f837c: 52800028     	mov	w8, #0x1                // =1
 12f8380: 392f2288     	strb	w8, [x20, #0xbc8]
 12f8384: f94002c0     	ldr	x0, [x22]
 12f8388: 97f71f5b     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12f838c: f9400261     	ldr	x1, [x19]
 12f8390: aa0003f4     	mov	x20, x0
 12f8394: 9418062d     	bl	0x18f9c48 <__start_il2cpp+0x752484>
 12f8398: f94002c0     	ldr	x0, [x22]
 12f839c: 97f71f56     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12f83a0: f9400261     	ldr	x1, [x19]
 12f83a4: aa0003f3     	mov	x19, x0
 12f83a8: 94180628     	bl	0x18f9c48 <__start_il2cpp+0x752484>
 12f83ac: f94002a0     	ldr	x0, [x21]
 12f83b0: b940e008     	ldr	w8, [x0, #0xe0]
 12f83b4: 35000048     	cbnz	w8, 0x12f83bc <__start_il2cpp+0x150bf8>
 12f83b8: 97f71f0a     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12f83bc: b40012f3     	cbz	x19, 0x12f8618 <__start_il2cpp+0x150e54>
 12f83c0: f94002a8     	ldr	x8, [x21]
 12f83c4: 9000ab36     	adrp	x22, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12f83c8: f9405d08     	ldr	x8, [x8, #0xb8]
 12f83cc: f947a6d6     	ldr	x22, [x22, #0xf48]
 12f83d0: b9401e6b     	ldr	w11, [x19, #0x1c]
 12f83d4: f9400a6a     	ldr	x10, [x19, #0x10]
 12f83d8: f9400501     	ldr	x1, [x8, #0x8]
 12f83dc: f94002c9     	ldr	x9, [x22]
 12f83e0: 11000568     	add	w8, w11, #0x1
 12f83e4: b9001e68     	str	w8, [x19, #0x1c]
 12f83e8: b400118a     	cbz	x10, 0x12f8618 <__start_il2cpp+0x150e54>
 12f83ec: b9801a6b     	ldrsw	x11, [x19, #0x18]
 12f83f0: b940194c     	ldr	w12, [x10, #0x18]
 12f83f4: 6b0c017f     	cmp	w11, w12
 12f83f8: 540000c2     	b.hs	0x12f8410 <__start_il2cpp+0x150c4c>
 12f83fc: 11000569     	add	w9, w11, #0x1
 12f8400: 8b0b0d4a     	add	x10, x10, x11, lsl #3
 12f8404: b9001a69     	str	w9, [x19, #0x18]
 12f8408: f9001141     	str	x1, [x10, #0x20]
 12f840c: 14000007     	b	0x12f8428 <__start_il2cpp+0x150c64>
 12f8410: f9401128     	ldr	x8, [x9, #0x20]
 12f8414: aa1303e0     	mov	x0, x19
 12f8418: f9406108     	ldr	x8, [x8, #0xc0]
 12f841c: f9403902     	ldr	x2, [x8, #0x70]
 12f8420: 941807fd     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 12f8424: 29432269     	ldp	w9, w8, [x19, #0x18]
 12f8428: f94002aa     	ldr	x10, [x21]
 12f842c: f9400a6b     	ldr	x11, [x19, #0x10]
 12f8430: f94002cc     	ldr	x12, [x22]
 12f8434: f9405d4a     	ldr	x10, [x10, #0xb8]
 12f8438: f9400941     	ldr	x1, [x10, #0x10]
 12f843c: 1100050a     	add	w10, w8, #0x1
 12f8440: b9001e6a     	str	w10, [x19, #0x1c]
 12f8444: b4000eab     	cbz	x11, 0x12f8618 <__start_il2cpp+0x150e54>
 12f8448: b9401968     	ldr	w8, [x11, #0x18]
 12f844c: 6b08013f     	cmp	w9, w8
 12f8450: 540000c2     	b.hs	0x12f8468 <__start_il2cpp+0x150ca4>
 12f8454: 11000528     	add	w8, w9, #0x1
 12f8458: 8b29cd69     	add	x9, x11, w9, sxtw #3
 12f845c: b9001a68     	str	w8, [x19, #0x18]
 12f8460: f9001121     	str	x1, [x9, #0x20]
 12f8464: 14000007     	b	0x12f8480 <__start_il2cpp+0x150cbc>
 12f8468: f9401188     	ldr	x8, [x12, #0x20]
 12f846c: aa1303e0     	mov	x0, x19
 12f8470: f9406108     	ldr	x8, [x8, #0xc0]
 12f8474: f9403902     	ldr	x2, [x8, #0x70]
 12f8478: 941807e7     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 12f847c: 29432a68     	ldp	w8, w10, [x19, #0x18]
 12f8480: f94002a9     	ldr	x9, [x21]
 12f8484: f9400a6b     	ldr	x11, [x19, #0x10]
 12f8488: 1100054a     	add	w10, w10, #0x1
 12f848c: f9405d29     	ldr	x9, [x9, #0xb8]
 12f8490: f9401121     	ldr	x1, [x9, #0x20]
 12f8494: f94002c9     	ldr	x9, [x22]
 12f8498: b9001e6a     	str	w10, [x19, #0x1c]
 12f849c: b4000beb     	cbz	x11, 0x12f8618 <__start_il2cpp+0x150e54>
 12f84a0: b940196c     	ldr	w12, [x11, #0x18]
 12f84a4: 6b0c011f     	cmp	w8, w12
 12f84a8: 540000c2     	b.hs	0x12f84c0 <__start_il2cpp+0x150cfc>
 12f84ac: 11000509     	add	w9, w8, #0x1
 12f84b0: 8b28cd68     	add	x8, x11, w8, sxtw #3
 12f84b4: b9001a69     	str	w9, [x19, #0x18]
 12f84b8: f9001101     	str	x1, [x8, #0x20]
 12f84bc: 14000007     	b	0x12f84d8 <__start_il2cpp+0x150d14>
 12f84c0: f9401128     	ldr	x8, [x9, #0x20]
 12f84c4: aa1303e0     	mov	x0, x19
 12f84c8: f9406108     	ldr	x8, [x8, #0xc0]
 12f84cc: f9403902     	ldr	x2, [x8, #0x70]
 12f84d0: 941807d1     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 12f84d4: 29432a69     	ldp	w9, w10, [x19, #0x18]
 12f84d8: f94002a8     	ldr	x8, [x21]
 12f84dc: 1100054a     	add	w10, w10, #0x1
 12f84e0: f9405d0b     	ldr	x11, [x8, #0xb8]
 12f84e4: f9400a68     	ldr	x8, [x19, #0x10]
 12f84e8: f9400d61     	ldr	x1, [x11, #0x18]
 12f84ec: f94002cb     	ldr	x11, [x22]
 12f84f0: b9001e6a     	str	w10, [x19, #0x1c]
 12f84f4: b4000928     	cbz	x8, 0x12f8618 <__start_il2cpp+0x150e54>
 12f84f8: b940190a     	ldr	w10, [x8, #0x18]
 12f84fc: 6b0a013f     	cmp	w9, w10
 12f8500: 540000c2     	b.hs	0x12f8518 <__start_il2cpp+0x150d54>
 12f8504: 1100052a     	add	w10, w9, #0x1
 12f8508: 8b29cd08     	add	x8, x8, w9, sxtw #3
 12f850c: b9001a6a     	str	w10, [x19, #0x18]
 12f8510: f9001101     	str	x1, [x8, #0x20]
 12f8514: 14000006     	b	0x12f852c <__start_il2cpp+0x150d68>
 12f8518: f9401168     	ldr	x8, [x11, #0x20]
 12f851c: aa1303e0     	mov	x0, x19
 12f8520: f9406108     	ldr	x8, [x8, #0xc0]
 12f8524: f9403902     	ldr	x2, [x8, #0x70]
 12f8528: 941807bb     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 12f852c: b4000774     	cbz	x20, 0x12f8618 <__start_il2cpp+0x150e54>
 12f8530: f94002a8     	ldr	x8, [x21]
 12f8534: b9401e8a     	ldr	w10, [x20, #0x1c]
 12f8538: f9405d09     	ldr	x9, [x8, #0xb8]
 12f853c: f9400a88     	ldr	x8, [x20, #0x10]
 12f8540: 1100054a     	add	w10, w10, #0x1
 12f8544: f9400121     	ldr	x1, [x9]
 12f8548: f94002c9     	ldr	x9, [x22]
 12f854c: b9001e8a     	str	w10, [x20, #0x1c]
 12f8550: b4000648     	cbz	x8, 0x12f8618 <__start_il2cpp+0x150e54>
 12f8554: b9801a8a     	ldrsw	x10, [x20, #0x18]
 12f8558: b940190b     	ldr	w11, [x8, #0x18]
 12f855c: 6b0b015f     	cmp	w10, w11
 12f8560: 540000c2     	b.hs	0x12f8578 <__start_il2cpp+0x150db4>
 12f8564: 11000549     	add	w9, w10, #0x1
 12f8568: 8b0a0d08     	add	x8, x8, x10, lsl #3
 12f856c: b9001a89     	str	w9, [x20, #0x18]
 12f8570: f9001101     	str	x1, [x8, #0x20]
 12f8574: 14000007     	b	0x12f8590 <__start_il2cpp+0x150dcc>
 12f8578: f9401128     	ldr	x8, [x9, #0x20]
 12f857c: aa1403e0     	mov	x0, x20
 12f8580: f9406108     	ldr	x8, [x8, #0xc0]
 12f8584: f9403902     	ldr	x2, [x8, #0x70]
 12f8588: 941807a3     	bl	0x18fa414 <__start_il2cpp+0x752c50>
 12f858c: b9401a89     	ldr	w9, [x20, #0x18]
 12f8590: d000ab36     	adrp	x22, 0x285e000
 12f8594: f9432ad6     	ldr	x22, [x22, #0x650]
 12f8598: 7100053f     	cmp	w9, #0x1
 12f859c: 5400018b     	b.lt	0x12f85cc <__start_il2cpp+0x150e08>
 12f85a0: 2a1f03f5     	mov	w21, wzr
 12f85a4: f94002c2     	ldr	x2, [x22]
 12f85a8: aa1403e0     	mov	x0, x20
 12f85ac: 2a1503e1     	mov	w1, w21
 12f85b0: 941806e8     	bl	0x18fa150 <__start_il2cpp+0x75298c>
 12f85b4: aa1f03e1     	mov	x1, xzr
 12f85b8: 94469a70     	bl	0x249ef78 <__start_il2cpp+0x12f77b4>
 12f85bc: b9401a88     	ldr	w8, [x20, #0x18]
 12f85c0: 110006b5     	add	w21, w21, #0x1
 12f85c4: 6b0802bf     	cmp	w21, w8
 12f85c8: 54fffeeb     	b.lt	0x12f85a4 <__start_il2cpp+0x150de0>
 12f85cc: b9401a68     	ldr	w8, [x19, #0x18]
 12f85d0: 7100051f     	cmp	w8, #0x1
 12f85d4: 5400018b     	b.lt	0x12f8604 <__start_il2cpp+0x150e40>
 12f85d8: 2a1f03f4     	mov	w20, wzr
 12f85dc: f94002c2     	ldr	x2, [x22]
 12f85e0: aa1303e0     	mov	x0, x19
 12f85e4: 2a1403e1     	mov	w1, w20
 12f85e8: 941806da     	bl	0x18fa150 <__start_il2cpp+0x75298c>
 12f85ec: aa1f03e1     	mov	x1, xzr
 12f85f0: 94469a71     	bl	0x249efb4 <__start_il2cpp+0x12f77f0>
 12f85f4: b9401a68     	ldr	w8, [x19, #0x18]
 12f85f8: 11000694     	add	w20, w20, #0x1
 12f85fc: 6b08029f     	cmp	w20, w8
 12f8600: 54fffeeb     	b.lt	0x12f85dc <__start_il2cpp+0x150e18>
 12f8604: a9424ff4     	ldp	x20, x19, [sp, #0x20]
 12f8608: a94157f6     	ldp	x22, x21, [sp, #0x10]
 12f860c: 52800020     	mov	w0, #0x1                // =1
 12f8610: f84307fe     	ldr	x30, [sp], #0x30
 12f8614: d65f03c0     	ret
 12f8618: 97f71eba     	bl	0x10c0100 <CloseNLSocket+0x638>
