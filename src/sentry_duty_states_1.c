#include "sentry_duty_states_1.h"
#include "main_02089678.h"
#include "sentry_duty_display.h"
#include "sentry_duty_states.h"
#include "util.h"
#include "window.h"

extern struct sentry_duty *SENTRY_DUTY_PTR;
extern s32 SENTRY_PORTRAIT_OFFSETS[];

extern void ClearWindow(s8 window_id);
extern void PlaySeByIdVolumeWrapper(s32 se_id);
extern void SentrySetExitingState(void);
extern void sub_02017B7C(s32 arg0);
extern void UpdateWindow(s8 window_id);
extern void ov11_022F6EFC(struct animation *anim);
extern void ov11_022F7058(struct animation *anim);
extern s32 SetSentryDutyGamePoints(s32 points);
extern void InitPortraitParams(portrait_params *params);
extern void SetAnimDataFields2(struct animation *anim, s32 arg1, s32 arg2);
extern void AnimRelatedFunction__022F6F14(struct animation *anim, s32 *pos, s32 arg2);
extern s32 GetLanguage(void);
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

    answered = SENTRY_DUTY_PTR->round_active;
    SENTRY_DUTY_PTR->round_active = 0;
    SENTRY_DUTY_PTR->round++;
    SENTRY_DUTY_PTR->frame_counter = 0;
    SENTRY_DUTY_PTR->timed_out = 0;
    SentryUpdateTimerBar(0);
    if (answered != 0)
    {
        ov11_022F7058(&SENTRY_DUTY_PTR->footprint_anim);
        ov11_022F6EFC(&SENTRY_DUTY_PTR->footprint_overlay_anim);
        SENTRY_DUTY_PTR->cursor_state = 1;
        SENTRY_DUTY_PTR->cursor_next_state = 0;
        ov11_022F6EFC(&SENTRY_DUTY_PTR->cursor_anim);
    }

    offset_x = SENTRY_PORTRAIT_OFFSETS[2];
    offset_y = SENTRY_PORTRAIT_OFFSETS[3];
    offset[0] = offset_x;
    offset[1] = offset_y;
    for (i = 0; i < 4; i++)
    {
        ov11_022F6EFC(&SENTRY_DUTY_PTR->choice_monster_anims[i]);
        ov11_022F6EFC(&SENTRY_DUTY_PTR->slot_mark_anims[i]);
        ov11_022F6EFC(&SENTRY_DUTY_PTR->choice_footprint_anims[i]);
        switch (i)
        {
            case 0:
                portrait_id = SENTRY_DUTY_PTR->choice_portrait_ids[0];
                break;
            case 1:
                portrait_id = SENTRY_DUTY_PTR->choice_portrait_ids[1];
                break;
            case 2:
                portrait_id = SENTRY_DUTY_PTR->choice_portrait_ids[2];
                break;
            case 3:
                portrait_id = SENTRY_DUTY_PTR->choice_portrait_ids[3];
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

    ClearWindow(SENTRY_DUTY_PTR->top_names_box_id);
    UpdateWindow(SENTRY_DUTY_PTR->top_names_box_id);
    ClearWindow(SENTRY_DUTY_PTR->bottom_names_box_id);
    UpdateWindow(SENTRY_DUTY_PTR->bottom_names_box_id);
    if (SENTRY_DUTY_PTR->round < 6)
    {
        SENTRY_DUTY_PTR->next_game_state = SENTRY_STATE_NEXT_ROUND;
    }
    else
    {
        SENTRY_DUTY_PTR->dialogue_progress = 0;
        if (SetSentryDutyGamePoints(SENTRY_DUTY_PTR->points) != 0)
        {
            SENTRY_DUTY_PTR->exit_result = 0;
            if (SENTRY_DUTY_PTR->points > 0xFA0)
                SENTRY_DUTY_PTR->exit_result = 1;

            if (SENTRY_DUTY_PTR->points > 0x1B58)
                SENTRY_DUTY_PTR->exit_result = 2;

            if (SENTRY_DUTY_PTR->perfect != 0)
                SENTRY_DUTY_PTR->exit_result = 3;
        }
        else
        {
            SENTRY_DUTY_PTR->exit_result = 4;
            if (SENTRY_DUTY_PTR->points > 0xFA0)
                SENTRY_DUTY_PTR->exit_result = 5;

            if (SENTRY_DUTY_PTR->points > 0x1B58)
                SENTRY_DUTY_PTR->exit_result = 6;

            if (SENTRY_DUTY_PTR->perfect != 0)
                SENTRY_DUTY_PTR->exit_result = 7;
        }

        switch (SENTRY_DUTY_PTR->mode)
        {
            case 1:
                SENTRY_DUTY_PTR->next_game_state = SENTRY_STATE_ENDING_MODE1;
                break;
            case 0:
            default:
                SENTRY_DUTY_PTR->next_game_state = SENTRY_STATE_ENDING_MODE0;
                break;
        }
    }
}

void SentryStateF(void)
{
    SENTRY_DUTY_PTR->next_game_state = SENTRY_STATE_HERE_COMES;
}

void SentryState10(void)
{
    SENTRY_DUTY_PTR->tries_left--;
    SENTRY_DUTY_PTR->round_points -= 0xFA;
    if (SENTRY_DUTY_PTR->footprint_box_id != -2)
        ClearWindow(SENTRY_DUTY_PTR->footprint_box_id);

    PlaySeByIdVolumeWrapper(0x2C08);
    SENTRY_DUTY_PTR->prev_dialogue_str_id = -1;
    SENTRY_DUTY_PTR->next_game_state = SENTRY_STATE_WRONG_ANSWER_2;
}

void SentryState11(void)
{
    SENTRY_DUTY_PTR->next_game_state = SENTRY_STATE_GET_USER_CHOICE;
}

void SentryState12(void)
{
    SENTRY_DUTY_PTR->perfect = 0;
    SENTRY_DUTY_PTR->dialogue_args.number_vals[0] = 0x2311;
    SENTRY_DUTY_PTR->next_game_state = SENTRY_STATE_TIME_UP_2;
}

void SentryState13(void)
{
    SENTRY_DUTY_PTR->dialogue_progress = 1;
    SENTRY_DUTY_PTR->next_game_state = SENTRY_STATE_REVEAL_ANSWER;
}

void SentryState14(void)
{
    SENTRY_DUTY_PTR->next_game_state = SENTRY_STATE_OUT_OF_TRIES_2;
}

void SentryState15(void)
{
    if (SENTRY_DUTY_PTR->dialogue_progress < 2)
    {
        SentrySetStateIntermediate(SENTRY_STATE_OUT_OF_TRIES);
        return;
    }

    PlaySeByIdVolumeWrapper(0x304);
    SentrySetStateIntermediate(SENTRY_STATE_HIDE_FOOTPRINT);
}

void SentryState16(void)
{
    SENTRY_DUTY_PTR->footprint_y -= 4;
    if (SENTRY_DUTY_PTR->footprint_y >= -0x40)
        return;

    SENTRY_DUTY_PTR->perfect = 0;
    SENTRY_DUTY_PTR->dialogue_progress = 0;
    SentrySetStateIntermediate(SENTRY_STATE_REVEAL_ANSWER);
}

void SentryState17(void)
{
    SENTRY_DUTY_PTR->dialogue_args.flag_vals[0] = SENTRY_DUTY_PTR->choices[SENTRY_DUTY_PTR->right_answer_slot];
    if (SENTRY_DUTY_PTR->timed_out == 0)
        SENTRY_DUTY_PTR->slot_mark_next_states[SENTRY_DUTY_PTR->selected_slot] = 3;

    SENTRY_DUTY_PTR->slot_mark_next_states[SENTRY_DUTY_PTR->right_answer_slot] = 4;
    SENTRY_DUTY_PTR->next_game_state = SENTRY_STATE_REVEAL_ANSWER_2;
}

void SentryState18(void)
{
    if (SENTRY_DUTY_PTR->dialogue_progress < 2)
    {
        SentrySetStateIntermediate(SENTRY_STATE_REVEAL_ANSWER);
        return;
    }

    SentrySetStateIntermediate(SENTRY_STATE_FINALIZE_ROUND);
}

void SentryState19(void)
{
    SENTRY_DUTY_PTR->next_game_state = SENTRY_STATE_CORRECT_ANSWER_2;
}

void SentryState1A(void)
{
    if (SENTRY_DUTY_PTR->dialogue_progress < 2)
    {
        SentrySetStateIntermediate(SENTRY_STATE_CORRECT_ANSWER);
        return;
    }

    PlaySeByIdVolumeWrapper(0x304);
    SentrySetStateIntermediate(SENTRY_STATE_FINALIZE_POINTS);
}

void SentryStateFinalizePoints(void)
{
    SENTRY_DUTY_PTR->footprint_y -= 4;
    if (SENTRY_DUTY_PTR->footprint_y >= -0x40)
        return;

    SENTRY_DUTY_PTR->points += SENTRY_DUTY_PTR->round_points;
    if (SENTRY_DUTY_PTR->round == 5)
    {
        if (SENTRY_DUTY_PTR->perfect != 0)
            SENTRY_DUTY_PTR->points += 0x7D0;
    }

    SENTRY_DUTY_PTR->dialogue_progress = 0;
    SentrySetStateIntermediate(SENTRY_STATE_SHOW_POINTS);
}

void SentryState1C(void)
{
    SENTRY_DUTY_PTR->dialogue_args.number_vals[0] = 0x2310;
    SENTRY_DUTY_PTR->slot_mark_next_states[SENTRY_DUTY_PTR->selected_slot] = 2;
    SENTRY_DUTY_PTR->next_game_state = SENTRY_STATE_SHOW_POINTS_2;
}

void SentryState1D(void)
{
    if (SENTRY_DUTY_PTR->dialogue_progress == 1)
    {
        if (SENTRY_DUTY_PTR->footprint_box_id != -2)
            ClearWindow(SENTRY_DUTY_PTR->footprint_box_id);
    }

    if (SENTRY_DUTY_PTR->dialogue_progress < 1)
    {
        SentrySetStateIntermediate(SENTRY_STATE_SHOW_POINTS);
        return;
    }

    SentrySetStateIntermediate(SENTRY_STATE_FINALIZE_ROUND);
}

void SentryState1E(void)
{
    SENTRY_DUTY_PTR->next_game_state = SENTRY_STATE_ENDING_MODE1_2;
}

void SentryState1F(void)
{
    if (SENTRY_DUTY_PTR->dialogue_progress < 2)
    {
        SentrySetStateIntermediate(SENTRY_STATE_ENDING_MODE1);
        SENTRY_DUTY_PTR->exit_timer = 0x1E;
        return;
    }

    if (SENTRY_DUTY_PTR->exit_timer == 0x1E)
        sub_02017B7C(0x1E);

    if (SENTRY_DUTY_PTR->exit_timer > 0)
    {
        SENTRY_DUTY_PTR->exit_timer--;
        return;
    }

    SentrySetExitingState();
}

void SentryState20(void)
{
    SENTRY_DUTY_PTR->next_game_state = SENTRY_STATE_ENDING_MODE0_2;
}

void SentryState21(void)
{
    if (SENTRY_DUTY_PTR->dialogue_progress < 2)
    {
        SentrySetStateIntermediate(SENTRY_STATE_ENDING_MODE0);
        SENTRY_DUTY_PTR->exit_timer = 0x1E;
        return;
    }

    if (SENTRY_DUTY_PTR->exit_timer == 0x1E)
        sub_02017B7C(0x1E);

    if (SENTRY_DUTY_PTR->exit_timer > 0)
    {
        SENTRY_DUTY_PTR->exit_timer--;
        return;
    }

    SentrySetExitingState();
}

void SentryDrawNumberString(u8* str, struct animation** anim_cursor, s32* x_pos, s32 y, s32 min_len)
{
    struct animation *anim;
    s32 pos[2];
    s32 len;
    u8 c;
    s16 val;
#ifdef EUROPE
    s32 lang;
#endif

    anim = *anim_cursor;
    len = strlen((const char *)str);
    if (len < min_len)
        *x_pos = *x_pos + ((min_len - len) << 3);

    pos[1] = y << 8;
    while (*str != 0)
    {
        c = *str++;
        pos[0] = *x_pos << 8;
        if (c >= 0x30 && c <= 0x39)
        {
            val = (c - 0x2B) | 0x800;
            *x_pos += 8;
            SetAnimDataFields2(anim, val, 0);
            AnimRelatedFunction__022F6F14(anim, pos, 0);
            anim++;
        }
        else if (c == 0x2F)
        {
            *x_pos += 8;
            SetAnimDataFields2(anim, 0x80F, 0);
            AnimRelatedFunction__022F6F14(anim, pos, 0);
            anim++;
        }
        else if (c == 0x50)
        {
            *x_pos += 8;
#ifdef EUROPE
            lang = GetLanguage();
            if ((u8)(s8)(lang - 2) <= 1)
            {
                pos[0] += 0x400;
                SetAnimDataFields2(anim, 0x811, 0);
            }
            else if (lang == 4)
            {
                pos[0] += 0x400;
                SetAnimDataFields2(anim, 0x812, 0);
            }
            else
            {
                SetAnimDataFields2(anim, 0x810, 0);
            }
#else
            SetAnimDataFields2(anim, 0x810, 0);
#endif
            AnimRelatedFunction__022F6F14(anim, pos, 0);
            anim++;
        }
    }

    *anim_cursor = anim;
}
