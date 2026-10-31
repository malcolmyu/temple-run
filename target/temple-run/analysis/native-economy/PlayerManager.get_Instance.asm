
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12a6548: a9be57fe     	stp	x30, x21, [sp, #-0x20]!
 12a654c: a9014ff4     	stp	x20, x19, [sp, #0x10]
 12a6550: f000bc73     	adrp	x19, 0x2a35000
 12a6554: d000adf4     	adrp	x20, 0x2864000
 12a6558: d000adb5     	adrp	x21, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12a655c: 3965f268     	ldrb	w8, [x19, #0x97c]
 12a6560: f9427294     	ldr	x20, [x20, #0x4e0]
 12a6564: f94562b5     	ldr	x21, [x21, #0xac0]
 12a6568: 37000188     	tbnz	w8, #0x0, 0x12a6598 <__start_il2cpp+0xfedd4>
 12a656c: d000ade0     	adrp	x0, 0x2864000
 12a6570: f9427400     	ldr	x0, [x0, #0x4e8]
 12a6574: 97f86659     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12a6578: d000ada0     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12a657c: f9456000     	ldr	x0, [x0, #0xac0]
 12a6580: 97f86656     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12a6584: d000ade0     	adrp	x0, 0x2864000
 12a6588: f9427000     	ldr	x0, [x0, #0x4e0]
 12a658c: 97f86653     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12a6590: 52800028     	mov	w8, #0x1                // =1
 12a6594: 3925f268     	strb	w8, [x19, #0x97c]
 12a6598: f9400288     	ldr	x8, [x20]
 12a659c: f94002a0     	ldr	x0, [x21]
 12a65a0: f9405d08     	ldr	x8, [x8, #0xb8]
 12a65a4: b940e009     	ldr	w9, [x0, #0xe0]
 12a65a8: f9400113     	ldr	x19, [x8]
 12a65ac: 35000049     	cbnz	w9, 0x12a65b4 <__start_il2cpp+0xfedf0>
 12a65b0: 97f8668c     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12a65b4: aa1303e0     	mov	x0, x19
 12a65b8: aa1f03e1     	mov	x1, xzr
 12a65bc: aa1f03e2     	mov	x2, xzr
 12a65c0: 94484bb6     	bl	0x24b9498 <__start_il2cpp+0x1311cd4>
 12a65c4: 36000180     	tbz	w0, #0x0, 0x12a65f4 <__start_il2cpp+0xfee30>
 12a65c8: f94002a0     	ldr	x0, [x21]
 12a65cc: d000adf3     	adrp	x19, 0x2864000
 12a65d0: b940e008     	ldr	w8, [x0, #0xe0]
 12a65d4: f9427673     	ldr	x19, [x19, #0x4e8]
 12a65d8: 35000048     	cbnz	w8, 0x12a65e0 <__start_il2cpp+0xfee1c>
 12a65dc: 97f86681     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12a65e0: f9400260     	ldr	x0, [x19]
 12a65e4: 9405658a     	bl	0x13ffc0c <__start_il2cpp+0x258448>
 12a65e8: f9400288     	ldr	x8, [x20]
 12a65ec: f9405d08     	ldr	x8, [x8, #0xb8]
 12a65f0: f9000100     	str	x0, [x8]
 12a65f4: f9400288     	ldr	x8, [x20]
 12a65f8: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 12a65fc: f9405d08     	ldr	x8, [x8, #0xb8]
 12a6600: f9400100     	ldr	x0, [x8]
 12a6604: a8c257fe     	ldp	x30, x21, [sp], #0x20
 12a6608: d65f03c0     	ret
