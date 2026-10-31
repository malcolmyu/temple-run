
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 1296ee4: fc1d0fe8     	str	d8, [sp, #-0x30]!
 1296ee8: a90157fe     	stp	x30, x21, [sp, #0x10]
 1296eec: a9024ff4     	stp	x20, x19, [sp, #0x20]
 1296ef0: 39478008     	ldrb	w8, [x0, #0x1e0]
 1296ef4: f9405814     	ldr	x20, [x0, #0xb0]
 1296ef8: aa0003f3     	mov	x19, x0
 1296efc: 4ea01c08     	mov	v8.16b, v0.16b
 1296f00: 34000628     	cbz	w8, 0x1296fc4 <__start_il2cpp+0xef800>
 1296f04: b4000c74     	cbz	x20, 0x1297090 <__start_il2cpp+0xef8cc>
 1296f08: b9401a88     	ldr	w8, [x20, #0x18]
 1296f0c: 7100051f     	cmp	w8, #0x1
 1296f10: 5400028b     	b.lt	0x1296f60 <__start_il2cpp+0xef79c>
 1296f14: 2a1f03f5     	mov	w21, wzr
 1296f18: 6b0802bf     	cmp	w21, w8
 1296f1c: 54000bc2     	b.hs	0x1297094 <__start_il2cpp+0xef8d0>
 1296f20: 8b35ce88     	add	x8, x20, w21, sxtw #3
 1296f24: f9401100     	ldr	x0, [x8, #0x20]
 1296f28: b4000b40     	cbz	x0, 0x1297090 <__start_il2cpp+0xef8cc>
 1296f2c: aa1f03e1     	mov	x1, xzr
 1296f30: 94481f55     	bl	0x249ec84 <__start_il2cpp+0x12f74c0>
 1296f34: b4000ae0     	cbz	x0, 0x1297090 <__start_il2cpp+0xef8cc>
 1296f38: bd41da62     	ldr	s2, [x19, #0x1d8]
 1296f3c: bd41d661     	ldr	s1, [x19, #0x1d4]
 1296f40: bd41d260     	ldr	s0, [x19, #0x1d0]
 1296f44: 4ea81d03     	mov	v3.16b, v8.16b
 1296f48: aa1f03e1     	mov	x1, xzr
 1296f4c: 9448215e     	bl	0x249f4c4 <__start_il2cpp+0x12f7d00>
 1296f50: b9401a88     	ldr	w8, [x20, #0x18]
 1296f54: 110006b5     	add	w21, w21, #0x1
 1296f58: 6b0802bf     	cmp	w21, w8
 1296f5c: 54fffdeb     	b.lt	0x1296f18 <__start_il2cpp+0xef754>
 1296f60: f9405e74     	ldr	x20, [x19, #0xb8]
 1296f64: b4000974     	cbz	x20, 0x1297090 <__start_il2cpp+0xef8cc>
 1296f68: b9401a88     	ldr	w8, [x20, #0x18]
 1296f6c: 7100051f     	cmp	w8, #0x1
 1296f70: 5400088b     	b.lt	0x1297080 <__start_il2cpp+0xef8bc>
 1296f74: 2a1f03f5     	mov	w21, wzr
 1296f78: 6b0802bf     	cmp	w21, w8
 1296f7c: 540008c2     	b.hs	0x1297094 <__start_il2cpp+0xef8d0>
 1296f80: 8b35ce88     	add	x8, x20, w21, sxtw #3
 1296f84: f9401100     	ldr	x0, [x8, #0x20]
 1296f88: b4000840     	cbz	x0, 0x1297090 <__start_il2cpp+0xef8cc>
 1296f8c: aa1f03e1     	mov	x1, xzr
 1296f90: 94481f3d     	bl	0x249ec84 <__start_il2cpp+0x12f74c0>
 1296f94: b40007e0     	cbz	x0, 0x1297090 <__start_il2cpp+0xef8cc>
 1296f98: bd41da62     	ldr	s2, [x19, #0x1d8]
 1296f9c: bd41d661     	ldr	s1, [x19, #0x1d4]
 1296fa0: bd41d260     	ldr	s0, [x19, #0x1d0]
 1296fa4: 4ea81d03     	mov	v3.16b, v8.16b
 1296fa8: aa1f03e1     	mov	x1, xzr
 1296fac: 94482146     	bl	0x249f4c4 <__start_il2cpp+0x12f7d00>
 1296fb0: b9401a88     	ldr	w8, [x20, #0x18]
 1296fb4: 110006b5     	add	w21, w21, #0x1
 1296fb8: 6b0802bf     	cmp	w21, w8
 1296fbc: 54fffdeb     	b.lt	0x1296f78 <__start_il2cpp+0xef7b4>
 1296fc0: 14000030     	b	0x1297080 <__start_il2cpp+0xef8bc>
 1296fc4: b4000674     	cbz	x20, 0x1297090 <__start_il2cpp+0xef8cc>
 1296fc8: b9401a88     	ldr	w8, [x20, #0x18]
 1296fcc: 7100051f     	cmp	w8, #0x1
 1296fd0: 5400028b     	b.lt	0x1297020 <__start_il2cpp+0xef85c>
 1296fd4: 2a1f03f5     	mov	w21, wzr
 1296fd8: 6b0802bf     	cmp	w21, w8
 1296fdc: 540005c2     	b.hs	0x1297094 <__start_il2cpp+0xef8d0>
 1296fe0: 8b35ce88     	add	x8, x20, w21, sxtw #3
 1296fe4: f9401100     	ldr	x0, [x8, #0x20]
 1296fe8: b4000540     	cbz	x0, 0x1297090 <__start_il2cpp+0xef8cc>
 1296fec: aa1f03e1     	mov	x1, xzr
 1296ff0: 94481f25     	bl	0x249ec84 <__start_il2cpp+0x12f74c0>
 1296ff4: b40004e0     	cbz	x0, 0x1297090 <__start_il2cpp+0xef8cc>
 1296ff8: 1e2e1000     	fmov	s0, #1.00000000
 1296ffc: 1e2e1001     	fmov	s1, #1.00000000
 1297000: 1e2e1002     	fmov	s2, #1.00000000
 1297004: 4ea81d03     	mov	v3.16b, v8.16b
 1297008: aa1f03e1     	mov	x1, xzr
 129700c: 9448212e     	bl	0x249f4c4 <__start_il2cpp+0x12f7d00>
 1297010: b9401a88     	ldr	w8, [x20, #0x18]
 1297014: 110006b5     	add	w21, w21, #0x1
 1297018: 6b0802bf     	cmp	w21, w8
 129701c: 54fffdeb     	b.lt	0x1296fd8 <__start_il2cpp+0xef814>
 1297020: f9405e73     	ldr	x19, [x19, #0xb8]
 1297024: b4000373     	cbz	x19, 0x1297090 <__start_il2cpp+0xef8cc>
 1297028: b9401a68     	ldr	w8, [x19, #0x18]
 129702c: 7100051f     	cmp	w8, #0x1
 1297030: 5400028b     	b.lt	0x1297080 <__start_il2cpp+0xef8bc>
 1297034: 2a1f03f4     	mov	w20, wzr
 1297038: 6b08029f     	cmp	w20, w8
 129703c: 540002c2     	b.hs	0x1297094 <__start_il2cpp+0xef8d0>
 1297040: 8b34ce68     	add	x8, x19, w20, sxtw #3
 1297044: f9401100     	ldr	x0, [x8, #0x20]
 1297048: b4000240     	cbz	x0, 0x1297090 <__start_il2cpp+0xef8cc>
 129704c: aa1f03e1     	mov	x1, xzr
 1297050: 94481f0d     	bl	0x249ec84 <__start_il2cpp+0x12f74c0>
 1297054: b40001e0     	cbz	x0, 0x1297090 <__start_il2cpp+0xef8cc>
 1297058: 1e2e1000     	fmov	s0, #1.00000000
 129705c: 1e2e1001     	fmov	s1, #1.00000000
 1297060: 1e2e1002     	fmov	s2, #1.00000000
 1297064: 4ea81d03     	mov	v3.16b, v8.16b
 1297068: aa1f03e1     	mov	x1, xzr
 129706c: 94482116     	bl	0x249f4c4 <__start_il2cpp+0x12f7d00>
 1297070: b9401a68     	ldr	w8, [x19, #0x18]
 1297074: 11000694     	add	w20, w20, #0x1
 1297078: 6b08029f     	cmp	w20, w8
 129707c: 54fffdeb     	b.lt	0x1297038 <__start_il2cpp+0xef874>
 1297080: a9424ff4     	ldp	x20, x19, [sp, #0x20]
 1297084: a94157fe     	ldp	x30, x21, [sp, #0x10]
 1297088: fc4307e8     	ldr	d8, [sp], #0x30
 129708c: d65f03c0     	ret
 1297090: 97f8a41c     	bl	0x10c0100 <CloseNLSocket+0x638>
 1297094: 97f8a41d     	bl	0x10c0108 <CloseNLSocket+0x640>
