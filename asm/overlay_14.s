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

	arm_func_start ov14_0238ABA0
ov14_0238ABA0: ; 0x0238ABA0
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x54
	mov r4, r1
	mov r1, r4, lsl #0x10
	mov r5, r0
	mov r0, r1, asr #0x10
	bl GetSentryDutyGamePoints
#ifdef JAPAN
	add r1, r4, #0x49
	add r1, r1, #0x3d00
#else
	add r1, r4, #0x6e0
#endif
	mov r1, r1, lsl #0x10
	str r0, [sp, #0x28]
	mov r0, r1, lsr #0x10
	bl StringFromId
	str r0, [sp, #0x3c]
	add r0, sp, #4
	str r0, [sp]
	ldr r2, _0238ABFC ; =ov14_0238DAE8
	ldr r3, _0238AC00 ; =0x0000C402
	mov r0, r5
	mov r1, #0x400
	bl PreprocessString
	mov r0, r5
	add sp, sp, #0x54
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0238ABFC: .word ov14_0238DAE8
_0238AC00: .word 0x0000C402
	arm_func_end ov14_0238ABA0

	arm_func_start ov14_0238AC04
ov14_0238AC04: ; 0x0238AC04
	stmdb sp!, {r3, lr}
	rsb ip, r0, #0x10
	mov r3, #1
	ldr r0, _0238AC3C ; =ov14_0238DB84
	mov r1, r3
	mov r2, #2
_0238AC1C:
	cmp r3, ip
	movge lr, r2
	movlt lr, r1
	strb lr, [r0, r3]
	add r3, r3, #1
	cmp r3, #0x10
	blt _0238AC1C
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238AC3C: .word ov14_0238DB84
	arm_func_end ov14_0238AC04

	arm_func_start ov14_0238AC40
ov14_0238AC40: ; 0x0238AC40
	stmdb sp!, {r3, lr}
	ldr r1, _0238ACE4 ; =SENTRY_DUTY_PTR
	ldr ip, [r1]
	add r0, ip, #0x3000
	ldr r2, [r0, #0x880]
	ldr r3, [r0, #0x888]
	mov r0, r2, lsl #2
#ifdef JAPAN
	add r0, r0, #0xd60
	add r0, r0, #0x3000
#else
	add r0, r0, #0xf7
	add r0, r0, #0x600
#endif
	add r0, r3, r0
	str r0, [ip, #0x114]
	ldr r0, [r1]
	ldrsb r0, [r0, #1]
	bl ShowDialogueBox
	ldr r0, _0238ACE4 ; =SENTRY_DUTY_PTR
	ldr r1, _0238ACE8 ; =0x00000408
	ldr r3, [r0]
	ldr r2, [r3, #0x114]
	ldrsb r0, [r3, #1]
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	add r3, r3, #0xa4
	bl ShowStringIdInDialogueBox
	ldr r0, _0238ACE4 ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl ShowDialogueBox
	ldr r1, _0238ACE4 ; =SENTRY_DUTY_PTR
	ldr r0, [r1]
	add r0, r0, #0x3000
	ldr r2, [r0, #0x888]
	add r2, r2, #1
	str r2, [r0, #0x888]
	ldr r0, [r1]
	add r2, r0, #0x3000
	ldr r0, [r2, #0x888]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #30
	add r0, r1, r0, ror #30
	str r0, [r2, #0x888]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238ACE4: .word SENTRY_DUTY_PTR
_0238ACE8: .word 0x00000408
	arm_func_end ov14_0238AC40

	arm_func_start ov14_0238ACEC
ov14_0238ACEC: ; 0x0238ACEC
	stmdb sp!, {r3, lr}
	mvn r1, #1
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl ClearWindow
	ldmia sp!, {r3, pc}
	arm_func_end ov14_0238ACEC

	arm_func_start ov14_0238AD04
ov14_0238AD04: ; 0x0238AD04
#ifdef JAPAN
#define OV14_0238AD04_OFFSET -2
#else
#define OV14_0238AD04_OFFSET 0
#endif
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x18
	mov r4, r0
	mvn r1, #1
	cmp r4, r1
	beq _0238ADF0
	bl ClearWindow
	ldr r0, _0238ADF8 ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldrsb r0, [r1, #4]
	cmp r4, r0
	bne _0238AD84
	add r0, r1, #0x3800
	ldrsh r1, [r0, #0xa2]
	add r0, sp, #0
	bl GetNameRaw
	mov r1, #2 + OV14_0238AD04_OFFSET
	add r3, sp, #0
	mov r0, r4
	sub r2, r1, #3 + OV14_0238AD04_OFFSET
	bl DrawTextInWindow
	ldr r1, _0238ADF8 ; =SENTRY_DUTY_PTR
	add r0, sp, #0
	ldr r1, [r1]
	add r1, r1, #0x3800
	ldrsh r1, [r1, #0xa4]
	bl GetNameRaw
	mov r1, #0x7a + OV14_0238AD04_OFFSET
	mov r0, r4
	sub r2, r1, #0x7b + OV14_0238AD04_OFFSET
	add r3, sp, #0
	bl DrawTextInWindow
_0238AD84:
	ldr r0, _0238ADF8 ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldrsb r0, [r1, #5]
	cmp r4, r0
	bne _0238ADE8
	add r0, r1, #0x3800
	ldrsh r1, [r0, #0xa6]
	add r0, sp, #0
	bl GetNameRaw
	mov r1, #2 + OV14_0238AD04_OFFSET
	add r3, sp, #0
	mov r0, r4
	sub r2, r1, #3 + OV14_0238AD04_OFFSET
	bl DrawTextInWindow
	ldr r1, _0238ADF8 ; =SENTRY_DUTY_PTR
	add r0, sp, #0
	ldr r1, [r1]
	add r1, r1, #0x3800
	ldrsh r1, [r1, #0xa8]
	bl GetNameRaw
	mov r1, #0x7a + OV14_0238AD04_OFFSET
	mov r0, r4
	sub r2, r1, #0x7b + OV14_0238AD04_OFFSET
	add r3, sp, #0
	bl DrawTextInWindow
_0238ADE8:
	mov r0, r4
	bl UpdateWindow
_0238ADF0:
	add sp, sp, #0x18
	ldmia sp!, {r4, pc}
	.align 2, 0
_0238ADF8: .word SENTRY_DUTY_PTR
	arm_func_end ov14_0238AD04

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

	arm_func_start SentrySetExitingState
SentrySetExitingState: ; 0x0238B6D8
	stmdb sp!, {r3, lr}
	ldr r0, _0238B704 ; =SENTRY_DUTY_PTR
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x118]
	bl ov14_0238A514
	ldr r0, _0238B704 ; =SENTRY_DUTY_PTR
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #0x104]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0238B704: .word SENTRY_DUTY_PTR
	arm_func_end SentrySetExitingState

	arm_func_start ov14_0238B708
ov14_0238B708: ; 0x0238B708
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _0238B7F8 ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	add r0, r0, #0x2a8
	bl ov11_022F6EFC
	ldr r7, _0238B7F8 ; =SENTRY_DUTY_PTR
	mov r4, #0
	mov r6, #0xc4
_0238B730:
	mul r5, r4, r6
	ldr r0, [r7]
	add r0, r0, #0x36c
	add r0, r0, r5
	bl ov11_022F6EFC
	ldr r0, [r7]
	add r0, r0, #0x3ac
	add r0, r0, #0xc00
	add r0, r0, r5
	bl ov11_022F6EFC
	ldr r0, [r7]
	add r0, r0, #0x3ec
	add r0, r0, #0x1800
	add r0, r0, r5
	bl ov11_022F6EFC
	add r4, r4, #1
	cmp r4, #0x10
	blt _0238B730
	ldr r5, _0238B7F8 ; =SENTRY_DUTY_PTR
	mov r6, #0
	mov r4, #0xc4
_0238B784:
	ldr r0, [r5]
	add r0, r0, #0x2c
	add r0, r0, #0x2800
	mla r0, r6, r4, r0
	bl ov11_022F6EFC
	add r6, r6, #1
	cmp r6, #2
	blt _0238B784
	ldr r0, _0238B7F8 ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	add r0, r0, #0x120
	bl ov11_022F6EFC
	ldr r0, _0238B7F8 ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	add r0, r0, #0x1e4
	bl ov11_022F6EFC
	ldr r0, _0238B7F8 ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	ldr r0, [r0, #0x11c]
	cmp r0, #2
	beq _0238B7DC
	bl sub_02017B70
_0238B7DC:
	ldr r0, _0238B7F8 ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0238B7F8 ; =SENTRY_DUTY_PTR
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0238B7F8: .word SENTRY_DUTY_PTR
	arm_func_end ov14_0238B708

	arm_func_start SentryRunState
SentryRunState: ; 0x0238B7FC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	ldr r0, _0238C12C ; =SENTRY_DUTY_PTR
	ldr r2, [r0]
	ldr r1, [r2, #0x104]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _0238C120
_0238B81C: ; jump table
	b _0238B82C ; case 0
	b _0238C0E0 ; case 1
	b _0238C0FC ; case 2
	b _0238C120 ; case 3
_0238B82C:
	ldr r1, [r2, #0x10c]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _0238C0D8
_0238B83C: ; jump table
	b _0238B84C ; case 0
	b _0238B8BC ; case 1
	b _0238C090 ; case 2
	b _0238B84C ; case 3
_0238B84C:
	mov r1, #0
	str r1, [r2, #0x10c]
	ldr r1, [r0]
	ldr r0, _0238C130 ; =SENTRY_DUTY_STATE_HANDLER_TABLE
	ldr r1, [r1, #0x108]
	ldr r0, [r0, r1, lsl #2]
	blx r0
	ldr r0, _0238C12C ; =SENTRY_DUTY_PTR
	ldr r3, [r0]
	ldr r1, [r3, #0x108]
	ldr r2, [r3, #0x110]
	cmp r1, r2
	beq _0238C0D8
	ldr r1, [r3, #0x10c]
	cmp r1, #3
	bne _0238B8A4
	str r2, [r3, #0x108]
	ldr r1, [r0]
	ldr r0, _0238C130 ; =SENTRY_DUTY_STATE_HANDLER_TABLE
	ldr r1, [r1, #0x108]
	ldr r0, [r0, r1, lsl #2]
	blx r0
_0238B8A4:
	bl ov14_0238A514
	ldr r0, _0238C12C ; =SENTRY_DUTY_PTR
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #0x10c]
	b _0238C0D8
_0238B8BC:
	bl ov14_0238A6B0
	cmp r0, #0
	beq _0238C0D8
	ldr r1, _0238C12C ; =SENTRY_DUTY_PTR
	ldr r3, [r1]
	ldr r0, [r3, #0x118]
	tst r0, #1
	beq _0238B96C
	ldrsb r2, [r3]
	mvn r0, #1
	cmp r2, r0
	bne _0238B96C
#ifdef JAPAN
	mov r0, #0
	str r0, [r3, #0xc]
	ldr r0, [r1]
	ldr r3, _0238D698_JP ; =0x00003D47
	mov r2, #0x10
	strh r3, [r0, #0x14]
	ldr r0, [r1]
	mov r4, #5
	str r2, [r0, #0x18]
	ldr r2, [r1]
	ldr r1, _0238C134 ; =0x04080800
	ldr r0, [r2, #0x11c]
#else
	mov r2, #0
	str r2, [r3, #0xc]
	ldr r2, [r1]
	add r0, r0, #0x6e0
	strh r0, [r2, #0x14]
	ldr r0, [r1]
	mov r2, #0x10
	str r2, [r0, #0x18]
	ldr r2, [r1]
	mov r4, #5
	ldr r0, [r2, #0x11c]
	ldr r1, _0238C134 ; =0x04080800
#endif
	cmp r0, #2
	str r4, [sp]
	beq _0238B94C
	ldr r0, _0238C138 ; =ov14_0238D9C8
	ldr r3, _0238C13C ; =ov14_0238ABA0
	add r2, r2, #0xc
	str r4, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _0238C12C ; =SENTRY_DUTY_PTR
	ldr r1, [r1]
	strb r0, [r1]
	b _0238B96C
_0238B94C:
	ldr r0, _0238C140 ; =ov14_0238D9D8
	ldr r3, _0238C13C ; =ov14_0238ABA0
	add r2, r2, #0xc
	str r4, [sp, #4]
	bl CreateAdvancedMenu
	ldr r1, _0238C12C ; =SENTRY_DUTY_PTR
	ldr r1, [r1]
	strb r0, [r1]
_0238B96C:
	ldr r0, _0238C12C ; =SENTRY_DUTY_PTR
	ldr r3, [r0]
	ldr r1, [r3, #0x118]
	tst r1, #2
	beq _0238BDA4
	ldr r5, [r3, #0x114]
	mov r2, #0x32
	str r2, [r3, #0xf0]
	ldr r1, [r0]
	sub r0, r2, #0x34
	ldrsb r1, [r1, #1]
	ldr r4, _0238C144 ; =0x00003018
	cmp r1, r0
	bne _0238B9B8
	ldr r0, _0238C148 ; =ov14_0238D9B8
	bl CreateDialogueBox
	ldr r1, _0238C12C ; =SENTRY_DUTY_PTR
	ldr r1, [r1]
	strb r0, [r1, #1]
_0238B9B8:
	ldr r0, _0238C12C ; =SENTRY_DUTY_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #1]
	bl ShowDialogueBox
	ldr r2, _0238C12C ; =SENTRY_DUTY_PTR
	ldr r0, [r2]
	ldr r1, [r0, #0x108]
	cmp r1, #0x21
	addls pc, pc, r1, lsl #2
	b _0238BD6C
_0238B9E0: ; jump table
	b _0238BD6C ; case 0
	b _0238BD6C ; case 1
	b _0238BD6C ; case 2
	b _0238BD6C ; case 3
	b _0238BA68 ; case 4
	b _0238BA68 ; case 5
	b _0238BA7C ; case 6
	b _0238BA7C ; case 7
	b _0238BA90 ; case 8
	b _0238BD6C ; case 9
	b _0238BA90 ; case 10
	b _0238BD6C ; case 11
	b _0238BAA4 ; case 12
	b _0238BAA4 ; case 13
	b _0238BD6C ; case 14
	b _0238BD6C ; case 15
	b _0238BAC0 ; case 16
	b _0238BAC0 ; case 17
	b _0238BADC ; case 18
	b _0238BADC ; case 19
	b _0238BAF0 ; case 20
	b _0238BD6C ; case 21
	b _0238BD6C ; case 22
	b _0238BB60 ; case 23
	b _0238BD6C ; case 24
	b _0238BBE0 ; case 25
	b _0238BD6C ; case 26
	b _0238BD6C ; case 27
	b _0238BC50 ; case 28
	b _0238BD6C ; case 29
	b _0238BC88 ; case 30
	b _0238BD6C ; case 31
	b _0238BCFC ; case 32
	b _0238BD6C ; case 33
_0238BA68:
	ldr r1, _0238C14C ; =0x00000142
#ifdef JAPAN
	ldr r4, _0238C144 ; =0x00003018
	str r1, [r0, #0xf0]
	add r5, r1, #0x3c00
#else
	ldr r5, _0238C150 ; =0x000006D9
	str r1, [r0, #0xf0]
	ldr r4, _0238C144 ; =0x00003018
#endif
	b _0238BD6C
_0238BA7C:
	ldr r1, _0238C14C ; =0x00000142
	ldr r5, _0238C154 ; =0x000006D8
	str r1, [r0, #0xf0]
#ifdef JAPAN
	ldr r4, _0238C144 ; =0x00003018
#else
	add r4, r5, #0x2940
#endif
	b _0238BD6C
_0238BA90:
	ldr r1, _0238C14C ; =0x00000142
	ldr r5, _0238C158 ; =0x000006DA
	str r1, [r0, #0xf0]
	ldr r4, _0238C144 ; =0x00003018
	b _0238BD6C
_0238BAA4:
	add r1, r0, #0x3800
	ldrsh r1, [r1, #0xd2]
	ldr r5, _0238C15C ; =0x000006DB
	ldr r4, _0238C160 ; =0x00003028
	orr r1, r1, #0x20000
	str r1, [r0, #0xf0]
	b _0238BD6C
_0238BAC0:
	add r1, r0, #0x3800
	ldrsh r1, [r1, #0xd2]
	ldr r5, _0238C164 ; =0x000006EB
	ldr r4, _0238C160 ; =0x00003028
	orr r1, r1, #0x20000
	str r1, [r0, #0xf0]
	b _0238BD6C
_0238BADC:
	ldr r1, _0238C14C ; =0x00000142
	ldr r5, _0238C168 ; =0x000006DC
	str r1, [r0, #0xf0]
	ldr r4, _0238C160 ; =0x00003028
	b _0238BD6C
_0238BAF0:
	add r1, r0, #0x3000
	ldr r1, [r1, #0x8ac]
	cmp r1, #0
	beq _0238BB0C
	cmp r1, #1
	beq _0238BB38
	b _0238BB58
_0238BB0C:
	add r1, r0, #0x3800
	ldrsh r1, [r1, #0xd0]
	ldr r5, _0238C16C ; =0x000006EE
	orr r1, r1, #0x20000
	str r1, [r0, #0xf0]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x8ac]
	add r1, r1, #1
	str r1, [r0, #0x8ac]
	b _0238BB58
_0238BB38:
	ldr r1, _0238C14C ; =0x00000142
	ldr r5, _0238C170 ; =0x000006EF
	str r1, [r0, #0xf0]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x8ac]
	add r1, r1, #1
	str r1, [r0, #0x8ac]
_0238BB58:
	ldr r4, _0238C160 ; =0x00003028
	b _0238BD6C
_0238BB60:
	add r1, r0, #0x3000
	ldr r1, [r1, #0x8ac]
	cmp r1, #0
	beq _0238BB7C
	cmp r1, #1
	beq _0238BBAC
	b _0238BBD8
_0238BB7C:
	ldr r3, _0238C14C ; =0x00000142
	ldr r1, _0238C174 ; =0x00002311
	str r3, [r0, #0xf0]
	ldr r0, [r2]
	ldr r5, _0238C178 ; =0x000006F1
	str r1, [r0, #0xc8]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x8ac]
	add r1, r1, #1
	str r1, [r0, #0x8ac]
	b _0238BBD8
_0238BBAC:
#ifdef JAPAN
	ldr r3, _0238C14C ; =0x00000142
	ldr r1, _0238C180 ; =0x00002C07
	str r3, [r0, #0xf0]
	ldr r0, [r2]
	ldr r5, _0238D6E4 ; =0x00003D5B
#else
	ldr r5, _0238C17C ; =0x000006F2
	ldr r1, _0238C180 ; =0x00002C07
	sub r3, r5, #0x5b0
	str r3, [r0, #0xf0]
	ldr r0, [r2]
#endif
	str r1, [r0, #0xc8]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x8ac]
	add r1, r1, #1
	str r1, [r0, #0x8ac]
_0238BBD8:
	ldr r4, _0238C160 ; =0x00003028
	b _0238BD6C
_0238BBE0:
	add r1, r0, #0x3000
	ldr r1, [r1, #0x8ac]
	cmp r1, #0
	beq _0238BBFC
	cmp r1, #1
	beq _0238BC28
	b _0238BC48
_0238BBFC:
	add r1, r0, #0x3800
	ldrsh r1, [r1, #0xd0]
	ldr r5, _0238C184 ; =0x000006EC
	orr r1, r1, #0x20000
	str r1, [r0, #0xf0]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x8ac]
	add r1, r1, #1
	str r1, [r0, #0x8ac]
	b _0238BC48
_0238BC28:
	ldr r1, _0238C14C ; =0x00000142
	ldr r5, _0238C188 ; =0x000006ED
	str r1, [r0, #0xf0]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x8ac]
	add r1, r1, #1
	str r1, [r0, #0x8ac]
_0238BC48:
	ldr r4, _0238C160 ; =0x00003028
	b _0238BD6C
_0238BC50:
	add r1, r0, #0x3000
	ldr r1, [r1, #0x8ac]
	cmp r1, #0
	bne _0238BC80
	ldr r1, _0238C14C ; =0x00000142
#ifdef JAPAN
	ldr r5, _0238D6F0_JP ; =0x00003D59
#else
	mov r5, #0x6f0
#endif
	str r1, [r0, #0xf0]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x8ac]
	add r1, r1, #1
	str r1, [r0, #0x8ac]
_0238BC80:
	ldr r4, _0238C160 ; =0x00003028
	b _0238BD6C
_0238BC88:
	add r1, r0, #0x3000
	ldr r1, [r1, #0x8ac]
	cmp r1, #0
	beq _0238BCA4
	cmp r1, #1
	beq _0238BCD4
	b _0238BCF4
_0238BCA4:
	mov r1, #0x32
	str r1, [r0, #0xf0]
	ldr r0, [r2]
	ldr r1, _0238C18C ; =0x00002C09
	ldr r5, _0238C190 ; =0x000006F3
	str r1, [r0, #0xc8]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x8ac]
	add r1, r1, #1
	str r1, [r0, #0x8ac]
	b _0238BCF4
_0238BCD4:
	ldr r1, _0238C14C ; =0x00000142
	ldr r5, _0238C194 ; =0x000006F4
	str r1, [r0, #0xf0]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x8ac]
	add r1, r1, #1
	str r1, [r0, #0x8ac]
_0238BCF4:
	ldr r4, _0238C144 ; =0x00003018
	b _0238BD6C
_0238BCFC:
	add r1, r0, #0x3000
	ldr r1, [r1, #0x8ac]
	cmp r1, #0
	beq _0238BD18
	cmp r1, #1
	beq _0238BD48
	b _0238BD68
_0238BD18:
	ldr r3, _0238C198 ; =0x000001E3
	ldr r1, _0238C18C ; =0x00002C09
	str r3, [r0, #0xf0]
	ldr r0, [r2]
	ldr r5, _0238C19C ; =0x000006F5
	str r1, [r0, #0xc8]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x8ac]
	add r1, r1, #1
	str r1, [r0, #0x8ac]
	b _0238BD68
_0238BD48:
	ldr r1, _0238C14C ; =0x00000142
	ldr r5, _0238C1A0 ; =0x000006F6
	str r1, [r0, #0xf0]
	ldr r0, [r2]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x8ac]
	add r1, r1, #1
	str r1, [r0, #0x8ac]
_0238BD68:
	ldr r4, _0238C144 ; =0x00003018
_0238BD6C:
	ldr r0, _0238C12C ; =SENTRY_DUTY_PTR
	ldr r2, [r0]
	ldr r1, [r2, #0x114]
	cmp r1, r5
	beq _0238BDA4
	str r5, [r2, #0x114]
	ldr r3, [r0]
	mov r1, r4
	ldr r2, [r3, #0x114]
	ldrsb r0, [r3, #1]
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	add r3, r3, #0xa4
	bl ShowStringIdInDialogueBox
_0238BDA4:
	ldr r0, _0238C12C ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #4
	beq _0238BE30
	ldrsb r1, [r1, #2]
	mvn r0, #1
	cmp r1, r0
	bne _0238BE30
	mov r0, #0
	mov r1, #3
	mov r2, #1
	bl CreatePortraitBox
	ldr r2, _0238C12C ; =SENTRY_DUTY_PTR
	mov r1, #0x32
	ldr r3, [r2]
	strb r0, [r3, #2]
	ldr r0, [r2]
	add r0, r0, #0xf4
	bl InitPortraitParamsWithMonsterId
	ldr r0, _0238C12C ; =SENTRY_DUTY_PTR
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0xf4
	bl SetPortraitLayout
	ldr r0, _0238C12C ; =SENTRY_DUTY_PTR
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0xf4
	bl SetPortraitEmotion
	ldr r0, _0238C12C ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldrsb r0, [r1, #2]
	add r1, r1, #0xf4
	bl ShowPortraitInPortraitBox
_0238BE30:
	ldr r0, _0238C12C ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #8
	beq _0238BE6C
	ldrsb r1, [r1, #3]
	mvn r0, #1
	cmp r1, r0
	bne _0238BE6C
	ldr r0, _0238C1A4 ; =ov14_0238D9F8
	ldr r1, _0238C1A8 ; =ov14_0238ACEC
	bl CreateTextBox
	ldr r1, _0238C12C ; =SENTRY_DUTY_PTR
	ldr r1, [r1]
	strb r0, [r1, #3]
_0238BE6C:
	ldr r0, _0238C12C ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x10
	beq _0238BEA8
	ldrsb r1, [r1, #4]
	mvn r0, #1
	cmp r1, r0
	bne _0238BEA8
	ldr r0, _0238C1AC ; =ov14_0238D988
	ldr r1, _0238C1B0 ; =ov14_0238AD04
	bl CreateTextBox
	ldr r1, _0238C12C ; =SENTRY_DUTY_PTR
	ldr r1, [r1]
	strb r0, [r1, #4]
_0238BEA8:
	ldr r0, _0238C12C ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x20
	beq _0238BEE4
	ldrsb r1, [r1, #5]
	mvn r0, #1
	cmp r1, r0
	bne _0238BEE4
	ldr r0, _0238C1B4 ; =ov14_0238D998
	ldr r1, _0238C1B0 ; =ov14_0238AD04
	bl CreateTextBox
	ldr r1, _0238C12C ; =SENTRY_DUTY_PTR
	ldr r1, [r1]
	strb r0, [r1, #5]
_0238BEE4:
	ldr r0, _0238C12C ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x40
	beq _0238BF24
	ldrsb r1, [r1, #6]
	mvn r0, #1
	cmp r1, r0
	bne _0238BF24
	mov r0, #0
	mov r2, r0
	mov r1, #3
	bl CreatePortraitBox
	ldr r1, _0238C12C ; =SENTRY_DUTY_PTR
	ldr r1, [r1]
	strb r0, [r1, #6]
_0238BF24:
	ldr r0, _0238C12C ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x80
	beq _0238BF64
	ldrsb r1, [r1, #7]
	mvn r0, #1
	cmp r1, r0
	bne _0238BF64
	mov r0, #0
	mov r2, r0
	mov r1, #4
	bl CreatePortraitBox
	ldr r1, _0238C12C ; =SENTRY_DUTY_PTR
	ldr r1, [r1]
	strb r0, [r1, #7]
_0238BF64:
	ldr r0, _0238C12C ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x100
	beq _0238BFA4
	ldrsb r1, [r1, #8]
	mvn r0, #1
	cmp r1, r0
	bne _0238BFA4
	mov r0, #0
	mov r2, r0
	mov r1, #5
	bl CreatePortraitBox
	ldr r1, _0238C12C ; =SENTRY_DUTY_PTR
	ldr r1, [r1]
	strb r0, [r1, #8]
_0238BFA4:
	ldr r0, _0238C12C ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x200
	beq _0238BFE4
	ldrsb r1, [r1, #9]
	mvn r0, #1
	cmp r1, r0
	bne _0238BFE4
	mov r0, #0
	mov r2, r0
	mov r1, #6
	bl CreatePortraitBox
	ldr r1, _0238C12C ; =SENTRY_DUTY_PTR
	ldr r1, [r1]
	strb r0, [r1, #9]
_0238BFE4:
	ldr r0, _0238C12C ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x40000000
	beq _0238C030
	ldrsb r1, [r1, #0xa]
	mvn r0, #1
	cmp r1, r0
	bne _0238C030
	ldr r0, _0238C1B8 ; =ov14_0238D9A8
	mov r4, #8
	ldr r3, _0238C1BC ; =SENTRY_DEBUG_MENU_ITEMS
	mov r1, #0x13
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238C12C ; =SENTRY_DUTY_PTR
	ldr r1, [r1]
	strb r0, [r1, #0xa]
_0238C030:
	ldr r0, _0238C12C ; =SENTRY_DUTY_PTR
	ldr r1, [r0]
	ldr r0, [r1, #0x118]
	tst r0, #0x80000000
	beq _0238C07C
	ldrsb r1, [r1, #0xb]
	mvn r0, #1
	cmp r1, r0
	bne _0238C07C
	ldr r0, _0238C1C0 ; =ov14_0238D9E8
	mov r4, #2
	ldr r3, _0238C1C4 ; =ov14_0238DA08
	mov r1, #0x13
	mov r2, #0
	str r4, [sp]
	bl CreateSimpleMenuFromStringIds
	ldr r1, _0238C12C ; =SENTRY_DUTY_PTR
	ldr r1, [r1]
	strb r0, [r1, #0xb]
_0238C07C:
	ldr r0, _0238C12C ; =SENTRY_DUTY_PTR
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #0x10c]
	b _0238C0D8
_0238C090:
	ldr r0, [r2, #0x118]
	tst r0, #2
	beq _0238C0B0
	ldrsb r0, [r2, #1]
	bl IsDialogueBoxActive
	cmp r0, #0
	movne r0, #0
	bne _0238C0B4
_0238C0B0:
	mov r0, #1
_0238C0B4:
	cmp r0, #0
	beq _0238C0D8
	ldr r0, _0238C12C ; =SENTRY_DUTY_PTR
	mov r2, #0
	ldr r1, [r0]
	str r2, [r1, #0x10c]
	ldr r1, [r0]
	ldr r0, [r1, #0x110]
	str r0, [r1, #0x108]
_0238C0D8:
	mov r0, #1
	b _0238C124
_0238C0E0:
	bl ov14_0238A6B0
	cmp r0, #0
	ldrne r0, _0238C12C ; =SENTRY_DUTY_PTR
	movne r1, #2
	ldrne r0, [r0]
	strne r1, [r0, #0x104]
	b _0238C120
_0238C0FC:
	mov r1, #3
	str r1, [r2, #0x104]
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldr r0, [r0, #0x890]
	bl ReturnScriptMenuResult
	bl ov14_0238B708
	mov r0, #4
	b _0238C124
_0238C120:
	mov r0, #1
_0238C124:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
#ifdef JAPAN
#define SENTRY_RUN_STATE_OFFSET 0x3669
#else
#define SENTRY_RUN_STATE_OFFSET 0
#endif
_0238C12C: .word SENTRY_DUTY_PTR
_0238C130: .word SENTRY_DUTY_STATE_HANDLER_TABLE
#ifdef JAPAN
_0238D698_JP: .word 0x00003D47
#endif
_0238C134: .word 0x04080800
_0238C138: .word ov14_0238D9C8
_0238C13C: .word ov14_0238ABA0
_0238C140: .word ov14_0238D9D8
_0238C144: .word 0x00003018
_0238C148: .word ov14_0238D9B8
_0238C14C: .word 0x00000142
#ifndef JAPAN
_0238C150: .word 0x000006D9
#endif
_0238C154: .word 0x000006D8 + SENTRY_RUN_STATE_OFFSET
_0238C158: .word 0x000006DA + SENTRY_RUN_STATE_OFFSET
_0238C15C: .word 0x000006DB + SENTRY_RUN_STATE_OFFSET
_0238C160: .word 0x00003028
_0238C164: .word 0x000006EB + SENTRY_RUN_STATE_OFFSET
_0238C168: .word 0x000006DC + SENTRY_RUN_STATE_OFFSET
_0238C16C: .word 0x000006EE + SENTRY_RUN_STATE_OFFSET
_0238C170: .word 0x000006EF + SENTRY_RUN_STATE_OFFSET
_0238C174: .word 0x00002311
_0238C178: .word 0x000006F1 + SENTRY_RUN_STATE_OFFSET
#ifdef JAPAN
_0238C180: .word 0x00002C07
_0238D6E4: .word 0x00003D5B
#else
_0238C17C: .word 0x000006F2
_0238C180: .word 0x00002C07
#endif
_0238C184: .word 0x000006EC + SENTRY_RUN_STATE_OFFSET
_0238C188: .word 0x000006ED + SENTRY_RUN_STATE_OFFSET
#ifdef JAPAN
_0238D6F0_JP: .word 0x00003D59
#endif
_0238C18C: .word 0x00002C09
_0238C190: .word 0x000006F3 + SENTRY_RUN_STATE_OFFSET
_0238C194: .word 0x000006F4 + SENTRY_RUN_STATE_OFFSET
_0238C198: .word 0x000001E3
_0238C19C: .word 0x000006F5 + SENTRY_RUN_STATE_OFFSET
_0238C1A0: .word 0x000006F6 + SENTRY_RUN_STATE_OFFSET
_0238C1A4: .word ov14_0238D9F8
_0238C1A8: .word ov14_0238ACEC
_0238C1AC: .word ov14_0238D988
_0238C1B0: .word ov14_0238AD04
_0238C1B4: .word ov14_0238D998
_0238C1B8: .word ov14_0238D9A8
_0238C1BC: .word SENTRY_DEBUG_MENU_ITEMS
_0238C1C0: .word ov14_0238D9E8
_0238C1C4: .word ov14_0238DA08
	arm_func_end SentryRunState
