	.include "asm/macros.inc"
	.include "overlay_14_0238CA94.inc"

	.text

	arm_func_start SentryStateGetUserChoice
SentryStateGetUserChoice: ; 0x0238CA94
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x38
	ldr r2, _0238CFA4 ; =SENTRY_DUTY_PTR
	mov r1, #0x3c
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r3, [r0, #0x874]
	add r3, r3, #1
	str r3, [r0, #0x874]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r3, [r0, #0x894]
	sub r3, r3, #1
	str r3, [r0, #0x894]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r0, [r0, #0x874]
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r8, r0, asr #0x10
	mov r1, r8, lsr #0x1f
	rsb r0, r1, r8, lsl #28
	add r0, r1, r0, ror #28
	bl ov14_0238AC04
	ldr r0, _0238CFA4 ; =SENTRY_DUTY_PTR
	mov r1, #0x3c
	ldr r4, [r0]
	add r0, r4, #0x3000
	ldr r0, [r0, #0x874]
	bl _s32_div_f
	cmp r0, #0x10
	bge _0238CDE0
	mov r4, #0
	add r1, sp, #2
	mov r0, r4
	bl sub_020063F4
	add r1, sp, #0
	mov r0, r4
	bl GetPressedButtons
	bl IsTouchScreenNotOff
	cmp r0, #0
	beq _0238CBCC
	add r0, sp, #4
	bl GetReleasedStylus
	ldrh r0, [sp, #4]
	tst r0, #2
	beq _0238CBCC
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	mov r1, r4
	ldr r0, _0238CFA8 ; =ov14_0238DA20
	b _0238CBC4
_0238CB64:
	ldr r6, [r0, r1, lsl #3]
	sub r5, r6, #0x38
	cmp r2, r5
	blt _0238CBB8
	add r5, r6, #0x40
	cmp r2, r5
	bgt _0238CBB8
	add r5, r0, r1, lsl #3
	ldr r6, [r5, #4]
	sub r5, r6, #0x20
	cmp r3, r5
	blt _0238CBB8
	add r5, r6, #0x28
	cmp r3, r5
	bgt _0238CBB8
	ldr r0, _0238CFA4 ; =SENTRY_DUTY_PTR
	mov r4, #1
	ldr r0, [r0]
	add r0, r0, #0x3000
	str r1, [r0, #0x878]
	b _0238CBCC
_0238CBB8:
	add r1, r1, #1
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
_0238CBC4:
	cmp r1, #4
	blt _0238CB64
_0238CBCC:
	cmp r4, #0
	bne _0238CBEC
	ldrh r0, [sp]
	tst r0, #1
	movne r0, #0
	strneh r0, [sp, #2]
	strneh r0, [sp]
	movne r4, #1
_0238CBEC:
	cmp r4, #0
	beq _0238CCCC
	ldr r1, _0238CFA4 ; =SENTRY_DUTY_PTR
	ldr r0, _0238CFAC ; =0x00003F02
	ldr r1, [r1]
	mov r2, #0
	add r1, r1, #0x3000
	str r2, [r1, #0x8ac]
	bl PlaySeByIdVolumeWrapper
	ldr r2, _0238CFA4 ; =SENTRY_DUTY_PTR
	ldr r1, [r2]
	add r0, r1, #0x3000
	ldr r0, [r0, #0x878]
	add r0, r1, r0, lsl #1
	add r0, r0, #0x3800
	ldrsh r0, [r0, #0xa2]
	str r0, [r1, #0xa4]
	ldr r4, [r2]
	add r1, r4, #0x3000
	ldr r3, [r1, #0x878]
	ldr r0, [r1, #0x87c]
	cmp r3, r0
	bne _0238CC5C
	mov r2, #5
	mov r0, #0x19
	str r2, [r1, #0x538]
	bl SentrySetStateIntermediate
	b _0238CCE0
_0238CC5C:
	add r0, r4, r3, lsl #2
	add r0, r0, #0x3000
	ldr r0, [r0, #0x554]
	cmp r0, #3
	bne _0238CC7C
	ldr r0, _0238CFB0 ; =0x00003F03
	bl PlaySeByIdVolumeWrapper
	b _0238CCE0
_0238CC7C:
	ldr r0, [r1, #0x898]
	cmp r0, #0
	ble _0238CCB8
	mov r0, #4
	str r0, [r1, #0x538]
	ldr r3, [r2]
	mov r2, #3
	add r0, r3, #0x3000
	ldr r1, [r0, #0x878]
	mov r0, #0x10
	add r1, r3, r1, lsl #2
	add r1, r1, #0x3000
	str r2, [r1, #0x554]
	bl SentrySetStateIntermediate
	b _0238CCE0
_0238CCB8:
	mov r2, #5
	mov r0, #0x14
	str r2, [r1, #0x538]
	bl SentrySetStateIntermediate
	b _0238CCE0
_0238CCCC:
	ldr r0, _0238CFA4 ; =SENTRY_DUTY_PTR
	mov r1, #3
	ldr r0, [r0]
	add r0, r0, #0x3000
	str r1, [r0, #0x538]
_0238CCE0:
	ldrh r0, [sp, #2]
	tst r0, #0xf0
	beq _0238CCF4
	ldr r0, _0238CFB4 ; =0x00003F01
	bl PlaySeByIdVolumeWrapper
_0238CCF4:
	ldr r0, _0238CFA4 ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x878]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _0238CF14
_0238CD10: ; jump table
	b _0238CD20 ; case 0
	b _0238CD50 ; case 1
	b _0238CD80 ; case 2
	b _0238CDB0 ; case 3
_0238CD20:
	ldrh r2, [sp, #2]
	tst r2, #0x80
	movne r1, #2
	strne r1, [r0, #0x878]
	tst r2, #0x10
	beq _0238CF14
	ldr r0, _0238CFA4 ; =SENTRY_DUTY_PTR
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x3000
	str r1, [r0, #0x878]
	b _0238CF14
_0238CD50:
	ldrh r2, [sp, #2]
	tst r2, #0x80
	movne r1, #3
	strne r1, [r0, #0x878]
	tst r2, #0x20
	beq _0238CF14
	ldr r0, _0238CFA4 ; =SENTRY_DUTY_PTR
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x3000
	str r1, [r0, #0x878]
	b _0238CF14
_0238CD80:
	ldrh r2, [sp, #2]
	tst r2, #0x40
	movne r1, #0
	strne r1, [r0, #0x878]
	tst r2, #0x10
	beq _0238CF14
	ldr r0, _0238CFA4 ; =SENTRY_DUTY_PTR
	mov r1, #3
	ldr r0, [r0]
	add r0, r0, #0x3000
	str r1, [r0, #0x878]
	b _0238CF14
_0238CDB0:
	ldrh r2, [sp, #2]
	tst r2, #0x40
	movne r1, #1
	strne r1, [r0, #0x878]
	tst r2, #0x20
	beq _0238CF14
	ldr r0, _0238CFA4 ; =SENTRY_DUTY_PTR
	mov r1, #2
	ldr r0, [r0]
	add r0, r0, #0x3000
	str r1, [r0, #0x878]
	b _0238CF14
_0238CDE0:
	add r0, r4, #0x3000
	mov r2, #1
	ldr r1, _0238CFA4 ; =SENTRY_DUTY_PTR
	strb r2, [r0, #0x871]
	ldr r0, [r1]
	mov r2, #2
	add r1, r0, #0x3000
	mov r0, #0x12
	str r2, [r1, #0x538]
	bl SentrySetStateIntermediate
	b _0238CF14
_0238CE0C:
	ldr r4, _0238CFA4 ; =SENTRY_DUTY_PTR
	ldr r0, [r4]
	add r0, r0, #0x3000
	ldrb r1, [r0, #0x89d]
	cmp r1, #0
	bne _0238CF1C
	mov r1, #1
	strb r1, [r0, #0x89d]
	ldr r0, [r4]
	mov sb, #0
	mov r1, #2
	add r0, r0, #0x3000
	ldr r6, _0238CFB8 ; =ov14_0238D96C
	ldr r5, _0238CFBC ; =ov14_0238DA80
	str r1, [r0, #0x540]
	add r7, sp, #0x28
	mov sl, sb
_0238CE50:
	mov r0, r7
	bl InitPortraitParams
	ldr r1, [r4]
	mov r0, r7
	add r1, r1, sb, lsl #1
	add r1, r1, #0x3800
	ldrsh r1, [r1, #0xa2]
	bl InitPortraitParamsWithMonsterId
	ldrb r1, [r6, sb]
	mov r0, r7
	bl SetPortraitLayout
	mov r0, r7
	add r1, r5, sb, lsl #3
	bl SetPortraitOffset
	mov r0, r7
	mov r1, sl
	bl SetPortraitEmotion
	cmp sb, #3
	addls pc, pc, sb, lsl #2
	b _0238CEFC
_0238CEA0: ; jump table
	b _0238CEB0 ; case 0
	b _0238CEC4 ; case 1
	b _0238CED8 ; case 2
	b _0238CEEC ; case 3
_0238CEB0:
	ldr r0, [r4]
	mov r1, r7
	ldrsb r0, [r0, #6]
	bl ShowPortraitInPortraitBox
	b _0238CEFC
_0238CEC4:
	ldr r0, [r4]
	mov r1, r7
	ldrsb r0, [r0, #7]
	bl ShowPortraitInPortraitBox
	b _0238CEFC
_0238CED8:
	ldr r0, [r4]
	mov r1, r7
	ldrsb r0, [r0, #8]
	bl ShowPortraitInPortraitBox
	b _0238CEFC
_0238CEEC:
	ldr r0, [r4]
	mov r1, r7
	ldrsb r0, [r0, #9]
	bl ShowPortraitInPortraitBox
_0238CEFC:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
	cmp sb, #4
	blt _0238CE50
	b _0238CF1C
_0238CF14:
	cmp r8, #2
	bge _0238CE0C
_0238CF1C:
	cmp r8, #5
	blt _0238CF5C
	ldr r0, _0238CFA4 ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldrb r0, [r0, #0x89e]
	cmp r0, #0
	bne _0238CF5C
	bl ov14_0238AC40
	ldr r0, _0238CFC0 ; =0x00002C06
	bl PlaySeByIdVolumeWrapper
	ldr r0, _0238CFA4 ; =SENTRY_DUTY_PTR
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x3000
	strb r1, [r0, #0x89e]
_0238CF5C:
	cmp r8, #0xb
	blt _0238CF9C
	ldr r0, _0238CFA4 ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldrb r0, [r0, #0x89f]
	cmp r0, #0
	bne _0238CF9C
	bl ov14_0238AC40
	ldr r0, _0238CFC0 ; =0x00002C06
	bl PlaySeByIdVolumeWrapper
	ldr r0, _0238CFA4 ; =SENTRY_DUTY_PTR
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x3000
	strb r1, [r0, #0x89f]
_0238CF9C:
	add sp, sp, #0x38
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0238CFA4: .word SENTRY_DUTY_PTR
_0238CFA8: .word ov14_0238DA20
_0238CFAC: .word 0x00003F02
_0238CFB0: .word 0x00003F03
_0238CFB4: .word 0x00003F01
_0238CFB8: .word ov14_0238D96C
_0238CFBC: .word ov14_0238DA80
_0238CFC0: .word 0x00002C06
	arm_func_end SentryStateGetUserChoice
