#include "sentry_duty_states.h"
#include "util.h"

extern struct sentry_duty *SENTRY_DUTY_PTR;

extern bool8 IsSimpleMenuActive(s32 menu_id);
extern s32 GetSimpleMenuResult__0202B870(s32 menu_id);
extern void SentrySetExitingState(void);

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
