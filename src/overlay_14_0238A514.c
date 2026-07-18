#include "overlay_14_0238A514.h"
#include "sentry_duty.h"
#include "util.h"

extern struct sentry_duty *SENTRY_DUTY_PTR;

extern void *MemAlloc(u32 size, u32 flags);
extern void InitPreprocessorArgs(struct preprocess_args *args);
extern s32 GetHeroMemberIdx(void);
extern s32 GetPartnerMemberIdx(void);
extern void ov14_0238AC04(s32 arg0);
extern void LoadObjectAnimData(struct animation *anim, s32 anim_id, u32 flags);
extern void InitAnimDataFromOtherAnimDataVeneer(struct animation *dst, struct animation *src);
extern void SetAnimDataFields2(struct animation *anim, s32 arg1, s32 arg2);
extern void SetAnimDataFieldsWrapper(struct animation *anim, u32 arg1);
extern void PlayBgmByIdVeneer(s32 bgm_id);
extern void sub_0202F334(s8 window_id);
extern void sub_0202BC60(s8 window_id);
extern void HidePortraitBox(s8 window_id);
extern void sub_0202F954(s8 window_id);

u32 SentrySetupState(s32 param_0)
{
    struct sentry_duty *sentry_duty;
    s32 i;

    sentry_duty = MemAlloc(0x38D4, 8);
    SENTRY_DUTY_PTR = sentry_duty;
    InitPreprocessorArgs(&sentry_duty->preprocessor_args);
    SENTRY_DUTY_PTR->completion_state = SENTRY_COMPLETION_IN_PROGRESS;
    SENTRY_DUTY_PTR->next_game_state = SENTRY_DUTY_PTR->game_state;
    SENTRY_DUTY_PTR->control_state = SENTRY_CTRL_CONTINUE;
    SENTRY_DUTY_PTR->prev_dialogue_str_id = -1;
    SENTRY_DUTY_PTR->field_0x118 = 0;
    SENTRY_DUTY_PTR->field_0x388c = 0;
    SENTRY_DUTY_PTR->field_0x3890 = 0;
    SENTRY_DUTY_PTR->field_0x3530 = 0;
    SENTRY_DUTY_PTR->field_0x3534 = 2;
    SENTRY_DUTY_PTR->field_0x3538 = 0;
    SENTRY_DUTY_PTR->field_0x353c = 0;
    SENTRY_DUTY_PTR->field_0x3540 = 0;
    SENTRY_DUTY_PTR->field_0x3564 = -1;
    SENTRY_DUTY_PTR->field_0x3568 = -1;
    SENTRY_DUTY_PTR->field_0x356c = 0;
    SENTRY_DUTY_PTR->field_0x3870 = 0;
    SENTRY_DUTY_PTR->field_0x3884 = 0;
    SENTRY_DUTY_PTR->field_0x388c = 0;
    SENTRY_DUTY_PTR->field_0x3898 = 2;
    SENTRY_DUTY_PTR->field_0x389c = 1;
    for (i = 0; i < 4; i++)
    {
        SENTRY_DUTY_PTR->field_0x3544[i] = 1;
        SENTRY_DUTY_PTR->field_0x3554[i] = 1;
    }

    SENTRY_DUTY_PTR->field_0x3871 = 0;
    SENTRY_DUTY_PTR->field_0x3874 = 0;
    SENTRY_DUTY_PTR->field_0x38b0 = 0x60;
    for (i = 0; i < 6; i++)
    {
        SENTRY_DUTY_PTR->field_0x38b8[i] = -1;
    }

    SENTRY_DUTY_PTR->field_0x38d0 = GetHeroMemberIdx();
    SENTRY_DUTY_PTR->field_0x38d2 = GetPartnerMemberIdx();
    SENTRY_DUTY_PTR->field_0x11c = param_0;
    SENTRY_DUTY_PTR->field_0x0 = -2;
    SENTRY_DUTY_PTR->field_0x1 = -2;
    SENTRY_DUTY_PTR->field_0x2 = -2;
    SENTRY_DUTY_PTR->field_0x3 = -2;
    SENTRY_DUTY_PTR->field_0x4 = -2;
    SENTRY_DUTY_PTR->field_0x5 = -2;
    SENTRY_DUTY_PTR->field_0x6 = -2;
    SENTRY_DUTY_PTR->field_0x7 = -2;
    SENTRY_DUTY_PTR->field_0x8 = -2;
    SENTRY_DUTY_PTR->field_0x9 = -2;
    SENTRY_DUTY_PTR->field_0xa = -2;
    SENTRY_DUTY_PTR->field_0xb = -2;
    ov14_0238AC04(0);
#ifdef EUROPE
    LoadObjectAnimData(&SENTRY_DUTY_PTR->field_0x120, 0xBD, 0x8100000);
    LoadObjectAnimData(&SENTRY_DUTY_PTR->field_0x1e4, 0xDD, 0x88080000);
#else
    LoadObjectAnimData(&SENTRY_DUTY_PTR->field_0x120, 0xAD, 0x8100000);
    LoadObjectAnimData(&SENTRY_DUTY_PTR->field_0x1e4, 0xCD, 0x88080000);
#endif
    InitAnimDataFromOtherAnimDataVeneer(&SENTRY_DUTY_PTR->field_0x2a8, &SENTRY_DUTY_PTR->field_0x1e4);
    SetAnimDataFields2(&SENTRY_DUTY_PTR->field_0x2a8, 0x800, 0);
    for (i = 0; i < 16; i++)
    {
        InitAnimDataFromOtherAnimDataVeneer(&SENTRY_DUTY_PTR->field_0x36c[i], &SENTRY_DUTY_PTR->field_0x1e4);
        SetAnimDataFields2(&SENTRY_DUTY_PTR->field_0x36c[i], 0x800, 0);
        InitAnimDataFromOtherAnimDataVeneer(&SENTRY_DUTY_PTR->field_0xfac[i], &SENTRY_DUTY_PTR->field_0x1e4);
        SetAnimDataFieldsWrapper(&SENTRY_DUTY_PTR->field_0xfac[i], 0xC8100000);
        InitAnimDataFromOtherAnimDataVeneer(&SENTRY_DUTY_PTR->field_0x1bec[i], &SENTRY_DUTY_PTR->field_0x1e4);
        SetAnimDataFieldsWrapper(&SENTRY_DUTY_PTR->field_0x1bec[i], 0xC8100000);
    }

    for (i = 0; i < 2; i++)
    {
        InitAnimDataFromOtherAnimDataVeneer(&SENTRY_DUTY_PTR->field_0x282c[i], &SENTRY_DUTY_PTR->field_0x1e4);
        SetAnimDataFieldsWrapper(&SENTRY_DUTY_PTR->field_0x282c[i], 0xC8100000);
    }

    if (SENTRY_DUTY_PTR->field_0x11c == 2)
    {
        SENTRY_DUTY_PTR->game_state = 4;
    }
    else
    {
        SENTRY_DUTY_PTR->game_state = 6;
        PlayBgmByIdVeneer(4);
    }

    return 1;
}

