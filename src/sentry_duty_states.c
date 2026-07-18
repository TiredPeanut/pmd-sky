#include "sentry_duty_states.h"
#include "common.h"
#include "debug.h"
#include "main_02054BE0.h"
#include "overlay_14_0238ABA0.h"
#include "util.h"
#include "window.h"

extern struct sentry_duty *SENTRY_DUTY_PTR;
extern s16 SENTRY_DUTY_MONSTER_IDS[];
extern s32 ov14_0238D970[];
extern u8 ov14_0238DB2C[];
extern u8 ov14_0238DB44[];
extern u8 ov14_0238DB58[];

extern bool8 IsSimpleMenuActive(s32 menu_id);
extern s32 GetSimpleMenuResult__0202B870(s32 menu_id);
extern void SentrySetExitingState(void);
extern struct ground_monster *GetHero(void);
extern struct ground_monster *GetPartner(void);
extern s32 RandRange(s32 from, s32 to);
extern void PlaySeByIdVolumeWrapper(s32 se_id);
extern void ClearWindow(s8 window_id);
extern void ov11_022F5BBC(struct animation *anim, s16 monster_id, u32 flags);
extern void ov11_022F6FE0(struct animation *anim, s16 arg1, u32 flags);
extern void SetAnimDataFields2(struct animation *anim, s32 arg1, s32 arg2);
extern void SetAnimDataFieldsWrapper(struct animation *anim, u32 arg1);
extern void InitAnimDataFromOtherAnimDataVeneer(struct animation *dst, struct animation *src);
extern void InitPortraitParams(portrait_params *params);
extern void SetPortraitLayout(portrait_params *params, u32 layout_idx);
extern void SetPortraitOffset(portrait_params *params, s32 *offset);
extern void ShowPortraitInPortraitBox(s8 window_id, portrait_params *params);

void SentrySetStateIntermediate(s32 next_state)
{
    SENTRY_DUTY_PTR->control_state = SENTRY_CTRL_INTERMEDIATE_TRANSITION;
    SENTRY_DUTY_PTR->next_game_state = next_state;
}

void SentryState0(void)
{
    SENTRY_DUTY_PTR->field_0x118 = 0x80000000;
    SENTRY_DUTY_PTR->next_game_state = 1;
}

void SentryState1(void)
{
    if (IsSimpleMenuActive(SENTRY_DUTY_PTR->field_0xb))
        return;

    switch (GetSimpleMenuResult__0202B870(SENTRY_DUTY_PTR->field_0xb))
    {
        case 8:
        default:
            SentrySetStateIntermediate(2);
            break;
        case 9:
            SentrySetStateIntermediate(6);
            break;
    }
}

void SentryState2(void)
{
    SENTRY_DUTY_PTR->field_0x118 = 0x40000000;
    SENTRY_DUTY_PTR->next_game_state = 3;
}

void SentryState3(void)
{
    if (IsSimpleMenuActive(SENTRY_DUTY_PTR->field_0xa))
        return;

    switch (GetSimpleMenuResult__0202B870(SENTRY_DUTY_PTR->field_0xa))
    {
        case -1:
            break;
        case 0:
            SENTRY_DUTY_PTR->field_0x3890 = 0;
            break;
        case 1:
            SENTRY_DUTY_PTR->field_0x3890 = 1;
            break;
        case 2:
            SENTRY_DUTY_PTR->field_0x3890 = 2;
            break;
        case 3:
            SENTRY_DUTY_PTR->field_0x3890 = 3;
            break;
        case 4:
            SENTRY_DUTY_PTR->field_0x3890 = 4;
            break;
        case 5:
            SENTRY_DUTY_PTR->field_0x3890 = 5;
            break;
        case 6:
            SENTRY_DUTY_PTR->field_0x3890 = 6;
            break;
        case 7:
            SENTRY_DUTY_PTR->field_0x3890 = 7;
            break;
    }

    SentrySetExitingState();
}

void SentryState4(void)
{
    SENTRY_DUTY_PTR->field_0x118 = 3;
    SENTRY_DUTY_PTR->next_game_state = 5;
}

void SentryStateExit(void)
{
    SentrySetExitingState();
}

