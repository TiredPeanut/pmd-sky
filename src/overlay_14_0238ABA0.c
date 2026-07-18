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

void SentryUpdateDisplay(void)
{
    struct preprocess_args args;
    struct vec2 pos;
    struct animation *cursor1;
    s32 x1;
    struct animation *cursor2;
    s32 x2;
    s32 i;
    struct sentry_duty *sentry;
    s32 tmp;

    // The volatile read is needed to load y before x while storing x before y.
    tmp = *(volatile s32 *)&ov14_0238D970[2].y;
    pos.x = ov14_0238D970[2].x;
    pos.y = tmp;
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
            sentry = SENTRY_DUTY_PTR;
            if (sentry->field_0x3544[i] != sentry->field_0x3554[i])
            {
                sentry->field_0x3544[i] = sentry->field_0x3554[i];
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
        if (SENTRY_DUTY_PTR->field_0x3538 != 0)
        switch (SENTRY_DUTY_PTR->field_0x3538)
        {
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

    sentry = SENTRY_DUTY_PTR;
    if (sentry->field_0x353c != sentry->field_0x3540)
    {
        sentry->field_0x353c = sentry->field_0x3540;
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
