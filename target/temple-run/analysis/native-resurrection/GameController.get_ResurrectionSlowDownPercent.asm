
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12725f8: f81e0ffe     	str	x30, [sp, #-0x20]!
 12725fc: a9014ff4     	stp	x20, x19, [sp, #0x10]
 1272600: f000be14     	adrp	x20, 0x2a35000
 1272604: 9000af73     	adrp	x19, 0x285e000
 1272608: 395dc688     	ldrb	w8, [x20, #0x771]
 127260c: f9414273     	ldr	x19, [x19, #0x280]
 1272610: 370000c8     	tbnz	w8, #0x0, 0x1272628 <__start_il2cpp+0xcae64>
 1272614: 9000af60     	adrp	x0, 0x285e000
 1272618: f9414000     	ldr	x0, [x0, #0x280]
 127261c: 97f9362f     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1272620: 52800028     	mov	w8, #0x1                // =1
 1272624: 391dc688     	strb	w8, [x20, #0x771]
 1272628: f9400260     	ldr	x0, [x19]
 127262c: b940e008     	ldr	w8, [x0, #0xe0]
 1272630: 35000068     	cbnz	w8, 0x127263c <__start_il2cpp+0xcae78>
 1272634: 97f9366b     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1272638: f9400260     	ldr	x0, [x19]
 127263c: f9405c08     	ldr	x8, [x0, #0xb8]
 1272640: f9401508     	ldr	x8, [x8, #0x28]
 1272644: b40000a8     	cbz	x8, 0x1272658 <__start_il2cpp+0xcae94>
 1272648: bd403500     	ldr	s0, [x8, #0x34]
 127264c: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 1272650: f84207fe     	ldr	x30, [sp], #0x20
 1272654: d65f03c0     	ret
 1272658: 97f936aa     	bl	0x10c0100 <CloseNLSocket+0x638>
