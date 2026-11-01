
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12b02e4: 6dbe23e9     	stp	d9, d8, [sp, #-0x20]!
 12b02e8: a9014ffe     	stp	x30, x19, [sp, #0x10]
 12b02ec: aa1f03e1     	mov	x1, xzr
 12b02f0: aa0003f3     	mov	x19, x0
 12b02f4: 94481786     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12b02f8: b4000420     	cbz	x0, 0x12b037c <__start_il2cpp+0x108bb8>
 12b02fc: aa1f03e1     	mov	x1, xzr
 12b0300: 944848dd     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12b0304: f9404a73     	ldr	x19, [x19, #0x90]
 12b0308: b40003b3     	cbz	x19, 0x12b037c <__start_il2cpp+0x108bb8>
 12b030c: 52a86908     	mov	w8, #0x43480000         // =1128792064
 12b0310: 1e270101     	fmov	s1, w8
 12b0314: 1e211800     	fdiv	s0, s0, s1
 12b0318: 1e211841     	fdiv	s1, s2, s1
 12b031c: 52801909     	mov	w9, #0xc8               // =200
 12b0320: 52aff00a     	mov	w10, #0x7f800000        // =2139095040
 12b0324: 1e380028     	fcvtzs	w8, s1
 12b0328: 1e270142     	fmov	s2, w10
 12b032c: 1e38000a     	fcvtzs	w10, s0
 12b0330: 1b097d08     	mul	w8, w8, w9
 12b0334: 1b097d49     	mul	w9, w10, w9
 12b0338: 1e2703e3     	fmov	s3, wzr
 12b033c: 1e222020     	fcmp	s1, s2
 12b0340: 1e220101     	scvtf	s1, w8
 12b0344: 1e220124     	scvtf	s4, w9
 12b0348: 1e210c68     	fcsel	s8, s3, s1, eq
 12b034c: 1e222000     	fcmp	s0, s2
 12b0350: aa1303e0     	mov	x0, x19
 12b0354: aa1f03e1     	mov	x1, xzr
 12b0358: 1e240c69     	fcsel	s9, s3, s4, eq
 12b035c: 944848c6     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12b0360: aa1303e0     	mov	x0, x19
 12b0364: a9414ffe     	ldp	x30, x19, [sp, #0x10]
 12b0368: 4ea91d20     	mov	v0.16b, v9.16b
 12b036c: 4ea81d02     	mov	v2.16b, v8.16b
 12b0370: aa1f03e1     	mov	x1, xzr
 12b0374: 6cc223e9     	ldp	d9, d8, [sp], #0x20
 12b0378: 144848e7     	b	0x24c2714 <__start_il2cpp+0x131af50>
 12b037c: 97f83f61     	bl	0x10c0100 <CloseNLSocket+0x638>
