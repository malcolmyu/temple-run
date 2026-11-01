
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12abd80: a9bf4ffe     	stp	x30, x19, [sp, #-0x10]!
 12abd84: f9400008     	ldr	x8, [x0]
 12abd88: aa0003f3     	mov	x19, x0
 12abd8c: a9588509     	ldp	x9, x1, [x8, #0x188]
 12abd90: d63f0120     	blr	x9
 12abd94: f9402268     	ldr	x8, [x19, #0x40]
 12abd98: b40003a8     	cbz	x8, 0x12abe0c <__start_il2cpp+0x104648>
 12abd9c: 39441908     	ldrb	w8, [x8, #0x106]
 12abda0: 35000328     	cbnz	w8, 0x12abe04 <__start_il2cpp+0x104640>
 12abda4: 1e202008     	fcmp	s0, #0.0
 12abda8: 1e3e1001     	fmov	s1, #-1.00000000
 12abdac: 54000084     	b.mi	0x12abdbc <__start_il2cpp+0x1045f8>
 12abdb0: 1e2703e1     	fmov	s1, wzr
 12abdb4: 5400004d     	b.le	0x12abdbc <__start_il2cpp+0x1045f8>
 12abdb8: 1e2e1001     	fmov	s1, #1.00000000
 12abdbc: f9402668     	ldr	x8, [x19, #0x48]
 12abdc0: b4000268     	cbz	x8, 0x12abe0c <__start_il2cpp+0x104648>
 12abdc4: 39443109     	ldrb	w9, [x8, #0x10c]
 12abdc8: 350001e9     	cbnz	w9, 0x12abe04 <__start_il2cpp+0x104640>
 12abdcc: 39443509     	ldrb	w9, [x8, #0x10d]
 12abdd0: 350001a9     	cbnz	w9, 0x12abe04 <__start_il2cpp+0x104640>
 12abdd4: 39449509     	ldrb	w9, [x8, #0x125]
 12abdd8: 35000169     	cbnz	w9, 0x12abe04 <__start_il2cpp+0x104640>
 12abddc: 52a82449     	mov	w9, #0x41220000         // =1092747264
 12abde0: 1e20c000     	fabs	s0, s0
 12abde4: 1e270123     	fmov	s3, w9
 12abde8: 1e2e1002     	fmov	s2, #1.00000000
 12abdec: 1e230800     	fmul	s0, s0, s3
 12abdf0: 1e225800     	fmin	s0, s0, s2
 12abdf4: 1e339002     	fmov	s2, #-7.00000000
 12abdf8: 1e220800     	fmul	s0, s0, s2
 12abdfc: 1e210800     	fmul	s0, s0, s1
 12abe00: bd019100     	str	s0, [x8, #0x190]
 12abe04: a8c14ffe     	ldp	x30, x19, [sp], #0x10
 12abe08: d65f03c0     	ret
 12abe0c: 97f850bd     	bl	0x10c0100 <CloseNLSocket+0x638>
