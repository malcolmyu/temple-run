
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 127276c: fc1e0fe8     	str	d8, [sp, #-0x20]!
 1272770: f90007fe     	str	x30, [sp, #0x8]
 1272774: a9014ff4     	stp	x20, x19, [sp, #0x10]
 1272778: aa0003f3     	mov	x19, x0
 127277c: f9403800     	ldr	x0, [x0, #0x70]
 1272780: b40003a0     	cbz	x0, 0x12727f4 <__start_il2cpp+0xcb030>
 1272784: 2a0103f4     	mov	w20, w1
 1272788: 12000021     	and	w1, w1, #0x1
 127278c: aa1f03e2     	mov	x2, xzr
 1272790: 4ea01c08     	mov	v8.16b, v0.16b
 1272794: 9400994d     	bl	0x1298cc8 <__start_il2cpp+0xf1504>
 1272798: f9402a60     	ldr	x0, [x19, #0x50]
 127279c: b40002c0     	cbz	x0, 0x12727f4 <__start_il2cpp+0xcb030>
 12727a0: 52a85908     	mov	w8, #0x42c80000         // =1120403456
 12727a4: 52a865e9     	mov	w9, #0x432f0000         // =1127153664
 12727a8: 7200029f     	tst	w20, #0x1
 12727ac: 1e270100     	fmov	s0, w8
 12727b0: 1e270121     	fmov	s1, w9
 12727b4: 1e201c20     	fcsel	s0, s1, s0, ne
 12727b8: 1e201901     	fdiv	s1, s8, s0
 12727bc: 1e2d1000     	fmov	s0, #0.75000000
 12727c0: 1e201002     	fmov	s2, #2.00000000
 12727c4: 1e2703e3     	fmov	s3, wzr
 12727c8: aa1f03e1     	mov	x1, xzr
 12727cc: 9400e817     	bl	0x12ac828 <__start_il2cpp+0x105064>
 12727d0: f9412e60     	ldr	x0, [x19, #0x258]
 12727d4: b4000100     	cbz	x0, 0x12727f4 <__start_il2cpp+0xcb030>
 12727d8: a9414ff4     	ldp	x20, x19, [sp, #0x10]
 12727dc: f94007fe     	ldr	x30, [sp, #0x8]
 12727e0: 1e2e1000     	fmov	s0, #1.00000000
 12727e4: 52800061     	mov	w1, #0x3                // =3
 12727e8: aa1f03e2     	mov	x2, xzr
 12727ec: fc4207e8     	ldr	d8, [sp], #0x20
 12727f0: 14008b73     	b	0x12955bc <__start_il2cpp+0xeddf8>
 12727f4: 97f93643     	bl	0x10c0100 <CloseNLSocket+0x638>
