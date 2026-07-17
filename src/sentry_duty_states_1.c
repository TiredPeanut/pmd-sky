#include "sentry_duty_states_1.h"
#include "sentry_duty_states.h"
#include "util.h"

extern struct sentry_duty *SENTRY_DUTY_PTR;

extern void ClearWindow(s8 window_id);
extern void PlaySeByIdVolumeWrapper(s32 se_id);
extern void SentrySetExitingState(void);
extern void sub_02017B7C(s32 arg0);

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
    SENTRY_DUTY_PTR->field_0xc8 = 0x2311;
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
    SENTRY_DUTY_PTR->field_0xa4 = SENTRY_DUTY_PTR->field_0x38a2[SENTRY_DUTY_PTR->field_0x387c];
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
    SENTRY_DUTY_PTR->field_0xc8 = 0x2310;
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
