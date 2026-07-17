#include "overlay_14_0238ABA0.h"
#include "main_0202593C.h"
#include "sentry_duty.h"
#include "util.h"

extern struct sentry_duty *SENTRY_DUTY_PTR;
extern u8 ov14_0238DB84[16];
extern u8 ov14_0238DAE8[];

extern s32 GetSentryDutyGamePoints(s16 slot);
extern void PreprocessString(u8 *output, s32 output_size, const u8 *format, u32 flags, struct preprocess_args *args);
extern void ClearWindow(s8 window_id);
extern void ShowDialogueBox(s8 window_id);
extern void ShowStringIdInDialogueBox(s8 window_id, s32 flags, u16 string_id, struct preprocess_args *args);
extern void GetNameRaw(u8 *buffer, s16 monster_id);
extern void DrawTextInWindow(s8 window_id, s32 x, s32 y, u8 *text);
extern void UpdateWindow(s8 window_id);

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
