#include "sentry_duty_states_1.h"
#include "overlay_14_0238ABA0.h"
#include "sentry_duty_states.h"
#include "util.h"
#include "window.h"

extern struct sentry_duty *SENTRY_DUTY_PTR;
extern s32 ov14_0238D970[];

extern void ClearWindow(s8 window_id);
extern void PlaySeByIdVolumeWrapper(s32 se_id);
extern void SentrySetExitingState(void);
extern void sub_02017B7C(s32 arg0);
extern void UpdateWindow(s8 window_id);
extern void ov11_022F6EFC(struct animation *anim);
extern void ov11_022F7058(struct animation *anim);
extern s32 SetSentryDutyGamePoints(s32 points);
extern void InitPortraitParams(portrait_params *params);
extern void SetPortraitLayout(portrait_params *params, u32 layout_idx);
extern void SetPortraitOffset(portrait_params *params, s32 *offset);
extern void ShowPortraitInPortraitBox(s8 window_id, portrait_params *params);

void SentryStateFinalizeRound(void)
{
    portrait_params params;
    s32 offset[4];
    u8 answered;
    s32 offset_y;
    s32 offset_x;
    s16 i;
    s8 portrait_id;

    answered = SENTRY_DUTY_PTR->field_0x3870;
    SENTRY_DUTY_PTR->field_0x3870 = 0;
    SENTRY_DUTY_PTR->field_0x3884++;
    SENTRY_DUTY_PTR->field_0x3874 = 0;
    SENTRY_DUTY_PTR->field_0x3871 = 0;
    ov14_0238AC04(0);
    if (answered != 0)
    {
        ov11_022F7058(&SENTRY_DUTY_PTR->field_0x33a8);
        ov11_022F6EFC(&SENTRY_DUTY_PTR->field_0x346c);
        SENTRY_DUTY_PTR->field_0x3534 = 1;
        SENTRY_DUTY_PTR->field_0x3538 = 0;
        ov11_022F6EFC(&SENTRY_DUTY_PTR->field_0x29b4);
    }

    offset_x = ov14_0238D970[2];
    offset_y = ov14_0238D970[3];
    offset[0] = offset_x;
    offset[1] = offset_y;
    for (i = 0; i < 4; i++)
    {
        ov11_022F6EFC(&SENTRY_DUTY_PTR->field_0x2a78[i]);
        ov11_022F6EFC(&SENTRY_DUTY_PTR->field_0x2d88[i]);
        ov11_022F6EFC(&SENTRY_DUTY_PTR->field_0x3098[i]);
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

    ClearWindow(SENTRY_DUTY_PTR->field_0x4);
    UpdateWindow(SENTRY_DUTY_PTR->field_0x4);
    ClearWindow(SENTRY_DUTY_PTR->field_0x5);
    UpdateWindow(SENTRY_DUTY_PTR->field_0x5);
    if (SENTRY_DUTY_PTR->field_0x3884 < 6)
    {
        SENTRY_DUTY_PTR->next_game_state = 0xF;
    }
    else
    {
        SENTRY_DUTY_PTR->field_0x38ac = 0;
        if (SetSentryDutyGamePoints(SENTRY_DUTY_PTR->field_0x388c) != 0)
        {
            SENTRY_DUTY_PTR->field_0x3890 = 0;
            if (SENTRY_DUTY_PTR->field_0x388c > 0xFA0)
                SENTRY_DUTY_PTR->field_0x3890 = 1;

            if (SENTRY_DUTY_PTR->field_0x388c > 0x1B58)
                SENTRY_DUTY_PTR->field_0x3890 = 2;

            if (SENTRY_DUTY_PTR->field_0x389c != 0)
                SENTRY_DUTY_PTR->field_0x3890 = 3;
        }
        else
        {
            SENTRY_DUTY_PTR->field_0x3890 = 4;
            if (SENTRY_DUTY_PTR->field_0x388c > 0xFA0)
                SENTRY_DUTY_PTR->field_0x3890 = 5;

            if (SENTRY_DUTY_PTR->field_0x388c > 0x1B58)
                SENTRY_DUTY_PTR->field_0x3890 = 6;

            if (SENTRY_DUTY_PTR->field_0x389c != 0)
                SENTRY_DUTY_PTR->field_0x3890 = 7;
        }

        switch (SENTRY_DUTY_PTR->field_0x11c)
        {
            case 1:
                SENTRY_DUTY_PTR->next_game_state = 0x1E;
                break;
            case 0:
            default:
                SENTRY_DUTY_PTR->next_game_state = 0x20;
                break;
        }
    }
}

void SentryStateF(void)
{
    SENTRY_DUTY_PTR->next_game_state = 0xA;
}

void SentryState10(void)
{
    SENTRY_DUTY_PTR->field_0x3898--;
    SENTRY_DUTY_PTR->field_0x3894 -= 0xFA;
    if (SENTRY_DUTY_PTR->field_0x3 != -2)
        ClearWindow(SENTRY_DUTY_PTR->field_0x3);

    PlaySeByIdVolumeWrapper(0x2C08);
    SENTRY_DUTY_PTR->prev_dialogue_str_id = -1;
    SENTRY_DUTY_PTR->next_game_state = 0x11;
}

void SentryState11(void)
{
    SENTRY_DUTY_PTR->next_game_state = 0xD;
}

void SentryState12(void)
{
    SENTRY_DUTY_PTR->field_0x389c = 0;
    SENTRY_DUTY_PTR->preprocessor_args.number_vals[0] = 0x2311;
    SENTRY_DUTY_PTR->next_game_state = 0x13;
}

void SentryState13(void)
{
    SENTRY_DUTY_PTR->field_0x38ac = 1;
    SENTRY_DUTY_PTR->next_game_state = 0x17;
}

void SentryState14(void)
{
    SENTRY_DUTY_PTR->next_game_state = 0x15;
}

void SentryState15(void)
{
    if (SENTRY_DUTY_PTR->field_0x38ac < 2)
    {
        SentrySetStateIntermediate(0x14);
        return;
    }

    PlaySeByIdVolumeWrapper(0x304);
    SentrySetStateIntermediate(0x16);
}

void SentryState16(void)
{
    SENTRY_DUTY_PTR->field_0x38b0 -= 4;
    if (SENTRY_DUTY_PTR->field_0x38b0 >= -0x40)
        return;

    SENTRY_DUTY_PTR->field_0x389c = 0;
    SENTRY_DUTY_PTR->field_0x38ac = 0;
    SentrySetStateIntermediate(0x17);
}

void SentryState17(void)
{
    SENTRY_DUTY_PTR->preprocessor_args.flag_vals[0] = SENTRY_DUTY_PTR->field_0x38a2[SENTRY_DUTY_PTR->field_0x387c];
    if (SENTRY_DUTY_PTR->field_0x3871 == 0)
        SENTRY_DUTY_PTR->field_0x3554[SENTRY_DUTY_PTR->field_0x3878] = 3;

    SENTRY_DUTY_PTR->field_0x3554[SENTRY_DUTY_PTR->field_0x387c] = 4;
    SENTRY_DUTY_PTR->next_game_state = 0x18;
}

void SentryState18(void)
{
    if (SENTRY_DUTY_PTR->field_0x38ac < 2)
    {
        SentrySetStateIntermediate(0x17);
        return;
    }

    SentrySetStateIntermediate(0xE);
}

void SentryState19(void)
{
    SENTRY_DUTY_PTR->next_game_state = 0x1A;
}

void SentryState1A(void)
{
    if (SENTRY_DUTY_PTR->field_0x38ac < 2)
    {
        SentrySetStateIntermediate(0x19);
        return;
    }

    PlaySeByIdVolumeWrapper(0x304);
    SentrySetStateIntermediate(0x1B);
}

void SentryStateFinalizePoints(void)
{
    SENTRY_DUTY_PTR->field_0x38b0 -= 4;
    if (SENTRY_DUTY_PTR->field_0x38b0 >= -0x40)
        return;

    SENTRY_DUTY_PTR->field_0x388c += SENTRY_DUTY_PTR->field_0x3894;
    if (SENTRY_DUTY_PTR->field_0x3884 == 5)
    {
        if (SENTRY_DUTY_PTR->field_0x389c != 0)
            SENTRY_DUTY_PTR->field_0x388c += 0x7D0;
    }

    SENTRY_DUTY_PTR->field_0x38ac = 0;
    SentrySetStateIntermediate(0x1C);
}

void SentryState1C(void)
{
    SENTRY_DUTY_PTR->preprocessor_args.number_vals[0] = 0x2310;
    SENTRY_DUTY_PTR->field_0x3554[SENTRY_DUTY_PTR->field_0x3878] = 2;
    SENTRY_DUTY_PTR->next_game_state = 0x1D;
}

void SentryState1D(void)
{
    if (SENTRY_DUTY_PTR->field_0x38ac == 1)
    {
        if (SENTRY_DUTY_PTR->field_0x3 != -2)
            ClearWindow(SENTRY_DUTY_PTR->field_0x3);
    }

    if (SENTRY_DUTY_PTR->field_0x38ac < 1)
    {
        SentrySetStateIntermediate(0x1C);
        return;
    }

    SentrySetStateIntermediate(0xE);
}

void SentryState1E(void)
{
    SENTRY_DUTY_PTR->next_game_state = 0x1F;
}

void SentryState1F(void)
{
    if (SENTRY_DUTY_PTR->field_0x38ac < 2)
    {
        SentrySetStateIntermediate(0x1E);
        SENTRY_DUTY_PTR->field_0x38b4 = 0x1E;
        return;
    }

    if (SENTRY_DUTY_PTR->field_0x38b4 == 0x1E)
        sub_02017B7C(0x1E);

    if (SENTRY_DUTY_PTR->field_0x38b4 > 0)
    {
        SENTRY_DUTY_PTR->field_0x38b4--;
        return;
    }

    SentrySetExitingState();
}

void SentryState20(void)
{
    SENTRY_DUTY_PTR->next_game_state = 0x21;
}

void SentryState21(void)
{
    if (SENTRY_DUTY_PTR->field_0x38ac < 2)
    {
        SentrySetStateIntermediate(0x20);
        SENTRY_DUTY_PTR->field_0x38b4 = 0x1E;
        return;
    }

    if (SENTRY_DUTY_PTR->field_0x38b4 == 0x1E)
        sub_02017B7C(0x1E);

    if (SENTRY_DUTY_PTR->field_0x38b4 > 0)
    {
        SENTRY_DUTY_PTR->field_0x38b4--;
        return;
    }

    SentrySetExitingState();
}
