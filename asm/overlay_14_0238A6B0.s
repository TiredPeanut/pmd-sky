	.include "asm/macros.inc"
	.include "overlay_14_0238A6B0.inc"

	.text

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
