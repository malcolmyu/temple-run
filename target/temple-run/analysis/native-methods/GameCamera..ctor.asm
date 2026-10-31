
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12b04c0: f0ff9f28     	adrp	x8, 0x697000
 12b04c4: f0ff9f29     	adrp	x9, 0x697000
 12b04c8: 3dc30500     	ldr	q0, [x8, #0xc10]
 12b04cc: fd413121     	ldr	d1, [x9, #0x260]
 12b04d0: 52a85588     	mov	w8, #0x42ac0000         // =1118568448
 12b04d4: aa1f03e1     	mov	x1, xzr
 12b04d8: 3d803400     	str	q0, [x0, #0xd0]
 12b04dc: fd007001     	str	d1, [x0, #0xe0]
 12b04e0: b900e808     	str	w8, [x0, #0xe8]
 12b04e4: 1400c283     	b	0x12e0ef0 <__start_il2cpp+0x13972c>
