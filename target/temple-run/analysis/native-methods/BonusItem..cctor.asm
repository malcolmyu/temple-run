
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1296758: f81d0ffe     	str	x30, [sp, #-0x30]!
 129675c: a90157f6     	stp	x22, x21, [sp, #0x10]
 1296760: a9024ff4     	stp	x20, x19, [sp, #0x20]
 1296764: f000bcf5     	adrp	x21, 0x2a35000
 1296768: b000ae76     	adrp	x22, 0x2863000
 129676c: b000ae73     	adrp	x19, 0x2863000
 1296770: b000ae74     	adrp	x20, 0x2863000
 1296774: 39622ea8     	ldrb	w8, [x21, #0x88b]
 1296778: f946bad6     	ldr	x22, [x22, #0xd70]
 129677c: f946be73     	ldr	x19, [x19, #0xd78]
 1296780: f9467694     	ldr	x20, [x20, #0xce8]
 1296784: 37000188     	tbnz	w8, #0x0, 0x12967b4 <__start_il2cpp+0xeeff0>
 1296788: b000ae60     	adrp	x0, 0x2863000
 129678c: f9467400     	ldr	x0, [x0, #0xce8]
 1296790: 97f8a5d2     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1296794: b000ae60     	adrp	x0, 0x2863000
 1296798: f946bc00     	ldr	x0, [x0, #0xd78]
 129679c: 97f8a5cf     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12967a0: b000ae60     	adrp	x0, 0x2863000
 12967a4: f946b800     	ldr	x0, [x0, #0xd70]
 12967a8: 97f8a5cc     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12967ac: 52800028     	mov	w8, #0x1                // =1
 12967b0: 39222ea8     	strb	w8, [x21, #0x88b]
 12967b4: f94002c0     	ldr	x0, [x22]
 12967b8: 97f8a64f     	bl	0x10c00f4 <CloseNLSocket+0x62c>
 12967bc: f9400261     	ldr	x1, [x19]
 12967c0: aa0003f3     	mov	x19, x0
 12967c4: 940f183a     	bl	0x165c8ac <__start_il2cpp+0x4b50e8>
 12967c8: f9400288     	ldr	x8, [x20]
 12967cc: a94157f6     	ldp	x22, x21, [sp, #0x10]
 12967d0: f9405d08     	ldr	x8, [x8, #0xb8]
 12967d4: f9000513     	str	x19, [x8, #0x8]
 12967d8: a9424ff4     	ldp	x20, x19, [sp, #0x20]
 12967dc: f84307fe     	ldr	x30, [sp], #0x30
 12967e0: d65f03c0     	ret
