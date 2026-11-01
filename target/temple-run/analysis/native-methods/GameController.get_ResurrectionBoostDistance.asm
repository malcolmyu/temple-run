
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1272594: f81e0ffe     	str	x30, [sp, #-0x20]!
 1272598: a9014ff4     	stp	x20, x19, [sp, #0x10]
 127259c: f000be14     	adrp	x20, 0x2a35000
 12725a0: 9000af73     	adrp	x19, 0x285e000
 12725a4: 395dca88     	ldrb	w8, [x20, #0x772]
 12725a8: f9414273     	ldr	x19, [x19, #0x280]
 12725ac: 370000c8     	tbnz	w8, #0x0, 0x12725c4 <__start_il2cpp+0xcae00>
 12725b0: 9000af60     	adrp	x0, 0x285e000
 12725b4: f9414000     	ldr	x0, [x0, #0x280]
 12725b8: 97f93648     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12725bc: 52800028     	mov	w8, #0x1                // =1
 12725c0: 391dca88     	strb	w8, [x20, #0x772]
 12725c4: f9400260     	ldr	x0, [x19]
 12725c8: b940e008     	ldr	w8, [x0, #0xe0]
 12725cc: 35000068     	cbnz	w8, 0x12725d8 <__start_il2cpp+0xcae14>
 12725d0: 97f93684     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12725d4: f9400260     	ldr	x0, [x19]
 12725d8: f9405c08     	ldr	x8, [x0, #0xb8]
 12725dc: f9401508     	ldr	x8, [x8, #0x28]
 12725e0: b40000a8     	cbz	x8, 0x12725f4 <__start_il2cpp+0xcae30>
 12725e4: b9403900     	ldr	w0, [x8, #0x38]
 12725e8: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 12725ec: f84207fe     	ldr	x30, [sp], #0x20
 12725f0: d65f03c0     	ret
 12725f4: 97f936c3     	bl	0x10c0100 <CloseNLSocket+0x638>
