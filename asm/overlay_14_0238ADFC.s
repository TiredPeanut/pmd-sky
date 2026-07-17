	.include "asm/macros.inc"
	.include "overlay_14_0238ADFC.inc"

	.text

	arm_func_start SentryUpdateDisplay
SentryUpdateDisplay: ; 0x0238ADFC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x6c
	ldr r1, _0238B690 ; =ov14_0238D970
	ldr r0, _0238B694 ; =SENTRY_DUTY_PTR
	ldr r2, [r1, #0x14]
	ldr r1, [r1, #0x10]
	ldr r4, [r0]
	str r1, [sp, #0x14]
	str r2, [sp, #0x18]
	cmp r4, #0
	ldrne r0, [r4, #0x11c]
	cmpne r0, #2
	beq _0238B688
	add r0, r4, #0x3000
	ldrb r1, [r0, #0x870]
	cmp r1, #0
	beq _0238AECC
	ldr r0, [r0, #0x874]
	mov r1, #0x3c
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	cmp r0, #9
	blt _0238AECC
	add r0, r4, #0x3000
	ldr r1, [r0, #0x540]
	mov r5, #0
	cmp r1, #2
	moveq r1, #3
	ldr r4, _0238B698 ; =ov14_0238DA40
	ldr r7, _0238B694 ; =SENTRY_DUTY_PTR
	streq r1, [r0, #0x540]
	add sb, sp, #0x14
	mov r8, r5
	mov r6, #0xc4
_0238AE88:
	ldr r0, [r7]
	add r1, r4, r5, lsl #3
	add r0, r0, #0x278
	add r0, r0, #0x2800
	mla r0, r5, r6, r0
	ldr r2, [r4, r5, lsl #3]
	ldr r1, [r1, #4]
	add sl, r2, #0x2200
	add r3, r1, #0x1600
	mov r1, sb
	mov r2, r8
	str sl, [sp, #0x14]
	str r3, [sp, #0x18]
	bl AnimRelatedFunction__022F6F14
	add r5, r5, #1
	cmp r5, #4
	blt _0238AE88
_0238AECC:
	ldr r7, _0238B694 ; =SENTRY_DUTY_PTR
	ldr r0, [r7]
	add r0, r0, #0x3000
	ldrb r0, [r0, #0x870]
	cmp r0, #0
	beq _0238AFDC
	ldr r0, _0238B69C ; =0x00000806
	mov r4, #0xc4
	ldr r8, _0238B698 ; =ov14_0238DA40
	mov sl, #0
	sub sb, r0, #2
	mov r5, r4
	mov r6, r4
	mov fp, r4
_0238AF04:
	ldr r0, [r7]
	add r0, r0, sl, lsl #2
	add r0, r0, #0x3000
	ldr r2, [r0, #0x544]
	ldr r1, [r0, #0x554]
	cmp r2, r1
	beq _0238AFA0
	str r1, [r0, #0x544]
	ldr r1, [r7]
	add r0, r1, sl, lsl #2
	add r0, r0, #0x3000
	ldr r0, [r0, #0x544]
	cmp r0, #2
	beq _0238AF50
	cmp r0, #3
	beq _0238AF6C
	cmp r0, #4
	beq _0238AF88
	b _0238AFA0
_0238AF50:
	add r0, r1, #0x188
	add r0, r0, #0x2c00
	mla r0, sl, r6, r0
	mov r1, sb
	mov r2, #0
	bl SetAnimDataFields2
	b _0238AFA0
_0238AF6C:
	add r0, r1, #0x188
	add r0, r0, #0x2c00
	mla r0, sl, r5, r0
	ldr r1, _0238B6A0 ; =0x00001005
	mov r2, #0
	bl SetAnimDataFields2
	b _0238AFA0
_0238AF88:
	add r0, r1, #0x188
	add r0, r0, #0x2c00
	mla r0, sl, r4, r0
	ldr r1, _0238B69C ; =0x00000806
	mov r2, #0
	bl SetAnimDataFields2
_0238AFA0:
	ldr r1, [r7]
	add r0, r1, sl, lsl #2
	add r0, r0, #0x3000
	ldr r0, [r0, #0x544]
	cmp r0, #1
	ble _0238AFD0
	add r0, r1, #0x188
	add r0, r0, #0x2c00
	mla r0, sl, fp, r0
	add r1, r8, sl, lsl #3
	mov r2, #0
	bl AnimRelatedFunction__022F6F14
_0238AFD0:
	add sl, sl, #1
	cmp sl, #4
	blt _0238AF04
_0238AFDC:
	ldr r0, _0238B694 ; =SENTRY_DUTY_PTR
	ldr r2, [r0]
	add r0, r2, #0x3000
	ldrb r1, [r0, #0x870]
	cmp r1, #0
	beq _0238B038
	mov r1, #0x8000
	str r1, [sp, #0x14]
	ldr r1, [r0, #0x8b0]
	add r0, r2, #0x3a8
	mov r3, r1, lsl #8
	add r1, sp, #0x14
	add r0, r0, #0x3000
	mov r2, #0
	str r3, [sp, #0x18]
	bl AnimRelatedFunction__022F7064
	ldr r0, _0238B694 ; =SENTRY_DUTY_PTR
	add r1, sp, #0x14
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x6c
	add r0, r0, #0x3400
	bl AnimRelatedFunction__022F6F14
_0238B038:
	ldr r0, _0238B694 ; =SENTRY_DUTY_PTR
	ldr r2, [r0]
	add r0, r2, #0x3000
	ldrb r1, [r0, #0x870]
	cmp r1, #0
	beq _0238B1DC
	ldr r1, [r0, #0x538]
	cmp r1, #0
	beq _0238B1A8
	cmp r1, #3
	beq _0238B078
	cmp r1, #4
	beq _0238B0EC
	cmp r1, #5
	beq _0238B128
	b _0238B164
_0238B078:
	ldr r0, [r0, #0x534]
	cmp r0, #4
	bne _0238B098
	add r0, r2, #0x1b4
	add r0, r0, #0x2800
	bl ov11_022F4990
	cmp r0, #0
	bne _0238B1A8
_0238B098:
	ldr r0, _0238B694 ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	add r0, r1, #0x3000
	ldr r0, [r0, #0x534]
	cmp r0, #3
	beq _0238B0C4
	add r0, r1, #0x1b4
	ldr r1, _0238B6A4 ; =0x00000801
	add r0, r0, #0x2800
	mov r2, #0
	bl SetAnimDataFields2
_0238B0C4:
	ldr r1, _0238B694 ; =SENTRY_DUTY_PTR
	mov r2, #0
	ldr r0, [r1]
	add r0, r0, #0x3000
	ldr r3, [r0, #0x538]
	str r3, [r0, #0x534]
	ldr r0, [r1]
	add r0, r0, #0x3000
	str r2, [r0, #0x538]
	b _0238B1A8
_0238B0EC:
	add r0, r2, #0x1b4
	ldr r1, _0238B6A8 ; =0x00001002
	add r0, r0, #0x2800
	mov r2, #0
	bl SetAnimDataFields2
	ldr r1, _0238B694 ; =SENTRY_DUTY_PTR
	mov r2, #0
	ldr r0, [r1]
	add r0, r0, #0x3000
	ldr r3, [r0, #0x538]
	str r3, [r0, #0x534]
	ldr r0, [r1]
	add r0, r0, #0x3000
	str r2, [r0, #0x538]
	b _0238B1A8
_0238B128:
	add r0, r2, #0x1b4
	ldr r1, _0238B6AC ; =0x00000802
	add r0, r0, #0x2800
	mov r2, #0
	bl SetAnimDataFields2
	ldr r1, _0238B694 ; =SENTRY_DUTY_PTR
	mov r2, #0
	ldr r0, [r1]
	add r0, r0, #0x3000
	ldr r3, [r0, #0x538]
	str r3, [r0, #0x534]
	ldr r0, [r1]
	add r0, r0, #0x3000
	str r2, [r0, #0x538]
	b _0238B1A8
_0238B164:
	ldr r0, [r0, #0x534]
	cmp r0, r1
	beq _0238B184
	add r0, r2, #0x1b4
	add r0, r0, #0x2800
	mov r1, #0x800
	mov r2, #0
	bl SetAnimDataFields2
_0238B184:
	ldr r1, _0238B694 ; =SENTRY_DUTY_PTR
	mov r2, #0
	ldr r0, [r1]
	add r0, r0, #0x3000
	ldr r3, [r0, #0x538]
	str r3, [r0, #0x534]
	ldr r0, [r1]
	add r0, r0, #0x3000
	str r2, [r0, #0x538]
_0238B1A8:
	ldr r0, _0238B694 ; =SENTRY_DUTY_PTR
	ldr r3, [r0]
	add r0, r3, #0x3000
	ldr r1, [r0, #0x534]
	cmp r1, #1
	beq _0238B1DC
	ldr r1, [r0, #0x878]
	ldr r2, _0238B698 ; =ov14_0238DA40
	add r0, r3, #0x1b4
	add r0, r0, #0x2800
	add r1, r2, r1, lsl #3
	mov r2, #0
	bl AnimRelatedFunction__022F6F14
_0238B1DC:
	mov sl, #0
	ldr r8, _0238B6B0 ; =ov14_0238DB84
	ldr r7, _0238B6B4 ; =ov14_0238DA60
	ldr r5, _0238B694 ; =SENTRY_DUTY_PTR
	mov fp, sl
	mov r6, #0xa000
	mov r4, #0xc4
_0238B1F8:
	mul sb, sl, r4
	ldrsb r0, [r8, sl]
	ldr r1, [r5]
	mov r2, fp
	add r0, r0, #0x800
	add r3, r1, #0x36c
	mov r1, r0, lsl #0x10
	add r0, r3, sb
	mov r1, r1, asr #0x10
	bl SetAnimDataFields2
	mov r0, sl, lsl #1
	ldrsh r1, [r7, r0]
	ldr r0, [r5]
	mov r2, #0
	mov r1, r1, lsl #8
	add r0, r0, #0x36c
	str r1, [sp, #0x14]
	add r0, r0, sb
	add r1, sp, #0x14
	str r6, [sp, #0x18]
	bl AnimRelatedFunction__022F6F14
	add sl, sl, #1
	cmp sl, #0x10
	blt _0238B1F8
	ldr r1, _0238B694 ; =SENTRY_DUTY_PTR
	ldr r0, [r1]
	add r0, r0, #0x3000
	ldr r3, [r0, #0x884]
	ldr r2, [r0, #0x564]
	cmp r3, r2
	beq _0238B2E4
	str r3, [r0, #0x564]
	ldr r2, [r1]
	mov r1, #6
	add r0, r2, #0x3000
	ldr r0, [r0, #0x564]
	ldr r3, _0238B6B8 ; =0x0000C402
	add r0, r0, #1
	str r0, [sp, #0x40]
	cmp r0, #6
	add r0, r2, #0x570
	ldr r2, _0238B6BC ; =ov14_0238DB0C
	str r1, [sp, #0x44]
	strgt r1, [sp, #0x40]
	add r4, sp, #0x1c
	add r0, r0, #0x3000
	mov r1, #0x400
	str r4, [sp]
	bl PreprocessString
	mov r1, r4
	str r1, [sp]
	ldr r0, _0238B694 ; =SENTRY_DUTY_PTR
	ldr r2, _0238B6C0 ; =ov14_0238DB18
	ldr r0, [r0]
	ldr r3, _0238B6B8 ; =0x0000C402
	add r0, r0, #0x670
	add r0, r0, #0x3000
	mov r1, #0x400
	bl PreprocessString
_0238B2E4:
	ldr r0, _0238B694 ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	add r0, r1, #0x3000
	ldr r0, [r0, #0x564]
	cmp r0, #0
	blt _0238B374
	add r0, r1, #0x3ac
	add r4, r0, #0xc00
	add r0, r1, #0x570
	mov r3, #0x3a
	str r4, [sp, #0x10]
	str r3, [sp, #0xc]
	mov r4, #1
	add r1, sp, #0x10
	add r2, sp, #0xc
	add r0, r0, #0x3000
	mov r3, #0x16
	str r4, [sp]
	bl ov14_0238D828
	mov r4, #0
	ldr r0, _0238B6C4 ; =ov14_0238DB24
	add r1, sp, #0x10
	add r2, sp, #0xc
	mov r3, #0x16
	str r4, [sp]
	bl ov14_0238D828
	mov r1, #1
	str r1, [sp]
	ldr r0, _0238B694 ; =SENTRY_DUTY_PTR
	add r1, sp, #0x10
	ldr r0, [r0]
	add r2, sp, #0xc
	add r0, r0, #0x670
	add r0, r0, #0x3000
	mov r3, #0x16
	bl ov14_0238D828
_0238B374:
	ldr r1, _0238B694 ; =SENTRY_DUTY_PTR
	ldr r0, [r1]
	add r0, r0, #0x3000
	ldr r3, [r0, #0x88c]
	ldr r2, [r0, #0x568]
	cmp r3, r2
	beq _0238B3C4
	str r3, [r0, #0x568]
	ldr r2, [r1]
	ldr r3, _0238B6B8 ; =0x0000C402
	add r0, r2, #0x3000
	ldr r1, [r0, #0x568]
	add r0, r2, #0x770
	str r1, [sp, #0x40]
	add r4, sp, #0x1c
	ldr r2, _0238B6BC ; =ov14_0238DB0C
	add r0, r0, #0x3000
	mov r1, #0x400
	str r4, [sp]
	bl PreprocessString
_0238B3C4:
	ldr r0, _0238B694 ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	add r0, r1, #0x3000
	ldr r0, [r0, #0x568]
	cmp r0, #0
	blt _0238B42C
	add r0, r1, #0x3ec
	add r4, r0, #0x1800
	add r0, r1, #0x770
	mov r3, #0xa8
	str r4, [sp, #8]
	str r3, [sp, #4]
	mov r4, #8
	add r1, sp, #8
	add r2, sp, #4
	add r0, r0, #0x3000
	mov r3, #0x18
	str r4, [sp]
	bl ov14_0238D828
	mov r4, #0
	ldr r0, _0238B6C8 ; =ov14_0238DB28
	add r1, sp, #8
	add r2, sp, #4
	mov r3, #0x18
	str r4, [sp]
	bl ov14_0238D828
_0238B42C:
	ldr r4, _0238B694 ; =SENTRY_DUTY_PTR
	ldr r0, [r4]
	add r0, r0, #0x3000
	ldr r8, [r0, #0x56c]
	ldr r7, [r0, #0x898]
	cmp r7, r8
	beq _0238B4E4
	cmp r7, r8
	mov r5, #0
	ble _0238B494
	mov r6, #0x304
	mov r7, #0xc4
	b _0238B47C
_0238B460:
	add r0, r1, #0x2c
	add r0, r0, #0x2800
	mla r0, r8, r7, r0
	mov r1, r6
	mov r2, r5
	bl SetAnimDataFields2
	add r8, r8, #1
_0238B47C:
	ldr r1, [r4]
	add r0, r1, #0x3000
	ldr r0, [r0, #0x898]
	cmp r8, r0
	blt _0238B460
	b _0238B4D0
_0238B494:
	ldr r6, _0238B6CC ; =0x00001004
	mov r8, #0xc4
	b _0238B4BC
_0238B4A0:
	add r0, r1, #0x2c
	add r0, r0, #0x2800
	mla r0, r7, r8, r0
	mov r1, r6
	mov r2, r5
	bl SetAnimDataFields2
	add r7, r7, #1
_0238B4BC:
	ldr r1, [r4]
	add r0, r1, #0x3000
	ldr r0, [r0, #0x56c]
	cmp r7, r0
	blt _0238B4A0
_0238B4D0:
	ldr r0, _0238B694 ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x898]
	str r1, [r0, #0x56c]
_0238B4E4:
	mov r0, #0x2600
	mov r4, #0
	ldr r6, _0238B694 ; =SENTRY_DUTY_PTR
	str r0, [sp, #0x18]
	add r8, sp, #0x14
	mov r7, r4
	mov r5, #0xc4
_0238B500:
	ldr r0, [r6]
	mov r1, r4, lsl #4
	add r0, r0, #0x2c
	add r0, r0, #0x2800
	mla r0, r4, r5, r0
	add r1, r1, #0xd6
	mov r3, r1, lsl #8
	mov r1, r8
	mov r2, r7
	str r3, [sp, #0x14]
	bl AnimRelatedFunction__022F6F14
	add r4, r4, #1
	cmp r4, #2
	blt _0238B500
	ldr r6, _0238B694 ; =SENTRY_DUTY_PTR
	ldr r0, [r6]
	add r0, r0, #0x3000
	ldrb r1, [r0, #0x870]
	cmp r1, #0
	beq _0238B688
	ldr r2, [r0, #0x53c]
	ldr r1, [r0, #0x540]
	cmp r2, r1
	beq _0238B5BC
	mov r4, #0
	ldr r8, _0238B6D0 ; =0x00001003
	str r1, [r0, #0x53c]
	mov r7, r4
	mov r5, #0xc4
_0238B574:
	ldr r0, [r6]
	mov r1, r8
	add r0, r0, #0x98
	add r0, r0, #0x3000
	mla r0, r4, r5, r0
	mov r2, r7
	bl SetAnimDataFields2
	add r4, r4, #1
	cmp r4, #4
	blt _0238B574
	ldr r0, _0238B694 ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldr r0, [r0, #0x53c]
	cmp r0, #3
	bne _0238B5BC
	ldr r0, _0238B6D4 ; =0x00002C05
	bl PlaySeByIdVolumeWrapper
_0238B5BC:
	ldr r6, _0238B694 ; =SENTRY_DUTY_PTR
	ldr r0, [r6]
	add r0, r0, #0x3000
	ldr r0, [r0, #0x53c]
	cmp r0, #1
	ble _0238B688
	mov sl, #0
	mov r4, #0xc4
	ldr sb, _0238B698 ; =ov14_0238DA40
	add r8, sp, #0x14
	mov fp, sl
	mov r7, sl
	mov r5, r4
_0238B5F0:
	ldr r1, [r6]
	add r0, r1, #0x3000
	ldr r0, [r0, #0x53c]
	cmp r0, #2
	beq _0238B610
	cmp r0, #3
	beq _0238B648
	b _0238B67C
_0238B610:
	add r0, r1, #0x98
	add r0, r0, #0x3000
	mla r0, sl, r5, r0
	add r1, sb, sl, lsl #3
	ldr r2, [sb, sl, lsl #3]
	ldr r1, [r1, #4]
	sub r3, r2, #0x1600
	sub ip, r1, #0x600
	mov r1, r8
	mov r2, r7
	str r3, [sp, #0x14]
	str ip, [sp, #0x18]
	bl AnimRelatedFunction__022F6F14
	b _0238B67C
_0238B648:
	add r0, r1, #0x98
	add r0, r0, #0x3000
	mla r0, sl, r4, r0
	add r1, sb, sl, lsl #3
	ldr r2, [sb, sl, lsl #3]
	ldr r1, [r1, #4]
	add r3, r2, #0x2200
	add ip, r1, #0xe00
	mov r1, r8
	mov r2, fp
	str r3, [sp, #0x14]
	str ip, [sp, #0x18]
	bl AnimRelatedFunction__022F6F14
_0238B67C:
	add sl, sl, #1
	cmp sl, #4
	blt _0238B5F0
_0238B688:
	add sp, sp, #0x6c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0238B690: .word ov14_0238D970
_0238B694: .word SENTRY_DUTY_PTR
_0238B698: .word ov14_0238DA40
_0238B69C: .word 0x00000806
_0238B6A0: .word 0x00001005
_0238B6A4: .word 0x00000801
_0238B6A8: .word 0x00001002
_0238B6AC: .word 0x00000802
_0238B6B0: .word ov14_0238DB84
_0238B6B4: .word ov14_0238DA60
_0238B6B8: .word 0x0000C402
_0238B6BC: .word ov14_0238DB0C
_0238B6C0: .word ov14_0238DB18
_0238B6C4: .word ov14_0238DB24
_0238B6C8: .word ov14_0238DB28
_0238B6CC: .word 0x00001004
_0238B6D0: .word 0x00001003
_0238B6D4: .word 0x00002C05
	arm_func_end SentryUpdateDisplay
