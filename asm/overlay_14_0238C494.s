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
