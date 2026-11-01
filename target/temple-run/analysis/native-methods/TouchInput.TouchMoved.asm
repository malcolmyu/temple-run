
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12acc7c: fc1a0fee     	str	d14, [sp, #-0x60]!
 12acc80: 6d00b3ed     	stp	d13, d12, [sp, #0x8]
 12acc84: 6d01abeb     	stp	d11, d10, [sp, #0x18]
 12acc88: 6d02a3e9     	stp	d9, d8, [sp, #0x28]
 12acc8c: f9001ffe     	str	x30, [sp, #0x38]
 12acc90: a90457f6     	stp	x22, x21, [sp, #0x40]
 12acc94: a9054ff4     	stp	x20, x19, [sp, #0x50]
 12acc98: b000bc54     	adrp	x20, 0x2a35000
 12acc9c: 3965aa88     	ldrb	w8, [x20, #0x96a]
 12acca0: 4ea11c28     	mov	v8.16b, v1.16b
 12acca4: 4ea01c09     	mov	v9.16b, v0.16b
 12acca8: aa0003f3     	mov	x19, x0
 12accac: 370001e8     	tbnz	w8, #0x0, 0x12acce8 <__start_il2cpp+0x105524>
 12accb0: d000ad80     	adrp	x0, 0x285e000
 12accb4: f9414000     	ldr	x0, [x0, #0x280]
 12accb8: 97f84c88     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12accbc: 9000ad80     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12accc0: f9456000     	ldr	x0, [x0, #0xac0]
 12accc4: 97f84c85     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12accc8: 9000adc0     	adrp	x0, 0x2864000
 12acccc: f943bc00     	ldr	x0, [x0, #0x778]
 12accd0: 97f84c82     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12accd4: 9000adc0     	adrp	x0, 0x2864000
 12accd8: f943c000     	ldr	x0, [x0, #0x780]
 12accdc: 97f84c7f     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12acce0: 52800028     	mov	w8, #0x1                // =1
 12acce4: 3925aa88     	strb	w8, [x20, #0x96a]
 12acce8: bd40626a     	ldr	s10, [x19, #0x60]
 12accec: aa1303e0     	mov	x0, x19
 12accf0: aa1f03e1     	mov	x1, xzr
 12accf4: 94482258     	bl	0x24b5654 <__start_il2cpp+0x130de90>
 12accf8: 36000120     	tbz	w0, #0x0, 0x12acd1c <__start_il2cpp+0x105558>
 12accfc: f9402268     	ldr	x8, [x19, #0x40]
 12acd00: b4003fe8     	cbz	x8, 0x12ad4fc <__start_il2cpp+0x105d38>
 12acd04: 39437909     	ldrb	w9, [x8, #0xde]
 12acd08: 350000a9     	cbnz	w9, 0x12acd1c <__start_il2cpp+0x105558>
 12acd0c: 39437109     	ldrb	w9, [x8, #0xdc]
 12acd10: 35000069     	cbnz	w9, 0x12acd1c <__start_il2cpp+0x105558>
 12acd14: 39441908     	ldrb	w8, [x8, #0x106]
 12acd18: 34000128     	cbz	w8, 0x12acd3c <__start_il2cpp+0x105578>
 12acd1c: a9454ff4     	ldp	x20, x19, [sp, #0x50]
 12acd20: a94457f6     	ldp	x22, x21, [sp, #0x40]
 12acd24: f9401ffe     	ldr	x30, [sp, #0x38]
 12acd28: 6d42a3e9     	ldp	d9, d8, [sp, #0x28]
 12acd2c: 6d41abeb     	ldp	d11, d10, [sp, #0x18]
 12acd30: 6d40b3ed     	ldp	d13, d12, [sp, #0x8]
 12acd34: fc4607ee     	ldr	d14, [sp], #0x60
 12acd38: d65f03c0     	ret
 12acd3c: 39419268     	ldrb	w8, [x19, #0x64]
 12acd40: 34fffee8     	cbz	w8, 0x12acd1c <__start_il2cpp+0x105558>
 12acd44: 1e2e1000     	fmov	s0, #1.00000000
 12acd48: b000bc54     	adrp	x20, 0x2a35000
 12acd4c: 1e2a3800     	fsub	s0, s0, s10
 12acd50: 395df688     	ldrb	w8, [x20, #0x77d]
 12acd54: 2d4d326a     	ldp	s10, s12, [x19, #0x68]
 12acd58: 1e2f9001     	fmov	s1, #1.75000000
 12acd5c: 1e210800     	fmul	s0, s0, s1
 12acd60: 1e2a1001     	fmov	s1, #0.25000000
 12acd64: 52a84609     	mov	w9, #0x42300000         // =1110441984
 12acd68: 1e21280b     	fadd	s11, s0, s1
 12acd6c: 1e27012d     	fmov	s13, w9
 12acd70: 350000c8     	cbnz	w8, 0x12acd88 <__start_il2cpp+0x1055c4>
 12acd74: d000ad80     	adrp	x0, 0x285e000
 12acd78: f9417800     	ldr	x0, [x0, #0x2f0]
 12acd7c: 97f84c57     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12acd80: 52800028     	mov	w8, #0x1                // =1
 12acd84: 391df688     	strb	w8, [x20, #0x77d]
 12acd88: d000ad94     	adrp	x20, 0x285e000
 12acd8c: f9417a94     	ldr	x20, [x20, #0x2f0]
 12acd90: 1e2d096d     	fmul	s13, s11, s13
 12acd94: 1e2a392e     	fsub	s14, s9, s10
 12acd98: 1e2c390a     	fsub	s10, s8, s12
 12acd9c: f9400280     	ldr	x0, [x20]
 12acda0: b940e008     	ldr	w8, [x0, #0xe0]
 12acda4: 35000048     	cbnz	w8, 0x12acdac <__start_il2cpp+0x1055e8>
 12acda8: 97f84c8e     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12acdac: 1e2e09c0     	fmul	s0, s14, s14
 12acdb0: 1e2a0941     	fmul	s1, s10, s10
 12acdb4: 1e212800     	fadd	s0, s0, s1
 12acdb8: 1e21c00a     	fsqrt	s10, s0
 12acdbc: 1e2d2140     	fcmp	s10, s13
 12acdc0: 54fffae4     	b.mi	0x12acd1c <__start_il2cpp+0x105558>
 12acdc4: b000bc55     	adrp	x21, 0x2a35000
 12acdc8: 39413ea8     	ldrb	w8, [x21, #0x4f]
 12acdcc: 2d4d366c     	ldp	s12, s13, [x19, #0x68]
 12acdd0: 350000c8     	cbnz	w8, 0x12acde8 <__start_il2cpp+0x105624>
 12acdd4: d000ad80     	adrp	x0, 0x285e000
 12acdd8: f9417800     	ldr	x0, [x0, #0x2f0]
 12acddc: 97f84c3f     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12acde0: 52800028     	mov	w8, #0x1                // =1
 12acde4: 39013ea8     	strb	w8, [x21, #0x4f]
 12acde8: f9400280     	ldr	x0, [x20]
 12acdec: 1e2c3929     	fsub	s9, s9, s12
 12acdf0: 1e2d3908     	fsub	s8, s8, s13
 12acdf4: b940e008     	ldr	w8, [x0, #0xe0]
 12acdf8: 35000048     	cbnz	w8, 0x12ace00 <__start_il2cpp+0x10563c>
 12acdfc: 97f84c79     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12ace00: f0ff9f48     	adrp	x8, 0x697000
 12ace04: bd45cd01     	ldr	s1, [x8, #0x5cc]
 12ace08: 1e290920     	fmul	s0, s9, s9
 12ace0c: 1e280902     	fmul	s2, s8, s8
 12ace10: 1e222800     	fadd	s0, s0, s2
 12ace14: 1e21c000     	fsqrt	s0, s0
 12ace18: 1e212000     	fcmp	s0, s1
 12ace1c: 5400008d     	b.le	0x12ace2c <__start_il2cpp+0x105668>
 12ace20: 1e201921     	fdiv	s1, s9, s0
 12ace24: 1e201900     	fdiv	s0, s8, s0
 12ace28: 1400000e     	b	0x12ace60 <__start_il2cpp+0x10569c>
 12ace2c: b000bc54     	adrp	x20, 0x2a35000
 12ace30: 39413a88     	ldrb	w8, [x20, #0x4e]
 12ace34: 350000c8     	cbnz	w8, 0x12ace4c <__start_il2cpp+0x105688>
 12ace38: d000ad80     	adrp	x0, 0x285e000
 12ace3c: f942b400     	ldr	x0, [x0, #0x568]
 12ace40: 97f84c26     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12ace44: 52800028     	mov	w8, #0x1                // =1
 12ace48: 39013a88     	strb	w8, [x20, #0x4e]
 12ace4c: d000ad88     	adrp	x8, 0x285e000
 12ace50: f942b508     	ldr	x8, [x8, #0x568]
 12ace54: f9400108     	ldr	x8, [x8]
 12ace58: f9405d08     	ldr	x8, [x8, #0xb8]
 12ace5c: 2d400101     	ldp	s1, s0, [x8]
 12ace60: 94516bd4     	bl	0x2707db0 <atan2f@plt>
 12ace64: f0ff9f48     	adrp	x8, 0x697000
 12ace68: f940026a     	ldr	x10, [x19]
 12ace6c: f0ff9f49     	adrp	x9, 0x697000
 12ace70: bd45d101     	ldr	s1, [x8, #0x5d0]
 12ace74: bd456122     	ldr	s2, [x9, #0x560]
 12ace78: a9588548     	ldp	x8, x1, [x10, #0x188]
 12ace7c: 52a8768b     	mov	w11, #0x43b40000        // =1135869952
 12ace80: 1e203820     	fsub	s0, s1, s0
 12ace84: 1e270163     	fmov	s3, w11
 12ace88: 1e220800     	fmul	s0, s0, s2
 12ace8c: 1e232801     	fadd	s1, s0, s3
 12ace90: 1e202008     	fcmp	s0, #0.0
 12ace94: aa1303e0     	mov	x0, x19
 12ace98: 1e204c2c     	fcsel	s12, s1, s0, mi
 12ace9c: d63f0100     	blr	x8
 12acea0: f9402268     	ldr	x8, [x19, #0x40]
 12acea4: b40032c8     	cbz	x8, 0x12ad4fc <__start_il2cpp+0x105d38>
 12acea8: f9402660     	ldr	x0, [x19, #0x48]
 12aceac: b4003280     	cbz	x0, 0x12ad4fc <__start_il2cpp+0x105d38>
 12aceb0: f9401514     	ldr	x20, [x8, #0x28]
 12aceb4: aa1f03e1     	mov	x1, xzr
 12aceb8: 4ea01c09     	mov	v9.16b, v0.16b
 12acebc: 94482494     	bl	0x24b610c <__start_il2cpp+0x130e948>
 12acec0: b40031e0     	cbz	x0, 0x12ad4fc <__start_il2cpp+0x105d38>
 12acec4: aa1f03e1     	mov	x1, xzr
 12acec8: 944855eb     	bl	0x24c2674 <__start_il2cpp+0x131aeb0>
 12acecc: f9402268     	ldr	x8, [x19, #0x40]
 12aced0: b4003168     	cbz	x8, 0x12ad4fc <__start_il2cpp+0x105d38>
 12aced4: b4003154     	cbz	x20, 0x12ad4fc <__start_il2cpp+0x105d38>
 12aced8: 52a85609     	mov	w9, #0x42b00000         // =1118830592
 12acedc: b9403101     	ldr	w1, [x8, #0x30]
 12acee0: 1e270123     	fmov	s3, w9
 12acee4: 1e230968     	fmul	s8, s11, s3
 12acee8: 1e301003     	fmov	s3, #-2.00000000
 12aceec: 1e230929     	fmul	s9, s9, s3
 12acef0: 52800022     	mov	w2, #0x1                // =1
 12acef4: 52800063     	mov	w3, #0x3                // =3
 12acef8: aa1403e0     	mov	x0, x20
 12acefc: 4ea81d03     	mov	v3.16b, v8.16b
 12acf00: aa1f03e4     	mov	x4, xzr
 12acf04: 9400ebc1     	bl	0x12e7e08 <__start_il2cpp+0x140644>
 12acf08: aa0003f4     	mov	x20, x0
 12acf0c: 52800400     	mov	w0, #0x20               // =32
 12acf10: aa1f03e1     	mov	x1, xzr
 12acf14: 94490b6c     	bl	0x24efcc4 <__start_il2cpp+0x1348500>
 12acf18: 36000060     	tbz	w0, #0x0, 0x12acf24 <__start_il2cpp+0x105760>
 12acf1c: aa1f03e0     	mov	x0, xzr
 12acf20: 94012efc     	bl	0x12f8b10 <__start_il2cpp+0x15134c>
 12acf24: f0ff9f48     	adrp	x8, 0x697000
 12acf28: bd458d00     	ldr	s0, [x8, #0x58c]
 12acf2c: 1e202920     	fadd	s0, s9, s0
 12acf30: 1e202180     	fcmp	s12, s0
 12acf34: 5400048c     	b.gt	0x12acfc4 <__start_il2cpp+0x105800>
 12acf38: 52a84688     	mov	w8, #0x42340000         // =1110704128
 12acf3c: 1e270101     	fmov	s1, w8
 12acf40: 1e212921     	fadd	s1, s9, s1
 12acf44: 1e212180     	fcmp	s12, s1
 12acf48: 540003e9     	b.ls	0x12acfc4 <__start_il2cpp+0x105800>
 12acf4c: 52a860e8     	mov	w8, #0x43070000         // =1124532224
 12acf50: 52a86c29     	mov	w9, #0x43610000         // =1130430464
 12acf54: 1e270102     	fmov	s2, w8
 12acf58: 1e222923     	fadd	s3, s9, s2
 12acf5c: 1e270122     	fmov	s2, w9
 12acf60: 1e232180     	fcmp	s12, s3
 12acf64: 1e222922     	fadd	s2, s9, s2
 12acf68: 540003ad     	b.le	0x12acfdc <__start_il2cpp+0x105818>
 12acf6c: 1e222180     	fcmp	s12, s2
 12acf70: 54000368     	b.hi	0x12acfdc <__start_il2cpp+0x105818>
 12acf74: d000ad88     	adrp	x8, 0x285e000
 12acf78: f9414108     	ldr	x8, [x8, #0x280]
 12acf7c: f9400100     	ldr	x0, [x8]
 12acf80: b940e008     	ldr	w8, [x0, #0xe0]
 12acf84: 35000048     	cbnz	w8, 0x12acf8c <__start_il2cpp+0x1057c8>
 12acf88: 97f84c16     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12acf8c: aa1f03e0     	mov	x0, xzr
 12acf90: 97ff2c81     	bl	0x1278194 <__start_il2cpp+0xd09d0>
 12acf94: 360000e0     	tbz	w0, #0x0, 0x12acfb0 <__start_il2cpp+0x1057ec>
 12acf98: f9402660     	ldr	x0, [x19, #0x48]
 12acf9c: b4002b00     	cbz	x0, 0x12ad4fc <__start_il2cpp+0x105d38>
 12acfa0: 3943e008     	ldrb	w8, [x0, #0xf8]
 12acfa4: 34000068     	cbz	w8, 0x12acfb0 <__start_il2cpp+0x1057ec>
 12acfa8: aa1f03e1     	mov	x1, xzr
 12acfac: 97ffae28     	bl	0x129884c <__start_il2cpp+0xf1088>
 12acfb0: 52800028     	mov	w8, #0x1                // =1
 12acfb4: b9003a7f     	str	wzr, [x19, #0x38]
 12acfb8: 3901927f     	strb	wzr, [x19, #0x64]
 12acfbc: 3900d268     	strb	w8, [x19, #0x34]
 12acfc0: 14000005     	b	0x12acfd4 <__start_il2cpp+0x105810>
 12acfc4: 52800028     	mov	w8, #0x1                // =1
 12acfc8: b900327f     	str	wzr, [x19, #0x30]
 12acfcc: 3901927f     	strb	wzr, [x19, #0x64]
 12acfd0: 3900b268     	strb	w8, [x19, #0x2c]
 12acfd4: b900727f     	str	wzr, [x19, #0x70]
 12acfd8: 17ffff51     	b	0x12acd1c <__start_il2cpp+0x105558>
 12acfdc: 1e212180     	fcmp	s12, s1
 12acfe0: 54000f0d     	b.le	0x12ad1c0 <__start_il2cpp+0x1059fc>
 12acfe4: 1e232180     	fcmp	s12, s3
 12acfe8: 54000ec8     	b.hi	0x12ad1c0 <__start_il2cpp+0x1059fc>
 12acfec: 9000ad95     	adrp	x21, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12acff0: f94562b5     	ldr	x21, [x21, #0xac0]
 12acff4: f94002a0     	ldr	x0, [x21]
 12acff8: b940e008     	ldr	w8, [x0, #0xe0]
 12acffc: 35000048     	cbnz	w8, 0x12ad004 <__start_il2cpp+0x105840>
 12ad000: 97f84bf8     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12ad004: aa1403e0     	mov	x0, x20
 12ad008: aa1f03e1     	mov	x1, xzr
 12ad00c: aa1f03e2     	mov	x2, xzr
 12ad010: 94482e0e     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12ad014: 36000200     	tbz	w0, #0x0, 0x12ad054 <__start_il2cpp+0x105890>
 12ad018: f9402268     	ldr	x8, [x19, #0x40]
 12ad01c: b4002708     	cbz	x8, 0x12ad4fc <__start_il2cpp+0x105d38>
 12ad020: f94002a0     	ldr	x0, [x21]
 12ad024: f9401d01     	ldr	x1, [x8, #0x38]
 12ad028: b940e009     	ldr	w9, [x0, #0xe0]
 12ad02c: 350000c9     	cbnz	w9, 0x12ad044 <__start_il2cpp+0x105880>
 12ad030: aa0103f5     	mov	x21, x1
 12ad034: 97f84beb     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12ad038: aa1503e1     	mov	x1, x21
 12ad03c: f000ad75     	adrp	x21, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12ad040: f94562b5     	ldr	x21, [x21, #0xac0]
 12ad044: aa1403e0     	mov	x0, x20
 12ad048: aa1f03e2     	mov	x2, xzr
 12ad04c: 94482dff     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12ad050: 37000180     	tbnz	w0, #0x0, 0x12ad080 <__start_il2cpp+0x1058bc>
 12ad054: f94002a0     	ldr	x0, [x21]
 12ad058: b940e008     	ldr	w8, [x0, #0xe0]
 12ad05c: 35000048     	cbnz	w8, 0x12ad064 <__start_il2cpp+0x1058a0>
 12ad060: 97f84be0     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12ad064: aa1403e0     	mov	x0, x20
 12ad068: aa1f03e1     	mov	x1, xzr
 12ad06c: aa1f03e2     	mov	x2, xzr
 12ad070: 9448310a     	bl	0x24b9498 <__start_il2cpp+0x1311cd4>
 12ad074: 1e282140     	fcmp	s10, s8
 12ad078: 540018ad     	b.le	0x12ad38c <__start_il2cpp+0x105bc8>
 12ad07c: 36001880     	tbz	w0, #0x0, 0x12ad38c <__start_il2cpp+0x105bc8>
 12ad080: f94002a0     	ldr	x0, [x21]
 12ad084: b940e008     	ldr	w8, [x0, #0xe0]
 12ad088: 35000048     	cbnz	w8, 0x12ad090 <__start_il2cpp+0x1058cc>
 12ad08c: 97f84bd5     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12ad090: aa1403e0     	mov	x0, x20
 12ad094: aa1f03e1     	mov	x1, xzr
 12ad098: aa1f03e2     	mov	x2, xzr
 12ad09c: 94482deb     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12ad0a0: 37000180     	tbnz	w0, #0x0, 0x12ad0d0 <__start_il2cpp+0x10590c>
 12ad0a4: f94002a0     	ldr	x0, [x21]
 12ad0a8: b940e008     	ldr	w8, [x0, #0xe0]
 12ad0ac: 35000048     	cbnz	w8, 0x12ad0b4 <__start_il2cpp+0x1058f0>
 12ad0b0: 97f84bcc     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12ad0b4: aa1403e0     	mov	x0, x20
 12ad0b8: aa1f03e1     	mov	x1, xzr
 12ad0bc: aa1f03e2     	mov	x2, xzr
 12ad0c0: 944830f6     	bl	0x24b9498 <__start_il2cpp+0x1311cd4>
 12ad0c4: 1e282140     	fcmp	s10, s8
 12ad0c8: 5400216d     	b.le	0x12ad4f4 <__start_il2cpp+0x105d30>
 12ad0cc: 36002140     	tbz	w0, #0x0, 0x12ad4f4 <__start_il2cpp+0x105d30>
 12ad0d0: 52800028     	mov	w8, #0x1                // =1
 12ad0d4: 39008a68     	strb	w8, [x19, #0x22]
 12ad0d8: b900267f     	str	wzr, [x19, #0x24]
 12ad0dc: f94002a0     	ldr	x0, [x21]
 12ad0e0: b940e008     	ldr	w8, [x0, #0xe0]
 12ad0e4: 35000048     	cbnz	w8, 0x12ad0ec <__start_il2cpp+0x105928>
 12ad0e8: 97f84bbe     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12ad0ec: aa1403e0     	mov	x0, x20
 12ad0f0: aa1f03e1     	mov	x1, xzr
 12ad0f4: aa1f03e2     	mov	x2, xzr
 12ad0f8: 944830e8     	bl	0x24b9498 <__start_il2cpp+0x1311cd4>
 12ad0fc: 36001780     	tbz	w0, #0x0, 0x12ad3ec <__start_il2cpp+0x105c28>
 12ad100: f9402668     	ldr	x8, [x19, #0x48]
 12ad104: b4001fc8     	cbz	x8, 0x12ad4fc <__start_il2cpp+0x105d38>
 12ad108: 3943e109     	ldrb	w9, [x8, #0xf8]
 12ad10c: 35001709     	cbnz	w9, 0x12ad3ec <__start_il2cpp+0x105c28>
 12ad110: 39440109     	ldrb	w9, [x8, #0x100]
 12ad114: 350016c9     	cbnz	w9, 0x12ad3ec <__start_il2cpp+0x105c28>
 12ad118: 3945d108     	ldrb	w8, [x8, #0x174]
 12ad11c: 35001688     	cbnz	w8, 0x12ad3ec <__start_il2cpp+0x105c28>
 12ad120: f9402268     	ldr	x8, [x19, #0x40]
 12ad124: b4001ec8     	cbz	x8, 0x12ad4fc <__start_il2cpp+0x105d38>
 12ad128: f000ad75     	adrp	x21, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12ad12c: 394a4508     	ldrb	w8, [x8, #0x291]
 12ad130: f94562b5     	ldr	x21, [x21, #0xac0]
 12ad134: 350015c8     	cbnz	w8, 0x12ad3ec <__start_il2cpp+0x105c28>
 12ad138: b000ad88     	adrp	x8, 0x285e000
 12ad13c: f9414108     	ldr	x8, [x8, #0x280]
 12ad140: f9400100     	ldr	x0, [x8]
 12ad144: b940e008     	ldr	w8, [x0, #0xe0]
 12ad148: 35000048     	cbnz	w8, 0x12ad150 <__start_il2cpp+0x10598c>
 12ad14c: 97f84ba5     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12ad150: aa1f03e0     	mov	x0, xzr
 12ad154: 97ff2bde     	bl	0x12780cc <__start_il2cpp+0xd0908>
 12ad158: f000ad75     	adrp	x21, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12ad15c: f94562b5     	ldr	x21, [x21, #0xac0]
 12ad160: 36001460     	tbz	w0, #0x0, 0x12ad3ec <__start_il2cpp+0x105c28>
 12ad164: f9402660     	ldr	x0, [x19, #0x48]
 12ad168: b4001ca0     	cbz	x0, 0x12ad4fc <__start_il2cpp+0x105d38>
 12ad16c: bd413400     	ldr	s0, [x0, #0x134]
 12ad170: 1e33d001     	fmov	s1, #-7.50000000
 12ad174: 1e212000     	fcmp	s0, s1
 12ad178: 54001289     	b.ls	0x12ad3c8 <__start_il2cpp+0x105c04>
 12ad17c: 1e23d001     	fmov	s1, #7.50000000
 12ad180: 1e212000     	fcmp	s0, s1
 12ad184: 5400122a     	b.ge	0x12ad3c8 <__start_il2cpp+0x105c04>
 12ad188: 1e2a1000     	fmov	s0, #0.25000000
 12ad18c: aa1f03e1     	mov	x1, xzr
 12ad190: 97ffaa12     	bl	0x12979d8 <__start_il2cpp+0xf0214>
 12ad194: f9402a68     	ldr	x8, [x19, #0x50]
 12ad198: b4001b28     	cbz	x8, 0x12ad4fc <__start_il2cpp+0x105d38>
 12ad19c: f0ff9f49     	adrp	x9, 0x698000
 12ad1a0: 3dc00520     	ldr	q0, [x9, #0x10]
 12ad1a4: 52800029     	mov	w9, #0x1                // =1
 12ad1a8: 3903e509     	strb	w9, [x8, #0xf9]
 12ad1ac: 3c8fc100     	stur	q0, [x8, #0xfc]
 12ad1b0: f9402668     	ldr	x8, [x19, #0x48]
 12ad1b4: b4001a48     	cbz	x8, 0x12ad4fc <__start_il2cpp+0x105d38>
 12ad1b8: 52b82309     	mov	w9, #-0x3ee80000        // =-1055391744
 12ad1bc: 14000089     	b	0x12ad3e0 <__start_il2cpp+0x105c1c>
 12ad1c0: 1e222180     	fcmp	s12, s2
 12ad1c4: 54ffdacd     	b.le	0x12acd1c <__start_il2cpp+0x105558>
 12ad1c8: 1e202180     	fcmp	s12, s0
 12ad1cc: 54ffda88     	b.hi	0x12acd1c <__start_il2cpp+0x105558>
 12ad1d0: f000ad76     	adrp	x22, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12ad1d4: f94562d6     	ldr	x22, [x22, #0xac0]
 12ad1d8: f94002c0     	ldr	x0, [x22]
 12ad1dc: b940e008     	ldr	w8, [x0, #0xe0]
 12ad1e0: 35000048     	cbnz	w8, 0x12ad1e8 <__start_il2cpp+0x105a24>
 12ad1e4: 97f84b7f     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12ad1e8: aa1403e0     	mov	x0, x20
 12ad1ec: aa1f03e1     	mov	x1, xzr
 12ad1f0: aa1f03e2     	mov	x2, xzr
 12ad1f4: 94482d95     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12ad1f8: 360001c0     	tbz	w0, #0x0, 0x12ad230 <__start_il2cpp+0x105a6c>
 12ad1fc: f9402268     	ldr	x8, [x19, #0x40]
 12ad200: b40017e8     	cbz	x8, 0x12ad4fc <__start_il2cpp+0x105d38>
 12ad204: f94002c0     	ldr	x0, [x22]
 12ad208: f9401d01     	ldr	x1, [x8, #0x38]
 12ad20c: b940e009     	ldr	w9, [x0, #0xe0]
 12ad210: 35000089     	cbnz	w9, 0x12ad220 <__start_il2cpp+0x105a5c>
 12ad214: aa0103f5     	mov	x21, x1
 12ad218: 97f84b72     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12ad21c: aa1503e1     	mov	x1, x21
 12ad220: aa1403e0     	mov	x0, x20
 12ad224: aa1f03e2     	mov	x2, xzr
 12ad228: 94482d88     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12ad22c: 37000180     	tbnz	w0, #0x0, 0x12ad25c <__start_il2cpp+0x105a98>
 12ad230: f94002c0     	ldr	x0, [x22]
 12ad234: b940e008     	ldr	w8, [x0, #0xe0]
 12ad238: 35000048     	cbnz	w8, 0x12ad240 <__start_il2cpp+0x105a7c>
 12ad23c: 97f84b69     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12ad240: aa1403e0     	mov	x0, x20
 12ad244: aa1f03e1     	mov	x1, xzr
 12ad248: aa1f03e2     	mov	x2, xzr
 12ad24c: 94483093     	bl	0x24b9498 <__start_il2cpp+0x1311cd4>
 12ad250: 1e282140     	fcmp	s10, s8
 12ad254: 54000a2d     	b.le	0x12ad398 <__start_il2cpp+0x105bd4>
 12ad258: 36000a00     	tbz	w0, #0x0, 0x12ad398 <__start_il2cpp+0x105bd4>
 12ad25c: f94002c0     	ldr	x0, [x22]
 12ad260: b940e008     	ldr	w8, [x0, #0xe0]
 12ad264: 35000048     	cbnz	w8, 0x12ad26c <__start_il2cpp+0x105aa8>
 12ad268: 97f84b5e     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12ad26c: aa1403e0     	mov	x0, x20
 12ad270: aa1f03e1     	mov	x1, xzr
 12ad274: aa1f03e2     	mov	x2, xzr
 12ad278: 94482d74     	bl	0x24b8848 <__start_il2cpp+0x1311084>
 12ad27c: 37000180     	tbnz	w0, #0x0, 0x12ad2ac <__start_il2cpp+0x105ae8>
 12ad280: f94002c0     	ldr	x0, [x22]
 12ad284: b940e008     	ldr	w8, [x0, #0xe0]
 12ad288: 35000048     	cbnz	w8, 0x12ad290 <__start_il2cpp+0x105acc>
 12ad28c: 97f84b55     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12ad290: aa1403e0     	mov	x0, x20
 12ad294: aa1f03e1     	mov	x1, xzr
 12ad298: aa1f03e2     	mov	x2, xzr
 12ad29c: 9448307f     	bl	0x24b9498 <__start_il2cpp+0x1311cd4>
 12ad2a0: 1e282140     	fcmp	s10, s8
 12ad2a4: 54ffd3cd     	b.le	0x12acd1c <__start_il2cpp+0x105558>
 12ad2a8: 3607d3a0     	tbz	w0, #0x0, 0x12acd1c <__start_il2cpp+0x105558>
 12ad2ac: 52800028     	mov	w8, #0x1                // =1
 12ad2b0: 39008668     	strb	w8, [x19, #0x21]
 12ad2b4: b900267f     	str	wzr, [x19, #0x24]
 12ad2b8: f94002c0     	ldr	x0, [x22]
 12ad2bc: b940e008     	ldr	w8, [x0, #0xe0]
 12ad2c0: 35000048     	cbnz	w8, 0x12ad2c8 <__start_il2cpp+0x105b04>
 12ad2c4: 97f84b47     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12ad2c8: aa1403e0     	mov	x0, x20
 12ad2cc: aa1f03e1     	mov	x1, xzr
 12ad2d0: aa1f03e2     	mov	x2, xzr
 12ad2d4: 94483071     	bl	0x24b9498 <__start_il2cpp+0x1311cd4>
 12ad2d8: 36000d40     	tbz	w0, #0x0, 0x12ad480 <__start_il2cpp+0x105cbc>
 12ad2dc: f9402668     	ldr	x8, [x19, #0x48]
 12ad2e0: b40010e8     	cbz	x8, 0x12ad4fc <__start_il2cpp+0x105d38>
 12ad2e4: 3943e109     	ldrb	w9, [x8, #0xf8]
 12ad2e8: 35000cc9     	cbnz	w9, 0x12ad480 <__start_il2cpp+0x105cbc>
 12ad2ec: 39440109     	ldrb	w9, [x8, #0x100]
 12ad2f0: 35000c89     	cbnz	w9, 0x12ad480 <__start_il2cpp+0x105cbc>
 12ad2f4: 3945d108     	ldrb	w8, [x8, #0x174]
 12ad2f8: 35000c48     	cbnz	w8, 0x12ad480 <__start_il2cpp+0x105cbc>
 12ad2fc: f9402268     	ldr	x8, [x19, #0x40]
 12ad300: b4000fe8     	cbz	x8, 0x12ad4fc <__start_il2cpp+0x105d38>
 12ad304: 394a4508     	ldrb	w8, [x8, #0x291]
 12ad308: 35000bc8     	cbnz	w8, 0x12ad480 <__start_il2cpp+0x105cbc>
 12ad30c: b000ad88     	adrp	x8, 0x285e000
 12ad310: f9414108     	ldr	x8, [x8, #0x280]
 12ad314: f9400100     	ldr	x0, [x8]
 12ad318: b940e008     	ldr	w8, [x0, #0xe0]
 12ad31c: 35000048     	cbnz	w8, 0x12ad324 <__start_il2cpp+0x105b60>
 12ad320: 97f84b30     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12ad324: aa1f03e0     	mov	x0, xzr
 12ad328: 97ff2b69     	bl	0x12780cc <__start_il2cpp+0xd0908>
 12ad32c: 36000aa0     	tbz	w0, #0x0, 0x12ad480 <__start_il2cpp+0x105cbc>
 12ad330: f9402660     	ldr	x0, [x19, #0x48]
 12ad334: b4000e40     	cbz	x0, 0x12ad4fc <__start_il2cpp+0x105d38>
 12ad338: bd413400     	ldr	s0, [x0, #0x134]
 12ad33c: 1e33d001     	fmov	s1, #-7.50000000
 12ad340: 1e212000     	fcmp	s0, s1
 12ad344: 54000909     	b.ls	0x12ad464 <__start_il2cpp+0x105ca0>
 12ad348: 1e23d001     	fmov	s1, #7.50000000
 12ad34c: 1e212000     	fcmp	s0, s1
 12ad350: 540008aa     	b.ge	0x12ad464 <__start_il2cpp+0x105ca0>
 12ad354: 1e2a1000     	fmov	s0, #0.25000000
 12ad358: aa1f03e1     	mov	x1, xzr
 12ad35c: 97ffa99f     	bl	0x12979d8 <__start_il2cpp+0xf0214>
 12ad360: f9402a68     	ldr	x8, [x19, #0x50]
 12ad364: b4000cc8     	cbz	x8, 0x12ad4fc <__start_il2cpp+0x105d38>
 12ad368: f0ff9f49     	adrp	x9, 0x698000
 12ad36c: 3dc00520     	ldr	q0, [x9, #0x10]
 12ad370: 52800029     	mov	w9, #0x1                // =1
 12ad374: 3903e509     	strb	w9, [x8, #0xf9]
 12ad378: 3c8fc100     	stur	q0, [x8, #0xfc]
 12ad37c: f9402668     	ldr	x8, [x19, #0x48]
 12ad380: b4000be8     	cbz	x8, 0x12ad4fc <__start_il2cpp+0x105d38>
 12ad384: 52a82309     	mov	w9, #0x41180000         // =1092091904
 12ad388: 1400003d     	b	0x12ad47c <__start_il2cpp+0x105cb8>
 12ad38c: f000ada8     	adrp	x8, 0x2864000
 12ad390: f943bd08     	ldr	x8, [x8, #0x778]
 12ad394: 14000003     	b	0x12ad3a0 <__start_il2cpp+0x105bdc>
 12ad398: f000ada8     	adrp	x8, 0x2864000
 12ad39c: f943c108     	ldr	x8, [x8, #0x780]
 12ad3a0: f9400100     	ldr	x0, [x8]
 12ad3a4: a9454ff4     	ldp	x20, x19, [sp, #0x50]
 12ad3a8: a94457f6     	ldp	x22, x21, [sp, #0x40]
 12ad3ac: f9401ffe     	ldr	x30, [sp, #0x38]
 12ad3b0: 6d42a3e9     	ldp	d9, d8, [sp, #0x28]
 12ad3b4: 6d41abeb     	ldp	d11, d10, [sp, #0x18]
 12ad3b8: 6d40b3ed     	ldp	d13, d12, [sp, #0x8]
 12ad3bc: aa1f03e1     	mov	x1, xzr
 12ad3c0: fc4607ee     	ldr	d14, [sp], #0x60
 12ad3c4: 14012882     	b	0x12f75cc <__start_il2cpp+0x14fe08>
 12ad3c8: 1e2e1000     	fmov	s0, #1.00000000
 12ad3cc: aa1f03e1     	mov	x1, xzr
 12ad3d0: 97ffa982     	bl	0x12979d8 <__start_il2cpp+0xf0214>
 12ad3d4: f9402668     	ldr	x8, [x19, #0x48]
 12ad3d8: b4000928     	cbz	x8, 0x12ad4fc <__start_il2cpp+0x105d38>
 12ad3dc: 52b82e09     	mov	w9, #-0x3e900000        // =-1049624576
 12ad3e0: b9019109     	str	w9, [x8, #0x190]
 12ad3e4: f000ad75     	adrp	x21, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12ad3e8: f94562b5     	ldr	x21, [x21, #0xac0]
 12ad3ec: f94002a0     	ldr	x0, [x21]
 12ad3f0: b940e008     	ldr	w8, [x0, #0xe0]
 12ad3f4: 35000048     	cbnz	w8, 0x12ad3fc <__start_il2cpp+0x105c38>
 12ad3f8: 97f84afa     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12ad3fc: aa1403e0     	mov	x0, x20
 12ad400: aa1f03e1     	mov	x1, xzr
 12ad404: aa1f03e2     	mov	x2, xzr
 12ad408: 94483024     	bl	0x24b9498 <__start_il2cpp+0x1311cd4>
 12ad40c: 36000740     	tbz	w0, #0x0, 0x12ad4f4 <__start_il2cpp+0x105d30>
 12ad410: b000ad94     	adrp	x20, 0x285e000
 12ad414: f9414294     	ldr	x20, [x20, #0x280]
 12ad418: f9400280     	ldr	x0, [x20]
 12ad41c: b940e008     	ldr	w8, [x0, #0xe0]
 12ad420: 35000048     	cbnz	w8, 0x12ad428 <__start_il2cpp+0x105c64>
 12ad424: 97f84aef     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12ad428: aa1f03e0     	mov	x0, xzr
 12ad42c: 97ff2b28     	bl	0x12780cc <__start_il2cpp+0xd0908>
 12ad430: 37000620     	tbnz	w0, #0x0, 0x12ad4f4 <__start_il2cpp+0x105d30>
 12ad434: f9400280     	ldr	x0, [x20]
 12ad438: b940e008     	ldr	w8, [x0, #0xe0]
 12ad43c: 35000048     	cbnz	w8, 0x12ad444 <__start_il2cpp+0x105c80>
 12ad440: 97f84ae8     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12ad444: aa1f03e0     	mov	x0, xzr
 12ad448: 97ff2b3a     	bl	0x1278130 <__start_il2cpp+0xd096c>
 12ad44c: 36000540     	tbz	w0, #0x0, 0x12ad4f4 <__start_il2cpp+0x105d30>
 12ad450: f9402660     	ldr	x0, [x19, #0x48]
 12ad454: b4000540     	cbz	x0, 0x12ad4fc <__start_il2cpp+0x105d38>
 12ad458: aa1f03e1     	mov	x1, xzr
 12ad45c: 97ffad2b     	bl	0x1298908 <__start_il2cpp+0xf1144>
 12ad460: 14000025     	b	0x12ad4f4 <__start_il2cpp+0x105d30>
 12ad464: 1e2e1000     	fmov	s0, #1.00000000
 12ad468: aa1f03e1     	mov	x1, xzr
 12ad46c: 97ffa95b     	bl	0x12979d8 <__start_il2cpp+0xf0214>
 12ad470: f9402668     	ldr	x8, [x19, #0x48]
 12ad474: b4000448     	cbz	x8, 0x12ad4fc <__start_il2cpp+0x105d38>
 12ad478: 52a82e09     	mov	w9, #0x41700000         // =1097859072
 12ad47c: b9019109     	str	w9, [x8, #0x190]
 12ad480: f94002c0     	ldr	x0, [x22]
 12ad484: b940e008     	ldr	w8, [x0, #0xe0]
 12ad488: 35000048     	cbnz	w8, 0x12ad490 <__start_il2cpp+0x105ccc>
 12ad48c: 97f84ad5     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12ad490: aa1403e0     	mov	x0, x20
 12ad494: aa1f03e1     	mov	x1, xzr
 12ad498: aa1f03e2     	mov	x2, xzr
 12ad49c: 94482fff     	bl	0x24b9498 <__start_il2cpp+0x1311cd4>
 12ad4a0: 360002a0     	tbz	w0, #0x0, 0x12ad4f4 <__start_il2cpp+0x105d30>
 12ad4a4: b000ad94     	adrp	x20, 0x285e000
 12ad4a8: f9414294     	ldr	x20, [x20, #0x280]
 12ad4ac: f9400280     	ldr	x0, [x20]
 12ad4b0: b940e008     	ldr	w8, [x0, #0xe0]
 12ad4b4: 35000048     	cbnz	w8, 0x12ad4bc <__start_il2cpp+0x105cf8>
 12ad4b8: 97f84aca     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12ad4bc: aa1f03e0     	mov	x0, xzr
 12ad4c0: 97ff2b03     	bl	0x12780cc <__start_il2cpp+0xd0908>
 12ad4c4: 37000180     	tbnz	w0, #0x0, 0x12ad4f4 <__start_il2cpp+0x105d30>
 12ad4c8: f9400280     	ldr	x0, [x20]
 12ad4cc: b940e008     	ldr	w8, [x0, #0xe0]
 12ad4d0: 35000048     	cbnz	w8, 0x12ad4d8 <__start_il2cpp+0x105d14>
 12ad4d4: 97f84ac3     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12ad4d8: aa1f03e0     	mov	x0, xzr
 12ad4dc: 97ff2b15     	bl	0x1278130 <__start_il2cpp+0xd096c>
 12ad4e0: 360000a0     	tbz	w0, #0x0, 0x12ad4f4 <__start_il2cpp+0x105d30>
 12ad4e4: f9402660     	ldr	x0, [x19, #0x48]
 12ad4e8: b40000a0     	cbz	x0, 0x12ad4fc <__start_il2cpp+0x105d38>
 12ad4ec: aa1f03e1     	mov	x1, xzr
 12ad4f0: 97fface1     	bl	0x1298874 <__start_il2cpp+0xf10b0>
 12ad4f4: 3901927f     	strb	wzr, [x19, #0x64]
 12ad4f8: 17fffeb7     	b	0x12acfd4 <__start_il2cpp+0x105810>
 12ad4fc: 97f84b01     	bl	0x10c0100 <CloseNLSocket+0x638>
