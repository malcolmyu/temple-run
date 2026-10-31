
/tmp/temple-libil2cpp.so:	file format elf64-littleaarch64

Disassembly of section il2cpp:

00000000011a77c4 <__start_il2cpp>:
 12e1958: a9bc67fe     	stp	x30, x25, [sp, #-0x40]!
 12e195c: a9015ff8     	stp	x24, x23, [sp, #0x10]
 12e1960: a90257f6     	stp	x22, x21, [sp, #0x20]
 12e1964: a9034ff4     	stp	x20, x19, [sp, #0x30]
 12e1968: 9000bab5     	adrp	x21, 0x2a35000
 12e196c: b000ac18     	adrp	x24, 0x2862000
 12e1970: 396c2aa8     	ldrb	w8, [x21, #0xb0a]
 12e1974: f9424b18     	ldr	x24, [x24, #0x490]
 12e1978: 2a0103f3     	mov	w19, w1
 12e197c: 2a0003f4     	mov	w20, w0
 12e1980: 37000368     	tbnz	w8, #0x0, 0x12e19ec <__start_il2cpp+0x13a228>
 12e1984: b000ac00     	adrp	x0, 0x2862000
 12e1988: f9424000     	ldr	x0, [x0, #0x480]
 12e198c: 97f77953     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e1990: 9000abe0     	adrp	x0, 0x285d000
 12e1994: f9461c00     	ldr	x0, [x0, #0xc38]
 12e1998: 97f77950     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e199c: f000abc0     	adrp	x0, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12e19a0: f9456000     	ldr	x0, [x0, #0xac0]
 12e19a4: 97f7794d     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e19a8: b000ac00     	adrp	x0, 0x2862000
 12e19ac: f9424800     	ldr	x0, [x0, #0x490]
 12e19b0: 97f7794a     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e19b4: 9000abe0     	adrp	x0, 0x285d000
 12e19b8: f9460c00     	ldr	x0, [x0, #0xc18]
 12e19bc: 97f77947     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e19c0: 9000ac20     	adrp	x0, 0x2865000
 12e19c4: f9478800     	ldr	x0, [x0, #0xf10]
 12e19c8: 97f77944     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e19cc: 9000ac20     	adrp	x0, 0x2865000
 12e19d0: f9478c00     	ldr	x0, [x0, #0xf18]
 12e19d4: 97f77941     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e19d8: 9000ac20     	adrp	x0, 0x2865000
 12e19dc: f9479000     	ldr	x0, [x0, #0xf20]
 12e19e0: 97f7793e     	bl	0x10bfed8 <CloseNLSocket+0x410>
 12e19e4: 52800028     	mov	w8, #0x1                // =1
 12e19e8: 392c2aa8     	strb	w8, [x21, #0xb0a]
 12e19ec: f9400300     	ldr	x0, [x24]
 12e19f0: f000abd5     	adrp	x21, 0x285c000 <_ZTVN10__cxxabiv119__pointer_type_infoE+0x18>
 12e19f4: b940e008     	ldr	w8, [x0, #0xe0]
 12e19f8: f94562b5     	ldr	x21, [x21, #0xac0]
 12e19fc: 35000068     	cbnz	w8, 0x12e1a08 <__start_il2cpp+0x13a244>
 12e1a00: 97f77978     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e1a04: f9400300     	ldr	x0, [x24]
 12e1a08: f94002a8     	ldr	x8, [x21]
 12e1a0c: f9405c09     	ldr	x9, [x0, #0xb8]
 12e1a10: b940e10a     	ldr	w10, [x8, #0xe0]
 12e1a14: f9403135     	ldr	x21, [x9, #0x60]
 12e1a18: 3500006a     	cbnz	w10, 0x12e1a24 <__start_il2cpp+0x13a260>
 12e1a1c: aa0803e0     	mov	x0, x8
 12e1a20: 97f77970     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e1a24: aa1503e0     	mov	x0, x21
 12e1a28: aa1f03e1     	mov	x1, xzr
 12e1a2c: aa1f03e2     	mov	x2, xzr
 12e1a30: 94475e9a     	bl	0x24b9498 <__start_il2cpp+0x1311cd4>
 12e1a34: 36000300     	tbz	w0, #0x0, 0x12e1a94 <__start_il2cpp+0x13a2d0>
 12e1a38: 9000ac28     	adrp	x8, 0x2865000
 12e1a3c: f9478d08     	ldr	x8, [x8, #0xf18]
 12e1a40: aa1f03e1     	mov	x1, xzr
 12e1a44: f9400100     	ldr	x0, [x8]
 12e1a48: 94474ab3     	bl	0x24b4514 <__start_il2cpp+0x130cd50>
 12e1a4c: b4000ac0     	cbz	x0, 0x12e1ba4 <__start_il2cpp+0x13a3e0>
 12e1a50: 9000abe8     	adrp	x8, 0x285d000
 12e1a54: f9461d08     	ldr	x8, [x8, #0xc38]
 12e1a58: f9400101     	ldr	x1, [x8]
 12e1a5c: f9400008     	ldr	x8, [x0]
 12e1a60: eb01011f     	cmp	x8, x1
 12e1a64: 54000a21     	b.ne	0x12e1ba8 <__start_il2cpp+0x13a3e4>
 12e1a68: aa1f03e1     	mov	x1, xzr
 12e1a6c: 94475c24     	bl	0x24b8afc <__start_il2cpp+0x1311338>
 12e1a70: f9400308     	ldr	x8, [x24]
 12e1a74: aa0003f5     	mov	x21, x0
 12e1a78: b940e109     	ldr	w9, [x8, #0xe0]
 12e1a7c: 35000089     	cbnz	w9, 0x12e1a8c <__start_il2cpp+0x13a2c8>
 12e1a80: aa0803e0     	mov	x0, x8
 12e1a84: 97f77957     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e1a88: f9400308     	ldr	x8, [x24]
 12e1a8c: f9405d08     	ldr	x8, [x8, #0xb8]
 12e1a90: f9003115     	str	x21, [x8, #0x60]
 12e1a94: 9000abf5     	adrp	x21, 0x285d000
 12e1a98: f9460eb5     	ldr	x21, [x21, #0xc18]
 12e1a9c: f94002a0     	ldr	x0, [x21]
 12e1aa0: b940e008     	ldr	w8, [x0, #0xe0]
 12e1aa4: 35000068     	cbnz	w8, 0x12e1ab0 <__start_il2cpp+0x13a2ec>
 12e1aa8: 97f7794e     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e1aac: f94002a0     	ldr	x0, [x21]
 12e1ab0: f9405c08     	ldr	x8, [x0, #0xb8]
 12e1ab4: f9400100     	ldr	x0, [x8]
 12e1ab8: b4000760     	cbz	x0, 0x12e1ba4 <__start_il2cpp+0x13a3e0>
 12e1abc: 9000ac28     	adrp	x8, 0x2865000
 12e1ac0: f9478908     	ldr	x8, [x8, #0xf10]
 12e1ac4: aa1f03e2     	mov	x2, xzr
 12e1ac8: f9400101     	ldr	x1, [x8]
 12e1acc: 97fba0b5     	bl	0x11c9da0 <__start_il2cpp+0x225dc>
 12e1ad0: f9400308     	ldr	x8, [x24]
 12e1ad4: aa0003f6     	mov	x22, x0
 12e1ad8: b940e109     	ldr	w9, [x8, #0xe0]
 12e1adc: 35000069     	cbnz	w9, 0x12e1ae8 <__start_il2cpp+0x13a324>
 12e1ae0: aa0803e0     	mov	x0, x8
 12e1ae4: 97f7793f     	bl	0x10bffe0 <CloseNLSocket+0x518>
 12e1ae8: b40005f6     	cbz	x22, 0x12e1ba4 <__start_il2cpp+0x13a3e0>
 12e1aec: f9400308     	ldr	x8, [x24]
 12e1af0: aa1603e0     	mov	x0, x22
 12e1af4: aa1f03e2     	mov	x2, xzr
 12e1af8: f9405d08     	ldr	x8, [x8, #0xb8]
 12e1afc: f9403101     	ldr	x1, [x8, #0x60]
 12e1b00: 97fbaa52     	bl	0x11cc448 <__start_il2cpp+0x24c84>
 12e1b04: b4000500     	cbz	x0, 0x12e1ba4 <__start_il2cpp+0x13a3e0>
 12e1b08: aa1f03e1     	mov	x1, xzr
 12e1b0c: 9447518f     	bl	0x24b6148 <__start_il2cpp+0x130e984>
 12e1b10: b40004a0     	cbz	x0, 0x12e1ba4 <__start_il2cpp+0x13a3e0>
 12e1b14: b000ac08     	adrp	x8, 0x2862000
 12e1b18: f9424108     	ldr	x8, [x8, #0x480]
 12e1b1c: aa0003f5     	mov	x21, x0
 12e1b20: f9400101     	ldr	x1, [x8]
 12e1b24: 9403dc8f     	bl	0x13d8d60 <__start_il2cpp+0x23159c>
 12e1b28: b40003e0     	cbz	x0, 0x12e1ba4 <__start_il2cpp+0x13a3e0>
 12e1b2c: 9000ac39     	adrp	x25, 0x2865000
 12e1b30: f9479339     	ldr	x25, [x25, #0xf20]
 12e1b34: aa0003f7     	mov	x23, x0
 12e1b38: f9001016     	str	x22, [x0, #0x20]
 12e1b3c: 29064c14     	stp	w20, w19, [x0, #0x30]
 12e1b40: 94000036     	bl	0x12e1c18 <__start_il2cpp+0x13a454>
 12e1b44: f9400308     	ldr	x8, [x24]
 12e1b48: aa1f03e1     	mov	x1, xzr
 12e1b4c: f9405d08     	ldr	x8, [x8, #0xb8]
 12e1b50: b9400109     	ldr	w9, [x8]
 12e1b54: 11000529     	add	w9, w9, #0x1
 12e1b58: b9000109     	str	w9, [x8]
 12e1b5c: b8070ee9     	str	w9, [x23, #0x70]!
 12e1b60: aa1703e0     	mov	x0, x23
 12e1b64: 942f01ec     	bl	0x1ea2314 <__start_il2cpp+0xcfab50>
 12e1b68: f9400328     	ldr	x8, [x25]
 12e1b6c: aa0003e1     	mov	x1, x0
 12e1b70: aa1f03e2     	mov	x2, xzr
 12e1b74: aa0803e0     	mov	x0, x8
 12e1b78: 942964c9     	bl	0x1d3ae9c <__start_il2cpp+0xb936d8>
 12e1b7c: aa0003e1     	mov	x1, x0
 12e1b80: aa1503e0     	mov	x0, x21
 12e1b84: aa1f03e2     	mov	x2, xzr
 12e1b88: 9447698c     	bl	0x24bc1b8 <__start_il2cpp+0x13149f4>
 12e1b8c: aa1503e0     	mov	x0, x21
 12e1b90: a9434ff4     	ldp	x20, x19, [sp, #0x30]
 12e1b94: a94257f6     	ldp	x22, x21, [sp, #0x20]
 12e1b98: a9415ff8     	ldp	x24, x23, [sp, #0x10]
 12e1b9c: a8c467fe     	ldp	x30, x25, [sp], #0x40
 12e1ba0: d65f03c0     	ret
 12e1ba4: 97f77957     	bl	0x10c0100 <CloseNLSocket+0x638>
 12e1ba8: 97f77a3d     	bl	0x10c049c <CloseNLSocket+0x9d4>
