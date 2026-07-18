#include "overlay_14_0238ABA0.h"
#include "main_0202593C.h"
#include "sentry_duty.h"
#include "util.h"

extern struct sentry_duty *SENTRY_DUTY_PTR;
extern s8 ov14_0238DB84[16];
extern u8 ov14_0238DAE8[];

extern s32 GetSentryDutyGamePoints(s16 slot);
extern void PreprocessString(u8 *output, s32 output_size, const u8 *format, u32 flags, struct preprocess_args *args);
extern void ClearWindow(s8 window_id);
extern void ShowDialogueBox(s8 window_id);
extern void ShowStringIdInDialogueBox(s8 window_id, s32 flags, u16 string_id, struct preprocess_args *args);
extern void GetNameRaw(u8 *buffer, s16 monster_id);
extern void DrawTextInWindow(s8 window_id, s32 x, s32 y, u8 *text);
extern void UpdateWindow(s8 window_id);

struct vec2 { s32 x; s32 y; };

extern struct vec2 ov14_0238DA40[];
extern struct vec2 ov14_0238D970[];
extern s16 ov14_0238DA60[];
extern u8 ov14_0238DB0C[];
extern u8 ov14_0238DB18[];
extern u8 ov14_0238DB24[];
extern u8 ov14_0238DB28[];

extern void AnimRelatedFunction__022F6F14(struct animation *anim, struct vec2 *pos, s32 arg2);
extern void AnimRelatedFunction__022F7064(struct animation *anim, struct vec2 *pos, s32 arg2);
extern bool8 ov11_022F4990(struct animation *anim);
extern void SetAnimDataFields2(struct animation *anim, s32 arg1, s32 arg2);
extern void PlaySeByIdVolumeWrapper(s32 se_id);
extern void ov14_0238D828(u8 *str, struct animation **anim_cursor, s32 *x_pos, s32 y, s32 min_len);
extern s32 _s32_div_f(s32 numerator, s32 denominator);

u8* ov14_0238ABA0(u8* buffer, s32 idx)
{
    struct preprocess_args args;
    args.number_vals[0] = GetSentryDutyGamePoints((s16)idx);
#ifdef JAPAN
    args.strings[0] = StringFromId((u16)(idx + 0x3D49));
#else
    args.strings[0] = StringFromId((u16)(idx + 0x6E0));
#endif
    PreprocessString(buffer, 0x400, ov14_0238DAE8, 0xC402, &args);
    return buffer;
}

void ov14_0238AC04(s32 arg0)
{
    s32 i;
    for (i = 1; i < 0x10; i++)
    {
        ov14_0238DB84[i] = (i >= 0x10 - arg0) ? 2 : 1;
    }
}

void ov14_0238AC40(void)
{
#ifdef JAPAN
    SENTRY_DUTY_PTR->prev_dialogue_str_id =
        SENTRY_DUTY_PTR->field_0x3888 + (SENTRY_DUTY_PTR->field_0x3880 * 4 + 0x3D60);
#else
    SENTRY_DUTY_PTR->prev_dialogue_str_id =
        SENTRY_DUTY_PTR->field_0x3888 + (SENTRY_DUTY_PTR->field_0x3880 * 4 + 0x6F7);
#endif
    ShowDialogueBox(SENTRY_DUTY_PTR->field_0x1);
    ShowStringIdInDialogueBox(SENTRY_DUTY_PTR->field_0x1, 0x408,
                              (u16)SENTRY_DUTY_PTR->prev_dialogue_str_id,
                              &SENTRY_DUTY_PTR->preprocessor_args);
    ShowDialogueBox(SENTRY_DUTY_PTR->field_0x1);
    SENTRY_DUTY_PTR->field_0x3888++;
    SENTRY_DUTY_PTR->field_0x3888 %= 4;
}

void ov14_0238ACEC(s8 window_id)
{
    if (window_id == -2)
        return;

    ClearWindow(window_id);
}