void ov14_0238A514(void)
{
    if (!(SENTRY_DUTY_PTR->field_0x118 & 2) && SENTRY_DUTY_PTR->field_0x1 != -2)
        sub_0202F334(SENTRY_DUTY_PTR->field_0x1);

    if (!(SENTRY_DUTY_PTR->field_0x118 & 1) && SENTRY_DUTY_PTR->field_0x0 != -2)
        sub_0202BC60(SENTRY_DUTY_PTR->field_0x0);

    if (!(SENTRY_DUTY_PTR->field_0x118 & 4) && SENTRY_DUTY_PTR->field_0x2 != -2)
        HidePortraitBox(SENTRY_DUTY_PTR->field_0x2);

    if (!(SENTRY_DUTY_PTR->field_0x118 & 8) && SENTRY_DUTY_PTR->field_0x3 != -2)
        sub_0202F954(SENTRY_DUTY_PTR->field_0x3);

    if (!(SENTRY_DUTY_PTR->field_0x118 & 0x10) && SENTRY_DUTY_PTR->field_0x4 != -2)
        sub_0202F954(SENTRY_DUTY_PTR->field_0x4);

    if (!(SENTRY_DUTY_PTR->field_0x118 & 0x20) && SENTRY_DUTY_PTR->field_0x5 != -2)
        sub_0202F954(SENTRY_DUTY_PTR->field_0x5);

    if (!(SENTRY_DUTY_PTR->field_0x118 & 0x40) && SENTRY_DUTY_PTR->field_0x6 != -2)
        HidePortraitBox(SENTRY_DUTY_PTR->field_0x6);

    if (!(SENTRY_DUTY_PTR->field_0x118 & 0x80) && SENTRY_DUTY_PTR->field_0x7 != -2)
        HidePortraitBox(SENTRY_DUTY_PTR->field_0x7);

    if (!(SENTRY_DUTY_PTR->field_0x118 & 0x100) && SENTRY_DUTY_PTR->field_0x8 != -2)
        HidePortraitBox(SENTRY_DUTY_PTR->field_0x8);

    if (!(SENTRY_DUTY_PTR->field_0x118 & 0x200) && SENTRY_DUTY_PTR->field_0x9 != -2)
        HidePortraitBox(SENTRY_DUTY_PTR->field_0x9);
}
