	.include "asm/macros.inc"
	.include "overlay_29_0233861C.inc"

	.text

	arm_func_start UpdateShouldBoostHiddenStairsSpawnChance
UpdateShouldBoostHiddenStairsSpawnChance: ; 0x0233861C
	stmdb sp!, {r3, lr}
	ldr r0, _02338658 ; =DUNGEON_PTR
	mov r2, #0
	ldr r1, [r0]
	mov r0, #0x5f
	add r1, r1, #0x12000
#ifdef JAPAN
	strb r2, [r1, #0xa81]
#else
	strb r2, [r1, #0xb25]
#endif
	bl TeamMemberHasExclusiveItemEffectActive
	cmp r0, #0
	ldrne r0, _02338658 ; =DUNGEON_PTR
	movne r1, #1
	ldrne r0, [r0]
	addne r0, r0, #0x12000
#ifdef JAPAN
	strneb r1, [r0, #0xa81]
#else
	strneb r1, [r0, #0xb25]
#endif
	ldmia sp!, {r3, pc}
	.align 2, 0
_02338658: .word DUNGEON_PTR
	arm_func_end UpdateShouldBoostHiddenStairsSpawnChance

	arm_func_start IsSecretRoom
IsSecretRoom: ; 0x0233865C
	ldr r0, _02338680 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrb r0, [r0, #0x36]
#else
	ldrb r0, [r0, #0xda]
#endif
	cmp r0, #0x71
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_02338680: .word DUNGEON_PTR
	arm_func_end IsSecretRoom

	arm_func_start IsSecretFloor
IsSecretFloor: ; 0x02338684
	stmdb sp!, {r3, lr}
	bl IsSecretBazaar
	cmp r0, #0
	bne _023386A0
	bl IsSecretRoom
	cmp r0, #0
	beq _023386A8
_023386A0:
	mov r0, #1
	ldmia sp!, {r3, pc}
_023386A8:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end IsSecretFloor

	arm_func_start GetCurrentHiddenStairsType
GetCurrentHiddenStairsType: ; 0x023386B0
	stmdb sp!, {r3, lr}
	bl IsSecretBazaar
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, pc}
	bl IsSecretRoom
	cmp r0, #0
	movne r0, #2
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end GetCurrentHiddenStairsType

	arm_func_start HiddenStairsPresent
HiddenStairsPresent: ; 0x023386D8
	ldr r0, _02338704 ; =DUNGEON_PTR
	mvn r1, #0
	ldr r0, [r0]
	add r0, r0, #0xcc00
#ifdef JAPAN
	ldrsh r2, [r0, #0x44]
	cmp r2, r1
	ldrnesh r0, [r0, #0x46]
#else
	ldrsh r2, [r0, #0xe8]
	cmp r2, r1
	ldrnesh r0, [r0, #0xea]
#endif
	cmpne r0, r1
	moveq r0, #0
	movne r0, #1
	bx lr
	.align 2, 0
_02338704: .word DUNGEON_PTR
	arm_func_end HiddenStairsPresent

	arm_func_start PositionIsOnHiddenStairs
PositionIsOnHiddenStairs: ; 0x02338708
	ldr r1, _02338738 ; =DUNGEON_PTR
	ldrsh r2, [r0]
	ldr r1, [r1]
	add r1, r1, #0xcc00
#ifdef JAPAN
	ldrsh r3, [r1, #0x44]
	cmp r3, r2
	ldreqsh r1, [r1, #0x46]
#else
	ldrsh r3, [r1, #0xe8]
	cmp r3, r2
	ldreqsh r1, [r1, #0xea]
#endif
	ldreqsh r0, [r0, #2]
	cmpeq r1, r0
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_02338738: .word DUNGEON_PTR
	arm_func_end PositionIsOnHiddenStairs

	arm_func_start ov29_0233873C
ov29_0233873C: ; 0x0233873C
	stmdb sp!, {r3, lr}
	bl HiddenStairsPresent
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, _02338764 ; =DUNGEON_PTR
	ldr r0, [r0]
#ifdef JAPAN
	add r0, r0, #0x44
#else
	add r0, r0, #0xe8
#endif
	add r0, r0, #0xcc00
	bl ov29_02338768
	ldmia sp!, {r3, pc}
	.align 2, 0
_02338764: .word DUNGEON_PTR
	arm_func_end ov29_0233873C

	arm_func_start ov29_02338768
ov29_02338768: ; 0x02338768
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl ov29_022E2418
	mov r4, r0
	ldrsh r0, [r5]
	ldrsh r1, [r5, #2]
	bl GetTileSafe
	str r4, [r0, #0x10]
	mov r0, #0
	strb r0, [r4, #0x20]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_02338768

	arm_func_start HiddenStairsTrigger
HiddenStairsTrigger: ; 0x02338794
#ifdef JAPAN
#define HIDDEN_STAIRS_TRIGGER_OFFSET -0xA4
#else
#define HIDDEN_STAIRS_TRIGGER_OFFSET 0
#endif
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl HiddenStairsPresent
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _02338848 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r1, r0, #0xcc00
	ldrsh r0, [r1, #0xe8 + HIDDEN_STAIRS_TRIGGER_OFFSET]
	ldrsh r1, [r1, #0xea + HIDDEN_STAIRS_TRIGGER_OFFSET]
	bl GetTileSafe
	mov r4, r0
	ldr r0, [r4, #0x10]
	ldrb r0, [r0, #0x20]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, _02338848 ; =DUNGEON_PTR
	ldr r2, [r0]
	add r0, r2, #0x1a000
	ldrb r1, [r0, #0x246 + HIDDEN_STAIRS_TRIGGER_OFFSET]
	cmp r1, #0
	ldreqb r0, [r0, #0x244 + HIDDEN_STAIRS_TRIGGER_OFFSET]
	cmpeq r0, #0
	bne _0233881C
	cmp r5, #0
	beq _0233881C
	add r0, r2, #0xe8 + HIDDEN_STAIRS_TRIGGER_OFFSET
	add r0, r0, #0xcc00
	mov r1, #0x41
	mov r2, #1
	bl PlayEffectAnimationPos
	bl GetLeader
	ldr r1, _0233884C ; =0x00000F31
	bl LogMessageByIdWithPopupCheckUser
_0233881C:
	ldr r1, [r4, #0x10]
	mov r2, #1
	ldr r0, _02338848 ; =DUNGEON_PTR
	strb r2, [r1, #0x20]
	ldr r0, [r0]
	add r1, r0, #0xcc00
	ldrsh r0, [r1, #0xe8 + HIDDEN_STAIRS_TRIGGER_OFFSET]
	ldrsh r1, [r1, #0xea + HIDDEN_STAIRS_TRIGGER_OFFSET]
	bl DrawMinimapTile
	bl UpdateTrapsVisibility
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02338848: .word DUNGEON_PTR
#ifdef JAPAN
_0233884C: .word 0x000008A8
#else
_0233884C: .word 0x00000F31
#endif
	arm_func_end HiddenStairsTrigger

	arm_func_start GetHiddenStairsField
GetHiddenStairsField: ; 0x02338850
	ldr r0, _02338864 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldr r0, [r0, #0x28]
#else
	ldr r0, [r0, #0xcc]
#endif
	bx lr
	.align 2, 0
_02338864: .word DUNGEON_PTR
	arm_func_end GetHiddenStairsField

	arm_func_start SetHiddenStairsField
SetHiddenStairsField: ; 0x02338868
	ldr r1, _0233887C ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x4000
#ifdef JAPAN
	str r0, [r1, #0x28]
#else
	str r0, [r1, #0xcc]
#endif
	bx lr
	.align 2, 0
_0233887C: .word DUNGEON_PTR
	arm_func_end SetHiddenStairsField

	arm_func_start GetHiddenFloorField
GetHiddenFloorField: ; 0x02338880
	ldr r0, _02338894 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldr r0, [r0, #0x2c]
#else
	ldr r0, [r0, #0xd0]
#endif
	bx lr
	.align 2, 0
_02338894: .word DUNGEON_PTR
	arm_func_end GetHiddenFloorField

	arm_func_start SetHiddenFloorField
SetHiddenFloorField: ; 0x02338898
	ldr r1, _023388AC ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x4000
#ifdef JAPAN
	str r0, [r1, #0x2c]
#else
	str r0, [r1, #0xd0]
#endif
	bx lr
	.align 2, 0
_023388AC: .word DUNGEON_PTR
	arm_func_end SetHiddenFloorField

	arm_func_start LoadWeather3DFiles
LoadWeather3DFiles: ; 0x023388B0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	ldr r0, _02338974 ; =ov29_02352F1C
	mov sl, #0
	ldr r1, [r0, #4]
	ldr r0, [r0]
	ldr r7, _02338978 ; =ov29_02352F40
	add r8, sp, #0
	str r1, [sp, #4]
	str r0, [sp]
	mov r6, #4
	mov r5, #0x300
	mov fp, sl
	mov r4, #0x14
_023388E8:
	mul sb, sl, r4
	ldrh r2, [r7, sb]
	mov r0, r8
	mov r1, r6
	mov r3, r5
	add sb, r7, sb
	bl LoadWteFromFileDirectory
	ldrsh r2, [sb, #8]
	ldr r0, [sp, #4]
	ldr r1, [sb, #4]
	mov r3, fp
	bl ProcessWte
	mov r0, r8
	bl DelayWteFree
	add sl, sl, #1
	cmp sl, #3
	blt _023388E8
	ldr r0, _0233897C ; =ov29_0237CACC
	mov r1, #0
	bl ov29_02338D94
	ldr r0, _02338980 ; =ov29_0237CD40
	mov r1, #1
	bl ov29_02338D94
	ldr r0, _02338984 ; =ov29_02352F7C
	ldr r2, _0233897C ; =ov29_0237CACC
	mov r1, #0
	ldr r4, [r0]
	strb r1, [r2, #0x240]
	ldr r3, [r0, #4]
	str r4, [r2, #0x254]
	ldr r0, _02338980 ; =ov29_0237CD40
	str r3, [r2, #0x258]
	bl ov29_02338D34
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02338974: .word ov29_02352F1C
_02338978: .word ov29_02352F40
_0233897C: .word ov29_0237CACC
_02338980: .word ov29_0237CD40
_02338984: .word ov29_02352F7C
	arm_func_end LoadWeather3DFiles

	arm_func_start ov29_02338988
ov29_02338988: ; 0x02338988
	stmdb sp!, {r3, lr}
	ldr r0, _023389BC ; =ov29_0237CACC
	bl ov29_02338D58
	cmp r0, #0
	bne _023389AC
	ldr r0, _023389C0 ; =ov29_0237CD40
	bl ov29_02338D58
	cmp r0, #0
	beq _023389B4
_023389AC:
	mov r0, #1
	ldmia sp!, {r3, pc}
_023389B4:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_023389BC: .word ov29_0237CACC
_023389C0: .word ov29_0237CD40
	arm_func_end ov29_02338988

	arm_func_start ov29_023389C4
ov29_023389C4: ; 0x023389C4
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mov r4, r0
	mov r0, #0xc
	mul r2, r4, r0
	ldr r1, _02338A3C ; =ov10_022C6326
	ldr r0, _02338A40 ; =ov29_0237CACC
	ldrb r1, [r1, r2]
	bl ov29_02338D34
	cmp r4, #0xc3
	bne _02338A34
	ldr r1, _02338A44 ; =ov29_02352F1C
	ldr r2, _02338A48 ; =0x000003EB
	ldr r3, [r1, #0xc]
	ldr ip, [r1, #8]
	str r3, [sp, #4]
	add r0, sp, #0
	mov r1, #4
	mov r3, #0
	str ip, [sp]
	bl LoadWteFromFileDirectory
	ldr r0, [sp, #4]
	mov r1, #0xb000
	mov r2, #0x14
	mov r3, #0
	bl ProcessWte
	add r0, sp, #0
	bl DelayWteFree
_02338A34:
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_02338A3C: .word ov10_022C6326
_02338A40: .word ov29_0237CACC
_02338A44: .word ov29_02352F1C
_02338A48: .word 0x000003EB
	arm_func_end ov29_023389C4

	arm_func_start ov29_02338A4C
ov29_02338A4C: ; 0x02338A4C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r1, _02338AB4 ; =ov29_02353730
	mov r4, r0
	ldrb r1, [r1, r4, lsl #3]
	ldr r0, _02338AB8 ; =ov29_0237CD40
	bl ov29_02338D34
	ldr r1, _02338ABC ; =ov29_0235372C
	mov sb, #0
	ldr r7, [r1, r4, lsl #3]
	ldr r0, _02338AC0 ; =ov29_0237CACC
	ldr r5, _02338AB8 ; =ov29_0237CD40
	str r7, [r0, #0x4e4]
	mov r6, sb
	mov r4, #0xc0
_02338A84:
	mla sl, sb, r4, r5
	mov r8, r6
_02338A8C:
	mov r1, r7
	add r0, sl, r8, lsl #6
	bl ov29_02338E50
	add r8, r8, #1
	cmp r8, #3
	blt _02338A8C
	add sb, sb, #1
	cmp sb, #3
	blt _02338A84
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_02338AB4: .word ov29_02353730
_02338AB8: .word ov29_0237CD40
_02338ABC: .word ov29_0235372C
_02338AC0: .word ov29_0237CACC
	arm_func_end ov29_02338A4C

	arm_func_start RenderWeather3D
RenderWeather3D: ; 0x02338AC4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r5, #0
_02338ACC:
	ldr r1, _02338D28 ; =ov29_0237CACC
	mov r0, #0x274
	mla r6, r5, r0, r1
	ldrb r0, [r6, #0x240]
	cmp r0, #0
	beq _02338D18
	bl ov29_022E3580
	cmp r0, #0
	movne r0, #0
	strneb r0, [r6, #0x26d]
	bne _02338B04
	mov r0, r6
	mov r1, #1
	bl ov29_02338D6C
_02338B04:
	mov r0, r6
	bl ov29_02338D58
	cmp r0, #0
	beq _02338D18
	ldr r4, [r6, #0x24c]
	ldr fp, [r6, #0x250]
	mov r7, #0
_02338B20:
	mov r0, #0xc0
	mla sl, r7, r0, r6
	mov r0, r7, lsl #7
	add sb, r0, fp, asr #8
	mov r0, sb, lsl #0x10
	mov r0, r0, asr #0x10
	mov r8, #0
	str r0, [sp]
_02338B40:
	cmp sb, #0xc0
	bge _02338B74
	mov r0, r8, lsl #7
	ldr r1, [r6, #0x244]
	add r2, r0, r4, asr #8
	mov r0, r8, lsl #6
	strh r2, [sl, r0]
	ldr r2, [sp]
	add r0, sl, r8, lsl #6
	strh r2, [r0, #2]
	mov r1, r1, asr #8
	strb r1, [r0, #0x2f]
	bl sub_0201F2A0
_02338B74:
	add r8, r8, #1
	cmp r8, #3
	blt _02338B40
	add r7, r7, #1
	cmp r7, #3
	blt _02338B20
	ldrb r0, [r6, #0x240]
	cmp r0, #9
	beq _02338BBC
	ldr r1, [r6, #0x24c]
	ldr r0, [r6, #0x254]
	add r0, r1, r0
	str r0, [r6, #0x24c]
	ldr r1, [r6, #0x250]
	ldr r0, [r6, #0x258]
	add r0, r1, r0
	str r0, [r6, #0x250]
	b _02338C48
_02338BBC:
	ldr r0, [r6, #0x25c]
	bl SinAbs4096
	ldr r3, [r6, #0x254]
	mov r2, #0xa
	mov r1, r0
	mul r0, r3, r2
	bl MultiplyByFixedPoint
	ldr r1, [r6, #0x24c]
	add r0, r1, r0
	str r0, [r6, #0x24c]
	ldr r0, [r6, #0x260]
	bl SinAbs4096
	ldr r3, [r6, #0x258]
	mov r2, #0xa
	mov r1, r0
	mul r0, r3, r2
	bl MultiplyByFixedPoint
	ldr r2, [r6, #0x250]
	ldr r1, _02338D2C ; =0x00000FFF
	add r0, r2, r0
	str r0, [r6, #0x250]
	ldr r2, [r6, #0x25c]
	ldr r0, [r6, #0x264]
	add r0, r2, r0
	str r0, [r6, #0x25c]
	ldr r2, [r6, #0x260]
	ldr r0, [r6, #0x268]
	add r0, r2, r0
	str r0, [r6, #0x260]
	ldr r0, [r6, #0x25c]
	and r0, r0, r1
	str r0, [r6, #0x25c]
	ldr r0, [r6, #0x260]
	and r0, r0, r1
	str r0, [r6, #0x260]
_02338C48:
	ldr r1, [r6, #0x24c]
	cmp r1, #0
	subgt r0, r1, #0x8000
	strgt r0, [r6, #0x24c]
	bgt _02338C70
	mov r0, #0x8000
	rsb r0, r0, #0
	cmp r1, r0
	addlt r0, r1, #0x8000
	strlt r0, [r6, #0x24c]
_02338C70:
	ldr r1, [r6, #0x250]
	cmp r1, #0
	subgt r0, r1, #0x8000
	strgt r0, [r6, #0x250]
	bgt _02338C98
	mov r0, #0x8000
	rsb r0, r0, #0
	cmp r1, r0
	addlt r0, r1, #0x8000
	strlt r0, [r6, #0x250]
_02338C98:
	ldrb r0, [r6, #0x26e]
	cmp r0, #0
	beq _02338CC8
	ldr r0, [r6, #0x244]
	add r0, r0, #0x400
	str r0, [r6, #0x244]
	cmp r0, #0x4000
	movge r0, #1
	strgeb r0, [r6, #0x26c]
	movge r0, #0
	strgeb r0, [r6, #0x26e]
	b _02338D18
_02338CC8:
	ldrb r0, [r6, #0x26c]
	ldr r1, [r6, #0x244]
	cmp r0, #0
	ldr r0, [r6, #0x248]
	bne _02338CFC
	sub r0, r1, r0
	str r0, [r6, #0x244]
	cmp r0, #0x4000
	movlt r0, #1
	strltb r0, [r6, #0x26c]
	movlt r0, #0x4000
	strlt r0, [r6, #0x244]
	b _02338D18
_02338CFC:
	add r0, r1, r0
	str r0, [r6, #0x244]
	cmp r0, #0xc000
	movgt r0, #0
	strgtb r0, [r6, #0x26c]
	movgt r0, #0xc000
	strgt r0, [r6, #0x244]
_02338D18:
	add r5, r5, #1
	cmp r5, #2
	blt _02338ACC
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02338D28: .word ov29_0237CACC
_02338D2C: .word 0x00000FFF
	arm_func_end RenderWeather3D

	arm_func_start ov29_02338D30
ov29_02338D30: ; 0x02338D30
	bx lr
	arm_func_end ov29_02338D30

	arm_func_start ov29_02338D34
ov29_02338D34: ; 0x02338D34
	ldr r3, _02338D54 ; =ov29_02352F7C
	strb r1, [r0, #0x240]
	add r2, r3, r1, lsl #3
	ldr r3, [r3, r1, lsl #3]
	ldr r1, [r2, #4]
	str r3, [r0, #0x254]
	str r1, [r0, #0x258]
	bx lr
	.align 2, 0
_02338D54: .word ov29_02352F7C
	arm_func_end ov29_02338D34

	arm_func_start ov29_02338D58
ov29_02338D58: ; 0x02338D58
	ldrb r1, [r0, #0x240]
	cmp r1, #0
	moveq r0, #0
	ldrneb r0, [r0, #0x26d]
	bx lr
	arm_func_end ov29_02338D58

	arm_func_start ov29_02338D6C
ov29_02338D6C: ; 0x02338D6C
	cmp r1, #0
	beq _02338D8C
	ldrb r2, [r0, #0x26d]
	cmp r2, #0
	moveq r2, #1
	streqb r2, [r0, #0x26e]
	moveq r2, #0
	streq r2, [r0, #0x244]
_02338D8C:
	strb r1, [r0, #0x26d]
	bx lr
	arm_func_end ov29_02338D6C

	arm_func_start ov29_02338D94
ov29_02338D94: ; 0x02338D94
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov r0, #0x4000
	str r0, [sl, #0x244]
	mov r0, #0
	str r0, [sl, #0x248]
	strb r0, [sl, #0x26c]
	str r0, [sl, #0x24c]
	str r0, [sl, #0x250]
	mov r0, #0x400
	mov sb, r1
	bl DungeonRandInt
	str r0, [sl, #0x25c]
	mov r0, #0x400
	bl DungeonRandInt
	str r0, [sl, #0x260]
	mov r0, #4
	str r0, [sl, #0x264]
	mov r0, #1
	str r0, [sl, #0x268]
	mov r5, #0
	strb r0, [sl, #0x26d]
	strb r5, [sl, #0x26e]
	str sb, [sl, #0x270]
	mov fp, r5
_02338DF8:
	mov r0, #0xc0
	mla r8, r5, r0, sl
	mov r6, #0
_02338E04:
	add r7, r8, r6, lsl #6
	mov r0, r7
	mov r4, r6, lsl #6
	bl InitRender3dElement64
	strb fp, [r7, #0x3c]
	strh fp, [r8, r4]
	strh fp, [r7, #2]
	ldr r2, [sl, #0x244]
	mov r0, r7
	mov r1, sb
	strb r2, [r7, #0x2f]
	bl ov29_02338E50
	add r6, r6, #1
	cmp r6, #3
	blt _02338E04
	add r5, r5, #1
	cmp r5, #3
	blt _02338DF8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov29_02338D94

	arm_func_start ov29_02338E50
ov29_02338E50: ; 0x02338E50
	ldr r3, _02338F08 ; =ov29_02352F40
	mov r2, #0x14
	mla r2, r1, r2, r3
	ldr r3, [r2, #4]
	mov r1, #0
	str r3, [r0, #0x20]
	strh r1, [r0, #0x16]
	strh r1, [r0, #0x18]
	mov r1, #0x80
	strh r1, [r0, #0x1a]
	strh r1, [r0, #0x1c]
	ldrh r3, [r0, #0x14]
	ldr r1, _02338F0C ; =_020AFC70
	bic r3, r3, #7
	orr r3, r3, #4
	strh r3, [r0, #0x14]
	ldrh r3, [r0, #0x14]
	bic r3, r3, #0x38
	orr r3, r3, #0x20
	strh r3, [r0, #0x14]
	ldrh r3, [r0, #0x14]
	bic r3, r3, #0xc0
	strh r3, [r0, #0x14]
	ldrh r3, [r0, #0x14]
	bic r3, r3, #0x700
	orr r3, r3, #0x300
	strh r3, [r0, #0x14]
	ldrh r3, [r0, #0x14]
	bic r3, r3, #0x1800
	strh r3, [r0, #0x14]
	ldrh r3, [r0, #0x14]
	bic r3, r3, #0x6000
	strh r3, [r0, #0x14]
	ldrh r3, [r0, #0x14]
	orr r3, r3, #0x8000
	strh r3, [r0, #0x14]
	ldr r3, [r1]
	ldrsh r1, [r2, #8]
	ldr r3, [r3, #0xe0]
	add r1, r3, r1, lsl #9
	str r1, [r0, #0x24]
	ldr r1, [r2, #0xc]
	strh r1, [r0, #0x2a]
	ldr r1, [r2, #0x10]
	strb r1, [r0, #0x3e]
	bx lr
	.align 2, 0
_02338F08: .word ov29_02352F40
_02338F0C: .word _020AFC70
	arm_func_end ov29_02338E50

	arm_func_start ov29_02338F10
ov29_02338F10: ; 0x02338F10
	ldr r0, _02338F20 ; =ov29_0235376C
	mov r1, #0x64
	strh r1, [r0, #2]
	bx lr
	.align 2, 0
_02338F20: .word ov29_0235376C
	arm_func_end ov29_02338F10

	arm_func_start ov29_02338F24
ov29_02338F24: ; 0x02338F24
	ldr r2, _02338F34 ; =ov29_0235376C
	strh r0, [r2, #2]
	strh r1, [r2, #4]
	bx lr
	.align 2, 0
_02338F34: .word ov29_0235376C
	arm_func_end ov29_02338F24

	arm_func_start ov29_02338F38
ov29_02338F38: ; 0x02338F38
	ldr r1, _02338F44 ; =ov29_0237CFB8
	strb r0, [r1, #2]
	bx lr
	.align 2, 0
_02338F44: .word ov29_0237CFB8
	arm_func_end ov29_02338F38

	arm_func_start ov29_02338F48
ov29_02338F48: ; 0x02338F48
	ldr r1, _02338F54 ; =ov29_0237CFB8
	strb r0, [r1]
	bx lr
	.align 2, 0
_02338F54: .word ov29_0237CFB8
	arm_func_end ov29_02338F48

	arm_func_start ov29_02338F58
ov29_02338F58: ; 0x02338F58
	ldr r1, _02338F64 ; =ov29_0235376C
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_02338F64: .word ov29_0235376C
	arm_func_end ov29_02338F58

	arm_func_start ov29_02338F68
ov29_02338F68: ; 0x02338F68
	stmdb sp!, {r3, lr}
	ldr r1, _02338FBC ; =0x0000040B
	ldr r2, _02338FC0 ; =ov29_02353784
	mov r0, #4
	mov r3, #0
	bl DirectoryFileMngr_OpenDirectoryFile
	ldr r1, _02338FC4 ; =ov29_0235376C
	add r0, sp, #0
	ldr r1, [r1, #0x18]
	bl HandleSir0Translation
	ldr r1, [sp]
	ldr r0, _02338FC4 ; =ov29_0235376C
	str r1, [r0, #8]
	bl GetMinimapData
	add r0, r0, #0xe000
	mov r2, #0
	ldr r1, _02338FC4 ; =ov29_0235376C
	strb r2, [r0, #0x447]
	str r2, [r1, #0xc]
	strb r2, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
#ifdef JAPAN
_02338FBC: .word 0x000003FF
#else
_02338FBC: .word 0x0000040B
#endif
_02338FC0: .word ov29_02353784
_02338FC4: .word ov29_0235376C
	arm_func_end ov29_02338F68

	arm_func_start ov29_02338FC8
ov29_02338FC8: ; 0x02338FC8
	stmdb sp!, {r3, lr}
	ldr r0, _02339000 ; =ov29_0235376C
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _02338FF0
	ldr r0, _02339004 ; =ov29_02353784
	bl UnloadFile
	ldr r0, _02339000 ; =ov29_0235376C
	mov r1, #0
	str r1, [r0, #8]
_02338FF0:
	ldr r0, _02339008 ; =ov29_0237CFB8
	mov r1, #0
	strb r1, [r0, #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02339000: .word ov29_0235376C
_02339004: .word ov29_02353784
_02339008: .word ov29_0237CFB8
	arm_func_end ov29_02338FC8

	arm_func_start ov29_0233900C
ov29_0233900C: ; 0x0233900C
	stmdb sp!, {r3, lr}
	ldr r0, _02339044 ; =ov29_0235352C
	ldr r0, [r0]
	add r0, r0, #0x20
	bl ov29_022DE288
	ldr r1, _02339044 ; =ov29_0235352C
	ldr r2, _02339048 ; =ov29_0235376C
	ldr r1, [r1]
	str r0, [r2, #0x10]
	add r0, r1, #0x2c
	bl ov29_022DE288
	ldr r1, _02339048 ; =ov29_0235376C
	str r0, [r1, #0x14]
	ldmia sp!, {r3, pc}
	.align 2, 0
_02339044: .word ov29_0235352C
_02339048: .word ov29_0235376C
	arm_func_end ov29_0233900C

	arm_func_start ov29_0233904C
ov29_0233904C: ; 0x0233904C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov fp, r0
	bl GetMinimapData
	mov r7, r0
	mov r6, #0
	add r4, r7, #0x7000
_02339064:
	mov r0, #0x700
	mul r1, r6, r0
	mov r0, #0x1c
	mla sl, r6, r0, r7
	mov r5, #0
	add r8, r7, r1
	add sb, r4, r1
_02339080:
	add r0, r8, r5, lsl #6
	mov r1, #0x20
	bl MemZero
	add r0, sb, r5, lsl #6
	mov r1, #0x20
	bl MemZero
	add r0, sl, r5
	add r1, r0, #0xe000
	mov r0, #0
	add r5, r5, #1
	strb r0, [r1]
	cmp r5, #0x1c
	blt _02339080
	add r6, r6, #1
	cmp r6, #0x10
	blt _02339064
	cmp fp, #0
	ldreq r0, _02339110 ; =ov29_0235376C
	moveq r1, #0x64
	streqh r1, [r0, #2]
	streqh r1, [r0, #4]
	add r0, r7, #0xe000
	mov r3, #0
	str r3, [r0, #0x440]
	mov r2, #1
	strb r2, [r0, #0x444]
	ldr r1, _02339114 ; =ov29_0237CFB8
	strb r3, [r0, #0x446]
	strb r2, [r1, #3]
	bl ov29_0233900C
	bl ov29_022E7F7C
	ldr r0, _02339114 ; =ov29_0237CFB8
	mov r1, #1
	strb r1, [r0, #2]
	bl ov29_02339148
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02339110: .word ov29_0235376C
_02339114: .word ov29_0237CFB8
	arm_func_end ov29_0233904C

	arm_func_start GetMinimapData
GetMinimapData: ; 0x02339118
	ldr r0, _02339134 ; =DUNGEON_PTR
	ldr r0, [r0]
	cmp r0, #0
#ifdef JAPAN
	addne r0, r0, #0x21c0
	addne r0, r0, #0x18000
#else
	addne r0, r0, #0x264
	addne r0, r0, #0x1a000
#endif
	moveq r0, #0
	bx lr
	.align 2, 0
_02339134: .word DUNGEON_PTR
	arm_func_end GetMinimapData

	arm_func_start ov29_02339138
ov29_02339138: ; 0x02339138
	stmdb sp!, {r3, lr}
	bl ov29_0233900C
	bl ov29_022E7F7C
	ldmia sp!, {r3, pc}
	arm_func_end ov29_02339138

	arm_func_start ov29_02339148
ov29_02339148: ; 0x02339148
	stmdb sp!, {r4, lr}
	ldr r0, _02339188 ; =DUNGEON_PTR
	mov r2, #0xc
	ldr r0, [r0]
	ldr r3, _0233918C ; =TILESET_PROPERTIES
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrsh r0, [r0, #0x30]
#else
	ldrsh r0, [r0, #0xd4]
#endif
	mov r1, #0
	smulbb r0, r0, r2
	ldr r4, [r3, r0]
	mov r0, r4
	bl ov29_0233A548
	mov r0, r4
	mov r1, #1
	bl ov29_0233A548
	ldmia sp!, {r4, pc}
	.align 2, 0
_02339188: .word DUNGEON_PTR
_0233918C: .word TILESET_PROPERTIES
	arm_func_end ov29_02339148

	arm_func_start ov29_02339190
ov29_02339190: ; 0x02339190
	stmdb sp!, {r3, lr}
	ldr r2, _023391B8 ; =ov29_0235376C
	ldr r2, [r2, #8]
	cmp r2, #0
	ldrne r2, _023391BC ; =ov29_0237CFB8
	ldrneb r2, [r2, #2]
	cmpne r2, #0
	ldmeqia sp!, {r3, pc}
	bl ov29_0233A548
	ldmia sp!, {r3, pc}
	.align 2, 0
_023391B8: .word ov29_0235376C
_023391BC: .word ov29_0237CFB8
	arm_func_end ov29_02339190

	arm_func_start ov29_023391C0
ov29_023391C0: ; 0x023391C0
	ldr r0, _023391E4 ; =DUNGEON_PTR
	mov r1, #0xc
	ldr r0, [r0]
	ldr r2, _023391E8 ; =TILESET_PROPERTIES
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrsh r0, [r0, #0x30]
#else
	ldrsh r0, [r0, #0xd4]
#endif
	smulbb r0, r0, r1
	ldr r0, [r2, r0]
	bx lr
	.align 2, 0
_023391E4: .word DUNGEON_PTR
_023391E8: .word TILESET_PROPERTIES
	arm_func_end ov29_023391C0

	arm_func_start DrawMinimapTile
DrawMinimapTile: ; 0x023391EC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x30
	mov sl, r0
	mov sb, r1
	bl GetMinimapData
	ldr r2, _023398C4 ; =ov29_02352FCC
	ldr r3, _023398C8 ; =DUNGEON_PTR
	ldrh r4, [r2]
	ldr r5, [r3]
	ldrh r3, [r2, #2]
	ldr r1, _023398CC ; =ov29_0235376C
	mov r7, #1
	ldr r2, [r1, #8]
	mov fp, r0
	cmp r2, #0
	ldrne r0, _023398D0 ; =ov29_0237CFB8
	str r7, [sp, #0x14]
	ldrneb r0, [r0, #2]
#ifdef JAPAN
	add r1, r5, #0x178
#else
	add r1, r5, #0x21c
#endif
	strh r4, [sp, #0x2c]
	strh r3, [sp, #0x2e]
	add r4, r1, #0x1a000
	cmpne r0, #0
	beq _023398BC
	cmp sl, #0
	cmpge sb, #2
	blt _023398BC
	cmp sl, #0x38
	cmplt sb, #0x20
	bge _023398BC
	mov r0, sl
	mov r1, sb
	bl GetTile
	mov r6, r0
	ldrb r1, [r4, #0x32]
	ldrh r2, [r6]
	ldrb r0, [r4, #0x29]
	cmp r1, #0
	moveq r1, r7
	str r0, [sp, #0x24]
	and r0, r2, #3
	str r0, [sp, #0x28]
	ldrb r0, [r4, #0x22]
	movne r1, #0
	and r1, r1, #0xff
	str r0, [sp, #0x20]
	ldrb r0, [r4, #0x28]
	str r0, [sp, #0x18]
	ldrb r0, [r4, #0x27]
	str r0, [sp, #0x1c]
	ldrb r0, [r4, #0x23]
	ldrb r5, [r4, #0x25]
	str r1, [sp, #0xc]
	ldrb r1, [r4, #0x33]
	cmp r1, #0
	movne r1, #0
	ldreq r1, _023398D0 ; =ov29_0237CFB8
	ldreqb r1, [r1, #3]
	and r1, r1, #0xff
	str r1, [sp, #8]
	ldr r1, [sp, #0x20]
	cmp r1, #0
	ldrneh r1, [r6, #2]
	movne r0, #0
	strne r0, [sp, #0x10]
	andne r8, r1, #1
	bne _02339344
	ldrb r1, [r4, #0x34]
	cmp r1, #0
	bne _02339310
	cmp r0, #0
	movne r8, #1
	bne _02339318
_02339310:
	ldrh r0, [r6, #2]
	and r8, r0, #1
_02339318:
	bl GetFloorType
	cmp r0, #0
	ldreqb r0, [r4, #0x2a]
	streq r0, [sp, #0x10]
	movne r0, #0
	strne r0, [sp, #0x10]
	cmp r5, #0
	beq _02339344
	cmp r8, #0
	streq r8, [sp, #0x14]
	moveq r8, #1
_02339344:
	bl IsMapShownOnEitherScreen
	cmp r0, #0
	ldreq r0, _023398CC ; =ov29_0235376C
	ldreqb r1, [r0, #1]
	cmpeq r1, #0
	beq _02339788
	ldr r0, [sp, #0x20]
	mov r5, #0
	cmp r0, #0
	bne _0233946C
	ldr r0, [r6, #0xc]
	str r0, [sp, #4]
	cmp r0, #0
	ldrne r0, _023398D0 ; =ov29_0237CFB8
	ldrneb r0, [r0, #3]
	cmpne r0, #0
	beq _0233946C
	ldr r0, [sp, #4]
	ldr r0, [r0]
	cmp r0, #1
	bne _0233946C
	ldr r0, [sp, #4]
	bl ShouldMinimapDisplayEntity
	cmp r0, #0
	beq _0233946C
	ldr r0, [sp, #4]
	mov r7, r5
	ldr r0, [r0, #0xb4]
	str r0, [sp]
	bl IsExperienceLocked
	cmp r0, #0
	bne _023393D4
	ldr r0, [sp]
	ldrb r0, [r0, #0xbc]
	cmp r0, #7
	bne _023393DC
_023393D4:
	mov r5, #0xa
	b _0233946C
_023393DC:
	ldr r0, [sp]
	ldrb r0, [r0, #6]
	cmp r0, #0
	beq _0233943C
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _02339434
	ldr r0, [sp]
	ldrb r0, [r0, #0xbc]
	cmp r0, #2
	moveq r0, r5
	beq _02339410
	bl IsBehaviorLoneOutlaw
_02339410:
	cmp r0, #0
	movne r5, #0xc
	bne _0233946C
	ldr r0, [sp]
	ldrb r0, [r0, #8]
	cmp r0, #0
	movne r5, #0xa
	moveq r5, #2
	b _0233946C
_02339434:
	mov r7, #1
	b _0233946C
_0233943C:
	ldr r0, [sp]
	ldrb r0, [r0, #7]
	cmp r0, #0
	beq _02339468
	ldr r0, _023398CC ; =ov29_0235376C
	strh sl, [r0, #2]
	strh sb, [r0, #4]
	ldrb r0, [r4, #0x2d]
	cmp r0, #0
	movne r5, #8
	b _0233946C
_02339468:
	mov r5, #0xa
_0233946C:
	cmp r7, #0
	beq _0233963C
	ldr r0, [sp, #0x20]
	cmp r0, #0
	bne _0233963C
	ldr r0, [r6, #0x10]
	cmp r0, #0
	beq _023395D0
	cmp r8, #0
	ldr r1, [r0]
	bne _023394F4
	ldr r0, [sp, #0xc]
	mov r5, #0
	cmp r0, #0
	beq _023394D8
	cmp r1, #3
	bne _023394D8
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	bne _023394C8
	ldrh r0, [r6, #2]
	tst r0, #2
	beq _023394EC
_023394C8:
	ldr r0, [sp, #0x28]
	cmp r0, #0
	movne r5, #3
	b _023394EC
_023394D8:
	cmp r1, #5
	bne _023394EC
	ldr r0, [sp, #0x10]
	cmp r0, #0
	movne r5, #0xd
_023394EC:
	mov r7, #0
	b _0233963C
_023394F4:
	cmp r7, #0
	beq _0233963C
	cmp r1, #2
	bne _0233953C
	ldr r2, [sp, #0x14]
	cmp r2, #0
	beq _0233953C
	ldrb r2, [r0, #0x20]
	cmp r2, #0
	ldreq r2, [sp, #0x18]
	cmpeq r2, #0
	beq _0233953C
	bl GetTrapInfo
	ldrb r1, [r0]
	ldr r0, _023398D4 ; =ov29_02352FF4
	mov r7, #0
	ldrb r5, [r0, r1]
	b _0233963C
_0233953C:
	ldr r2, [sp, #0xc]
	cmp r2, #0
	beq _0233957C
	cmp r1, #3
	bne _0233957C
	ldr r2, [sp, #0x1c]
	cmp r2, #0
	bne _02339568
	ldrh r2, [r6, #2]
	tst r2, #2
	beq _0233957C
_02339568:
	ldr r2, [sp, #0x28]
	cmp r2, #0
	movne r5, #3
	movne r7, #0
	bne _0233963C
_0233957C:
	cmp r1, #5
	bne _023395BC
	ldr r1, [sp, #0x10]
	cmp r1, #0
	bne _023395B0
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _0233963C
	ldr r1, [sp, #0x18]
	cmp r1, #0
	ldreqb r0, [r0, #0x20]
	cmpeq r0, #0
	beq _0233963C
_023395B0:
	mov r5, #0xd
	mov r7, #0
	b _0233963C
_023395BC:
	ldr r0, [sp, #0x28]
	cmp r0, #1
	movne r5, #0
	movne r7, r5
	b _0233963C
_023395D0:
	cmp r8, #0
	bne _02339608
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0233963C
	ldrh r0, [r6]
	tst r0, #0x200
	beq _0233963C
	bl GetFloorType
	cmp r0, #0
	moveq r5, #6
	movne r5, #5
	mov r7, #0
	b _0233963C
_02339608:
	ldrh r0, [r6]
	tst r0, #0x200
	beq _0233963C
	ldr r0, [sp, #0x10]
	cmp r0, #0
	ldreq r0, [sp, #0x14]
	cmpeq r0, #0
	beq _0233963C
	bl GetFloorType
	cmp r0, #0
	moveq r5, #6
	movne r5, #5
	mov r7, #0
_0233963C:
	cmp r7, #0
	bne _02339654
	ldr r0, [sp, #0x24]
	cmp r0, #0
	cmpne r5, #0
	movne r5, #0xb
_02339654:
	cmp r5, #0
	bne _02339734
	cmp r8, #0
	moveq r5, #1
	beq _02339734
	ldr r0, [sp, #0x28]
	cmp r0, #1
	movne r5, #1
	bne _02339734
	cmp sb, #0x1f
	mov r4, #0xf
	bge _023396A0
	mov r0, sl
	add r1, sb, #1
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	biceq r4, r4, #1
_023396A0:
	cmp sb, #1
	blt _023396C4
	mov r0, sl
	sub r1, sb, #1
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	biceq r4, r4, #4
_023396C4:
	cmp sl, #0x37
	bge _023396E8
	mov r1, sb
	add r0, sl, #1
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	biceq r4, r4, #2
_023396E8:
	cmp sl, #1
	blt _0233970C
	mov r1, sb
	sub r0, sl, #1
	bl GetTile
	ldrh r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	biceq r4, r4, #8
_0233970C:
	ldrh r1, [r6, #2]
	mov r0, r4, lsl #0x10
	mov r0, r0, asr #0x10
	tst r1, #2
	addne r0, r0, #0x10
	movne r0, r0, lsl #0x10
	movne r5, r0, asr #0x10
	addeq r0, r0, #0x20
	moveq r0, r0, lsl #0x10
	moveq r5, r0, asr #0x10
_02339734:
	bl GetTopScreenOption
	cmp r0, #3
	addeq r0, r5, #0x80
	streqh r0, [sp, #0x2e]
	bl GetBottomScreenOption
	cmp r0, #0
	bne _02339770
	ldr r0, _023398CC ; =ov29_0235376C
	ldrb r0, [r0, #1]
	cmp r0, #0
	addne r0, r5, #0x40
	strneh r0, [sp, #0x2c]
	moveq r0, #1
	streqh r0, [sp, #0x2c]
	b _0233979C
_02339770:
	bl GetBottomScreenOption
	cmp r0, #1
	addeq r0, r5, #0x40
	streqh r0, [sp, #0x2c]
	strneh r5, [sp, #0x2c]
	b _0233979C
_02339788:
	mov r2, #1
	mov r1, #0x64
	strh r2, [sp, #0x2c]
	strh r2, [sp, #0x2e]
	strh r1, [r0, #2]
_0233979C:
	sub r3, sb, #2
	add r0, r3, r3, lsr #31
	mov r5, r0, asr #1
	mov r0, #0x700
	mul r7, r5, r0
	ldr r0, _023398CC ; =ov29_0235376C
	mov r2, sl, lsr #0x1f
	mov r4, r3, lsr #0x1f
	rsb r1, r2, sl, lsl #31
	rsb r3, r4, r3, lsl #31
	ldr sb, [r0, #8]
	add r0, sl, sl, lsr #31
	ldrsh r6, [sp, #0x2c]
	add r2, r2, r1, ror #31
	add r1, r4, r3, ror #31
	add r8, r2, r1, lsl #1
	ldr r2, [sb]
	add r1, r8, r6, lsl #2
	mov r4, r0, asr #1
	add r0, fp, r7
	add r6, r0, r4, lsl #6
	ldr r1, [r2, r1, lsl #2]
	mov r0, r6
	bl InitMinimapDisplayTile
	ldr r0, _023398CC ; =ov29_0235376C
	ldrsh r1, [sp, #0x2e]
	ldr r0, [r0, #8]
	add r2, fp, #0x7000
	add r2, r2, r7
	add r7, r2, r4, lsl #6
	ldr r2, [r0]
	add r0, r8, r1, lsl #2
	ldr r1, [r2, r0, lsl #2]
	mov r0, r7
	bl InitMinimapDisplayTile
	add r0, fp, #0xe000
	ldrb r1, [r0, #0x445]
	cmp r1, #0
	bne _023398BC
	mov r1, #0x1c
	mul r8, r5, r1
	add r1, r0, r8
	ldrb r2, [r1, r4]
	add r1, r1, r4
	cmp r2, #0
	bne _023398BC
	mov r3, #1
	strb r3, [r1]
	ldr r2, [r0, #0x440]
	cmp r2, #0x28
	strgeb r3, [r0, #0x445]
	bge _023398BC
	add r3, r4, r8
	add r2, fp, r2, lsl #4
	mov r3, r3, lsl #6
	add r2, r2, #0xe000
	str r3, [r2, #0x1c0]
	ldr r2, [r0, #0x440]
	add r2, fp, r2, lsl #4
	add r2, r2, #0xe000
	str r6, [r2, #0x1c4]
	ldr r2, [r0, #0x440]
	add r2, fp, r2, lsl #4
	add r2, r2, #0xe000
	str r7, [r2, #0x1c8]
	ldr r2, [r0, #0x440]
	add r2, fp, r2, lsl #4
	add r2, r2, #0xe000
	str r1, [r2, #0x1cc]
	ldr r1, [r0, #0x440]
	add r1, r1, #1
	str r1, [r0, #0x440]
_023398BC:
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023398C4: .word ov29_02352FCC
_023398C8: .word DUNGEON_PTR
_023398CC: .word ov29_0235376C
_023398D0: .word ov29_0237CFB8
_023398D4: .word ov29_02352FF4
	arm_func_end DrawMinimapTile

	arm_func_start ov29_023398D8
ov29_023398D8: ; 0x023398D8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r2, #0x7000
	mla r6, r1, r2, r0
	add r0, r0, #0xe000
	mov r5, #0
	ldr r2, _02339928 ; =ov29_0235377C
	strb r5, [r0, #0x445]
	ldr r7, [r2, r1, lsl #2]
	mov r4, #0x200
	b _0233991C
_02339900:
	mov r0, r7
	mov r1, r6
	mov r2, r4
	bl Memcpy32
	add r7, r7, #0x200
	add r6, r6, #0x200
	add r5, r5, #8
_0233991C:
	cmp r5, #0x1c0
	blo _02339900
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02339928: .word ov29_0235377C
	arm_func_end ov29_023398D8

	arm_func_start ov29_0233992C
ov29_0233992C: ; 0x0233992C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _02339A1C ; =DUNGEON_PTR
	ldr r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r4, #0
	mov r5, r4
	bl ov29_022EA408
	ldr r1, _02339A20 ; =ov29_0237CFB8
	ldrb r1, [r1]
	cmp r1, #0
	beq _0233996C
	cmp r0, #0
	cmpne r0, #3
	cmpne r0, #0xc
	moveq r4, #1
_0233996C:
	bl GetTopScreenOption
	cmp r0, #3
	moveq r5, #1
	bl GetMinimapData
	mov r6, r0
	add r0, r6, #0xe000
	ldrb r0, [r0, #0x444]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	bl ov10_022BFD20
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	add r0, r6, #0xe000
	ldrb r0, [r0, #0x445]
	cmp r0, #0
	bne _023399D8
	cmp r4, #0
	beq _023399C0
	mov r0, r6
	mov r1, #0
	bl ov29_0233A470
_023399C0:
	cmp r5, #0
	beq _02339A0C
	mov r0, r6
	mov r1, #1
	bl ov29_0233A470
	b _02339A0C
_023399D8:
	cmp r4, #0
	beq _023399EC
	mov r0, r6
	mov r1, #0
	bl ov29_023398D8
_023399EC:
	cmp r5, #0
	beq _02339A00
	mov r0, r6
	mov r1, #1
	bl ov29_023398D8
_02339A00:
	add r0, r6, #0xe000
	mov r1, #1
	strb r1, [r0, #0x446]
_02339A0C:
	add r0, r6, #0xe000
	mov r1, #0
	str r1, [r0, #0x440]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02339A1C: .word DUNGEON_PTR
_02339A20: .word ov29_0237CFB8
	arm_func_end ov29_0233992C

	arm_func_start FlashLeaderIcon
FlashLeaderIcon: ; 0x02339A24
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	ldr r1, _02339CB8 ; =DUNGEON_PTR
	mov r4, r0
	ldr r0, [r1]
	add r0, r0, #0x1a000
#ifdef JAPAN
	ldrb r0, [r0, #0x1a5]
#else
	ldrb r0, [r0, #0x249]
#endif
	cmp r0, #0
	bne _02339CB0
	ldr r0, _02339CBC ; =ov29_0235376C
	ldrsh r0, [r0, #2]
	cmp r0, #0x64
	bge _02339CB0
	ldr r0, _02339CC0 ; =ov29_0237CFB8
	ldrb r1, [r0, #1]
	add r2, r1, #1
	and r1, r2, #0xff
	strb r2, [r0, #1]
	tst r1, #8
	bne _02339CB0
	add r0, sp, #0
	mov r1, #8
	bl MemZero
	ldrh r2, [sp]
	ldrh r0, [sp, #6]
	ldrh r1, [sp, #2]
	bic r2, r2, #0x100
	strh r2, [sp]
	ldrh r2, [sp]
	bic r0, r0, #1
	strh r0, [sp, #6]
	bic r2, r2, #0x200
	strh r2, [sp]
	ldrh r2, [sp]
	bic r1, r1, #0x3e00
	strh r1, [sp, #2]
	bic r0, r2, #0xc00
	strh r0, [sp]
	ldrh r0, [sp]
	ldrh r2, [sp, #2]
	ldrh r1, [sp, #4]
	bic r0, r0, #0x1000
	strh r0, [sp]
	ldrh r3, [sp]
	ldrh r0, [sp, #6]
	bic r2, r2, #0xc000
	bic r3, r3, #0xc000
	bic r1, r1, #0xc00
	bic r0, r0, #2
	strh r3, [sp]
	strh r2, [sp, #2]
	strh r1, [sp, #4]
	strh r0, [sp, #6]
	bl GetMinimapData
	add r0, r0, #0xe000
	ldrb r0, [r0, #0x448]
	cmp r0, #0
	beq _02339BC0
	bl GetTopScreenOption
	cmp r0, #3
	bne _02339BC0
	ldrh r0, [sp, #4]
	mov r2, #0x400
	rsb r2, r2, #0
	and r0, r0, r2
	strh r0, [sp, #4]
	ldrh r0, [sp, #4]
	ldr ip, _02339CBC ; =ov29_0235376C
	ldrh r3, [sp, #2]
	orr r5, r0, #0x70
	add r0, r2, #0x200
	and r0, r3, r0
	strh r0, [sp, #2]
	ldrsh r1, [ip, #2]
	bic r5, r5, #0xf000
	strh r5, [sp, #4]
	mov r0, r1, lsl #2
	ldrh r1, [sp]
	add r5, r0, #0x10
	and r2, r5, r2, lsr #23
	ldrh r6, [sp, #2]
	ldrh r3, [sp, #4]
	bic r1, r1, #0x2000
	orr r6, r6, r2
	orr r0, r3, #0xc000
	ldr r3, _02339CC4 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldrh r5, [sp, #6]
	ldr r2, _02339CC8 ; =0xFFFF000F
	strh r1, [sp]
	and r1, r5, r2
	strh r1, [sp, #6]
	strh r6, [sp, #2]
	strh r0, [sp, #4]
	ldrsh r0, [ip, #4]
	ldrh r2, [sp, #6]
	ldr r3, [r3]
	mov r0, r0, lsl #0x16
	orr r5, r2, r0, lsr #16
	ldr r2, _02339CCC ; =0x0000013F
	add r1, sp, #0
	add r0, r3, #0x70
	strh r5, [sp, #6]
	bl AddSimpleObjToOam
_02339BC0:
	cmp r4, #0
	bne _02339CB0
	ldr r0, _02339CC0 ; =ov29_0237CFB8
	ldrb r0, [r0]
	cmp r0, #0
	beq _02339CB0
	bl GetMinimapData
	add r0, r0, #0xe000
	ldrb r0, [r0, #0x447]
	cmp r0, #0
	beq _02339CB0
	bl GetBottomScreenOption
	cmp r0, #0
	beq _02339CB0
	ldrh r0, [sp, #4]
	mov r2, #0x400
	rsb r2, r2, #0
	and r0, r0, r2
	strh r0, [sp, #4]
	ldrh r0, [sp, #4]
	ldrh r4, [sp]
	ldrh r6, [sp, #2]
	add r2, r2, #0x200
	orr r1, r0, #0xdd
	ldr ip, _02339CBC ; =ov29_0235376C
	and r2, r6, r2
	strh r2, [sp, #2]
	ldrsh r0, [ip, #2]
	orr r1, r1, #0x100
	bic r4, r4, #0x2000
	strh r4, [sp]
	strh r1, [sp, #4]
	mov r5, r0, lsl #2
	ldrh r0, [sp, #4]
	ldrh r1, [sp]
	ldrh lr, [sp, #6]
	ldr r2, _02339CC8 ; =0xFFFF000F
	bic r0, r0, #0xf000
	and r2, lr, r2
	orr r1, r1, #0x2000
	ldr r3, _02339CD0 ; =0x000001DD
	strh r2, [sp, #6]
	ldrh r6, [sp, #2]
	add r5, r5, #8
	add r2, r3, #0x22
	and r2, r5, r2
	orr r2, r6, r2
	strh r2, [sp, #2]
	strh r0, [sp, #4]
	strh r1, [sp]
	ldrsh r1, [ip, #4]
	ldr r4, _02339CC4 ; =OBJ_GRAPHICS_CONTROLS_PTR
	ldrh r2, [sp, #6]
	ldr r0, [r4]
	mov r1, r1, lsl #0x16
	orr r4, r2, r1, lsr #16
	add r1, sp, #0
	sub r2, r3, #0x9e
	strh r4, [sp, #6]
	bl AddSimpleObjToOam
_02339CB0:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02339CB8: .word DUNGEON_PTR
_02339CBC: .word ov29_0235376C
_02339CC0: .word ov29_0237CFB8
_02339CC4: .word OBJ_GRAPHICS_CONTROLS_PTR
_02339CC8: .word 0xFFFF000F
_02339CCC: .word 0x0000013F
_02339CD0: .word 0x000001DD
	arm_func_end FlashLeaderIcon

	arm_func_start ov29_02339CD4
ov29_02339CD4: ; 0x02339CD4
	ldr r0, _02339CE4 ; =ov29_0237CFB8
	mov r1, #0
	strb r1, [r0, #1]
	bx lr
	.align 2, 0
_02339CE4: .word ov29_0237CFB8
	arm_func_end ov29_02339CD4

	arm_func_start UpdateMinimap
UpdateMinimap: ; 0x02339CE8
	stmdb sp!, {r4, r5, r6, lr}
	bl GetMinimapData
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r6, #0
	add r0, r0, #0xe000
	mov r1, #1
	strb r1, [r0, #0x445]
	mov r4, r6
_02339D0C:
	mov r5, r4
_02339D10:
	mov r0, r5
	mov r1, r6
	bl DrawMinimapTile
	add r5, r5, #1
	cmp r5, #0x38
	blt _02339D10
	add r6, r6, #1
	cmp r6, #0x20
	blt _02339D0C
	bl GetBottomScreenOption
	cmp r0, #0
	beq _02339D54
	bl GetMinimapData
	add r0, r0, #0xe000
	mov r1, #1
	strb r1, [r0, #0x447]
	ldmia sp!, {r4, r5, r6, pc}
_02339D54:
	ldr r0, _02339D78 ; =ov29_0235376C
	ldrb r0, [r0, #1]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	bl GetMinimapData
	add r0, r0, #0xe000
	mov r1, #1
	strb r1, [r0, #0x447]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02339D78: .word ov29_0235376C
	arm_func_end UpdateMinimap

	arm_func_start ov29_02339D7C
ov29_02339D7C: ; 0x02339D7C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	cmp r0, #1
	mov r5, #0x10
	moveq r6, #0
	beq _02339D9C
	cmp r1, #0
	movne r6, #0
	moveq r6, #5
_02339D9C:
	cmp r0, #1
	mov sl, #0x1140
	mov r8, #1
	bne _02339E6C
	mov sb, #0
	mov fp, sb
	b _02339E00
_02339DB8:
	mov r0, r8, lsl #0x10
	mov r7, fp
	mov r4, r0, asr #0x10
_02339DC4:
	add r0, r7, #2
	add r1, sl, #1
	mov ip, r0, lsl #0x10
	mov r0, r1, lsl #0x10
	mov r2, sl
	mov sl, r0, lsr #0x10
	mov r1, r4
	mov r3, #1
	mov r0, ip, asr #0x10
	bl ov29_02339F2C
	add r7, r7, #1
	cmp r7, #0x1c
	blt _02339DC4
	add r8, r8, #1
	add sb, sb, #1
_02339E00:
	cmp sb, r5
	blt _02339DB8
	mov sb, #0
	mov r4, #0x1000
	mov fp, #1
	mov r7, sb
	b _02339E58
_02339E1C:
	mov r0, r8, lsl #0x10
	mov sl, r7
	mov r5, r0, asr #0x10
_02339E28:
	add r0, sl, #2
	mov r0, r0, lsl #0x10
	mov r1, r5
	mov r2, r4
	mov r3, fp
	mov r0, r0, asr #0x10
	bl ov29_02339F2C
	add sl, sl, #1
	cmp sl, #0x1c
	blt _02339E28
	add r8, r8, #1
	add sb, sb, #1
_02339E58:
	cmp sb, r6
	blt _02339E1C
	mov r0, #1
	bl ov29_02339F64
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02339E6C:
	mov r7, #0
	mov fp, r7
	b _02339EC0
_02339E78:
	mov r0, r8, lsl #0x10
	mov sb, fp
	mov r4, r0, asr #0x10
_02339E84:
	add r0, sb, #1
	add r1, sl, #1
	mov ip, r0, lsl #0x10
	mov r0, r1, lsl #0x10
	mov r2, sl
	mov sl, r0, lsr #0x10
	mov r1, r4
	mov r3, #0
	mov r0, ip, asr #0x10
	bl ov29_02339F2C
	add sb, sb, #1
	cmp sb, #0x1c
	blt _02339E84
	add r8, r8, #1
	add r7, r7, #1
_02339EC0:
	cmp r7, r5
	blt _02339E78
	mov sb, #0
	mov r4, #0x1000
	mov fp, sb
	mov r7, sb
	b _02339F18
_02339EDC:
	mov r0, r8, lsl #0x10
	mov sl, r7
	mov r5, r0, asr #0x10
_02339EE8:
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	mov r1, r5
	mov r2, r4
	mov r3, fp
	mov r0, r0, asr #0x10
	bl ov29_02339F2C
	add sl, sl, #1
	cmp sl, #0x1c
	blt _02339EE8
	add r8, r8, #1
	add sb, sb, #1
_02339F18:
	cmp sb, r6
	blt _02339EDC
	mov r0, #0
	bl ov29_02339F64
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov29_02339D7C

	arm_func_start ov29_02339F2C
ov29_02339F2C: ; 0x02339F2C
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr ip, _02339F60 ; =ov29_0235352C
	str r1, [sp, #4]
	ldr ip, [ip]
	mov r1, #0xc
	mla r1, r3, r1, ip
	str r0, [sp]
	ldr r0, [r1, #0x24]
	add r1, sp, #0
	bl sub_0200B3FC
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_02339F60: .word ov29_0235352C
	arm_func_end ov29_02339F2C

	arm_func_start ov29_02339F64
ov29_02339F64: ; 0x02339F64
	ldr r2, _02339F80 ; =ov29_0235352C
	mov r1, #0xc
	ldr r2, [r2]
	ldr ip, _02339F84 ; =sub_0200B330
	mla r1, r0, r1, r2
	ldr r0, [r1, #0x24]
	bx ip
	.align 2, 0
_02339F80: .word ov29_0235352C
_02339F84: .word sub_0200B330
	arm_func_end ov29_02339F64

	arm_func_start ov29_02339F88
ov29_02339F88: ; 0x02339F88
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetBottomScreenOption
	cmp r0, #0
	beq _02339FAC
	mov r1, r4
	mov r0, #0
	bl ov29_02339D7C
	ldmia sp!, {r4, pc}
_02339FAC:
	ldr r0, _02339FCC ; =ov29_0235376C
	ldrb r0, [r0, #1]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r1, r4
	mov r0, #0
	bl ov29_02339D7C
	ldmia sp!, {r4, pc}
	.align 2, 0
_02339FCC: .word ov29_0235376C
	arm_func_end ov29_02339F88

	arm_func_start ov29_02339FD0
ov29_02339FD0: ; 0x02339FD0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetTopScreenOption
	cmp r0, #3
	ldmneia sp!, {r4, pc}
	mov r1, r4
	mov r0, #1
	bl ov29_02339D7C
	ldmia sp!, {r4, pc}
	arm_func_end ov29_02339FD0

	arm_func_start ov29_02339FF4
ov29_02339FF4: ; 0x02339FF4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov29_02339F88
	bl GetTopScreenOption
	cmp r0, #3
	ldmneia sp!, {r4, pc}
	mov r1, r4
	mov r0, #1
	bl ov29_02339D7C
	ldmia sp!, {r4, pc}
	arm_func_end ov29_02339FF4

	arm_func_start ov29_0233A01C
ov29_0233A01C: ; 0x0233A01C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	cmp r0, #0
	movne r6, #0
	mov sb, #0
	mov sl, r1
	mov r5, #0x10
	moveq r6, #5
	mov r8, #1
	mov fp, sb
	b _0233A080
_0233A044:
	mov r0, r8, lsl #0x10
	mov r7, fp
	mov r4, r0, asr #0x10
_0233A050:
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	mov r1, r4
	mov r2, #0x1000
	mov r3, sl
	mov r0, r0, asr #0x10
	bl ov29_02339F2C
	add r7, r7, #1
	cmp r7, #0x1c
	blt _0233A050
	add r8, r8, #1
	add sb, sb, #1
_0233A080:
	cmp sb, r5
	blt _0233A044
	mov r7, #0
	mov fp, #0x1000
	mov r5, r7
	b _0233A0D4
_0233A098:
	mov r0, r8, lsl #0x10
	mov sb, r5
	mov r4, r0, asr #0x10
_0233A0A4:
	add r0, sb, #1
	mov r0, r0, lsl #0x10
	mov r1, r4
	mov r2, fp
	mov r3, sl
	mov r0, r0, asr #0x10
	bl ov29_02339F2C
	add sb, sb, #1
	cmp sb, #0x1c
	blt _0233A0A4
	add r8, r8, #1
	add r7, r7, #1
_0233A0D4:
	cmp r7, r6
	blt _0233A098
	mov r0, sl
	bl ov29_02339F64
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov29_0233A01C

	arm_func_start ov29_0233A0E8
ov29_0233A0E8: ; 0x0233A0E8
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r1, #1
	bne _0233A114
	bl GetTopScreenOption
	cmp r0, #3
	ldmneia sp!, {r4, pc}
	mov r0, r4
	mov r1, #1
	bl ov29_0233A01C
	ldmia sp!, {r4, pc}
_0233A114:
	cmp r1, #0
	ldmneia sp!, {r4, pc}
	bl GetBottomScreenOption
	cmp r0, #0
	beq _0233A138
	mov r0, r4
	mov r1, #0
	bl ov29_0233A01C
	ldmia sp!, {r4, pc}
_0233A138:
	ldr r0, _0233A158 ; =ov29_0235376C
	ldrb r0, [r0, #1]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	mov r1, #0
	bl ov29_0233A01C
	ldmia sp!, {r4, pc}
	.align 2, 0
_0233A158: .word ov29_0235376C
	arm_func_end ov29_0233A0E8

	arm_func_start ov29_0233A15C
ov29_0233A15C: ; 0x0233A15C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetTopScreenOption
	cmp r0, #3
	bne _0233A17C
	mov r0, r4
	mov r1, #1
	bl ov29_0233A01C
_0233A17C:
	bl GetBottomScreenOption
	cmp r0, #0
	beq _0233A198
	mov r0, r4
	mov r1, #0
	bl ov29_0233A01C
	ldmia sp!, {r4, pc}
_0233A198:
	ldr r0, _0233A1B8 ; =ov29_0235376C
	ldrb r0, [r0, #1]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	mov r1, #0
	bl ov29_0233A01C
	ldmia sp!, {r4, pc}
	.align 2, 0
_0233A1B8: .word ov29_0235376C
	arm_func_end ov29_0233A15C

	arm_func_start ov29_0233A1BC
ov29_0233A1BC: ; 0x0233A1BC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r6, #0
	mov r7, r0
	mov r8, #0x1000
	mov r4, r6
_0233A1D0:
	mov r0, r6, lsl #0x10
	mov r5, r4
	mov sb, r0, asr #0x10
_0233A1DC:
	mov r0, r5, lsl #0x10
	mov r1, sb
	mov r2, r8
	mov r3, r7
	mov r0, r0, asr #0x10
	bl ov29_02339F2C
	add r5, r5, #1
	cmp r5, #0x1c
	blt _0233A1DC
	add r6, r6, #1
	cmp r6, #0x20
	blt _0233A1D0
	mov r0, r7
	bl ov29_02339F64
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov29_0233A1BC

	arm_func_start SetMinimapDataE447
SetMinimapDataE447: ; 0x0233A218
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetMinimapData
	add r0, r0, #0xe000
	strb r4, [r0, #0x447]
	ldmia sp!, {r4, pc}
	arm_func_end SetMinimapDataE447

#ifdef EUROPE
	arm_func_start GetMinimapDataE447
GetMinimapDataE447: ; 0x0233AE00
	stmdb sp!, {r3, lr}
	bl GetMinimapData
	add r0, r0, #0xe000
	ldrb r0, [r0, #0x447]
	ldmia sp!, {r3, pc}
	arm_func_end GetMinimapDataE447
#endif

	arm_func_start SetMinimapDataE448
SetMinimapDataE448: ; 0x0233A230
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl GetMinimapData
	add r0, r0, #0xe000
	strb r4, [r0, #0x448]
	ldmia sp!, {r4, pc}
	arm_func_end SetMinimapDataE448

	arm_func_start ov29_0233A248
ov29_0233A248: ; 0x0233A248
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, r4
	mov r0, #0
	bl ov29_0233A0E8
	cmp r4, #0
	bne _0233A274
	bl GetMinimapData
	add r0, r0, #0xe000
	mov r1, #0
	strb r1, [r0, #0x447]
_0233A274:
	cmp r4, #1
	ldmneia sp!, {r4, pc}
	bl GetMinimapData
	add r0, r0, #0xe000
	mov r1, #0
	strb r1, [r0, #0x448]
	ldmia sp!, {r4, pc}
	arm_func_end ov29_0233A248

	arm_func_start InitWeirdMinimapMatrix
InitWeirdMinimapMatrix: ; 0x0233A290
	stmdb sp!, {r3, r4, r5, lr}
	bl GetMinimapData
	add r1, r0, #0xe000
	ldrb r1, [r1, #0x446]
	cmp r1, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r4, #0
	mov r3, r4
	mov ip, r4
	mov r2, #0x1c
_0233A2B8:
	mla r5, r4, r2, r0
	mov lr, ip
_0233A2C0:
	add r1, r5, lr
	add r1, r1, #0xe000
	add lr, lr, #1
	strb r3, [r1]
	cmp lr, #0x38
	blt _0233A2C0
	add r4, r4, #1
	cmp r4, #0x20
	blt _0233A2B8
	add r0, r0, #0xe000
	strb r3, [r0, #0x446]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end InitWeirdMinimapMatrix

	arm_func_start InitMinimapDisplayTile
InitMinimapDisplayTile: ; 0x0233A2F0
	ldr r3, [r0]
	ldmia r1, {r2, ip}
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0]
	ldr r3, [r0, #4]
	ldr r2, [r1, #8]
	ldr ip, [r1, #0xc]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #4]
	ldr r3, [r0, #8]
	ldr r2, [r1, #0x10]
	ldr ip, [r1, #0x14]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #8]
	ldr r3, [r0, #0xc]
	ldr r2, [r1, #0x18]
	ldr ip, [r1, #0x1c]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0xc]
	ldr r3, [r0, #0x10]
	ldr r2, [r1, #0x20]
	ldr ip, [r1, #0x24]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x10]
	ldr r3, [r0, #0x14]
	ldr r2, [r1, #0x28]
	ldr ip, [r1, #0x2c]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x14]
	ldr r3, [r0, #0x18]
	ldr r2, [r1, #0x30]
	ldr ip, [r1, #0x34]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x18]
	ldr r3, [r0, #0x1c]
	ldr r2, [r1, #0x38]
	ldr ip, [r1, #0x3c]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x1c]
	ldr r3, [r0, #0x20]
	ldr r2, [r1, #0x40]
	ldr ip, [r1, #0x44]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x20]
	ldr r3, [r0, #0x24]
	ldr r2, [r1, #0x48]
	ldr ip, [r1, #0x4c]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x24]
	ldr r3, [r0, #0x28]
	ldr r2, [r1, #0x50]
	ldr ip, [r1, #0x54]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x28]
	ldr r3, [r0, #0x2c]
	ldr r2, [r1, #0x58]
	ldr ip, [r1, #0x5c]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x2c]
	ldr r3, [r0, #0x30]
	ldr r2, [r1, #0x60]
	ldr ip, [r1, #0x64]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x30]
	ldr r3, [r0, #0x34]
	ldr r2, [r1, #0x68]
	ldr ip, [r1, #0x6c]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x34]
	ldr r3, [r0, #0x38]
	ldr r2, [r1, #0x70]
	ldr ip, [r1, #0x74]
	and r2, r3, r2
	orr r2, ip, r2
	str r2, [r0, #0x38]
	ldr r3, [r0, #0x3c]
	ldr r2, [r1, #0x78]
	ldr ip, [r1, #0x7c]
	and r1, r3, r2
	orr r1, ip, r1
	str r1, [r0, #0x3c]
	bx lr
	arm_func_end InitMinimapDisplayTile

	arm_func_start ov29_0233A470
ov29_0233A470: ; 0x0233A470
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r4, #0
	add r2, r0, #0x21c0
	add r5, r0, #0xe000
	add ip, r2, #0xc000
	ldr r0, _0233A544 ; =ov29_0235377C
	mov r6, r4
	b _0233A534
_0233A490:
	add lr, ip, r4, lsl #4
	add r2, lr, r1, lsl #2
	ldr r3, [r2, #4]
	ldr sb, [ip, r4, lsl #4]
	ldr r8, [r0, r1, lsl #2]
	ldr r7, [r3]
	add r2, sb, r8
	str r7, [sb, r8]
	ldr r7, [r3, #4]
	add r4, r4, #1
	str r7, [r2, #4]
	ldr r7, [r3, #8]
	str r7, [r2, #8]
	ldr r7, [r3, #0xc]
	str r7, [r2, #0xc]
	ldr r7, [r3, #0x10]
	str r7, [r2, #0x10]
	ldr r7, [r3, #0x14]
	str r7, [r2, #0x14]
	ldr r7, [r3, #0x18]
	str r7, [r2, #0x18]
	ldr r7, [r3, #0x1c]
	str r7, [r2, #0x1c]
	ldr r7, [r3, #0x20]
	str r7, [r2, #0x20]
	ldr r7, [r3, #0x24]
	str r7, [r2, #0x24]
	ldr r7, [r3, #0x28]
	str r7, [r2, #0x28]
	ldr r7, [r3, #0x2c]
	str r7, [r2, #0x2c]
	ldr r7, [r3, #0x30]
	str r7, [r2, #0x30]
	ldr r7, [r3, #0x34]
	str r7, [r2, #0x34]
	ldr r7, [r3, #0x38]
	str r7, [r2, #0x38]
	ldr r3, [r3, #0x3c]
	str r3, [r2, #0x3c]
	ldr r2, [lr, #0xc]
	strb r6, [r2]
_0233A534:
	ldr r2, [r5, #0x440]
	cmp r4, r2
	blt _0233A490
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0233A544: .word ov29_0235377C
	arm_func_end ov29_0233A470

	arm_func_start ov29_0233A548
ov29_0233A548: ; 0x0233A548
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _0233A5E0 ; =MAP_COLOR_TABLE
	ldr r7, _0233A5E4 ; =ov29_0235376C
	mov r6, r1
	add r5, r2, r0, lsl #2
	mov r4, #0
_0233A560:
	cmp r4, #7
	bne _0233A5B0
	cmp r6, #0
	bne _0233A58C
	add r0, r4, #0x100
	mov r1, r0, lsl #0x10
	mov r0, r5
	mov r2, r6
	mov r1, r1, asr #0x10
	bl ov29_0233A5E8
	b _0233A5D0
_0233A58C:
	ldr r1, [r7, #8]
	add r0, r4, #0x100
	ldr r3, [r1, #4]
	mov r1, r0, lsl #0x10
	mov r2, r6
	add r0, r3, r4, lsl #2
	mov r1, r1, asr #0x10
	bl ov29_0233A5E8
	b _0233A5D0
_0233A5B0:
	ldr r1, [r7, #8]
	add r0, r4, #0x100
	ldr r3, [r1, #4]
	mov r1, r0, lsl #0x10
	mov r2, r6
	add r0, r3, r4, lsl #2
	mov r1, r1, asr #0x10
	bl ov29_0233A5E8
_0233A5D0:
	add r4, r4, #1
	cmp r4, #0x10
	blt _0233A560
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0233A5E0: .word MAP_COLOR_TABLE
_0233A5E4: .word ov29_0235376C
	arm_func_end ov29_0233A548

	arm_func_start ov29_0233A5E8
ov29_0233A5E8: ; 0x0233A5E8
	stmdb sp!, {r4, lr}
	ldr ip, _0233A620 ; =ov29_0235352C
	mov r3, #0xc
	ldr ip, [ip]
	mov lr, r0
	add r0, ip, #0x20
	mla r4, r2, r3, r0
	ldr r0, [r4, #8]
	mov r2, r1
	mov r1, lr
	bl sub_0200C008
	ldr r0, [r4, #8]
	bl sub_0200A174
	ldmia sp!, {r4, pc}
	.align 2, 0
_0233A620: .word ov29_0235352C
	arm_func_end ov29_0233A5E8

	arm_func_start LoadFixedRoomDataVeneer
LoadFixedRoomDataVeneer: ; 0x0233A624
	ldr ip, _0233A62C ; =LoadFixedRoomData
	bx ip
	.align 2, 0
_0233A62C: .word LoadFixedRoomData
	arm_func_end LoadFixedRoomDataVeneer

	arm_func_start UnloadFixedRoomData
UnloadFixedRoomData: ; 0x0233A630
	stmdb sp!, {r3, lr}
	bl ov29_02343DD8
	ldr r0, _0233A650 ; =DUNGEON_PTR
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x12000
#ifdef JAPAN
	str r1, [r0, #0xa00]
#else
	str r1, [r0, #0xaa4]
#endif
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233A650: .word DUNGEON_PTR
	arm_func_end UnloadFixedRoomData

	arm_func_start IsNormalFloor
IsNormalFloor: ; 0x0233A654
	stmdb sp!, {r3, lr}
	bl IsHiddenStairsFloor
	cmp r0, #0
	bne _0233A6C4
	bl IsGoldenChamber
	cmp r0, #0
	bne _0233A6C4
	mov r0, #0xb
	bl IsCurrentMissionType
	cmp r0, #0
	bne _0233A6C4
	mov r0, #0xa
	mov r1, #6
	bl IsCurrentMissionTypeExact
	cmp r0, #0
	bne _0233A6C4
	mov r0, #0xc
	bl IsCurrentMissionType
	cmp r0, #0
	bne _0233A6C4
	ldr r0, _0233A6D4 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
#ifdef JAPAN
	ldrb r0, [r0, #0x36]
#else
	ldrb r0, [r0, #0xda]
#endif
	cmp r0, #0
	beq _0233A6CC
	cmp r0, #0xa5
	bhs _0233A6CC
_0233A6C4:
	mov r0, #0
	ldmia sp!, {r3, pc}
_0233A6CC:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0233A6D4: .word DUNGEON_PTR
	arm_func_end IsNormalFloor

	arm_func_start GenerateFloor
GenerateFloor: ; 0x0233A6D8
#ifdef JAPAN
#define GENERATE_FLOOR_OFFSET -0xA4
#else
#define GENERATE_FLOOR_OFFSET 0
#endif
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x54
	ldr r2, _0233AE64 ; =DUNGEON_PTR
	mov r8, #0
	ldr r3, [r2]
	ldr r0, _0233AE68 ; =0x000286B2
	add r1, r3, #0x12000
	str r8, [r1, #0xaa4 + GENERATE_FLOOR_OFFSET]
	ldr r1, [r2]
	add sb, r3, r0
	add r0, r1, #0x3f00
	strh r8, [r0, #0xc2 + GENERATE_FLOOR_OFFSET]
	bl LoadFixedRoomDataVeneer
	bl ov29_02343DC4
	ldr r1, _0233AE64 ; =DUNGEON_PTR
	ldr r2, _0233AE6C ; =FLOOR_GENERATION_STATUS
	ldr r1, [r1]
	mov r3, r8
	add r1, r1, #0x12000
	str r0, [r1, #0xaa4 + GENERATE_FLOOR_OFFSET]
	strb r3, [r2, #3]
	strb r3, [r2, #1]
	strb r3, [r2, #7]
	bl ResetHiddenStairsSpawn
	bl IsOutlawMonsterHouseFloor
	ldr r1, _0233AE64 ; =DUNGEON_PTR
	ldr r3, _0233AE6C ; =FLOOR_GENERATION_STATUS
	ldr r2, [r1]
	mov r1, sb
	add r2, r2, #0xc4 + GENERATE_FLOOR_OFFSET
	strb r0, [r3, #8]
	add r0, r2, #0x4000
	bl GetHiddenStairsType
	ldr r1, _0233AE64 ; =DUNGEON_PTR
	ldr r2, _0233AE6C ; =FLOOR_GENERATION_STATUS
	ldr r1, [r1]
	str r0, [r2, #0x2c]
	add r0, r1, #0x4000
	ldrsh r1, [r0, #0xd4 + GENERATE_FLOOR_OFFSET]
	ldr r0, _0233AE70 ; =SECONDARY_TERRAIN_TYPES
	ldrb r0, [r0, r1]
	mov r1, #0xff
	cmp r0, #2
	moveq r2, #1
	ldr r0, _0233AE6C ; =FLOOR_GENERATION_STATUS
	movne r2, r8
	strb r2, [r0, #4]
	strb r1, [r0, #2]
	mov r1, #0
	strb r1, [r0, #6]
	ldrb r0, [sb, #7]
	bl GetFinalKecleonShopSpawnChance
	ldr r1, _0233AE6C ; =FLOOR_GENERATION_STATUS
	strh r0, [r1, #0xc]
	ldrb r0, [sb, #8]
	strh r0, [r1, #0x10]
	ldrb r0, [r1, #8]
	cmp r0, #0
	movne r0, #0x64
	strneh r0, [r1, #0x10]
	ldr r0, _0233AE6C ; =FLOOR_GENERATION_STATUS
	mov r1, #1
	strb r1, [r0]
	sub r1, r1, #2
	str r1, [r0, #0x30]
	str r1, [r0, #0x38]
	str r1, [r0, #0x34]
	str r1, [r0, #0x3c]
	bl ResetFloor
	bl IsNormalFloor
	cmp r0, #0
	bne _0233A810
	ldr r0, _0233AE64 ; =DUNGEON_PTR
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x700
	strh r1, [r0, #0x86]
	b _0233A828
_0233A810:
	ldrb r0, [sb, #6]
	bl abs
	ldr r1, _0233AE64 ; =DUNGEON_PTR
	ldr r1, [r1]
	add r1, r1, #0x700
	strh r0, [r1, #0x86]
_0233A828:
	ldr r3, _0233AE64 ; =DUNGEON_PTR
	mov r7, #0
	ldr r0, [r3]
	ldr r1, _0233AE74 ; =0x00012AFA
	add r0, r0, #0x4000
	strb r7, [r0, #0xc5 + GENERATE_FLOOR_OFFSET]
	ldr r0, [r3]
	ldr r2, _0233AE6C ; =FLOOR_GENERATION_STATUS
	add r0, r0, #0x4000
	strb r7, [r0, #0xc6 + GENERATE_FLOOR_OFFSET]
	ldr r0, [r3]
	strh r7, [r0, r1]
	ldr r0, [r3]
	add r0, r0, #0x4000
	str r7, [r0, #0xcc + GENERATE_FLOOR_OFFSET]
	ldrb r0, [sb, #0xc]
	str r0, [r2, #0x18]
	b _0233AD3C
_0233A870:
	ldr r1, _0233AE64 ; =DUNGEON_PTR
	mov r0, #0
	str r0, [sp]
	ldr r0, [r1]
	add r0, r0, #0xc4 + GENERATE_FLOOR_OFFSET
	add r0, r0, #0x4000
	bl ResetImportantSpawnPositions
	mov r6, #0
	mvn r5, #0
	ldr r4, _0233AE64 ; =DUNGEON_PTR
	b _0233AC50
_0233A89C:
	ldr r0, [sp]
	cmp r0, #0
	beq _0233A8C8
	ldr r0, [r4]
	add r0, r0, #0x4000
	ldrb r0, [r0, #0xda + GENERATE_FLOOR_OFFSET]
	bl IsNotFullFloorFixedRoom
	cmp r0, #0
	beq _0233AC58
	mov r0, #0
	str r0, [sp]
_0233A8C8:
	ldr r0, [r4]
	cmp r6, #1
	add r0, r0, #0x4000
	strh r6, [r0, #0xde + GENERATE_FLOOR_OFFSET]
	ldrge r0, _0233AE6C ; =FLOOR_GENERATION_STATUS
	movge r1, #0
	strge r1, [r0, #0x18]
	ldr r0, _0233AE6C ; =FLOOR_GENERATION_STATUS
	mov r1, #0
	strb r1, [r0, #5]
	strh r5, [r0, #0x20]
	strh r5, [r0, #0x22]
	bl ResetFloor
	ldr r0, [r4]
	add r0, r0, #0xcc00
	strh r5, [r0, #0xe0 + GENERATE_FLOOR_OFFSET]
	ldr r0, [r4]
	add r0, r0, #0xcc00
	strh r5, [r0, #0xe2 + GENERATE_FLOOR_OFFSET]
	ldr r0, [r4]
	add r1, r0, #0x4000
	mov r0, #0
	strb r0, [r1, #0xc4 + GENERATE_FLOOR_OFFSET]
	ldr r0, [r4]
	add r0, r0, #0x4000
	ldrb r0, [r0, #0xda + GENERATE_FLOOR_OFFSET]
	cmp r0, #0
	beq _0233A954
	mov r1, sb
	bl GenerateFixedRoom
	cmp r0, #0
	bne _0233AC58
	mov r0, #1
	str r0, [sp]
	b _0233AB78
_0233A954:
	mov r0, #2
	ldrb sl, [sb]
	mov fp, #0x20
	str r0, [sp, #4]
	str r0, [sp, #8]
	b _0233A9DC
_0233A96C:
	cmp sl, #8
	mov r0, #2
	beq _0233A998
	mov r1, #9
	bl DungeonRandRange
	str r0, [sp, #8]
	mov r0, #2
	mov r1, #8
	bl DungeonRandRange
	str r0, [sp, #4]
	b _0233A9B4
_0233A998:
	mov r1, #5
	bl DungeonRandRange
	str r0, [sp, #8]
	mov r0, #2
	mov r1, #4
	bl DungeonRandRange
	str r0, [sp, #4]
_0233A9B4:
	ldr r0, [sp, #8]
	cmp r0, #6
	ldrle r0, [sp, #4]
	cmple r0, #4
	ble _0233A9E4
	subs fp, fp, #1
	moveq r0, #4
	streq r0, [sp, #8]
	streq r0, [sp, #4]
	beq _0233A9E4
_0233A9DC:
	cmp fp, #0
	bne _0233A96C
_0233A9E4:
	ldr r1, [sp, #8]
	mov r0, #0x38
	bl _s32_div_f
	cmp r0, #7
	movle r0, #1
	strle r0, [sp, #8]
	ldr r1, [sp, #4]
	mov r0, #0x20
	bl _s32_div_f
	ldr r1, [r4]
	cmp r0, #7
	add r2, r1, #0x4000
	mov r1, #0
	strb r1, [r2, #0xc4 + GENERATE_FLOOR_OFFSET]
	ldr r1, [r4]
	movle r0, #1
	add r2, r1, #0x4000
	mov r1, #0xff
	strb r1, [r2, #0xc9 + GENERATE_FLOOR_OFFSET]
	ldr r1, _0233AE6C ; =FLOOR_GENERATION_STATUS
	strle r0, [sp, #4]
	and r0, sl, #0xf
	cmp r0, #0xb
	str sl, [r1, #0x28]
	addls pc, pc, r0, lsl #2
	b _0233AAD4
_0233AA4C: ; jump table
	b _0233AAD4 ; case 0
	b _0233AA7C ; case 1
	b _0233AAEC ; case 2
	b _0233AB04 ; case 3
	b _0233AB14 ; case 4
	b _0233AB24 ; case 5
	b _0233AB3C ; case 6
	b _0233AB4C ; case 7
	b _0233AAD4 ; case 8
	b _0233AB58 ; case 9
	b _0233AB64 ; case 10
	b _0233AAA8 ; case 11
_0233AA7C:
	mov r0, #2
	bl DungeonRandInt
	ldr r1, _0233AE6C ; =FLOOR_GENERATION_STATUS
	mov r2, #1
	strb r2, [r1, #6]
	add r1, r0, #2
	mov r0, #4
	mov r2, sb
	bl GenerateStandardFloor
	mov r8, #1
	b _0233AB78
_0233AAA8:
	mov r0, #2
	bl DungeonRandInt
	ldr r1, _0233AE6C ; =FLOOR_GENERATION_STATUS
	mov r2, #2
	strb r2, [r1, #6]
	add r1, r0, #2
	mov r0, #4
	mov r2, sb
	bl GenerateStandardFloor
	mov r8, #1
	b _0233AB78
_0233AAD4:
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	mov r2, sb
	bl GenerateStandardFloor
	mov r8, #1
	b _0233AB78
_0233AAEC:
	bl GenerateOneRoomMonsterHouseFloor
	ldr r0, [r4]
	add r1, r0, #0x4000
	mov r0, #1
	strb r0, [r1, #0xc4 + GENERATE_FLOOR_OFFSET]
	b _0233AB78
_0233AB04:
	mov r0, sb
	bl GenerateOuterRingFloor
	mov r8, #1
	b _0233AB78
_0233AB14:
	mov r0, sb
	bl GenerateCrossroadsFloor
	mov r8, #1
	b _0233AB78
_0233AB24:
	bl GenerateTwoRoomsWithMonsterHouseFloor
	ldr r0, [r4]
	add r1, r0, #0x4000
	mov r0, #1
	strb r0, [r1, #0xc4 + GENERATE_FLOOR_OFFSET]
	b _0233AB78
_0233AB3C:
	mov r0, sb
	bl GenerateLineFloor
	mov r8, #1
	b _0233AB78
_0233AB4C:
	mov r0, sb
	bl GenerateCrossFloor
	b _0233AB78
_0233AB58:
	mov r0, sb
	bl GenerateBeetleFloor
	b _0233AB78
_0233AB64:
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	mov r2, sb
	bl GenerateOuterRoomsFloor
	mov r8, #1
_0233AB78:
	bl ResetInnerBoundaryTileRows
	bl EnsureImpassableTilesAreWalls
	ldr r0, _0233AE6C ; =FLOOR_GENERATION_STATUS
	ldrb r0, [r0, #5]
	cmp r0, #0
	bne _0233AC4C
	mov sl, #0
	mov r2, sl
_0233AB98:
	mov r1, #0
	add r0, sp, #0x14
	strb r1, [r0, r2]
	add r2, r2, #1
	cmp r2, #0x40
	blt _0233AB98
	mov r0, r1
	str r0, [sp, #0xc]
_0233ABB8:
	mov fp, #0
_0233ABBC:
	ldr r0, [sp, #0xc]
	mov r1, fp
	bl GetTile
	str r0, [sp, #0x10]
	bl GetTileTerrain
	cmp r0, #1
	bne _0233ABFC
	ldr r0, [sp, #0x10]
	ldrb r2, [r0, #7]
	cmp r2, #0xf0
	bhi _0233ABFC
	cmp r2, #0x40
	movlo r1, #1
	addlo r0, sp, #0x14
	add sl, sl, #1
	strlob r1, [r0, r2]
_0233ABFC:
	add fp, fp, #1
	cmp fp, #0x20
	blt _0233ABBC
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #0x38
	blt _0233ABB8
	mov r1, #0
	mov r2, r1
_0233AC24:
	add r0, sp, #0x14
	ldrb r0, [r0, r2]
	add r2, r2, #1
	cmp r0, #0
	addne r1, r1, #1
	cmp r2, #0x40
	blt _0233AC24
	cmp sl, #0x1e
	cmpge r1, #2
	bge _0233AC58
_0233AC4C:
	add r6, r6, #1
_0233AC50:
	cmp r6, #0xa
	blt _0233A89C
_0233AC58:
	cmp r6, #0xa
	bne _0233AC88
	ldr r0, _0233AE6C ; =FLOOR_GENERATION_STATUS
	mvn r1, #0
	strh r1, [r0, #0x20]
	strh r1, [r0, #0x22]
	bl GenerateOneRoomMonsterHouseFloor
	ldr r0, _0233AE64 ; =DUNGEON_PTR
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x4000
	strb r1, [r0, #0xc4 + GENERATE_FLOOR_OFFSET]
_0233AC88:
	bl FinalizeJunctions
	cmp r8, #0
	beq _0233ACA0
	mov r1, sb
	mov r0, #1
	bl GenerateSecondaryTerrainFormations
_0233ACA0:
	bl DungeonRand100
	ldrb r1, [sb, #0x19]
	cmp r0, r1
	movlt r0, #1
	movge r0, #0
	and r4, r0, #0xff
	mov r0, sb
	mov r1, r4
	bl MarkNonEnemySpawns
	mov r0, sb
	mov r1, r4
	bl MarkEnemySpawns
	bl ResolveInvalidSpawns
	ldr r0, _0233AE64 ; =DUNGEON_PTR
	mvn r1, #0
	ldr r0, [r0]
	add r0, r0, #0xcc00
	ldrsh r2, [r0, #0xe0 + GENERATE_FLOOR_OFFSET]
	cmp r2, r1
	ldrnesh r0, [r0, #0xe2 + GENERATE_FLOOR_OFFSET]
	cmpne r0, r1
	beq _0233AD38
	bl GetFloorType
	cmp r0, #1
	beq _0233AD44
	ldr r0, _0233AE64 ; =DUNGEON_PTR
	mvn r2, #0
	ldr r0, [r0]
	add r1, r0, #0xcc00
	ldrsh r0, [r1, #0xe4 + GENERATE_FLOOR_OFFSET]
	cmp r0, r2
	ldrnesh r1, [r1, #0xe6 + GENERATE_FLOOR_OFFSET]
	cmpne r1, r2
	beq _0233AD38
	mov r2, #0
	bl StairsAlwaysReachable
	cmp r0, #0
	bne _0233AD44
_0233AD38:
	add r7, r7, #1
_0233AD3C:
	cmp r7, #0xa
	blt _0233A870
_0233AD44:
	cmp r7, #0xa
	bne _0233AD98
	ldr r0, _0233AE6C ; =FLOOR_GENERATION_STATUS
	mvn r1, #0
	strh r1, [r0, #0x20]
	strh r1, [r0, #0x22]
	bl ResetFloor
	bl GenerateOneRoomMonsterHouseFloor
	ldr r0, _0233AE64 ; =DUNGEON_PTR
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x4000
	strb r1, [r0, #0xc4 + GENERATE_FLOOR_OFFSET]
	bl FinalizeJunctions
	mov r0, sb
	mov r1, #0
	bl MarkNonEnemySpawns
	mov r0, sb
	mov r1, #0
	bl MarkEnemySpawns
	bl ResolveInvalidSpawns
_0233AD98:
	ldr r0, _0233AE6C ; =FLOOR_GENERATION_STATUS
	ldrsh r1, [r0, #0x20]
	cmp r1, #0
	ldrgesh r0, [r0, #0x22]
	cmpge r0, #0
	blt _0233ADCC
	bl GetKecleonIdToSpawnByFloor
	ldr r1, _0233AE6C ; =FLOOR_GENERATION_STATUS
	mov r2, r0
	ldrsh r0, [r1, #0x20]
	ldrsh r1, [r1, #0x22]
	mov r3, #0
	bl MarkShopkeeperSpawn
_0233ADCC:
	ldr r0, _0233AE6C ; =FLOOR_GENERATION_STATUS
	ldr r0, [r0, #0x30]
	cmp r0, #0
	ldrlt r0, _0233AE64 ; =DUNGEON_PTR
	movlt r1, #0
	blt _0233ADF4
	mov r0, sb
	bl ov29_023427E4
	ldr r0, _0233AE64 ; =DUNGEON_PTR
	mov r1, #1
_0233ADF4:
	ldr r0, [r0]
	mov r2, #0x38
	add r0, r0, #0x4000
	strb r1, [r0, #0xc6 + GENERATE_FLOOR_OFFSET]
	mov r0, #0
	mov r1, r0
	mov r3, #0x20
	bl FlagHallwayJunctions
	ldr r0, _0233AE6C ; =FLOOR_GENERATION_STATUS
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _0233AE28
	bl ConvertSecondaryTerrainToChasms
_0233AE28:
	ldr r0, _0233AE64 ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrsh r0, [r0, #0xd4 + GENERATE_FLOOR_OFFSET]
	sub r0, r0, #0x1a
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _0233AE58
	bl ConvertWallsToChasms
_0233AE58:
	bl UnloadFixedRoomData
	add sp, sp, #0x54
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0233AE64: .word DUNGEON_PTR
_0233AE68: .word 0x000286B2 + GENERATE_FLOOR_OFFSET
_0233AE6C: .word FLOOR_GENERATION_STATUS
_0233AE70: .word SECONDARY_TERRAIN_TYPES
_0233AE74: .word 0x00012AFA + GENERATE_FLOOR_OFFSET
	arm_func_end GenerateFloor
