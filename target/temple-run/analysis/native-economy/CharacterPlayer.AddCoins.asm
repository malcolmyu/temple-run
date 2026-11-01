
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1298aa8: 7100043f     	cmp	w1, #0x1
 1298aac: 540002eb     	b.lt	0x1298b08 <__start_il2cpp+0xf1344>
 1298ab0: b9414808     	ldr	w8, [x0, #0x148]
 1298ab4: b9414c09     	ldr	w9, [x0, #0x14c]
 1298ab8: b941500a     	ldr	w10, [x0, #0x150]
 1298abc: 0b010108     	add	w8, w8, w1
 1298ac0: 0b010129     	add	w9, w9, w1
 1298ac4: b9014808     	str	w8, [x0, #0x148]
 1298ac8: 6b0a0128     	subs	w8, w9, w10
 1298acc: b9014c09     	str	w9, [x0, #0x14c]
 1298ad0: 540001cb     	b.lt	0x1298b08 <__start_il2cpp+0xf1344>
 1298ad4: b9413809     	ldr	w9, [x0, #0x138]
 1298ad8: b9413c0a     	ldr	w10, [x0, #0x13c]
 1298adc: b941400b     	ldr	w11, [x0, #0x140]
 1298ae0: b941440d     	ldr	w13, [x0, #0x144]
 1298ae4: 52803e8c     	mov	w12, #0x1f4             // =500
 1298ae8: 1b0c254a     	madd	w10, w10, w12, w9
 1298aec: 11000569     	add	w9, w11, #0x1
 1298af0: 6b0d013f     	cmp	w9, w13
 1298af4: b901380a     	str	w10, [x0, #0x138]
 1298af8: b9014009     	str	w9, [x0, #0x140]
 1298afc: 5400004d     	b.le	0x1298b04 <__start_il2cpp+0xf1340>
 1298b00: b9014409     	str	w9, [x0, #0x144]
 1298b04: b9014c08     	str	w8, [x0, #0x14c]
 1298b08: d65f03c0     	ret