void ov14_0238AD04(s8 window_id)
{
    u8 buffer[0x18];

    if (window_id == -2)
        return;

    ClearWindow(window_id);
    if (window_id == SENTRY_DUTY_PTR->field_0x4)
    {
        GetNameRaw(buffer, SENTRY_DUTY_PTR->field_0x38a2[0]);
#ifdef JAPAN
        DrawTextInWindow(window_id, 0, -1, buffer);
#else
        DrawTextInWindow(window_id, 2, -1, buffer);
#endif
        GetNameRaw(buffer, SENTRY_DUTY_PTR->field_0x38a2[1]);
#ifdef JAPAN
        DrawTextInWindow(window_id, 0x78, -1, buffer);
#else
        DrawTextInWindow(window_id, 0x7A, -1, buffer);
#endif
    }

    if (window_id == SENTRY_DUTY_PTR->field_0x5)
    {
        GetNameRaw(buffer, SENTRY_DUTY_PTR->field_0x38a2[2]);
#ifdef JAPAN
        DrawTextInWindow(window_id, 0, -1, buffer);
#else
        DrawTextInWindow(window_id, 2, -1, buffer);
#endif
        GetNameRaw(buffer, SENTRY_DUTY_PTR->field_0x38a2[3]);
#ifdef JAPAN
        DrawTextInWindow(window_id, 0x78, -1, buffer);
#else
        DrawTextInWindow(window_id, 0x7A, -1, buffer);
#endif
    }

    UpdateWindow(window_id);
}

