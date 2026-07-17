	.include "asm/macros.inc"
	.include "overlay_14_0238B7FC.inc"

	.text

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
