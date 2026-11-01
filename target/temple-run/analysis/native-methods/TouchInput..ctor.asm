
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12ad570: f81e0ffe     	str	x30, [sp, #-0x20]!
 12ad574: a9014ff4     	stp	x20, x19, [sp, #0x10]
 12ad578: 52a7e008     	mov	w8, #0x3f000000         // =1056964608
 12ad57c: b9006008     	str	w8, [x0, #0x60]
 12ad580: 9000bc54     	adrp	x20, 0x2a35000
 12ad584: 39413a88     	ldrb	w8, [x20, #0x4e]
 12ad588: aa0003f3     	mov	x19, x0
 12ad58c: 350000c8     	cbnz	w8, 0x12ad5a4 <__start_il2cpp+0x105de0>
 12ad590: b000ad80     	adrp	x0, 0x285e000
 12ad594: f942b400     	ldr	x0, [x0, #0x568]
 12ad598: 97f84a50     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12ad59c: 52800028     	mov	w8, #0x1                // =1
 12ad5a0: 39013a88     	strb	w8, [x20, #0x4e]
 12ad5a4: b000ad88     	adrp	x8, 0x285e000
 12ad5a8: f942b508     	ldr	x8, [x8, #0x568]
 12ad5ac: b0ff9f49     	adrp	x9, 0x696000
 12ad5b0: fd478920     	ldr	d0, [x9, #0xf10]
 12ad5b4: f000bc34     	adrp	x20, 0x2a34000
 12ad5b8: f9400108     	ldr	x8, [x8]
 12ad5bc: f9405d08     	ldr	x8, [x8, #0xb8]
 12ad5c0: fd400101     	ldr	d1, [x8]
 12ad5c4: fc07c260     	stur	d0, [x19, #0x7c]
 12ad5c8: fd003661     	str	d1, [x19, #0x68]
 12ad5cc: 397e8288     	ldrb	w8, [x20, #0xfa0]
 12ad5d0: 350000c8     	cbnz	w8, 0x12ad5e8 <__start_il2cpp+0x105e24>
 12ad5d4: 9000ad80     	adrp	x0, 0x285d000
 12ad5d8: f9474800     	ldr	x0, [x0, #0xe90]
 12ad5dc: 97f84a3f     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12ad5e0: 52800028     	mov	w8, #0x1                // =1
 12ad5e4: 393e8288     	strb	w8, [x20, #0xfa0]
 12ad5e8: 9000ad88     	adrp	x8, 0x285d000
 12ad5ec: f9474908     	ldr	x8, [x8, #0xe90]
 12ad5f0: aa1303e0     	mov	x0, x19
 12ad5f4: aa1f03e1     	mov	x1, xzr
 12ad5f8: f9400108     	ldr	x8, [x8]
 12ad5fc: f9405d08     	ldr	x8, [x8, #0xb8]
 12ad600: fd400100     	ldr	d0, [x8]
 12ad604: bd400901     	ldr	s1, [x8, #0x8]
 12ad608: fc084260     	stur	d0, [x19, #0x84]
 12ad60c: bd008e61     	str	s1, [x19, #0x8c]
 12ad610: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 12ad614: f84207fe     	ldr	x30, [sp], #0x20
 12ad618: 1448329a     	b	0x24ba080 <__start_il2cpp+0x13128bc>
