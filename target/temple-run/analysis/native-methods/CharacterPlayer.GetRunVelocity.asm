
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12982d8: 6dbe23e9     	stp	d9, d8, [sp, #-0x20]!
 12982dc: a9014ffe     	stp	x30, x19, [sp, #0x10]
 12982e0: b000bcf3     	adrp	x19, 0x2a35000
 12982e4: bd403408     	ldr	s8, [x0, #0x34]
 12982e8: 39413e68     	ldrb	w8, [x19, #0x4f]
 12982ec: bd403c09     	ldr	s9, [x0, #0x3c]
 12982f0: 350000c8     	cbnz	w8, 0x1298308 <__start_il2cpp+0xf0b44>
 12982f4: d000ae20     	adrp	x0, 0x285e000
 12982f8: f9417800     	ldr	x0, [x0, #0x2f0]
 12982fc: 97f89ef7     	bl	0x10bfed8 <CloseNLSocket+0x410>
 1298300: 52800028     	mov	w8, #0x1                // =1
 1298304: 39013e68     	strb	w8, [x19, #0x4f]
 1298308: d000ae28     	adrp	x8, 0x285e000
 129830c: f9417908     	ldr	x8, [x8, #0x2f0]
 1298310: f9400100     	ldr	x0, [x8]
 1298314: b940e008     	ldr	w8, [x0, #0xe0]
 1298318: 35000048     	cbnz	w8, 0x1298320 <__start_il2cpp+0xf0b5c>
 129831c: 97f89f31     	bl	0x10bffe0 <CloseNLSocket+0x518>
 1298320: a9414ffe     	ldp	x30, x19, [sp, #0x10]
 1298324: 1e280900     	fmul	s0, s8, s8
 1298328: 1e290921     	fmul	s1, s9, s9
 129832c: 1e212800     	fadd	s0, s0, s1
 1298330: 1e21c000     	fsqrt	s0, s0
 1298334: 6cc223e9     	ldp	d9, d8, [sp], #0x20
 1298338: d65f03c0     	ret
