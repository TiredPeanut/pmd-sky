	.include "asm/macros.inc"
	.include "overlay_14.inc"

	.text

	arm_func_start SentrySetupState
SentrySetupState: ; 0x0238A140
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r4, r0
	ldr r0, _0238A504 ; =0x000038D4
	mov r1, #8
	bl MemAlloc
	ldr r1, _0238A508 ; =SENTRY_DUTY_PTR
	str r0, [r1]
	add r0, r0, #0xa4
	bl InitPreprocessorArgs
	ldr r0, _0238A508 ; =SENTRY_DUTY_PTR
	mov r5, #0
	ldr r1, [r0]
	sub r3, r5, #1
	str r5, [r1, #0x104]
	ldr r7, [r0]
	mov r2, #2
	ldr r6, [r7, #0x108]
	mov r1, #1
	str r6, [r7, #0x110]
	ldr r6, [r0]
	str r5, [r6, #0x10c]
	ldr r6, [r0]
	str r3, [r6, #0x114]
	ldr r6, [r0]
	str r5, [r6, #0x118]
	ldr r6, [r0]
	add r6, r6, #0x3000
	str r5, [r6, #0x88c]
	ldr r6, [r0]
	add r6, r6, #0x3000
	str r5, [r6, #0x890]
	ldr r6, [r0]
	add r6, r6, #0x3000
	strb r5, [r6, #0x530]
	ldr r6, [r0]
	add r6, r6, #0x3000
	str r2, [r6, #0x534]
	ldr r6, [r0]
	add r6, r6, #0x3000
	str r5, [r6, #0x538]
	ldr r6, [r0]
	add r6, r6, #0x3000
	str r5, [r6, #0x53c]
	ldr r6, [r0]
	add r6, r6, #0x3000
	str r5, [r6, #0x540]
	ldr r6, [r0]
	add r6, r6, #0x3000
	str r3, [r6, #0x564]
	ldr r6, [r0]
	add r6, r6, #0x3000
	str r3, [r6, #0x568]
	ldr r3, [r0]
	add r3, r3, #0x3000
	str r5, [r3, #0x56c]
	ldr r3, [r0]
	add r3, r3, #0x3000
	strb r5, [r3, #0x870]
	ldr r3, [r0]
	add r3, r3, #0x3000
	str r5, [r3, #0x884]
	ldr r3, [r0]
	add r3, r3, #0x3000
	str r5, [r3, #0x88c]
	ldr r3, [r0]
	add r3, r3, #0x3000
	str r2, [r3, #0x898]
	ldr r2, [r0]
	add r2, r2, #0x3000
	strb r1, [r2, #0x89c]
	mov r2, r1
_0238A25C:
	ldr r1, [r0]
	add r1, r1, r5, lsl #2
	add r1, r1, #0x3000
	str r2, [r1, #0x544]
	ldr r1, [r0]
	add r1, r1, r5, lsl #2
	add r1, r1, #0x3000
	add r5, r5, #1
	str r2, [r1, #0x554]
	cmp r5, #4
	blt _0238A25C
	ldr r2, _0238A508 ; =SENTRY_DUTY_PTR
	mov r0, #0
	ldr r1, [r2]
	mov r3, #0x60
	add r1, r1, #0x3000
	strb r0, [r1, #0x871]
	ldr r1, [r2]
	add r1, r1, #0x3000
	str r0, [r1, #0x874]
	ldr r1, [r2]
	add r1, r1, #0x3000
	str r3, [r1, #0x8b0]
	mvn r3, #0
_0238A2BC:
	ldr r1, [r2]
	add r1, r1, r0, lsl #2
	add r1, r1, #0x3000
	add r0, r0, #1
	str r3, [r1, #0x8b8]
	cmp r0, #6
	blt _0238A2BC
	bl GetHeroMemberIdx
	ldr r1, _0238A508 ; =SENTRY_DUTY_PTR
	ldr r1, [r1]
	add r1, r1, #0x3800
	strh r0, [r1, #0xd0]
	bl GetPartnerMemberIdx
	ldr r3, _0238A508 ; =SENTRY_DUTY_PTR
	mvn r1, #1
	ldr r2, [r3]
	add r2, r2, #0x3800
	strh r0, [r2, #0xd2]
	ldr r2, [r3]
	mov r0, #0
	str r4, [r2, #0x11c]
	ldr r2, [r3]
	strb r1, [r2]
	ldr r2, [r3]
	strb r1, [r2, #1]
	ldr r2, [r3]
	strb r1, [r2, #2]
	ldr r2, [r3]
	strb r1, [r2, #3]
	ldr r2, [r3]
	strb r1, [r2, #4]
	ldr r2, [r3]
	strb r1, [r2, #5]
	ldr r2, [r3]
	strb r1, [r2, #6]
	ldr r2, [r3]
	strb r1, [r2, #7]
	ldr r2, [r3]
	strb r1, [r2, #8]
	ldr r2, [r3]
	strb r1, [r2, #9]
	ldr r2, [r3]
	strb r1, [r2, #0xa]
	ldr r2, [r3]
	strb r1, [r2, #0xb]
	bl ov14_0238AC04
	ldr r0, _0238A508 ; =SENTRY_DUTY_PTR
#ifdef EUROPE
	mov r1, #0xbd
#else
	mov r1, #0xad
#endif
	ldr r0, [r0]
	mov r2, #0x8100000
	add r0, r0, #0x120
	bl LoadObjectAnimData
	ldr r0, _0238A508 ; =SENTRY_DUTY_PTR
	ldr r2, _0238A50C ; =0x88080000
	ldr r0, [r0]
#ifdef EUROPE
	mov r1, #0xdd
#else
	mov r1, #0xcd
#endif
	add r0, r0, #0x1e4
	bl LoadObjectAnimData
	ldr r0, _0238A508 ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	add r0, r1, #0x2a8
	add r1, r1, #0x1e4
	bl InitAnimDataFromOtherAnimDataVeneer
	ldr r0, _0238A508 ; =SENTRY_DUTY_PTR
	mov r1, #0x800
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x2a8
	bl SetAnimDataFields2
	mov sb, #0
	ldr r5, _0238A510 ; =0xC8100000
	ldr r4, _0238A508 ; =SENTRY_DUTY_PTR
	mov r7, #0x800
	mov r6, sb
	mov sl, #0xc4
_0238A3E8:
	mul r8, sb, sl
	ldr r1, [r4]
	add r0, r1, #0x36c
	add r0, r0, r8
	add r1, r1, #0x1e4
	bl InitAnimDataFromOtherAnimDataVeneer
	ldr r0, [r4]
	mov r1, r7
	add r0, r0, #0x36c
	mov r2, r6
	add r0, r0, r8
	bl SetAnimDataFields2
	ldr r1, [r4]
	add r0, r1, #0x3ac
	add r0, r0, #0xc00
	add r0, r0, r8
	add r1, r1, #0x1e4
	bl InitAnimDataFromOtherAnimDataVeneer
	ldr r0, [r4]
	mov r1, r5
	add r0, r0, #0x3ac
	add r0, r0, #0xc00
	add r0, r0, r8
	bl SetAnimDataFieldsWrapper
	ldr r1, [r4]
	add r0, r1, #0x3ec
	add r0, r0, #0x1800
	add r0, r0, r8
	add r1, r1, #0x1e4
	bl InitAnimDataFromOtherAnimDataVeneer
	ldr r0, [r4]
	mov r1, r5
	add r0, r0, #0x3ec
	add r0, r0, #0x1800
	add r0, r0, r8
	bl SetAnimDataFieldsWrapper
	add sb, sb, #1
	cmp sb, #0x10
	blt _0238A3E8
	ldr r8, _0238A510 ; =0xC8100000
	ldr r7, _0238A508 ; =SENTRY_DUTY_PTR
	mov r5, #0
	mov r6, #0xc4
_0238A494:
	mul r4, r5, r6
	ldr r1, [r7]
	add r0, r1, #0x2c
	add r0, r0, #0x2800
	add r0, r0, r4
	add r1, r1, #0x1e4
	bl InitAnimDataFromOtherAnimDataVeneer
	ldr r0, [r7]
	mov r1, r8
	add r0, r0, #0x2c
	add r0, r0, #0x2800
	add r0, r0, r4
	bl SetAnimDataFieldsWrapper
	add r5, r5, #1
	cmp r5, #2
	blt _0238A494
	ldr r0, _0238A508 ; =SENTRY_DUTY_PTR
	ldr r2, [r0]
	ldr r0, [r2, #0x11c]
	cmp r0, #2
	mov r0, #4
	streq r0, [r2, #0x108]
	beq _0238A4FC
	mov r1, #6
	str r1, [r2, #0x108]
	bl PlayBgmByIdVeneer
_0238A4FC:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0238A504: .word 0x000038D4
_0238A508: .word SENTRY_DUTY_PTR
_0238A50C: .word 0x88080000
_0238A510: .word 0xC8100000
	arm_func_end SentrySetupState

	arm_func_start ov14_0238A514
ov14_0238A514: ; 0x0238A514
	stmdb sp!, {r3, lr}
	ldr r0, _0238A6AC ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #2
	bne _0238A540
	ldrsb r0, [r1, #1]
	mvn r1, #1
	cmp r0, r1
	beq _0238A540
	bl sub_0202F334
_0238A540:
	ldr r0, _0238A6AC ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #1
	bne _0238A568
	ldrsb r0, [r1]
	mvn r1, #1
	cmp r0, r1
	beq _0238A568
	bl sub_0202BC60
_0238A568:
	ldr r0, _0238A6AC ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #4
	bne _0238A590
	ldrsb r0, [r1, #2]
	mvn r1, #1
	cmp r0, r1
	beq _0238A590
	bl HidePortraitBox
_0238A590:
	ldr r0, _0238A6AC ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #8
	bne _0238A5B8
	ldrsb r0, [r1, #3]
	mvn r1, #1
	cmp r0, r1
	beq _0238A5B8
	bl sub_0202F954
_0238A5B8:
	ldr r0, _0238A6AC ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x10
	bne _0238A5E0
	ldrsb r0, [r1, #4]
	mvn r1, #1
	cmp r0, r1
	beq _0238A5E0
	bl sub_0202F954
_0238A5E0:
	ldr r0, _0238A6AC ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x20
	bne _0238A608
	ldrsb r0, [r1, #5]
	mvn r1, #1
	cmp r0, r1
	beq _0238A608
	bl sub_0202F954
_0238A608:
	ldr r0, _0238A6AC ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x40
	bne _0238A630
	ldrsb r0, [r1, #6]
	mvn r1, #1
	cmp r0, r1
	beq _0238A630
	bl HidePortraitBox
_0238A630:
	ldr r0, _0238A6AC ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x80
	bne _0238A658
	ldrsb r0, [r1, #7]
	mvn r1, #1
	cmp r0, r1
	beq _0238A658
	bl HidePortraitBox
_0238A658:
	ldr r0, _0238A6AC ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x100
	bne _0238A680
	ldrsb r0, [r1, #8]
	mvn r1, #1
	cmp r0, r1
	beq _0238A680
	bl HidePortraitBox
_0238A680:
	ldr r0, _0238A6AC ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x200
	ldmneia sp!, {r3, pc}
	ldrsb r0, [r1, #9]
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl HidePortraitBox
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238A6AC: .word SENTRY_DUTY_PTR
	arm_func_end ov14_0238A514

	arm_func_start ov14_0238A6B0
ov14_0238A6B0: ; 0x0238A6B0
	stmdb sp!, {r3, lr}
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #2
	bne _0238A71C
	ldrsb r0, [r1, #1]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A710
	bl IsDialogueBoxActive
	cmp r0, #0
	movne r2, #0
	bne _0238A710
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl CloseDialogueBox
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #1]
_0238A710:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A71C:
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #1
	bne _0238A784
	ldrsb r0, [r1]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A778
	bl IsAdvancedMenuActive2
	cmp r0, #0
	movne r2, #0
	bne _0238A778
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	ldrsb r0, [r0]
	bl CloseAdvancedMenu
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0]
_0238A778:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A784:
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #4
	bne _0238A7EC
	ldrsb r0, [r1, #2]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A7E0
	bl PortraitBoxNeedsUpdate
	cmp r0, #0
	movne r2, #0
	bne _0238A7E0
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #2]
	bl ClosePortraitBox
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #2]
_0238A7E0:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A7EC:
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #8
	bne _0238A854
	ldrsb r0, [r1, #3]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A848
	bl IsTextBoxActive
	cmp r0, #0
	movne r2, #0
	bne _0238A848
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	bl CloseTextBox
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #3]
_0238A848:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A854:
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x10
	bne _0238A8BC
	ldrsb r0, [r1, #4]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A8B0
	bl IsTextBoxActive
	cmp r0, #0
	movne r2, #0
	bne _0238A8B0
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl CloseTextBox
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #4]
_0238A8B0:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A8BC:
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x20
	bne _0238A924
	ldrsb r0, [r1, #5]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A918
	bl IsTextBoxActive
	cmp r0, #0
	movne r2, #0
	bne _0238A918
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	bl CloseTextBox
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #5]
_0238A918:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A924:
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x40
	bne _0238A98C
	ldrsb r0, [r1, #6]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A980
	bl PortraitBoxNeedsUpdate
	cmp r0, #0
	movne r2, #0
	bne _0238A980
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #6]
	bl ClosePortraitBox
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #6]
_0238A980:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A98C:
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x80
	bne _0238A9F4
	ldrsb r0, [r1, #7]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238A9E8
	bl PortraitBoxNeedsUpdate
	cmp r0, #0
	movne r2, #0
	bne _0238A9E8
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #7]
	bl ClosePortraitBox
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #7]
_0238A9E8:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238A9F4:
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x100
	bne _0238AA5C
	ldrsb r0, [r1, #8]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238AA50
	bl PortraitBoxNeedsUpdate
	cmp r0, #0
	movne r2, #0
	bne _0238AA50
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #8]
	bl ClosePortraitBox
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #8]
_0238AA50:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238AA5C:
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x200
	bne _0238AAC4
	ldrsb r0, [r1, #9]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238AAB8
	bl PortraitBoxNeedsUpdate
	cmp r0, #0
	movne r2, #0
	bne _0238AAB8
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #9]
	bl ClosePortraitBox
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #9]
_0238AAB8:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238AAC4:
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x40000000
	bne _0238AB2C
	ldrsb r0, [r1, #0xa]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238AB20
	bl IsSimpleMenuActive
	cmp r0, #0
	movne r2, #0
	bne _0238AB20
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #0xa]
	bl CloseSimpleMenu
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #0xa]
_0238AB20:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238AB2C:
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x80000000
	bne _0238AB94
	ldrsb r0, [r1, #0xb]
	mvn r1, #1
	cmp r0, r1
	moveq r2, #1
	beq _0238AB88
	bl IsSimpleMenuActive
	cmp r0, #0
	movne r2, #0
	bne _0238AB88
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #0xb]
	bl CloseSimpleMenu
	ldr r0, _0238AB9C ; =SENTRY_DUTY_PTR
	mvn r1, #1
	ldr r0, [r0]
	mov r2, #1
	strb r1, [r0, #0xb]
_0238AB88:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0238AB94:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238AB9C: .word SENTRY_DUTY_PTR
	arm_func_end ov14_0238A6B0