// Matches instruction-for-instruction, but with several registers allocated differently.
#ifdef NONMATCHING
void SentryUpdateDisplay(void)
{
    struct preprocess_args args;
    struct vec2 pos;
    struct animation *cursor2;
    s32 x2;
    struct animation *cursor1;
    s32 x1;
    s32 i;

    pos = ov14_0238D970[2];
    if (SENTRY_DUTY_PTR == NULL || SENTRY_DUTY_PTR->field_0x11c == 2)
        return;

    if (SENTRY_DUTY_PTR->field_0x3870 != 0 && (s16)(SENTRY_DUTY_PTR->field_0x3874 / 0x3C) >= 9)
    {
        if (SENTRY_DUTY_PTR->field_0x3540 == 2)
            SENTRY_DUTY_PTR->field_0x3540 = 3;

        for (i = 0; i < 4; i++)
        {
            pos.x = ov14_0238DA40[i].x + 0x2200;
            pos.y = ov14_0238DA40[i].y + 0x1600;
            AnimRelatedFunction__022F6F14(&SENTRY_DUTY_PTR->field_0x2a78[i], &pos, 0);
        }
    }

    if (SENTRY_DUTY_PTR->field_0x3870 != 0)
    {
        for (i = 0; i < 4; i++)
        {
            if (SENTRY_DUTY_PTR->field_0x3544[i] != SENTRY_DUTY_PTR->field_0x3554[i])
            {
                SENTRY_DUTY_PTR->field_0x3544[i] = SENTRY_DUTY_PTR->field_0x3554[i];
                switch (SENTRY_DUTY_PTR->field_0x3544[i])
                {
                    case 2:
                        SetAnimDataFields2(&SENTRY_DUTY_PTR->field_0x2d88[i], 0x804, 0);
                        break;
                    case 3:
                        SetAnimDataFields2(&SENTRY_DUTY_PTR->field_0x2d88[i], 0x1005, 0);
                        break;
                    case 4:
                        SetAnimDataFields2(&SENTRY_DUTY_PTR->field_0x2d88[i], 0x806, 0);
                        break;
                }
            }

            if (SENTRY_DUTY_PTR->field_0x3544[i] > 1)
                AnimRelatedFunction__022F6F14(&SENTRY_DUTY_PTR->field_0x2d88[i], &ov14_0238DA40[i], 0);
        }
    }

    if (SENTRY_DUTY_PTR->field_0x3870 != 0)
    {
        pos.x = 0x8000;
        pos.y = SENTRY_DUTY_PTR->field_0x38b0 << 8;
        AnimRelatedFunction__022F7064(&SENTRY_DUTY_PTR->field_0x33a8, &pos, 0);
        AnimRelatedFunction__022F6F14(&SENTRY_DUTY_PTR->field_0x346c, &pos, 0);
    }

    if (SENTRY_DUTY_PTR->field_0x3870 != 0)
    {
        switch (SENTRY_DUTY_PTR->field_0x3538)
        {
            case 0:
                break;
            case 3:
                if (SENTRY_DUTY_PTR->field_0x3534 == 4 && ov11_022F4990(&SENTRY_DUTY_PTR->field_0x29b4))
                    break;

                if (SENTRY_DUTY_PTR->field_0x3534 != 3)
                    SetAnimDataFields2(&SENTRY_DUTY_PTR->field_0x29b4, 0x801, 0);

                SENTRY_DUTY_PTR->field_0x3534 = SENTRY_DUTY_PTR->field_0x3538;
                SENTRY_DUTY_PTR->field_0x3538 = 0;
                break;
            case 4:
                SetAnimDataFields2(&SENTRY_DUTY_PTR->field_0x29b4, 0x1002, 0);
                SENTRY_DUTY_PTR->field_0x3534 = SENTRY_DUTY_PTR->field_0x3538;
                SENTRY_DUTY_PTR->field_0x3538 = 0;
                break;
            case 5:
                SetAnimDataFields2(&SENTRY_DUTY_PTR->field_0x29b4, 0x802, 0);
                SENTRY_DUTY_PTR->field_0x3534 = SENTRY_DUTY_PTR->field_0x3538;
                SENTRY_DUTY_PTR->field_0x3538 = 0;
                break;
            default:
                if (SENTRY_DUTY_PTR->field_0x3534 != SENTRY_DUTY_PTR->field_0x3538)
                    SetAnimDataFields2(&SENTRY_DUTY_PTR->field_0x29b4, 0x800, 0);

                SENTRY_DUTY_PTR->field_0x3534 = SENTRY_DUTY_PTR->field_0x3538;
                SENTRY_DUTY_PTR->field_0x3538 = 0;
                break;
        }

        if (SENTRY_DUTY_PTR->field_0x3534 != 1)
            AnimRelatedFunction__022F6F14(&SENTRY_DUTY_PTR->field_0x29b4,
                                          &ov14_0238DA40[SENTRY_DUTY_PTR->field_0x3878], 0);
    }

    for (i = 0; i < 0x10; i++)
    {
        SetAnimDataFields2(&SENTRY_DUTY_PTR->field_0x36c[i], (s16)(ov14_0238DB84[i] + 0x800), 0);
        pos.x = ov14_0238DA60[i] << 8;
        pos.y = 0xA000;
        AnimRelatedFunction__022F6F14(&SENTRY_DUTY_PTR->field_0x36c[i], &pos, 0);
    }

    if (SENTRY_DUTY_PTR->field_0x3884 != SENTRY_DUTY_PTR->field_0x3564)
    {
        SENTRY_DUTY_PTR->field_0x3564 = SENTRY_DUTY_PTR->field_0x3884;
        args.number_vals[0] = SENTRY_DUTY_PTR->field_0x3564 + 1;
        args.number_vals[1] = 6;
        if (args.number_vals[0] > 6)
            args.number_vals[0] = 6;

        PreprocessString(SENTRY_DUTY_PTR->field_0x3570, 0x400, ov14_0238DB0C, 0xC402, &args);
        PreprocessString(SENTRY_DUTY_PTR->field_0x3670, 0x400, ov14_0238DB18, 0xC402, &args);
    }

    if (SENTRY_DUTY_PTR->field_0x3564 >= 0)
    {
        cursor1 = &SENTRY_DUTY_PTR->field_0xfac[0];
        x1 = 0x3A;
        ov14_0238D828(SENTRY_DUTY_PTR->field_0x3570, &cursor1, &x1, 0x16, 1);
        ov14_0238D828(ov14_0238DB24, &cursor1, &x1, 0x16, 0);
        ov14_0238D828(SENTRY_DUTY_PTR->field_0x3670, &cursor1, &x1, 0x16, 1);
    }

    if (SENTRY_DUTY_PTR->field_0x388c != SENTRY_DUTY_PTR->field_0x3568)
    {
        SENTRY_DUTY_PTR->field_0x3568 = SENTRY_DUTY_PTR->field_0x388c;
        args.number_vals[0] = SENTRY_DUTY_PTR->field_0x3568;
        PreprocessString(SENTRY_DUTY_PTR->field_0x3770, 0x400, ov14_0238DB0C, 0xC402, &args);
    }

    if (SENTRY_DUTY_PTR->field_0x3568 >= 0)
    {
        cursor2 = &SENTRY_DUTY_PTR->field_0x1bec[0];
        x2 = 0xA8;
        ov14_0238D828(SENTRY_DUTY_PTR->field_0x3770, &cursor2, &x2, 0x18, 8);
        ov14_0238D828(ov14_0238DB28, &cursor2, &x2, 0x18, 0);
    }

    if (SENTRY_DUTY_PTR->field_0x3898 != SENTRY_DUTY_PTR->field_0x356c)
    {
        if (SENTRY_DUTY_PTR->field_0x3898 > SENTRY_DUTY_PTR->field_0x356c)
        {
            for (i = SENTRY_DUTY_PTR->field_0x356c; i < SENTRY_DUTY_PTR->field_0x3898; i++)
            {
                SetAnimDataFields2(&SENTRY_DUTY_PTR->field_0x282c[i], 0x304, 0);
            }
        }
        else
        {
            for (i = SENTRY_DUTY_PTR->field_0x3898; i < SENTRY_DUTY_PTR->field_0x356c; i++)
            {
                SetAnimDataFields2(&SENTRY_DUTY_PTR->field_0x282c[i], 0x1004, 0);
            }
        }

        SENTRY_DUTY_PTR->field_0x356c = SENTRY_DUTY_PTR->field_0x3898;
    }

    pos.y = 0x2600;
    for (i = 0; i < 2; i++)
    {
        pos.x = ((i << 4) + 0xD6) << 8;
        AnimRelatedFunction__022F6F14(&SENTRY_DUTY_PTR->field_0x282c[i], &pos, 0);
    }

    if (SENTRY_DUTY_PTR->field_0x3870 == 0)
        return;

    if (SENTRY_DUTY_PTR->field_0x353c != SENTRY_DUTY_PTR->field_0x3540)
    {
        SENTRY_DUTY_PTR->field_0x353c = SENTRY_DUTY_PTR->field_0x3540;
        for (i = 0; i < 4; i++)
        {
            SetAnimDataFields2(&SENTRY_DUTY_PTR->field_0x3098[i], 0x1003, 0);
        }

        if (SENTRY_DUTY_PTR->field_0x353c == 3)
            PlaySeByIdVolumeWrapper(0x2C05);
    }

    if (SENTRY_DUTY_PTR->field_0x353c > 1)
    {
        for (i = 0; i < 4; i++)
        {
            switch (SENTRY_DUTY_PTR->field_0x353c)
            {
                case 2:
                    pos.x = ov14_0238DA40[i].x - 0x1600;
                    pos.y = ov14_0238DA40[i].y - 0x600;
                    AnimRelatedFunction__022F6F14(&SENTRY_DUTY_PTR->field_0x3098[i], &pos, 0);
                    break;
                case 3:
                    pos.x = ov14_0238DA40[i].x + 0x2200;
                    pos.y = ov14_0238DA40[i].y + 0xE00;
                    AnimRelatedFunction__022F6F14(&SENTRY_DUTY_PTR->field_0x3098[i], &pos, 0);
                    break;
            }
        }
    }
}
#else
asm void SentryUpdateDisplay(void)
{
	stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
	sub sp, sp, #0x6c
	ldr r1, =ov14_0238D970
	ldr r0, =SENTRY_DUTY_PTR
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
	ldr r4, =ov14_0238DA40
	ldr r7, =SENTRY_DUTY_PTR
	streq r1, [r0, #0x540]
	add r9, sp, #0x14
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
	add r10, r2, #0x2200
	add r3, r1, #0x1600
	mov r1, r9
	mov r2, r8
	str r10, [sp, #0x14]
	str r3, [sp, #0x18]
	bl AnimRelatedFunction__022F6F14
	add r5, r5, #1
	cmp r5, #4
	blt _0238AE88
_0238AECC:
	ldr r7, =SENTRY_DUTY_PTR
	ldr r0, [r7]
	add r0, r0, #0x3000
	ldrb r0, [r0, #0x870]
	cmp r0, #0
	beq _0238AFDC
	ldr r0, =0x00000806
	mov r4, #0xc4
	ldr r8, =ov14_0238DA40
	mov r10, #0
	sub r9, r0, #2
	mov r5, r4
	mov r6, r4
	mov r11, r4
_0238AF04:
	ldr r0, [r7]
	add r0, r0, r10, lsl #2
	add r0, r0, #0x3000
	ldr r2, [r0, #0x544]
	ldr r1, [r0, #0x554]
	cmp r2, r1
	beq _0238AFA0
	str r1, [r0, #0x544]
	ldr r1, [r7]
	add r0, r1, r10, lsl #2
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
	mla r0, r10, r6, r0
	mov r1, r9
	mov r2, #0
	bl SetAnimDataFields2
	b _0238AFA0
_0238AF6C:
	add r0, r1, #0x188
	add r0, r0, #0x2c00
	mla r0, r10, r5, r0
	ldr r1, =0x00001005
	mov r2, #0
	bl SetAnimDataFields2
	b _0238AFA0
_0238AF88:
	add r0, r1, #0x188
	add r0, r0, #0x2c00
	mla r0, r10, r4, r0
	ldr r1, =0x00000806
	mov r2, #0
	bl SetAnimDataFields2
_0238AFA0:
	ldr r1, [r7]
	add r0, r1, r10, lsl #2
	add r0, r0, #0x3000
	ldr r0, [r0, #0x544]
	cmp r0, #1
	ble _0238AFD0
	add r0, r1, #0x188
	add r0, r0, #0x2c00
	mla r0, r10, r11, r0
	add r1, r8, r10, lsl #3
	mov r2, #0
	bl AnimRelatedFunction__022F6F14
_0238AFD0:
	add r10, r10, #1
	cmp r10, #4
	blt _0238AF04
_0238AFDC:
	ldr r0, =SENTRY_DUTY_PTR
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
	ldr r0, =SENTRY_DUTY_PTR
	add r1, sp, #0x14
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x6c
	add r0, r0, #0x3400
	bl AnimRelatedFunction__022F6F14
_0238B038:
	ldr r0, =SENTRY_DUTY_PTR
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
	ldr r0, =SENTRY_DUTY_PTR
	ldr r1, [r0]
	add r0, r1, #0x3000
	ldr r0, [r0, #0x534]
	cmp r0, #3
	beq _0238B0C4
	add r0, r1, #0x1b4
	ldr r1, =0x00000801
	add r0, r0, #0x2800
	mov r2, #0
	bl SetAnimDataFields2
_0238B0C4:
	ldr r1, =SENTRY_DUTY_PTR
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
	ldr r1, =0x00001002
	add r0, r0, #0x2800
	mov r2, #0
	bl SetAnimDataFields2
	ldr r1, =SENTRY_DUTY_PTR
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
	ldr r1, =0x00000802
	add r0, r0, #0x2800
	mov r2, #0
	bl SetAnimDataFields2
	ldr r1, =SENTRY_DUTY_PTR
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
	ldr r1, =SENTRY_DUTY_PTR
	mov r2, #0
	ldr r0, [r1]
	add r0, r0, #0x3000
	ldr r3, [r0, #0x538]
	str r3, [r0, #0x534]
	ldr r0, [r1]
	add r0, r0, #0x3000
	str r2, [r0, #0x538]
_0238B1A8:
	ldr r0, =SENTRY_DUTY_PTR
	ldr r3, [r0]
	add r0, r3, #0x3000
	ldr r1, [r0, #0x534]
	cmp r1, #1
	beq _0238B1DC
	ldr r1, [r0, #0x878]
	ldr r2, =ov14_0238DA40
	add r0, r3, #0x1b4
	add r0, r0, #0x2800
	add r1, r2, r1, lsl #3
	mov r2, #0
	bl AnimRelatedFunction__022F6F14
_0238B1DC:
	mov r10, #0
	ldr r8, =ov14_0238DB84
	ldr r7, =ov14_0238DA60
	ldr r5, =SENTRY_DUTY_PTR
	mov r11, r10
	mov r6, #0xa000
	mov r4, #0xc4
_0238B1F8:
	mul r9, r10, r4
	ldrsb r0, [r8, r10]
	ldr r1, [r5]
	mov r2, r11
	add r0, r0, #0x800
	add r3, r1, #0x36c
	mov r1, r0, lsl #0x10
	add r0, r3, r9
	mov r1, r1, asr #0x10
	bl SetAnimDataFields2
	mov r0, r10, lsl #1
	ldrsh r1, [r7, r0]
	ldr r0, [r5]
	mov r2, #0
	mov r1, r1, lsl #8
	add r0, r0, #0x36c
	str r1, [sp, #0x14]
	add r0, r0, r9
	add r1, sp, #0x14
	str r6, [sp, #0x18]
	bl AnimRelatedFunction__022F6F14
	add r10, r10, #1
	cmp r10, #0x10
	blt _0238B1F8
	ldr r1, =SENTRY_DUTY_PTR
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
	ldr r3, =0x0000C402
	add r0, r0, #1
	str r0, [sp, #0x40]
	cmp r0, #6
	add r0, r2, #0x570
	ldr r2, =ov14_0238DB0C
	str r1, [sp, #0x44]
	strgt r1, [sp, #0x40]
	add r4, sp, #0x1c
	add r0, r0, #0x3000
	mov r1, #0x400
	str r4, [sp]
	bl PreprocessString
	mov r1, r4
	str r1, [sp]
	ldr r0, =SENTRY_DUTY_PTR
	ldr r2, =ov14_0238DB18
	ldr r0, [r0]
	ldr r3, =0x0000C402
	add r0, r0, #0x670
	add r0, r0, #0x3000
	mov r1, #0x400
	bl PreprocessString
_0238B2E4:
	ldr r0, =SENTRY_DUTY_PTR
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
	ldr r0, =ov14_0238DB24
	add r1, sp, #0x10
	add r2, sp, #0xc
	mov r3, #0x16
	str r4, [sp]
	bl ov14_0238D828
	mov r1, #1
	str r1, [sp]
	ldr r0, =SENTRY_DUTY_PTR
	add r1, sp, #0x10
	ldr r0, [r0]
	add r2, sp, #0xc
	add r0, r0, #0x670
	add r0, r0, #0x3000
	mov r3, #0x16
	bl ov14_0238D828
_0238B374:
	ldr r1, =SENTRY_DUTY_PTR
	ldr r0, [r1]
	add r0, r0, #0x3000
	ldr r3, [r0, #0x88c]
	ldr r2, [r0, #0x568]
	cmp r3, r2
	beq _0238B3C4
	str r3, [r0, #0x568]
	ldr r2, [r1]
	ldr r3, =0x0000C402
	add r0, r2, #0x3000
	ldr r1, [r0, #0x568]
	add r0, r2, #0x770
	str r1, [sp, #0x40]
	add r4, sp, #0x1c
	ldr r2, =ov14_0238DB0C
	add r0, r0, #0x3000
	mov r1, #0x400
	str r4, [sp]
	bl PreprocessString
_0238B3C4:
	ldr r0, =SENTRY_DUTY_PTR
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
	ldr r0, =ov14_0238DB28
	add r1, sp, #8
	add r2, sp, #4
	mov r3, #0x18
	str r4, [sp]
	bl ov14_0238D828
_0238B42C:
	ldr r4, =SENTRY_DUTY_PTR
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
	ldr r6, =0x00001004
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
	ldr r0, =SENTRY_DUTY_PTR
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldr r1, [r0, #0x898]
	str r1, [r0, #0x56c]
_0238B4E4:
	mov r0, #0x2600
	mov r4, #0
	ldr r6, =SENTRY_DUTY_PTR
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
	ldr r6, =SENTRY_DUTY_PTR
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
	ldr r8, =0x00001003
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
	ldr r0, =SENTRY_DUTY_PTR
	ldr r0, [r0]
	add r0, r0, #0x3000
	ldr r0, [r0, #0x53c]
	cmp r0, #3
	bne _0238B5BC
	ldr r0, =0x00002C05
	bl PlaySeByIdVolumeWrapper
_0238B5BC:
	ldr r6, =SENTRY_DUTY_PTR
	ldr r0, [r6]
	add r0, r0, #0x3000
	ldr r0, [r0, #0x53c]
	cmp r0, #1
	ble _0238B688
	mov r10, #0
	mov r4, #0xc4
	ldr r9, =ov14_0238DA40
	add r8, sp, #0x14
	mov r11, r10
	mov r7, r10
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
	mla r0, r10, r5, r0
	add r1, r9, r10, lsl #3
	ldr r2, [r9, r10, lsl #3]
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
	mla r0, r10, r4, r0
	add r1, r9, r10, lsl #3
	ldr r2, [r9, r10, lsl #3]
	ldr r1, [r1, #4]
	add r3, r2, #0x2200
	add ip, r1, #0xe00
	mov r1, r8
	mov r2, r11
	str r3, [sp, #0x14]
	str ip, [sp, #0x18]
	bl AnimRelatedFunction__022F6F14
_0238B67C:
	add r10, r10, #1
	cmp r10, #4
	blt _0238B5F0
_0238B688:
	add sp, sp, #0x6c
	ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
}
#endif