void SentryState6(void)
{
    SENTRY_DUTY_PTR->field_0x118 = 3;
    SENTRY_DUTY_PTR->next_game_state = 7;
}

void SentryState7(void)
{
    SENTRY_DUTY_PTR->next_game_state = 8;
}

void SentryState8(void)
{
    SENTRY_DUTY_PTR->field_0x118 = 3;
    SENTRY_DUTY_PTR->next_game_state = 9;
}

void SentryState9(void)
{
    SENTRY_DUTY_PTR->field_0x118 = 2;
    SENTRY_DUTY_PTR->next_game_state = 0xC;
}

void SentryStateA(void)
{
    SENTRY_DUTY_PTR->next_game_state = 0xB;
}

void SentryStateB(void)
{
    SENTRY_DUTY_PTR->next_game_state = 0xC;
}

// Matches instruction-for-instruction except for the register allocation of
// hero (r7 vs r6), portrait_id (r6 vs r7), and offset_x (r7 vs r6).
#ifdef NONMATCHING
void SentryStateGenerateChoices(void)
{
    portrait_params params;
    s32 offset[4];
    struct ground_monster *partner;
    struct ground_monster *hero;
    s8 portrait_id;
    s16 monster_id;
    s16 i;
    s16 j;
    s32 rounds;
    s32 offset_y;
    s32 offset_x;

    SENTRY_DUTY_PTR->field_0x118 = 0x3FA;
    hero = GetHero();
    partner = GetPartner();
    SENTRY_DUTY_PTR->field_0x3878 = 0;
    SENTRY_DUTY_PTR->field_0x3894 = 0x5DC;
    SENTRY_DUTY_PTR->field_0x3888 = RandRange(0, 4);
    SENTRY_DUTY_PTR->field_0x389d[0] = 0;
    SENTRY_DUTY_PTR->field_0x389d[1] = 0;
    SENTRY_DUTY_PTR->field_0x389d[2] = 0;
    SENTRY_DUTY_PTR->field_0x389d[3] = 0;
    SENTRY_DUTY_PTR->field_0x3871 = 0;
    SENTRY_DUTY_PTR->field_0x3874 = 0;
    ov14_0238AC04(0);
    SENTRY_DUTY_PTR->field_0x387c = RandRange(0, 4);
    while (TRUE)
    {
        SENTRY_DUTY_PTR->field_0x3880 = RandRange(0, 0x65);
        SENTRY_DUTY_PTR->field_0x38a2[SENTRY_DUTY_PTR->field_0x387c] =
            SENTRY_DUTY_MONSTER_IDS[SENTRY_DUTY_PTR->field_0x3880];
        if (SENTRY_DUTY_PTR->field_0x38a2[SENTRY_DUTY_PTR->field_0x387c] == FemaleToMaleForm(hero->id))
            continue;

        if (SENTRY_DUTY_PTR->field_0x38a2[SENTRY_DUTY_PTR->field_0x387c] == FemaleToMaleForm(partner->id)
            || SENTRY_DUTY_PTR->field_0x38a2[SENTRY_DUTY_PTR->field_0x387c] == 0x119)
            continue;

        rounds = SENTRY_DUTY_PTR->field_0x3884;
        for (i = 0; i < rounds; i++)
        {
            if (SENTRY_DUTY_PTR->field_0x3880 == SENTRY_DUTY_PTR->field_0x38b8[i])
                break;
        }

        if (i < rounds)
            continue;

        break;
    }

    SENTRY_DUTY_PTR->field_0x38b8[rounds] = SENTRY_DUTY_PTR->field_0x3880;
    for (i = 0; i < 4; i++)
    {
        if (i == SENTRY_DUTY_PTR->field_0x387c)
            continue;

        while (TRUE)
        {
            monster_id = SENTRY_DUTY_MONSTER_IDS[RandRange(0, 0x65)];
            if (monster_id == FemaleToMaleForm(hero->id))
                continue;

            if (monster_id == FemaleToMaleForm(partner->id) || monster_id == 0x119)
                continue;

            if (monster_id == SENTRY_DUTY_PTR->field_0x38a2[SENTRY_DUTY_PTR->field_0x387c])
                continue;

            for (j = 0; j < i; j++)
            {
                if (monster_id == SENTRY_DUTY_PTR->field_0x38a2[j])
                    break;
            }

            if (j < i)
                continue;

            break;
        }

        SENTRY_DUTY_PTR->field_0x38a2[i] = monster_id;
    }

    Debug_Print0(ov14_0238DB2C);
    Debug_Print0(ov14_0238DB44, SENTRY_DUTY_PTR->field_0x3880);
    Debug_Print0(ov14_0238DB58, SENTRY_DUTY_PTR->field_0x387c);
    ov11_022F6FE0(&SENTRY_DUTY_PTR->field_0x33a8, (s16)(SENTRY_DUTY_PTR->field_0x3880 + 1), 0x880A0000);
    SetAnimDataFields2(&SENTRY_DUTY_PTR->field_0x33a8, 0x1001, 0);
    InitAnimDataFromOtherAnimDataVeneer(&SENTRY_DUTY_PTR->field_0x346c, &SENTRY_DUTY_PTR->field_0x1e4);
    SetAnimDataFields2(&SENTRY_DUTY_PTR->field_0x346c, 0x1003, 0);
    SENTRY_DUTY_PTR->field_0x38b0 = 0x60;
    InitAnimDataFromOtherAnimDataVeneer(&SENTRY_DUTY_PTR->field_0x29b4, &SENTRY_DUTY_PTR->field_0x120);
    SetAnimDataFieldsWrapper(&SENTRY_DUTY_PTR->field_0x29b4, 0x48140000);
    SetAnimDataFields2(&SENTRY_DUTY_PTR->field_0x29b4, 0x800, 0);
    SENTRY_DUTY_PTR->field_0x353c = 0;
    SENTRY_DUTY_PTR->field_0x3540 = 0;
    offset_x = ov14_0238D970[0];
    offset_y = ov14_0238D970[1];
    offset[0] = offset_x;
    offset[1] = offset_y;
    for (i = 0; i < 4; i++)
    {
        ov11_022F5BBC(&SENTRY_DUTY_PTR->field_0x2a78[i], SENTRY_DUTY_PTR->field_0x38a2[i], 0x08120000);
        SetAnimDataFields2(&SENTRY_DUTY_PTR->field_0x2a78[i], 0x807, 7);
        InitAnimDataFromOtherAnimDataVeneer(&SENTRY_DUTY_PTR->field_0x2d88[i], &SENTRY_DUTY_PTR->field_0x120);
        SetAnimDataFieldsWrapper(&SENTRY_DUTY_PTR->field_0x2d88[i], 0x48140000);
        SENTRY_DUTY_PTR->field_0x3544[i] = 1;
        SENTRY_DUTY_PTR->field_0x3554[i] = 1;
        InitAnimDataFromOtherAnimDataVeneer(&SENTRY_DUTY_PTR->field_0x3098[i], &SENTRY_DUTY_PTR->field_0x120);
        switch (i)
        {
            case 0:
                portrait_id = SENTRY_DUTY_PTR->field_0x6;
                break;
            case 1:
                portrait_id = SENTRY_DUTY_PTR->field_0x7;
                break;
            case 2:
                portrait_id = SENTRY_DUTY_PTR->field_0x8;
                break;
            case 3:
                portrait_id = SENTRY_DUTY_PTR->field_0x9;
                break;
        }

        if (portrait_id != -2)
        {
            offset[2] = offset_x;
            offset[3] = offset_y;
            InitPortraitParams(&params);
            SetPortraitLayout(&params, 3);
            SetPortraitOffset(&params, &offset[2]);
            ShowPortraitInPortraitBox(portrait_id, &params);
        }
    }

    ov14_0238AD04(SENTRY_DUTY_PTR->field_0x4);
    ov14_0238AD04(SENTRY_DUTY_PTR->field_0x5);
    if (SENTRY_DUTY_PTR->field_0x3 != -2)
        ClearWindow(SENTRY_DUTY_PTR->field_0x3);

    SENTRY_DUTY_PTR->field_0x3870 = 1;
    PlaySeByIdVolumeWrapper(0x2C04);
    SENTRY_DUTY_PTR->field_0x3538 = 2;
    SENTRY_DUTY_PTR->next_game_state = 0xD;
}
#else
asm void SentryStateGenerateChoices(void)
{
	stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
	sub sp, sp, #0x20
	ldr r0, =SENTRY_DUTY_PTR
	ldr r1, =0x000003FA
	ldr r0, [r0]
	str r1, [r0, #0x118]
	bl GetHero
	mov r6, r0
	bl GetPartner
	ldr r2, =SENTRY_DUTY_PTR
	mov r5, r0
	ldr r1, [r2]
	mov r0, #0
	add r1, r1, #0x3000
	str r0, [r1, #0x878]
	ldr r1, [r2]
	ldr r3, =0x000005DC
	add r2, r1, #0x3000
	mov r1, #4
	str r3, [r2, #0x894]
	bl RandRange
	ldr r2, =SENTRY_DUTY_PTR
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
	ldr r1, =SENTRY_DUTY_PTR
	ldr r1, [r1]
	add r1, r1, #0x3000
	str r0, [r1, #0x87c]
_0238C564:
	mov r0, #0
	mov r1, #0x65
	bl RandRange
	ldr r2, =SENTRY_DUTY_PTR
	ldr r3, =SENTRY_DUTY_MONSTER_IDS
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
	ldr r1, =SENTRY_DUTY_PTR
	ldrsh r0, [r5, #4]
	ldr r2, [r1]
	add r1, r2, #0x3000
	ldr r1, [r1, #0x87c]
	add r1, r2, r1, lsl #1
	add r1, r1, #0x3800
	ldrsh r4, [r1, #0xa2]
	bl FemaleToMaleForm
	cmp r4, r0
	ldrne r0, =0x00000119
	cmpne r4, r0
	beq _0238C564
	ldr r0, =SENTRY_DUTY_PTR
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
	ldr r1, =SENTRY_DUTY_PTR
	mov r9, #0
	ldr r2, [r1]
	add r1, r2, #0x3000
	add r0, r2, r0, lsl #2
	ldr r1, [r1, #0x880]
	add r0, r0, #0x3000
	str r1, [r0, #0x8b8]
_0238C670:
	ldr r10, =SENTRY_DUTY_PTR
	ldr r0, [r10]
	add r0, r0, #0x3000
	ldr r0, [r0, #0x87c]
	cmp r9, r0
	beq _0238C72C
	ldr r4, =SENTRY_DUTY_MONSTER_IDS
	ldr r11, =0x00000119
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
	cmpne r8, r11
	beq _0238C690
	ldr r1, [r10]
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
	cmp r0, r9
	blt _0238C6F0
_0238C718:
	cmp r0, r9
	blt _0238C690
	add r0, r1, r9, lsl #1
	add r0, r0, #0x3800
	strh r8, [r0, #0xa2]
_0238C72C:
	add r0, r9, #1
	mov r0, r0, lsl #0x10
	mov r9, r0, asr #0x10
	cmp r9, #4
	blt _0238C670
	ldr r0, =ov14_0238DB2C
	bl Debug_Print0
	ldr r1, =SENTRY_DUTY_PTR
	ldr r0, =ov14_0238DB44
	ldr r1, [r1]
	add r1, r1, #0x3000
	ldr r1, [r1, #0x880]
	bl Debug_Print0
	ldr r1, =SENTRY_DUTY_PTR
	ldr r0, =ov14_0238DB58
	ldr r1, [r1]
	add r1, r1, #0x3000
	ldr r1, [r1, #0x87c]
	bl Debug_Print0
	ldr r0, =SENTRY_DUTY_PTR
	ldr r2, =0x880A0000
	ldr r3, [r0]
	add r0, r3, #0x3000
	ldr r1, [r0, #0x880]
	add r0, r3, #0x3a8
	add r1, r1, #1
	mov r1, r1, lsl #0x10
	add r0, r0, #0x3000
	mov r1, r1, asr #0x10
	bl ov11_022F6FE0
	ldr r0, =SENTRY_DUTY_PTR
	ldr r1, =0x00001001
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x3a8
	add r0, r0, #0x3000
	bl SetAnimDataFields2
	ldr r0, =SENTRY_DUTY_PTR
	ldr r1, [r0]
	add r0, r1, #0x6c
	add r0, r0, #0x3400
	add r1, r1, #0x1e4
	bl InitAnimDataFromOtherAnimDataVeneer
	ldr r0, =SENTRY_DUTY_PTR
	ldr r1, =0x00001003
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x6c
	add r0, r0, #0x3400
	bl SetAnimDataFields2
	ldr r1, =SENTRY_DUTY_PTR
	mov r2, #0x60
	ldr r0, [r1]
	add r0, r0, #0x3000
	str r2, [r0, #0x8b0]
	ldr r1, [r1]
	add r0, r1, #0x1b4
	add r0, r0, #0x2800
	add r1, r1, #0x120
	bl InitAnimDataFromOtherAnimDataVeneer
	ldr r0, =SENTRY_DUTY_PTR
	ldr r1, =0x48140000
	ldr r0, [r0]
	add r0, r0, #0x1b4
	add r0, r0, #0x2800
	bl SetAnimDataFieldsWrapper
	ldr r0, =SENTRY_DUTY_PTR
	mov r1, #0x800
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x1b4
	add r0, r0, #0x2800
	bl SetAnimDataFields2
	ldr r4, =SENTRY_DUTY_PTR
	mov r9, #0
	ldr r0, [r4]
	ldr r1, =ov14_0238D970
	add r0, r0, #0x3000
	str r9, [r0, #0x53c]
	ldr r0, [r4]
	mov r11, #1
	add r0, r0, #0x3000
	str r9, [r0, #0x540]
	ldr r6, [r1]
	ldr r5, [r1, #4]
	str r6, [sp]
	str r5, [sp, #4]
	mvn r10, #1
_0238C88C:
	mov r0, #0xc4
	mul r8, r9, r0
	ldr r1, [r4]
	ldr r2, =0x08120000
	add r0, r1, #0x278
	add r1, r1, r9, lsl #1
	add r1, r1, #0x3800
	add r0, r0, #0x2800
	ldrsh r1, [r1, #0xa2]
	add r0, r0, r8
	bl ov11_022F5BBC
	ldr r0, [r4]
	ldr r1, =0x00000807
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
	ldr r1, =0x48140000
	add r0, r0, #0x188
	add r0, r0, #0x2c00
	add r0, r0, r8
	bl SetAnimDataFieldsWrapper
	ldr r0, [r4]
	add r0, r0, r9, lsl #2
	add r0, r0, #0x3000
	str r11, [r0, #0x544]
	ldr r0, [r4]
	add r0, r0, r9, lsl #2
	add r0, r0, #0x3000
	str r11, [r0, #0x554]
	ldr r1, [r4]
	add r0, r1, #0x98
	add r0, r0, #0x3000
	add r0, r0, r8
	add r1, r1, #0x120
	bl InitAnimDataFromOtherAnimDataVeneer
	cmp r9, #3
	addls pc, pc, r9, lsl #2
	b _0238C984
_0238C948:
	b _0238C958
	b _0238C964
	b _0238C970
	b _0238C97C
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
	cmp r7, r10
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
	add r0, r9, #1
	mov r0, r0, lsl #0x10
	mov r9, r0, asr #0x10
	cmp r9, #4
	blt _0238C88C
	ldr r0, =SENTRY_DUTY_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #4]
	bl ov14_0238AD04
	ldr r0, =SENTRY_DUTY_PTR
	ldr r0, [r0]
	ldrsb r0, [r0, #5]
	bl ov14_0238AD04
	ldr r0, =SENTRY_DUTY_PTR
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #3]
	cmp r0, r1
	beq _0238CA10
	bl ClearWindow
_0238CA10:
	ldr r1, =SENTRY_DUTY_PTR
	ldr r0, =0x00002C04
	ldr r1, [r1]
	mov r2, #1
	add r1, r1, #0x3000
	strb r2, [r1, #0x870]
	bl PlaySeByIdVolumeWrapper
	ldr r1, =SENTRY_DUTY_PTR
	mov r3, #2
	ldr r0, [r1]
	mov r2, #0xd
	add r0, r0, #0x3000
	str r3, [r0, #0x538]
	ldr r0, [r1]
	str r2, [r0, #0x110]
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
}
#endif
