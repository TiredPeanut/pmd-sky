	.include "asm/macros.inc"
	.include "overlay_14_0238C494.inc"

	.text

	arm_func_start SentryStateGenerateChoices
SentryStateGenerateChoices: ; 0x0238C494
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
	ldr r0, _0238CA54 ; =SENTRY_DUTY_PTR
	ldr r1, _0238CA58 ; =0x000003FA
	ldr r0, [r0]
	str r1, [r0, #0x118]
	bl GetHero
	mov r6, r0
	bl GetPartner
	ldr r2, _0238CA54 ; =SENTRY_DUTY_PTR
	mov r5, r0
	ldr r1, [r2]
	mov r0, #0
	add r1, r1, #0x3000
	str r0, [r1, #0x878]
	ldr r1, [r2]
	ldr r3, _0238CA5C ; =0x000005DC
	add r2, r1, #0x3000
	mov r1, #4
	str r3, [r2, #0x894]
	bl RandRange
	ldr r2, _0238CA54 ; =SENTRY_DUTY_PTR
	ldr r1, [r2]
	add r1, r1, #0x3000
	str r0, [r1, #0x888]
	ldr r1, [r2]
	mov r0, #0
	add r1, r1, #0x3000
	strb r0, [r1, #0x89d]
	ldr r1, [r2]
	add r1, r1, #0x3000
	strb r0, [r1, #0x89e]
	ldr r1, [r2]
	add r1, r1, #0x3000
	strb r0, [r1, #0x89f]
	ldr r1, [r2]
	add r1, r1, #0x3000
	strb r0, [r1, #0x8a0]
	ldr r1, [r2]
	add r1, r1, #0x3000
	strb r0, [r1, #0x871]
	ldr r1, [r2]
	add r1, r1, #0x3000
	str r0, [r1, #0x874]
	bl ov14_0238AC04
	mov r0, #0
	mov r1, #4
	bl RandRange
	ldr r1, _0238CA54 ; =SENTRY_DUTY_PTR
	ldr r1, [r1]
	add r1, r1, #0x3000
	str r0, [r1, #0x87c]
_0238C564:
	mov r0, #0
	mov r1, #0x65
	bl RandRange
	ldr r2, _0238CA54 ; =SENTRY_DUTY_PTR
	ldr r3, _0238CA60 ; =SENTRY_DUTY_MONSTER_IDS
	ldr r1, [r2]
	add r1, r1, #0x3000
	str r0, [r1, #0x880]
	ldr r4, [r2]
	add r0, r4, #0x3000
	ldr r1, [r0, #0x880]
	ldr r0, [r0, #0x87c]
	mov r1, r1, lsl #1
	add r0, r4, r0, lsl #1
	ldrsh r1, [r3, r1]
	add r0, r0, #0x3800
	strh r1, [r0, #0xa2]
	ldrsh r0, [r6, #4]
	ldr r4, [r2]
	bl FemaleToMaleForm
	add r1, r4, #0x3000
	ldr r1, [r1, #0x87c]
	add r1, r4, r1, lsl #1
	add r1, r1, #0x3800
	ldrsh r1, [r1, #0xa2]
	cmp r1, r0
	beq _0238C564
	ldr r1, _0238CA54 ; =SENTRY_DUTY_PTR
	ldrsh r0, [r5, #4]
	ldr r2, [r1]
	add r1, r2, #0x3000
	ldr r1, [r1, #0x87c]
	add r1, r2, r1, lsl #1
	add r1, r1, #0x3800
	ldrsh r4, [r1, #0xa2]
	bl FemaleToMaleForm
	cmp r4, r0
	ldrne r0, _0238CA64 ; =0x00000119
	cmpne r4, r0
	beq _0238C564
	ldr r0, _0238CA54 ; =SENTRY_DUTY_PTR
	mov r8, #0
	ldr r4, [r0]
	add r2, r4, #0x3000
	ldr r0, [r2, #0x884]
	b _0238C640
_0238C61C:
	add r1, r4, r8, lsl #2
	add r1, r1, #0x3000
	ldr r3, [r2, #0x880]
	ldr r1, [r1, #0x8b8]
	cmp r3, r1
	beq _0238C648
	add r1, r8, #1
	mov r1, r1, lsl #0x10
	mov r8, r1, asr #0x10
_0238C640:
	cmp r8, r0
	blt _0238C61C
_0238C648:
	cmp r8, r0
	blt _0238C564
	ldr r1, _0238CA54 ; =SENTRY_DUTY_PTR
	mov sb, #0
	ldr r2, [r1]
	add r1, r2, #0x3000
	add r0, r2, r0, lsl #2
	ldr r1, [r1, #0x880]
	add r0, r0, #0x3000
	str r1, [r0, #0x8b8]
_0238C670:
	ldr sl, _0238CA54 ; =SENTRY_DUTY_PTR
	ldr r0, [sl]
	add r0, r0, #0x3000
	ldr r0, [r0, #0x87c]
	cmp sb, r0
	beq _0238C72C
	ldr r4, _0238CA60 ; =SENTRY_DUTY_MONSTER_IDS
	ldr fp, _0238CA64 ; =0x00000119
_0238C690:
	mov r0, #0
	mov r1, #0x65
	bl RandRange
	mov r0, r0, lsl #1
	ldrsh r8, [r4, r0]
	ldrsh r0, [r6, #4]
	bl FemaleToMaleForm
	cmp r8, r0
	beq _0238C690
	ldrsh r0, [r5, #4]
	bl FemaleToMaleForm
	cmp r8, r0
	cmpne r8, fp
	beq _0238C690
	ldr r1, [sl]
	add r0, r1, #0x3000
	ldr r0, [r0, #0x87c]
	add r0, r1, r0, lsl #1
	add r0, r0, #0x3800
	ldrsh r0, [r0, #0xa2]
	cmp r8, r0
	beq _0238C690
	mov r0, #0
	b _0238C710
_0238C6F0:
	add r2, r1, r0, lsl #1
	add r2, r2, #0x3800
	ldrsh r2, [r2, #0xa2]
	cmp r8, r2
	beq _0238C718
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
_0238C710:
	cmp r0, sb
	blt _0238C6F0
_0238C718:
	cmp r0, sb
	blt _0238C690
	add r0, r1, sb, lsl #1
	add r0, r0, #0x3800
	strh r8, [r0, #0xa2]
_0238C72C:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
	cmp sb, #4
	blt _0238C670
	ldr r0, _0238CA68 ; =ov14_0238DB2C
	bl Debug_Print0
	ldr r1, _0238CA54 ; =SENTRY_DUTY_PTR
	ldr r0, _0238CA6C ; =ov14_0238DB44
	ldr r1, [r1]
	add r1, r1, #0x3000
	ldr r1, [r1, #0x880]
	bl Debug_Print0
	ldr r1, _0238CA54 ; =SENTRY_DUTY_PTR
	ldr r0, _0238CA70 ; =ov14_0238DB58
	ldr r1, [r1]
	add r1, r1, #0x3000
	ldr r1, [r1, #0x87c]
	bl Debug_Print0
	ldr r0, _0238CA54 ; =SENTRY_DUTY_PTR
	ldr r2, _0238CA74 ; =0x880A0000
	ldr r3, [r0]
	add r0, r3, #0x3000
	ldr r1, [r0, #0x880]
	add r0, r3, #0x3a8
	add r1, r1, #1
	mov r1, r1, lsl #0x10
	add r0, r0, #0x3000
	mov r1, r1, asr #0x10
	bl ov11_022F6FE0
	ldr r0, _0238CA54 ; =SENTRY_DUTY_PTR
	ldr r1, _0238CA78 ; =0x00001001
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x3a8
	add r0, r0, #0x3000
	bl SetAnimDataFields2
	ldr r0, _0238CA54 ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	add r0, r1, #0x6c
	add r0, r0, #0x3400
	add r1, r1, #0x1e4
	bl InitAnimDataFromOtherAnimDataVeneer
	ldr r0, _0238CA54 ; =SENTRY_DUTY_PTR
	ldr r1, _0238CA7C ; =0x00001003
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x6c
	add r0, r0, #0x3400
	bl SetAnimDataFields2
	ldr r1, _0238CA54 ; =SENTRY_DUTY_PTR
	mov r2, #0x60
	ldr r0, [r1]
	add r0, r0, #0x3000
	str r2, [r0, #0x8b0]
	ldr r1, [r1]
	add r0, r1, #0x1b4
	add r0, r0, #0x2800
	add r1, r1, #0x120
	bl InitAnimDataFromOtherAnimDataVeneer
	ldr r0, _0238CA54 ; =SENTRY_DUTY_PTR
	ldr r1, _0238CA80 ; =0x48140000
	ldr r0, [r0]
	add r0, r0, #0x1b4
	add r0, r0, #0x2800
	bl SetAnimDataFieldsWrapper
	ldr r0, _0238CA54 ; =SENTRY_DUTY_PTR
	mov r1, #0x800
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x1b4
	add r0, r0, #0x2800
	bl SetAnimDataFields2
	ldr r4, _0238CA54 ; =SENTRY_DUTY_PTR
	mov sb, #0
	ldr r0, [r4]
	ldr r1, _0238CA84 ; =ov14_0238D970
	add r0, r0, #0x3000
	str sb, [r0, #0x53c]
	ldr r0, [r4]
	mov fp, #1
	add r0, r0, #0x3000
	str sb, [r0, #0x540]
	ldr r6, [r1]
	ldr r5, [r1, #4]
	str r6, [sp]
	str r5, [sp, #4]
	mvn sl, #1
_0238C88C:
	mov r0, #0xc4
	mul r8, sb, r0
	ldr r1, [r4]
	ldr r2, _0238CA88 ; =0x08120000
	add r0, r1, #0x278
	add r1, r1, sb, lsl #1
	add r1, r1, #0x3800
	add r0, r0, #0x2800
	ldrsh r1, [r1, #0xa2]
	add r0, r0, r8
	bl ov11_022F5BBC
	ldr r0, [r4]
	ldr r1, _0238CA8C ; =0x00000807
	add r0, r0, #0x278
	add r0, r0, #0x2800
	add r0, r0, r8
	mov r2, #7
	bl SetAnimDataFields2
	ldr r1, [r4]
	add r0, r1, #0x188
	add r0, r0, #0x2c00
	add r0, r0, r8
	add r1, r1, #0x120
	bl InitAnimDataFromOtherAnimDataVeneer
	ldr r0, [r4]
	ldr r1, _0238CA80 ; =0x48140000
	add r0, r0, #0x188
	add r0, r0, #0x2c00
	add r0, r0, r8
	bl SetAnimDataFieldsWrapper
	ldr r0, [r4]
	add r0, r0, sb, lsl #2
	add r0, r0, #0x3000
	str fp, [r0, #0x544]
	ldr r0, [r4]
	add r0, r0, sb, lsl #2
	add r0, r0, #0x3000
	str fp, [r0, #0x554]
	ldr r1, [r4]
	add r0, r1, #0x98
	add r0, r0, #0x3000
	add r0, r0, r8
	add r1, r1, #0x120
	bl InitAnimDataFromOtherAnimDataVeneer
	cmp sb, #3
	addls pc, pc, sb, lsl #2
	b _0238C984
_0238C948: ; jump table
	b _0238C958 ; case 0
	b _0238C964 ; case 1
	b _0238C970 ; case 2
	b _0238C97C ; case 3
_0238C958:
	ldr r0, [r4]
	ldrsb r7, [r0, #6]
	b _0238C984
_0238C964:
	ldr r0, [r4]
	ldrsb r7, [r0, #7]
	b _0238C984
_0238C970:
	ldr r0, [r4]
	ldrsb r7, [r0, #8]
	b _0238C984
_0238C97C:
	ldr r0, [r4]
	ldrsb r7, [r0, #9]
_0238C984:
	cmp r7, sl
	beq _0238C9C0
	add r0, sp, #0x10
	str r6, [sp, #8]
	str r5, [sp, #0xc]
	bl InitPortraitParams
	add r0, sp, #0x10
	mov r1, #3
	bl SetPortraitLayout
	add r0, sp, #0x10
	add r1, sp, #8
	bl SetPortraitOffset
	mov r0, r7
	add r1, sp, #0x10
	bl ShowPortraitInPortraitBox
_0238C9C0:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov sb, r0, asr #0x10
	cmp sb, #4
	blt _0238C88C
	ldr r0, _0238CA54 ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl ov14_0238AD04
	ldr r0, _0238CA54 ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	bl ov14_0238AD04
	ldr r0, _0238CA54 ; =SENTRY_DUTY_PTR
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	cmp r0, r1
	beq _0238CA10
	bl ClearWindow
_0238CA10:
	ldr r1, _0238CA54 ; =SENTRY_DUTY_PTR
	ldr r0, _0238CA90 ; =0x00002C04
	ldr r1, [r1]
	mov r2, #1
	add r1, r1, #0x3000
	strb r2, [r1, #0x870]
	bl PlaySeByIdVolumeWrapper
	ldr r1, _0238CA54 ; =SENTRY_DUTY_PTR
	mov r3, #2
	ldr r0, [r1]
	mov r2, #0xd
	add r0, r0, #0x3000
	str r3, [r0, #0x538]
	ldr r0, [r1]
	str r2, [r0, #0x110]
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0238CA54: .word SENTRY_DUTY_PTR
_0238CA58: .word 0x000003FA
_0238CA5C: .word 0x000005DC
_0238CA60: .word SENTRY_DUTY_MONSTER_IDS
_0238CA64: .word 0x00000119
_0238CA68: .word ov14_0238DB2C
_0238CA6C: .word ov14_0238DB44
_0238CA70: .word ov14_0238DB58
_0238CA74: .word 0x880A0000
_0238CA78: .word 0x00001001
_0238CA7C: .word 0x00001003
_0238CA80: .word 0x48140000
_0238CA84: .word ov14_0238D970
_0238CA88: .word 0x08120000
_0238CA8C: .word 0x00000807
_0238CA90: .word 0x00002C04
	arm_func_end SentryStateGenerateChoices

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

	arm_func_start SentryStateFinalizeRound
SentryStateFinalizeRound: ; 0x0238CFC4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
	ldr r2, _0238D2FC ; =SENTRY_DUTY_PTR
	mov r0, #0
	ldr r1, [r2]
	add r1, r1, #0x3000
	ldrb r4, [r1, #0x870]
	strb r0, [r1, #0x870]
	ldr r1, [r2]
	add r1, r1, #0x3000
	ldr r3, [r1, #0x884]
	add r3, r3, #1
	str r3, [r1, #0x884]
	ldr r1, [r2]
	add r1, r1, #0x3000
	str r0, [r1, #0x874]
	ldr r1, [r2]
	add r1, r1, #0x3000
	strb r0, [r1, #0x871]
	bl ov14_0238AC04
	cmp r4, #0
	beq _0238D078
	ldr r0, _0238D2FC ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	add r0, r0, #0x3a8
	add r0, r0, #0x3000
	bl ov11_022F7058
	ldr r0, _0238D2FC ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	add r0, r0, #0x6c
	add r0, r0, #0x3400
	bl ov11_022F6EFC
	ldr r1, _0238D2FC ; =SENTRY_DUTY_PTR
	mov r3, #1
	ldr r0, [r1]
	mov r2, #0
	add r0, r0, #0x3000
	str r3, [r0, #0x534]
	ldr r0, [r1]
	add r0, r0, #0x3000
	str r2, [r0, #0x538]
	ldr r0, [r1]
	add r0, r0, #0x1b4
	add r0, r0, #0x2800
	bl ov11_022F6EFC
_0238D078:
	ldr r0, _0238D300 ; =ov14_0238D970
	ldr r4, _0238D2FC ; =SENTRY_DUTY_PTR
	ldr r6, [r0, #8]
	ldr r5, [r0, #0xc]
	mov r7, #0
	str r6, [sp]
	str r5, [sp, #4]
	mvn sl, #1
	mov fp, #0xc4
_0238D09C:
	ldr r0, [r4]
	smulbb sb, r7, fp
	add r0, r0, #0x278
	add r0, r0, #0x2800
	add r0, r0, sb
	bl ov11_022F6EFC
	ldr r0, [r4]
	add r0, r0, #0x188
	add r0, r0, #0x2c00
	add r0, r0, sb
	bl ov11_022F6EFC
	ldr r0, [r4]
	add r0, r0, #0x98
	add r0, r0, #0x3000
	add r0, r0, sb
	bl ov11_022F6EFC
	cmp r7, #3
	addls pc, pc, r7, lsl #2
	b _0238D124
_0238D0E8: ; jump table
	b _0238D0F8 ; case 0
	b _0238D104 ; case 1
	b _0238D110 ; case 2
	b _0238D11C ; case 3
_0238D0F8:
	ldr r0, [r4]
	ldrsb r8, [r0, #6]
	b _0238D124
_0238D104:
	ldr r0, [r4]
	ldrsb r8, [r0, #7]
	b _0238D124
_0238D110:
	ldr r0, [r4]
	ldrsb r8, [r0, #8]
	b _0238D124
_0238D11C:
	ldr r0, [r4]
	ldrsb r8, [r0, #9]
_0238D124:
	cmp r8, sl
	beq _0238D160
	add r0, sp, #0x10
	str r6, [sp, #8]
	str r5, [sp, #0xc]
	bl InitPortraitParams
	add r0, sp, #0x10
	mov r1, #3
	bl SetPortraitLayout
	add r0, sp, #0x10
	add r1, sp, #8
	bl SetPortraitOffset
	mov r0, r8
	add r1, sp, #0x10
	bl ShowPortraitInPortraitBox
_0238D160:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r7, r0, asr #0x10
	cmp r7, #4
	blt _0238D09C
	ldr r0, _0238D2FC ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl ClearWindow
	ldr r0, _0238D2FC ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl UpdateWindow
	ldr r0, _0238D2FC ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	bl ClearWindow
	ldr r0, _0238D2FC ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	bl UpdateWindow
	ldr r1, _0238D2FC ; =SENTRY_DUTY_PTR
	ldr r3, [r1]
	add r0, r3, #0x3000
	ldr r2, [r0, #0x884]
	cmp r2, #6
	movlt r0, #0xf
	strlt r0, [r3, #0x110]
	blt _0238D2F4
	mov r2, #0
	str r2, [r0, #0x8ac]
	ldr r0, [r1]
	add r0, r0, #0x3000
	ldr r0, [r0, #0x88c]
	bl SetSentryDutyGamePoints
	cmp r0, #0
	beq _0238D25C
	ldr r1, _0238D2FC ; =SENTRY_DUTY_PTR
	mov r2, #0
	ldr r0, [r1]
	add r0, r0, #0x3000
	str r2, [r0, #0x890]
	ldr r0, [r1]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x88c]
	cmp r1, #0xfa0
	movgt r1, #1
	strgt r1, [r0, #0x890]
	ldr r0, _0238D2FC ; =SENTRY_DUTY_PTR
	ldr r1, _0238D304 ; =0x00001B58
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldr r2, [r0, #0x88c]
	cmp r2, r1
	movgt r1, #2
	strgt r1, [r0, #0x890]
	ldr r0, _0238D2FC ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldrb r1, [r0, #0x89c]
	cmp r1, #0
	movne r1, #3
	b _0238D2C0
_0238D25C:
	ldr r1, _0238D2FC ; =SENTRY_DUTY_PTR
	mov r2, #4
	ldr r0, [r1]
	add r0, r0, #0x3000
	str r2, [r0, #0x890]
	ldr r0, [r1]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x88c]
	cmp r1, #0xfa0
	movgt r1, #5
	strgt r1, [r0, #0x890]
	ldr r0, _0238D2FC ; =SENTRY_DUTY_PTR
	ldr r1, _0238D304 ; =0x00001B58
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldr r2, [r0, #0x88c]
	cmp r2, r1
	movgt r1, #6
	strgt r1, [r0, #0x890]
	ldr r0, _0238D2FC ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldrb r1, [r0, #0x89c]
	cmp r1, #0
	movne r1, #7
_0238D2C0:
	strne r1, [r0, #0x890]
	ldr r0, _0238D2FC ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x11c]
	cmp r0, #0
	beq _0238D2EC
	cmp r0, #1
	bne _0238D2EC
	mov r0, #0x1e
	str r0, [r1, #0x110]
	b _0238D2F4
_0238D2EC:
	mov r0, #0x20
	str r0, [r1, #0x110]
_0238D2F4:
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0238D2FC: .word SENTRY_DUTY_PTR
_0238D300: .word ov14_0238D970
_0238D304: .word 0x00001B58
	arm_func_end SentryStateFinalizeRound

	arm_func_start SentryStateF
SentryStateF: ; 0x0238D308
	ldr r0, _0238D31C ; =SENTRY_DUTY_PTR
	mov r1, #0xa
	ldr r0, [r0]
	str r1, [r0, #0x110]
	bx lr
	.align 2, 0
_0238D31C: .word SENTRY_DUTY_PTR
	arm_func_end SentryStateF

	arm_func_start SentryState10
SentryState10: ; 0x0238D320
	stmdb sp!, {r3, lr}
	ldr r2, _0238D390 ; =SENTRY_DUTY_PTR
	mvn r1, #1
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r3, [r0, #0x898]
	sub r3, r3, #1
	str r3, [r0, #0x898]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r3, [r0, #0x894]
	sub r3, r3, #0xfa
	str r3, [r0, #0x894]
	ldr r0, [r2]
	ldrsb r0, [r0, #3]
	cmp r0, r1
	beq _0238D368
	bl ClearWindow
_0238D368:
	ldr r0, _0238D394 ; =0x00002C08
	bl PlaySeByIdVolumeWrapper
	ldr r0, _0238D390 ; =SENTRY_DUTY_PTR
	mvn r3, #0
	ldr r2, [r0]
	mov r1, #0x11
	str r3, [r2, #0x114]
	ldr r0, [r0]
	str r1, [r0, #0x110]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238D390: .word SENTRY_DUTY_PTR
_0238D394: .word 0x00002C08
	arm_func_end SentryState10

	arm_func_start SentryState11
SentryState11: ; 0x0238D398
	ldr r0, _0238D3AC ; =SENTRY_DUTY_PTR
	mov r1, #0xd
	ldr r0, [r0]
	str r1, [r0, #0x110]
	bx lr
	.align 2, 0
_0238D3AC: .word SENTRY_DUTY_PTR
	arm_func_end SentryState11

	arm_func_start SentryState12
SentryState12: ; 0x0238D3B0
	ldr r1, _0238D3E0 ; =SENTRY_DUTY_PTR
	mov r2, #0
	ldr r0, [r1]
	ldr r3, _0238D3E4 ; =0x00002311
	add r0, r0, #0x3000
	strb r2, [r0, #0x89c]
	ldr r0, [r1]
	mov r2, #0x13
	str r3, [r0, #0xc8]
	ldr r0, [r1]
	str r2, [r0, #0x110]
	bx lr
	.align 2, 0
_0238D3E0: .word SENTRY_DUTY_PTR
_0238D3E4: .word 0x00002311
	arm_func_end SentryState12

	arm_func_start SentryState13
SentryState13: ; 0x0238D3E8
	ldr r1, _0238D40C ; =SENTRY_DUTY_PTR
	mov r3, #1
	ldr r0, [r1]
	mov r2, #0x17
	add r0, r0, #0x3000
	str r3, [r0, #0x8ac]
	ldr r0, [r1]
	str r2, [r0, #0x110]
	bx lr
	.align 2, 0
_0238D40C: .word SENTRY_DUTY_PTR
	arm_func_end SentryState13

	arm_func_start SentryState14
SentryState14: ; 0x0238D410
	ldr r0, _0238D424 ; =SENTRY_DUTY_PTR
	mov r1, #0x15
	ldr r0, [r0]
	str r1, [r0, #0x110]
	bx lr
	.align 2, 0
_0238D424: .word SENTRY_DUTY_PTR
	arm_func_end SentryState14

	arm_func_start SentryState15
SentryState15: ; 0x0238D428
	stmdb sp!, {r3, lr}
	ldr r0, _0238D464 ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldr r0, [r0, #0x8ac]
	cmp r0, #2
	bge _0238D450
	mov r0, #0x14
	bl SentrySetStateIntermediate
	ldmia sp!, {r3, pc}
_0238D450:
	mov r0, #0x304
	bl PlaySeByIdVolumeWrapper
	mov r0, #0x16
	bl SentrySetStateIntermediate
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238D464: .word SENTRY_DUTY_PTR
	arm_func_end SentryState15

	arm_func_start SentryState16
SentryState16: ; 0x0238D468
	stmdb sp!, {r3, lr}
	ldr r2, _0238D4BC ; =SENTRY_DUTY_PTR
	mvn r1, #0x3f
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r3, [r0, #0x8b0]
	sub r3, r3, #4
	str r3, [r0, #0x8b0]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r3, [r0, #0x8b0]
	cmp r3, r1
	ldmgeia sp!, {r3, pc}
	mov r3, #0
	strb r3, [r0, #0x89c]
	ldr r1, [r2]
	mov r0, #0x17
	add r1, r1, #0x3000
	str r3, [r1, #0x8ac]
	bl SentrySetStateIntermediate
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238D4BC: .word SENTRY_DUTY_PTR
	arm_func_end SentryState16

	arm_func_start SentryState17
SentryState17: ; 0x0238D4C0
	ldr r1, _0238D534 ; =SENTRY_DUTY_PTR
	mov r3, #4
	ldr r2, [r1]
	add r0, r2, #0x3000
	ldr r0, [r0, #0x87c]
	add r0, r2, r0, lsl #1
	add r0, r0, #0x3800
	ldrsh r0, [r0, #0xa2]
	str r0, [r2, #0xa4]
	ldr r2, [r1]
	add r0, r2, #0x3000
	ldrb r1, [r0, #0x871]
	cmp r1, #0
	ldreq r0, [r0, #0x878]
	moveq r1, #3
	addeq r0, r2, r0, lsl #2
	addeq r0, r0, #0x3000
	streq r1, [r0, #0x554]
	ldr r1, _0238D534 ; =SENTRY_DUTY_PTR
	mov r2, #0x18
	ldr ip, [r1]
	add r0, ip, #0x3000
	ldr r0, [r0, #0x87c]
	add r0, ip, r0, lsl #2
	add r0, r0, #0x3000
	str r3, [r0, #0x554]
	ldr r0, [r1]
	str r2, [r0, #0x110]
	bx lr
	.align 2, 0
_0238D534: .word SENTRY_DUTY_PTR
	arm_func_end SentryState17

	arm_func_start SentryState18
SentryState18: ; 0x0238D538
	stmdb sp!, {r3, lr}
	ldr r0, _0238D56C ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldr r0, [r0, #0x8ac]
	cmp r0, #2
	bge _0238D560
	mov r0, #0x17
	bl SentrySetStateIntermediate
	ldmia sp!, {r3, pc}
_0238D560:
	mov r0, #0xe
	bl SentrySetStateIntermediate
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238D56C: .word SENTRY_DUTY_PTR
	arm_func_end SentryState18

	arm_func_start SentryState19
SentryState19: ; 0x0238D570
	ldr r0, _0238D584 ; =SENTRY_DUTY_PTR
	mov r1, #0x1a
	ldr r0, [r0]
	str r1, [r0, #0x110]
	bx lr
	.align 2, 0
_0238D584: .word SENTRY_DUTY_PTR
	arm_func_end SentryState19

	arm_func_start SentryState1A
SentryState1A: ; 0x0238D588
	stmdb sp!, {r3, lr}
	ldr r0, _0238D5C4 ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldr r0, [r0, #0x8ac]
	cmp r0, #2
	bge _0238D5B0
	mov r0, #0x19
	bl SentrySetStateIntermediate
	ldmia sp!, {r3, pc}
_0238D5B0:
	mov r0, #0x304
	bl PlaySeByIdVolumeWrapper
	mov r0, #0x1b
	bl SentrySetStateIntermediate
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238D5C4: .word SENTRY_DUTY_PTR
	arm_func_end SentryState1A

	arm_func_start SentryStateFinalizePoints
SentryStateFinalizePoints: ; 0x0238D5C8
	stmdb sp!, {r3, lr}
	ldr r2, _0238D654 ; =SENTRY_DUTY_PTR
	mvn r1, #0x3f
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r3, [r0, #0x8b0]
	sub r3, r3, #4
	str r3, [r0, #0x8b0]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r3, [r0, #0x8b0]
	cmp r3, r1
	ldmgeia sp!, {r3, pc}
	ldr r3, [r0, #0x88c]
	ldr r1, [r0, #0x894]
	add r1, r3, r1
	str r1, [r0, #0x88c]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x884]
	cmp r1, #5
	bne _0238D634
	ldrb r1, [r0, #0x89c]
	cmp r1, #0
	ldrne r1, [r0, #0x88c]
	addne r1, r1, #0x7d0
	strne r1, [r0, #0x88c]
_0238D634:
	ldr r0, _0238D654 ; =SENTRY_DUTY_PTR
	mov r2, #0
	ldr r1, [r0]
	mov r0, #0x1c
	add r1, r1, #0x3000
	str r2, [r1, #0x8ac]
	bl SentrySetStateIntermediate
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238D654: .word SENTRY_DUTY_PTR
	arm_func_end SentryStateFinalizePoints

	arm_func_start SentryState1C
SentryState1C: ; 0x0238D658
	ldr r1, _0238D694 ; =SENTRY_DUTY_PTR
	ldr r2, _0238D698 ; =0x00002310
	ldr r0, [r1]
	mov r3, #2
	str r2, [r0, #0xc8]
	ldr ip, [r1]
	mov r2, #0x1d
	add r0, ip, #0x3000
	ldr r0, [r0, #0x878]
	add r0, ip, r0, lsl #2
	add r0, r0, #0x3000
	str r3, [r0, #0x554]
	ldr r0, [r1]
	str r2, [r0, #0x110]
	bx lr
	.align 2, 0
_0238D694: .word SENTRY_DUTY_PTR
_0238D698: .word 0x00002310
	arm_func_end SentryState1C

	arm_func_start SentryState1D
SentryState1D: ; 0x0238D69C
	stmdb sp!, {r3, lr}
	ldr r0, _0238D6FC ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	add r0, r1, #0x3000
	ldr r0, [r0, #0x8ac]
	cmp r0, #1
	bne _0238D6CC
	ldrsb r0, [r1, #3]
	mvn r1, #1
	cmp r0, r1
	beq _0238D6CC
	bl ClearWindow
_0238D6CC:
	ldr r0, _0238D6FC ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldr r0, [r0, #0x8ac]
	cmp r0, #1
	bge _0238D6F0
	mov r0, #0x1c
	bl SentrySetStateIntermediate
	ldmia sp!, {r3, pc}
_0238D6F0:
	mov r0, #0xe
	bl SentrySetStateIntermediate
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238D6FC: .word SENTRY_DUTY_PTR
	arm_func_end SentryState1D

	arm_func_start SentryState1E
SentryState1E: ; 0x0238D700
	ldr r0, _0238D714 ; =SENTRY_DUTY_PTR
	mov r1, #0x1f
	ldr r0, [r0]
	str r1, [r0, #0x110]
	bx lr
	.align 2, 0
_0238D714: .word SENTRY_DUTY_PTR
	arm_func_end SentryState1E

	arm_func_start SentryState1F
SentryState1F: ; 0x0238D718
	stmdb sp!, {r3, lr}
	ldr r0, _0238D790 ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x8ac]
	cmp r1, #2
	bge _0238D754
	mov r0, #0x1e
	bl SentrySetStateIntermediate
	ldr r0, _0238D790 ; =SENTRY_DUTY_PTR
	mov r1, #0x1e
	ldr r0, [r0]
	add r0, r0, #0x3000
	str r1, [r0, #0x8b4]
	ldmia sp!, {r3, pc}
_0238D754:
	ldr r0, [r0, #0x8b4]
	cmp r0, #0x1e
	bne _0238D768
	mov r0, #0x1e
	bl sub_02017B7C
_0238D768:
	ldr r0, _0238D790 ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x8b4]
	cmp r1, #0
	subgt r1, r1, #1
	strgt r1, [r0, #0x8b4]
	ldmgtia sp!, {r3, pc}
	bl SentrySetExitingState
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238D790: .word SENTRY_DUTY_PTR
	arm_func_end SentryState1F

	arm_func_start SentryState20
SentryState20: ; 0x0238D794
	ldr r0, _0238D7A8 ; =SENTRY_DUTY_PTR
	mov r1, #0x21
	ldr r0, [r0]
	str r1, [r0, #0x110]
	bx lr
	.align 2, 0
_0238D7A8: .word SENTRY_DUTY_PTR
	arm_func_end SentryState20

	arm_func_start SentryState21
SentryState21: ; 0x0238D7AC
	stmdb sp!, {r3, lr}
	ldr r0, _0238D824 ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x8ac]
	cmp r1, #2
	bge _0238D7E8
	mov r0, #0x20
	bl SentrySetStateIntermediate
	ldr r0, _0238D824 ; =SENTRY_DUTY_PTR
	mov r1, #0x1e
	ldr r0, [r0]
	add r0, r0, #0x3000
	str r1, [r0, #0x8b4]
	ldmia sp!, {r3, pc}
_0238D7E8:
	ldr r0, [r0, #0x8b4]
	cmp r0, #0x1e
	bne _0238D7FC
	mov r0, #0x1e
	bl sub_02017B7C
_0238D7FC:
	ldr r0, _0238D824 ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x8b4]
	cmp r1, #0
	subgt r1, r1, #1
	strgt r1, [r0, #0x8b4]
	ldmgtia sp!, {r3, pc}
	bl SentrySetExitingState
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238D824: .word SENTRY_DUTY_PTR
	arm_func_end SentryState21

	arm_func_start ov14_0238D828
ov14_0238D828: ; 0x0238D828
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sb, r1
	mov sl, r0
	mov r8, r2
	mov r4, r3
	ldr r7, [sb]
	bl strlen
	ldr r2, [sp, #0x30]
#ifdef EUROPE
	add fp, sp, #0
#else
	mov r6, #0
#endif
	cmp r0, r2
	ldrlt r1, [r8]
	sublt r0, r2, r0
	addlt r0, r1, r0, lsl #3
	strlt r0, [r8]
	mov r0, r4, lsl #8
	str r0, [sp, #4]
#ifdef EUROPE
	ldr r0, _0238D968 ; =0x0000080F
	mov r6, #0
	sub r4, r0, #1
	sub r5, r0, #3
#else
	add r5, sp, #0
	ldr fp, _0238D968 ; =0x0000080F
	mov r4, r6
#endif
	b _0238D950
_0238D87C:
	ldrb r1, [sl], #1
	ldr r0, [r8]
	mov r0, r0, lsl #8
	str r0, [sp]
	cmp r1, #0x30
	blo _0238D8DC
	cmp r1, #0x39
	bhi _0238D8DC
	sub r0, r1, #0x2b
#ifdef EUROPE
	ldr r2, [r8]
	orr r0, r0, #0x800
	mov r0, r0, lsl #0x10
	add r2, r2, #8
	mov r1, r0, asr #0x10
	str r2, [r8]
	mov r0, r7
#else
	orr r0, r0, #0x800
	mov r0, r0, lsl #0x10
	mov r1, r0, asr #0x10
	ldr r2, [r8]
	mov r0, r7
	add r2, r2, #8
	str r2, [r8]
#endif
	mov r2, r6
	bl SetAnimDataFields2
	mov r0, r7
#ifdef EUROPE
	mov r1, fp
	mov r2, #0
#else
	mov r1, r5
	mov r2, r4
#endif
	bl AnimRelatedFunction__022F6F14
	add r7, r7, #0xc4
	b _0238D950
_0238D8DC:
	cmp r1, #0x2f
	bne _0238D918
	ldr r1, [r8]
	mov r0, r7
	add r1, r1, #8
	str r1, [r8]
#ifdef EUROPE
	mov r1, r5
#else
	mov r1, fp
#endif
	mov r2, #0
	bl SetAnimDataFields2
	mov r0, r7
#ifdef EUROPE
	mov r1, fp
#else
	mov r1, r5
#endif
	mov r2, #0
	bl AnimRelatedFunction__022F6F14
	add r7, r7, #0xc4
	b _0238D950
_0238D918:
	cmp r1, #0x50
	bne _0238D950
#ifdef EUROPE
	ldr r0, [r8]
	add r0, r0, #8
	str r0, [r8]
	bl GetLanguage
	sub r1, r0, #2
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	and r1, r1, #0xff
	cmp r1, #1
	mov r2, #0
	bhi _0238E4AC
	ldr r1, [sp]
	mov r0, r7
	add r1, r1, #0x400
	str r1, [sp]
	mov r1, r4
	bl SetAnimDataFields2
	b _0238E4DC
_0238E4AC:
	cmp r0, #4
	bne _0238E4D0
	ldr r1, [sp]
	mov r0, r7
	add r1, r1, #0x400
	str r1, [sp]
	ldr r1, _0238D968 ; =0x00000812
	bl SetAnimDataFields2
	b _0238E4DC
_0238E4D0:
	mov r0, r7
	mov r1, #0x810
	bl SetAnimDataFields2
_0238E4DC:
	mov r0, r7
	mov r1, fp
#else
	ldr r1, [r8]
	mov r0, r7
	add r1, r1, #8
	str r1, [r8]
	mov r1, #0x810
	mov r2, #0
	bl SetAnimDataFields2
	mov r0, r7
	mov r1, r5
#endif
	mov r2, #0
	bl AnimRelatedFunction__022F6F14
	add r7, r7, #0xc4
_0238D950:
	ldrb r0, [sl]
	cmp r0, #0
	bne _0238D87C
	str r7, [sb]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
#ifdef EUROPE
_0238D968: .word 0x00000812
#else
_0238D968: .word 0x0000080F
#endif
	arm_func_end ov14_0238D828
	; 0x0238D96C

	.rodata
	.global ov14_0238D96C
ov14_0238D96C:
	.byte 0x03, 0x03, 0x03, 0x03
	.global ov14_0238D970
ov14_0238D970:
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov14_0238D988
ov14_0238D988:
	.byte 0x00, 0x00, 0x00, 0x00
#ifdef JAPAN
	.byte 0x03, 0x07, 0x18, 0x02
#else
	.byte 0x02, 0x07, 0x1A, 0x02
#endif
	.byte 0x00, 0xFB, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov14_0238D998
ov14_0238D998:
	.byte 0x00, 0x00, 0x00, 0x00
#ifdef JAPAN
	.byte 0x03, 0x10, 0x18, 0x02
#else
	.byte 0x02, 0x10, 0x1A, 0x02
#endif
	.byte 0x00, 0xFB, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov14_0238D9A8
ov14_0238D9A8:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x02, 0x00, 0x00, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov14_0238D9B8
ov14_0238D9B8:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x13, 0x1C, 0x04, 0x00, 0xFD, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov14_0238D9C8
ov14_0238D9C8:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x06, 0x10, 0x0B, 0x01, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov14_0238D9D8
ov14_0238D9D8:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x04, 0x10, 0x0B, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov14_0238D9E8
ov14_0238D9E8:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x02, 0x00, 0x00, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov14_0238D9F8
ov14_0238D9F8:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x02, 0x1D, 0x05, 0x01, 0xFB, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov14_0238DA08
ov14_0238DA08:
#ifdef JAPAN
#define OV14_DATA_OFFSET 0x3669
#else
#define OV14_DATA_OFFSET 0
#endif
	.word 0x6D6 + OV14_DATA_OFFSET
	.byte 0x08, 0x00, 0x00, 0x00
	.word 0x6D7 + OV14_DATA_OFFSET
	.byte 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00
	.global ov14_0238DA20
ov14_0238DA20:
	.byte 0x40, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0xB8, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x68, 0x00, 0x00, 0x00, 0xB8, 0x00, 0x00, 0x00
	.byte 0x68, 0x00, 0x00, 0x00
	.global ov14_0238DA40
ov14_0238DA40:
	.byte 0x00, 0x40, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0xB8, 0x00, 0x00
	.byte 0x00, 0x20, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x68, 0x00, 0x00, 0x00, 0xB8, 0x00, 0x00
	.byte 0x00, 0x68, 0x00, 0x00
	.global ov14_0238DA60
ov14_0238DA60:
	.byte 0x20, 0x00, 0x2C, 0x00, 0x38, 0x00, 0x44, 0x00, 0x50, 0x00, 0x5C, 0x00
	.byte 0x68, 0x00, 0x74, 0x00, 0x80, 0x00, 0x8C, 0x00, 0x98, 0x00, 0xA4, 0x00, 0xB0, 0x00, 0xBC, 0x00
	.byte 0xC8, 0x00, 0xD4, 0x00
	.global ov14_0238DA80
ov14_0238DA80:
	.byte 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00
	.global SENTRY_DEBUG_MENU_ITEMS
SENTRY_DEBUG_MENU_ITEMS:
	.word 0x6CE + OV14_DATA_OFFSET
	.byte 0x00, 0x00, 0x00, 0x00
	.word 0x6CF + OV14_DATA_OFFSET
	.byte 0x01, 0x00, 0x00, 0x00
	.word 0x6D0 + OV14_DATA_OFFSET
	.byte 0x02, 0x00, 0x00, 0x00
	.word 0x6D1 + OV14_DATA_OFFSET
	.byte 0x03, 0x00, 0x00, 0x00
	.word 0x6D2 + OV14_DATA_OFFSET
	.byte 0x04, 0x00, 0x00, 0x00
	.word 0x6D3 + OV14_DATA_OFFSET
	.byte 0x05, 0x00, 0x00, 0x00
	.word 0x6D4 + OV14_DATA_OFFSET
	.byte 0x06, 0x00, 0x00, 0x00
	.word 0x6D5 + OV14_DATA_OFFSET
	.byte 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.global ov14_0238DAE8
ov14_0238DAE8:
	.byte 0x5B, 0x73, 0x74, 0x72
	.byte 0x69, 0x6E, 0x67, 0x30, 0x5D, 0x5B, 0x43, 0x4C, 0x55, 0x4D, 0x5F, 0x53, 0x45, 0x54, 0x3A, 0x36
	.byte 0x34, 0x5D, 0x5B, 0x76, 0x61, 0x6C, 0x75, 0x65, 0x3A, 0x30, 0x3A, 0x38, 0x5D, 0x00, 0x00, 0x00
	.global ov14_0238DB0C
ov14_0238DB0C:
	.byte 0x5B, 0x64, 0x69, 0x67, 0x69, 0x74, 0x73, 0x3A, 0x30, 0x5D, 0x00, 0x00
	.global ov14_0238DB18
ov14_0238DB18:
	.byte 0x5B, 0x64, 0x69, 0x67
	.byte 0x69, 0x74, 0x73, 0x3A, 0x31, 0x5D, 0x00, 0x00
	.global ov14_0238DB24
ov14_0238DB24:
	.byte 0x2F, 0x00, 0x00, 0x00
	.global ov14_0238DB28
ov14_0238DB28:
	.byte 0x50, 0x00, 0x00, 0x00
	.global ov14_0238DB2C
ov14_0238DB2C:
	.byte 0x2D, 0x2D, 0x2D, 0x2D, 0x20, 0x46, 0x6F, 0x6F, 0x74, 0x70, 0x72, 0x69, 0x6E, 0x74, 0x20, 0x2D
	.byte 0x2D, 0x2D, 0x2D, 0x0A, 0x00, 0x00, 0x00, 0x00
	.global ov14_0238DB44
ov14_0238DB44:
	.byte 0x46, 0x6F, 0x6F, 0x72, 0x70, 0x72, 0x69, 0x6E
	.byte 0x74, 0x4E, 0x6F, 0x20, 0x3D, 0x20, 0x25, 0x64, 0x0A, 0x00, 0x00, 0x00
	.global ov14_0238DB58
ov14_0238DB58:
	.byte 0x41, 0x6E, 0x73, 0x77
	.byte 0x65, 0x72, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x3D, 0x20, 0x25, 0x64, 0x0A, 0x00, 0x00, 0x00

	.data
	.global SENTRY_DUTY_PTR
SENTRY_DUTY_PTR:
	.byte 0x00, 0x00, 0x00, 0x00
	.global ov14_0238DB84
ov14_0238DB84:
	.byte 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01
	.byte 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01
	.global SENTRY_DUTY_STATE_HANDLER_TABLE
SENTRY_DUTY_STATE_HANDLER_TABLE:
	.word SentryState0
	.word SentryState1
	.word SentryState2
	.word SentryState3
	.word SentryState4
	.word SentryStateExit
	.word SentryState6
	.word SentryState7
	.word SentryState8
	.word SentryState9
	.word SentryStateA
	.word SentryStateB
	.word SentryStateGenerateChoices
	.word SentryStateGetUserChoice
	.word SentryStateFinalizeRound
	.word SentryStateF
	.word SentryState10
	.word SentryState11
	.word SentryState12
	.word SentryState13
	.word SentryState14
	.word SentryState15
	.word SentryState16
	.word SentryState17
	.word SentryState18
	.word SentryState19
	.word SentryState1A
	.word SentryStateFinalizePoints
	.word SentryState1C
	.word SentryState1D
	.word SentryState1E
	.word SentryState1F
	.word SentryState20
	.word SentryState21
