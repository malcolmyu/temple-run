
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12e491c: f94007e8     	ldr	x8, [sp, #0x8]
 12e4920: b9402fe9     	ldr	w9, [sp, #0x2c]
 12e4924: b94017f5     	ldr	w21, [sp, #0x14]
 12e4928: 2a1a03f8     	mov	w24, w26
 12e492c: b9400108     	ldr	w8, [x8]
 12e4930: 71000d3f     	cmp	w9, #0x3
 12e4934: 54000181     	b.ne	0x12e4964 <__start_il2cpp+0x13d1a0>
 12e4938: 7100051f     	cmp	w8, #0x1
 12e493c: 2a1a03f8     	mov	w24, w26
 12e4940: 54000121     	b.ne	0x12e4964 <__start_il2cpp+0x13d1a0>
 12e4944: 71003adf     	cmp	w22, #0xe
 12e4948: 2a1603f8     	mov	w24, w22
 12e494c: 540000c0     	b.eq	0x12e4964 <__start_il2cpp+0x13d1a0>
 12e4950: 71002edf     	cmp	w22, #0xb
 12e4954: 54000061     	b.ne	0x12e4960 <__start_il2cpp+0x13d19c>
 12e4958: 52800178     	mov	w24, #0xb               // =11
 12e495c: 14000002     	b	0x12e4964 <__start_il2cpp+0x13d1a0>
 12e4960: 2a1a03f8     	mov	w24, w26
 12e4964: 7100051f     	cmp	w8, #0x1
 12e4968: 54000501     	b.ne	0x12e4a08 <__start_il2cpp+0x13d244>
 12e496c: 71003adf     	cmp	w22, #0xe
 12e4970: 54000060     	b.eq	0x12e497c <__start_il2cpp+0x13d1b8>
 12e4974: 71002edf     	cmp	w22, #0xb
 12e4978: 54000481     	b.ne	0x12e4a08 <__start_il2cpp+0x13d244>
 12e497c: 71002f1f     	cmp	w24, #0xb
 12e4980: 54000180     	b.eq	0x12e49b0 <__start_il2cpp+0x13d1ec>
 12e4984: 71003b1f     	cmp	w24, #0xe
 12e4988: 54000401     	b.ne	0x12e4a08 <__start_il2cpp+0x13d244>
 12e498c: 71000a9f     	cmp	w20, #0x2
 12e4990: 54000221     	b.ne	0x12e49d4 <__start_il2cpp+0x13d210>
 12e4994: b9402fe8     	ldr	w8, [sp, #0x2c]
 12e4998: 528001e9     	mov	w9, #0xf                // =15
 12e499c: aa1303e0     	mov	x0, x19
 12e49a0: 29062269     	stp	w9, w8, [x19, #0x30]
 12e49a4: 97fff49d     	bl	0x12e1c18 <__start_il2cpp+0x13a454>
 12e49a8: 52800218     	mov	w24, #0x10              // =16
 12e49ac: 14000017     	b	0x12e4a08 <__start_il2cpp+0x13d244>
 12e49b0: 7100069f     	cmp	w20, #0x1
 12e49b4: 540001e1     	b.ne	0x12e49f0 <__start_il2cpp+0x13d22c>
 12e49b8: b9402fe8     	ldr	w8, [sp, #0x2c]
 12e49bc: 52800189     	mov	w9, #0xc                // =12
 12e49c0: aa1303e0     	mov	x0, x19
 12e49c4: 29062269     	stp	w9, w8, [x19, #0x30]
 12e49c8: 97fff494     	bl	0x12e1c18 <__start_il2cpp+0x13a454>
 12e49cc: 528001b8     	mov	w24, #0xd               // =13
 12e49d0: 1400000e     	b	0x12e4a08 <__start_il2cpp+0x13d244>
 12e49d4: b9402fe8     	ldr	w8, [sp, #0x2c]
 12e49d8: 52800209     	mov	w9, #0x10               // =16
 12e49dc: aa1303e0     	mov	x0, x19
 12e49e0: 29062269     	stp	w9, w8, [x19, #0x30]
 12e49e4: 97fff48d     	bl	0x12e1c18 <__start_il2cpp+0x13a454>
 12e49e8: 528001f8     	mov	w24, #0xf               // =15
 12e49ec: 14000007     	b	0x12e4a08 <__start_il2cpp+0x13d244>
 12e49f0: b9402fe8     	ldr	w8, [sp, #0x2c]
 12e49f4: 528001a9     	mov	w9, #0xd                // =13
 12e49f8: aa1303e0     	mov	x0, x19
 12e49fc: 29062269     	stp	w9, w8, [x19, #0x30]
 12e4a00: 97fff486     	bl	0x12e1c18 <__start_il2cpp+0x13a454>
 12e4a04: 52800198     	mov	w24, #0xc               // =12
 12e4a08: b94013e8     	ldr	w8, [sp, #0x10]
 12e4a0c: 34000328     	cbz	w8, 0x12e4a70 <__start_il2cpp+0x13d2ac>
 12e4a10: 71000ebf     	cmp	w21, #0x3
 12e4a14: 54000081     	b.ne	0x12e4a24 <__start_il2cpp+0x13d260>
 12e4a18: b9402fe8     	ldr	w8, [sp, #0x2c]
 12e4a1c: 7100091f     	cmp	w8, #0x2
 12e4a20: 540001c0     	b.eq	0x12e4a58 <__start_il2cpp+0x13d294>
 12e4a24: b9402fe9     	ldr	w9, [sp, #0x2c]
 12e4a28: 7100093f     	cmp	w9, #0x2
 12e4a2c: 1a9f17e8     	cset	w8, eq
 12e4a30: 71000d3f     	cmp	w9, #0x3
 12e4a34: 1a9f17e9     	cset	w9, eq
 12e4a38: 71000abf     	cmp	w21, #0x2
 12e4a3c: 1a9f17ea     	cset	w10, eq
 12e4a40: 710006bf     	cmp	w21, #0x1
 12e4a44: 0a09014a     	and	w10, w10, w9
 12e4a48: 1a9f17e9     	cset	w9, eq
 12e4a4c: 3700006a     	tbnz	w10, #0x0, 0x12e4a58 <__start_il2cpp+0x13d294>
 12e4a50: 0a080128     	and	w8, w9, w8
 12e4a54: 340000e8     	cbz	w8, 0x12e4a70 <__start_il2cpp+0x13d2ac>
 12e4a58: 51000688     	sub	w8, w20, #0x1
 12e4a5c: 7100111f     	cmp	w8, #0x4
 12e4a60: 54000082     	b.hs	0x12e4a70 <__start_il2cpp+0x13d2ac>
 12e4a64: 90ff9da9     	adrp	x9, 0x698000
 12e4a68: 91008129     	add	x9, x9, #0x20
 12e4a6c: b868d938     	ldr	w24, [x9, w8, sxtw #2]
 12e4a70: f9400380     	ldr	x0, [x28]
 12e4a74: b940e008     	ldr	w8, [x0, #0xe0]
 12e4a78: 35000048     	cbnz	w8, 0x12e4a80 <__start_il2cpp+0x13d2bc>
 12e4a7c: 97f76d59     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4a80: b9402fe1     	ldr	w1, [sp, #0x2c]
 12e4a84: 2a1803e0     	mov	w0, w24
 12e4a88: 97fff3b4     	bl	0x12e1958 <__start_il2cpp+0x13a194>
 12e4a8c: b4000b20     	cbz	x0, 0x12e4bf0 <__start_il2cpp+0x13d42c>
 12e4a90: d000abe8     	adrp	x8, 0x2862000
 12e4a94: f9424108     	ldr	x8, [x8, #0x480]
 12e4a98: f9400101     	ldr	x1, [x8]
 12e4a9c: 9403d0b1     	bl	0x13d8d60 <__start_il2cpp+0x23159c>
 12e4aa0: b4000a80     	cbz	x0, 0x12e4bf0 <__start_il2cpp+0x13d42c>
 12e4aa4: 51000768     	sub	w8, w27, #0x1
 12e4aa8: aa0003f5     	mov	x21, x0
 12e4aac: 7100051f     	cmp	w8, #0x1
 12e4ab0: 2913601a     	stp	w26, w24, [x0, #0x98]
 12e4ab4: 54000068     	b.hi	0x12e4ac0 <__start_il2cpp+0x13d2fc>
 12e4ab8: b9003abb     	str	w27, [x21, #0x38]
 12e4abc: 14000004     	b	0x12e4acc <__start_il2cpp+0x13d308>
 12e4ac0: aa1503e0     	mov	x0, x21
 12e4ac4: 2a1b03e1     	mov	w1, w27
 12e4ac8: 97fff79b     	bl	0x12e2934 <__start_il2cpp+0x13b170>
 12e4acc: b94023e8     	ldr	w8, [sp, #0x20]
 12e4ad0: 37000108     	tbnz	w8, #0x0, 0x12e4af0 <__start_il2cpp+0x13d32c>
 12e4ad4: aa1503e0     	mov	x0, x21
 12e4ad8: 2a1403e1     	mov	w1, w20
 12e4adc: aa1303e2     	mov	x2, x19
 12e4ae0: 94000045     	bl	0x12e4bf4 <__start_il2cpp+0x13d430>
 12e4ae4: aa1503e0     	mov	x0, x21
 12e4ae8: aa1303e2     	mov	x2, x19
 12e4aec: 9400050a     	bl	0x12e5f14 <__start_il2cpp+0x13e750>
 12e4af0: f9400380     	ldr	x0, [x28]
 12e4af4: b940e008     	ldr	w8, [x0, #0xe0]
 12e4af8: 35000048     	cbnz	w8, 0x12e4b00 <__start_il2cpp+0x13d33c>
 12e4afc: 97f76d39     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e4b00: 51000688     	sub	w8, w20, #0x1
 12e4b04: 71000d1f     	cmp	w8, #0x3
 12e4b08: 540000a8     	b.hi	0x12e4b1c <__start_il2cpp+0x13d358>
 12e4b0c: 90ff9da9     	adrp	x9, 0x698000
 12e4b10: 9104c129     	add	x9, x9, #0x130
 12e4b14: b868d922     	ldr	w2, [x9, w8, sxtw #2]
 12e4b18: 14000002     	b	0x12e4b20 <__start_il2cpp+0x13d35c>
 12e4b1c: 2a1f03e2     	mov	w2, wzr
 12e4b20: aa1303e0     	mov	x0, x19
 12e4b24: aa1503e1     	mov	x1, x21
 12e4b28: 94000608     	bl	0x12e6348 <__start_il2cpp+0x13eb84>
 12e4b2c: aa1503e0     	mov	x0, x21
 12e4b30: aa1303e1     	mov	x1, x19
 12e4b34: 940006c6     	bl	0x12e664c <__start_il2cpp+0x13ee88>
 12e4b38: aa1503e0     	mov	x0, x21
 12e4b3c: 94000738     	bl	0x12e681c <__start_il2cpp+0x13f058>
