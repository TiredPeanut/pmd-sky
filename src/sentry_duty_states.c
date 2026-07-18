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
extern void sub_020063F4(s32 param, u16 *buttons);
extern void GetPressedButtons(s32 param, u16 *buttons);
extern bool8 IsTouchScreenNotOff(void);
extern void InitPortraitParamsWithMonsterId(portrait_params *params, s16 monster_id);
extern void SetPortraitEmotion(portrait_params *params, u32 emotion);
extern s32 ov14_0238DA20[][2];
extern s32 ov14_0238DA80[][2];
extern u8 ov14_0238D96C[];

// State of the stylus when it was released (see GetReleasedStylus)
struct released_stylus {
    u16 flags;
    u16 pad;
    s32 x;
    s32 y;
    u8 field_0xc[0x18];
};

extern void GetReleasedStylus(struct released_stylus *stylus);

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

void SentryStateGenerateChoices(void)
{
    s32 zero;
    portrait_params params;
    s32 offset[4];
    struct ground_monster *partner;
    s32 offset_y;
    s32 offset_x;
    struct ground_monster *hero;
    s8 portrait_id;
    s16 monster_id;
    s16 i;
    s16 j;
    s32 rounds;

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
    zero = 0;
    for (i = zero; i < 4; i++)
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

            for (j = zero; j < i; j++)
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
    SetAnimDataFields2(&SENTRY_DUTY_PTR->field_0x346c, 0x1003, zero);
    SENTRY_DUTY_PTR->field_0x38b0 = 0x60;
    InitAnimDataFromOtherAnimDataVeneer(&SENTRY_DUTY_PTR->field_0x29b4, &SENTRY_DUTY_PTR->field_0x120);
    SetAnimDataFieldsWrapper(&SENTRY_DUTY_PTR->field_0x29b4, 0x48140000);
    SetAnimDataFields2(&SENTRY_DUTY_PTR->field_0x29b4, 0x800, 0);
    SENTRY_DUTY_PTR->field_0x353c = 0;
    SENTRY_DUTY_PTR->field_0x3540 = 0;
    offset_x = ov14_0238D970[zero];
    offset_y = ov14_0238D970[1];
    offset[0] = offset_x;
    offset[1] = offset_y;
    for (i = zero; i < 4; i++)
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

void SentryStateGetUserChoice(void)
{
    portrait_params params;
    struct released_stylus stylus;
    u16 held;
    u16 pressed;
    s32 touched;
    s16 seconds;
    s16 i;

    SENTRY_DUTY_PTR->field_0x3874++;
    SENTRY_DUTY_PTR->field_0x3894--;
    seconds = SENTRY_DUTY_PTR->field_0x3874 / 0x3C;
    ov14_0238AC04(seconds % 0x10);
    if (SENTRY_DUTY_PTR->field_0x3874 / 0x3C < 0x10)
    {
        touched = 0;
        sub_020063F4(0, &held);
        GetPressedButtons(0, &pressed);
        if (IsTouchScreenNotOff())
        {
            GetReleasedStylus(&stylus);
            if (stylus.flags & 2)
            {
                for (i = 0; i < 4; i++)
                {
                    if (stylus.x >= ov14_0238DA20[i][0] - 0x38 && stylus.x <= ov14_0238DA20[i][0] + 0x40
                        && stylus.y >= ov14_0238DA20[i][1] - 0x20 && stylus.y <= ov14_0238DA20[i][1] + 0x28)
                    {
                        SENTRY_DUTY_PTR->field_0x3878 = i;
                        touched = 1;
                        break;
                    }
                }
            }
        }

        if (touched == 0)
        {
            if (pressed & 1)
            {
                held = 0;
                pressed = 0;
                touched = 1;
            }
        }

        if (touched != 0)
        {
            SENTRY_DUTY_PTR->field_0x38ac = 0;
            PlaySeByIdVolumeWrapper(0x3F02);
            SENTRY_DUTY_PTR->preprocessor_args.flag_vals[0] = SENTRY_DUTY_PTR->field_0x38a2[SENTRY_DUTY_PTR->field_0x3878];
            if (SENTRY_DUTY_PTR->field_0x3878 == SENTRY_DUTY_PTR->field_0x387c)
            {
                SENTRY_DUTY_PTR->field_0x3538 = 5;
                SentrySetStateIntermediate(0x19);
            }
            else if (SENTRY_DUTY_PTR->field_0x3554[SENTRY_DUTY_PTR->field_0x3878] == 3)
            {
                PlaySeByIdVolumeWrapper(0x3F03);
            }
            else if (SENTRY_DUTY_PTR->field_0x3898 > 0)
            {
                SENTRY_DUTY_PTR->field_0x3538 = 4;
                SENTRY_DUTY_PTR->field_0x3554[SENTRY_DUTY_PTR->field_0x3878] = 3;
                SentrySetStateIntermediate(0x10);
            }
            else
            {
                SENTRY_DUTY_PTR->field_0x3538 = 5;
                SentrySetStateIntermediate(0x14);
            }
        }
        else
        {
            SENTRY_DUTY_PTR->field_0x3538 = 3;
        }

        if (held & 0xF0)
            PlaySeByIdVolumeWrapper(0x3F01);

        switch (SENTRY_DUTY_PTR->field_0x3878)
        {
            case 0:
                if (held & 0x80)
                    SENTRY_DUTY_PTR->field_0x3878 = 2;

                if (held & 0x10)
                    SENTRY_DUTY_PTR->field_0x3878 = 1;

                break;
            case 1:
                if (held & 0x80)
                    SENTRY_DUTY_PTR->field_0x3878 = 3;

                if (held & 0x20)
                    SENTRY_DUTY_PTR->field_0x3878 = 0;

                break;
            case 2:
                if (held & 0x40)
                    SENTRY_DUTY_PTR->field_0x3878 = 0;

                if (held & 0x10)
                    SENTRY_DUTY_PTR->field_0x3878 = 3;

                break;
            case 3:
                if (held & 0x40)
                    SENTRY_DUTY_PTR->field_0x3878 = 1;

                if (held & 0x20)
                    SENTRY_DUTY_PTR->field_0x3878 = 2;

                break;
        }
    }
    else
    {
        SENTRY_DUTY_PTR->field_0x3871 = 1;
        SENTRY_DUTY_PTR->field_0x3538 = 2;
        SentrySetStateIntermediate(0x12);
    }

    while (seconds >= 2)
    {
        if (SENTRY_DUTY_PTR->field_0x389d[0] != 0)
            break;

        SENTRY_DUTY_PTR->field_0x389d[0] = 1;
            SENTRY_DUTY_PTR->field_0x3540 = 2;
            for (i = 0; i < 4; i++)
            {
                InitPortraitParams(&params);
                InitPortraitParamsWithMonsterId(&params, SENTRY_DUTY_PTR->field_0x38a2[i]);
                SetPortraitLayout(&params, ov14_0238D96C[i]);
                SetPortraitOffset(&params, ov14_0238DA80[i]);
                SetPortraitEmotion(&params, 0);
                switch (i)
                {
                    case 0:
                        ShowPortraitInPortraitBox(SENTRY_DUTY_PTR->field_0x6, &params);
                        break;
                    case 1:
                        ShowPortraitInPortraitBox(SENTRY_DUTY_PTR->field_0x7, &params);
                        break;
                    case 2:
                        ShowPortraitInPortraitBox(SENTRY_DUTY_PTR->field_0x8, &params);
                        break;
                    case 3:
                        ShowPortraitInPortraitBox(SENTRY_DUTY_PTR->field_0x9, &params);
                        break;
                }
            }

        break;
    }

    if (seconds >= 5)
    {
        if (SENTRY_DUTY_PTR->field_0x389d[1] == 0)
        {
            ov14_0238AC40();
            PlaySeByIdVolumeWrapper(0x2C06);
            SENTRY_DUTY_PTR->field_0x389d[1] = 1;
        }
    }

    if (seconds >= 0xB)
    {
        if (SENTRY_DUTY_PTR->field_0x389d[2] == 0)
        {
            ov14_0238AC40();
            PlaySeByIdVolumeWrapper(0x2C06);
            SENTRY_DUTY_PTR->field_0x389d[2] = 1;
        }
    }
}
