
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12bb304: f81d0ffe     	str	x30, [sp, #-0x30]!
 12bb308: a90157f6     	stp	x22, x21, [sp, #0x10]
 12bb30c: a9024ff4     	stp	x20, x19, [sp, #0x20]
 12bb310: d000bbd6     	adrp	x22, 0x2a35000
 12bb314: b000ad15     	adrp	x21, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12bb318: 3967a6c8     	ldrb	w8, [x22, #0x9e9]
 12bb31c: f94562b5     	ldr	x21, [x21, #0xac0]
 12bb320: 2a0203f3     	mov	w19, w2
 12bb324: aa0103f4     	mov	x20, x1
 12bb328: 37000128     	tbnz	w8, #0x0, 0x12bb34c <__start_il2cpp+0x113b88>
 12bb32c: b000ad40     	adrp	x0, 0x2864000
 12bb330: f9461c00     	ldr	x0, [x0, #0xc38]
 12bb334: 97f812e9     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12bb338: b000ad00     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12bb33c: f9456000     	ldr	x0, [x0, #0xac0]
 12bb340: 97f812e6     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12bb344: 52800028     	mov	w8, #0x1                // =1
 12bb348: 3927a6c8     	strb	w8, [x22, #0x9e9]
 12bb34c: f94002a0     	ldr	x0, [x21]
 12bb350: b940e008     	ldr	w8, [x0, #0xe0]
 12bb354: 35000048     	cbnz	w8, 0x12bb35c <__start_il2cpp+0x113b98>
 12bb358: 97f81322     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12bb35c: aa1403e0     	mov	x0, x20
 12bb360: aa1f03e1     	mov	x1, xzr
 12bb364: aa1f03e2     	mov	x2, xzr
 12bb368: 9447f538     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12bb36c: 36000340     	tbz	w0, #0x0, 0x12bb3d4 <__start_il2cpp+0x113c10>
 12bb370: b40003b4     	cbz	x20, 0x12bb3e4 <__start_il2cpp+0x113c20>
 12bb374: b000ad48     	adrp	x8, 0x2864000
 12bb378: f9461d08     	ldr	x8, [x8, #0xc38]
 12bb37c: aa1403e0     	mov	x0, x20
 12bb380: f9400101     	ldr	x1, [x8]
 12bb384: 94047677     	bl	0x13d8d60 <__start_il2cpp+0x23159c>
 12bb388: f94002a8     	ldr	x8, [x21]
 12bb38c: aa0003f4     	mov	x20, x0
 12bb390: b940e109     	ldr	w9, [x8, #0xe0]
 12bb394: 35000069     	cbnz	w9, 0x12bb3a0 <__start_il2cpp+0x113bdc>
 12bb398: aa0803e0     	mov	x0, x8
 12bb39c: 97f81311     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12bb3a0: aa1403e0     	mov	x0, x20
 12bb3a4: aa1f03e1     	mov	x1, xzr
 12bb3a8: aa1f03e2     	mov	x2, xzr
 12bb3ac: 9447f527     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12bb3b0: 36000120     	tbz	w0, #0x0, 0x12bb3d4 <__start_il2cpp+0x113c10>
 12bb3b4: b4000194     	cbz	x20, 0x12bb3e4 <__start_il2cpp+0x113c20>
 12bb3b8: 12000261     	and	w1, w19, #0x1
 12bb3bc: aa1403e0     	mov	x0, x20
 12bb3c0: a9424ff4     	ldp	x20, x19, [sp, #0x20]
 12bb3c4: a94157f6     	ldp	x22, x21, [sp, #0x10]
 12bb3c8: aa1f03e2     	mov	x2, xzr
 12bb3cc: f84307fe     	ldr	x30, [sp], #0x30
 12bb3d0: 1448e5e6     	b	0x24f4b68 <__start_il2cpp+0x134d3a4>
 12bb3d4: a9424ff4     	ldp	x20, x19, [sp, #0x20]
 12bb3d8: a94157f6     	ldp	x22, x21, [sp, #0x10]
 12bb3dc: f84307fe     	ldr	x30, [sp], #0x30
 12bb3e0: d65f03c0     	ret
 12bb3e4: 97f81347     	bl	0x10c0100 <CloseNLSocket+0x638>
