
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 128d1b4: f81c0ffe     	str	x30, [sp, #-0x40]!
 128d1b8: a9015ff8     	stp	x24, x23, [sp, #0x10]
 128d1bc: a90257f6     	stp	x22, x21, [sp, #0x20]
 128d1c0: a9034ff4     	stp	x20, x19, [sp, #0x30]
 128d1c4: 9000bd54     	adrp	x20, 0x2a35000
 128d1c8: 39606a88     	ldrb	w8, [x20, #0x81a]
 128d1cc: aa0003f3     	mov	x19, x0
 128d1d0: 37000128     	tbnz	w8, #0x0, 0x128d1f4 <__start_il2cpp+0xe5a30>
 128d1d4: d000aea0     	adrp	x0, 0x2863000
 128d1d8: f942ac00     	ldr	x0, [x0, #0x558]
 128d1dc: 97f8cb3f     	bl	0x10bfed8 <CloseNLSocket+0x410>
 128d1e0: d000aea0     	adrp	x0, 0x2863000
 128d1e4: f942b000     	ldr	x0, [x0, #0x560]
 128d1e8: 97f8cb3c     	bl	0x10bfed8 <CloseNLSocket+0x410>
 128d1ec: 52800028     	mov	w8, #0x1                // =1
 128d1f0: 39206a88     	strb	w8, [x20, #0x81a]
 128d1f4: f9402260     	ldr	x0, [x19, #0x40]
 128d1f8: b40002e0     	cbz	x0, 0x128d254 <__start_il2cpp+0xe5a90>
 128d1fc: b9401816     	ldr	w22, [x0, #0x18]
 128d200: 710006df     	cmp	w22, #0x1
 128d204: 540002ab     	b.lt	0x128d258 <__start_il2cpp+0xe5a94>
 128d208: d000aeb7     	adrp	x23, 0x2863000
 128d20c: f942b2f7     	ldr	x23, [x23, #0x560]
 128d210: 2a1f03f5     	mov	w21, wzr
 128d214: 2a1f03f4     	mov	w20, wzr
 128d218: 52a85918     	mov	w24, #0x42c80000        // =1120403456
 128d21c: f94002e2     	ldr	x2, [x23]
 128d220: 2a1503e1     	mov	w1, w21
 128d224: 9419b3cb     	bl	0x18fa150 <__start_il2cpp+0x75298c>
 128d228: b4000160     	cbz	x0, 0x128d254 <__start_il2cpp+0xe5a90>
 128d22c: bd402000     	ldr	s0, [x0, #0x20]
 128d230: 1e270301     	fmov	s1, w24
 128d234: 110006b5     	add	w21, w21, #0x1
 128d238: 1e212000     	fcmp	s0, s1
 128d23c: 1a9fb7e8     	cset	w8, ge
 128d240: 6b1502df     	cmp	w22, w21
 128d244: 0b080294     	add	w20, w20, w8
 128d248: 540000a0     	b.eq	0x128d25c <__start_il2cpp+0xe5a98>
 128d24c: f9402260     	ldr	x0, [x19, #0x40]
 128d250: b5fffe60     	cbnz	x0, 0x128d21c <__start_il2cpp+0xe5a58>
 128d254: 97f8cbab     	bl	0x10c0100 <CloseNLSocket+0x638>
 128d258: 2a1f03f4     	mov	w20, wzr
 128d25c: 2a1403e0     	mov	w0, w20
 128d260: a9434ff4     	ldp	x20, x19, [sp, #0x30]
 128d264: a94257f6     	ldp	x22, x21, [sp, #0x20]
 128d268: a9415ff8     	ldp	x24, x23, [sp, #0x10]
 128d26c: f84407fe     	ldr	x30, [sp], #0x40
 128d270: d65f03c0     	ret
