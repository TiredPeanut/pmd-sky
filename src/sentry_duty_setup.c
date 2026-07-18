#include "sentry_duty_setup.h"
#include "sentry_duty.h"
#include "util.h"

extern struct sentry_duty *SENTRY_DUTY_PTR;

extern void *MemAlloc(u32 size, u32 flags);
extern void InitPreprocessorArgs(struct preprocess_args *args);
extern s32 GetHeroMemberIdx(void);
extern s32 GetPartnerMemberIdx(void);
extern void SentryUpdateTimerBar(s32 arg0);
extern void LoadObjectAnimData(struct animation *anim, s32 anim_id, u32 flags);
extern void InitAnimDataFromOtherAnimDataVeneer(struct animation *dst, struct animation *src);
extern void SetAnimDataFields2(struct animation *anim, s32 arg1, s32 arg2);
extern void SetAnimDataFieldsWrapper(struct animation *anim, u32 arg1);
extern void PlayBgmByIdVeneer(s32 bgm_id);
extern void sub_0202F334(s8 window_id);
extern void sub_0202BC60(s8 window_id);
extern void HidePortraitBox(s8 window_id);
extern void sub_0202F954(s8 window_id);
extern bool8 IsDialogueBoxActive(s8 window_id);
extern void CloseDialogueBox(s8 window_id);
extern bool8 IsAdvancedMenuActive2(s8 window_id);
extern void CloseAdvancedMenu(s8 window_id);
extern bool8 PortraitBoxNeedsUpdate(s8 window_id);
extern void ClosePortraitBox(s8 window_id);
extern bool8 IsTextBoxActive(s8 window_id);
extern void CloseTextBox(s8 window_id);
extern bool8 IsSimpleMenuActive(s32 menu_id);
extern void CloseSimpleMenu(s8 menu_id);

u32 SentrySetupState(s32 param_0)
{
    struct sentry_duty *sentry_duty;
    s32 i;

    sentry_duty = MemAlloc(0x38D4, 8);
    SENTRY_DUTY_PTR = sentry_duty;
    InitPreprocessorArgs(&sentry_duty->dialogue_args);
    SENTRY_DUTY_PTR->completion_state = SENTRY_COMPLETION_IN_PROGRESS;
    SENTRY_DUTY_PTR->next_game_state = SENTRY_DUTY_PTR->game_state;
    SENTRY_DUTY_PTR->control_state = SENTRY_CTRL_CONTINUE;
    SENTRY_DUTY_PTR->prev_dialogue_str_id = -1;
    SENTRY_DUTY_PTR->window_flags = 0;
    SENTRY_DUTY_PTR->points = 0;
    SENTRY_DUTY_PTR->exit_result = 0;
    SENTRY_DUTY_PTR->field_0x3530 = 0;
    SENTRY_DUTY_PTR->cursor_state = 2;
    SENTRY_DUTY_PTR->cursor_next_state = 0;
    SENTRY_DUTY_PTR->choice_footprints_state = 0;
    SENTRY_DUTY_PTR->choice_footprints_next_state = 0;
    SENTRY_DUTY_PTR->round_display = -1;
    SENTRY_DUTY_PTR->points_display = -1;
    SENTRY_DUTY_PTR->tries_display = 0;
    SENTRY_DUTY_PTR->round_active = 0;
    SENTRY_DUTY_PTR->round = 0;
    SENTRY_DUTY_PTR->points = 0;
    SENTRY_DUTY_PTR->tries_left = 2;
    SENTRY_DUTY_PTR->perfect = 1;
    for (i = 0; i < 4; i++)
    {
        SENTRY_DUTY_PTR->slot_mark_states[i] = 1;
        SENTRY_DUTY_PTR->slot_mark_next_states[i] = 1;
    }

    SENTRY_DUTY_PTR->timed_out = 0;
    SENTRY_DUTY_PTR->frame_counter = 0;
    SENTRY_DUTY_PTR->footprint_y = 0x60;
    for (i = 0; i < 6; i++)
    {
        SENTRY_DUTY_PTR->prev_right_answer_data_idxs[i] = -1;
    }

    SENTRY_DUTY_PTR->hero_str_id = GetHeroMemberIdx();
    SENTRY_DUTY_PTR->partner_str_id = GetPartnerMemberIdx();
    SENTRY_DUTY_PTR->mode = param_0;
    SENTRY_DUTY_PTR->scores_menu_id = -2;
    SENTRY_DUTY_PTR->dialogue_box_id = -2;
    SENTRY_DUTY_PTR->diglett_portrait_id = -2;
    SENTRY_DUTY_PTR->footprint_box_id = -2;
    SENTRY_DUTY_PTR->top_names_box_id = -2;
    SENTRY_DUTY_PTR->bottom_names_box_id = -2;
    SENTRY_DUTY_PTR->choice_portrait_ids[0] = -2;
    SENTRY_DUTY_PTR->choice_portrait_ids[1] = -2;
    SENTRY_DUTY_PTR->choice_portrait_ids[2] = -2;
    SENTRY_DUTY_PTR->choice_portrait_ids[3] = -2;
    SENTRY_DUTY_PTR->debug_menu_id = -2;
    SENTRY_DUTY_PTR->debug_option_menu_id = -2;
    SentryUpdateTimerBar(0);
#ifdef EUROPE
    LoadObjectAnimData(&SENTRY_DUTY_PTR->marker_anim_data, 0xBD, 0x8100000);
    LoadObjectAnimData(&SENTRY_DUTY_PTR->hud_anim_data, 0xDD, 0x88080000);
#else
    LoadObjectAnimData(&SENTRY_DUTY_PTR->marker_anim_data, 0xAD, 0x8100000);
    LoadObjectAnimData(&SENTRY_DUTY_PTR->hud_anim_data, 0xCD, 0x88080000);
#endif
    InitAnimDataFromOtherAnimDataVeneer(&SENTRY_DUTY_PTR->field_0x2a8, &SENTRY_DUTY_PTR->hud_anim_data);
    SetAnimDataFields2(&SENTRY_DUTY_PTR->field_0x2a8, 0x800, 0);
    for (i = 0; i < 16; i++)
    {
        InitAnimDataFromOtherAnimDataVeneer(&SENTRY_DUTY_PTR->timer_icon_anims[i], &SENTRY_DUTY_PTR->hud_anim_data);
        SetAnimDataFields2(&SENTRY_DUTY_PTR->timer_icon_anims[i], 0x800, 0);
        InitAnimDataFromOtherAnimDataVeneer(&SENTRY_DUTY_PTR->round_digit_anims[i], &SENTRY_DUTY_PTR->hud_anim_data);
        SetAnimDataFieldsWrapper(&SENTRY_DUTY_PTR->round_digit_anims[i], 0xC8100000);
        InitAnimDataFromOtherAnimDataVeneer(&SENTRY_DUTY_PTR->points_digit_anims[i], &SENTRY_DUTY_PTR->hud_anim_data);
        SetAnimDataFieldsWrapper(&SENTRY_DUTY_PTR->points_digit_anims[i], 0xC8100000);
    }

    for (i = 0; i < 2; i++)
    {
        InitAnimDataFromOtherAnimDataVeneer(&SENTRY_DUTY_PTR->try_icon_anims[i], &SENTRY_DUTY_PTR->hud_anim_data);
        SetAnimDataFieldsWrapper(&SENTRY_DUTY_PTR->try_icon_anims[i], 0xC8100000);
    }

    if (SENTRY_DUTY_PTR->mode == 2)
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

void SentryHideDisabledWindows(void)
{
    if (!(SENTRY_DUTY_PTR->window_flags & 2) && SENTRY_DUTY_PTR->dialogue_box_id != -2)
        sub_0202F334(SENTRY_DUTY_PTR->dialogue_box_id);

    if (!(SENTRY_DUTY_PTR->window_flags & 1) && SENTRY_DUTY_PTR->scores_menu_id != -2)
        sub_0202BC60(SENTRY_DUTY_PTR->scores_menu_id);

    if (!(SENTRY_DUTY_PTR->window_flags & 4) && SENTRY_DUTY_PTR->diglett_portrait_id != -2)
        HidePortraitBox(SENTRY_DUTY_PTR->diglett_portrait_id);

    if (!(SENTRY_DUTY_PTR->window_flags & 8) && SENTRY_DUTY_PTR->footprint_box_id != -2)
        sub_0202F954(SENTRY_DUTY_PTR->footprint_box_id);

    if (!(SENTRY_DUTY_PTR->window_flags & 0x10) && SENTRY_DUTY_PTR->top_names_box_id != -2)
        sub_0202F954(SENTRY_DUTY_PTR->top_names_box_id);

    if (!(SENTRY_DUTY_PTR->window_flags & 0x20) && SENTRY_DUTY_PTR->bottom_names_box_id != -2)
        sub_0202F954(SENTRY_DUTY_PTR->bottom_names_box_id);

    if (!(SENTRY_DUTY_PTR->window_flags & 0x40) && SENTRY_DUTY_PTR->choice_portrait_ids[0] != -2)
        HidePortraitBox(SENTRY_DUTY_PTR->choice_portrait_ids[0]);

    if (!(SENTRY_DUTY_PTR->window_flags & 0x80) && SENTRY_DUTY_PTR->choice_portrait_ids[1] != -2)
        HidePortraitBox(SENTRY_DUTY_PTR->choice_portrait_ids[1]);

    if (!(SENTRY_DUTY_PTR->window_flags & 0x100) && SENTRY_DUTY_PTR->choice_portrait_ids[2] != -2)
        HidePortraitBox(SENTRY_DUTY_PTR->choice_portrait_ids[2]);

    if (!(SENTRY_DUTY_PTR->window_flags & 0x200) && SENTRY_DUTY_PTR->choice_portrait_ids[3] != -2)
        HidePortraitBox(SENTRY_DUTY_PTR->choice_portrait_ids[3]);
}

u32 SentryCloseDisabledWindows(void)
{
    s32 closed;

    if (!(SENTRY_DUTY_PTR->window_flags & 2))
    {
        if (SENTRY_DUTY_PTR->dialogue_box_id == -2)
            closed = 1;
        else if (IsDialogueBoxActive(SENTRY_DUTY_PTR->dialogue_box_id))
            closed = 0;
        else
        {
            CloseDialogueBox(SENTRY_DUTY_PTR->dialogue_box_id);
            SENTRY_DUTY_PTR->dialogue_box_id = -2;
            closed = 1;
        }

        if (closed == 0)
            return 0;
    }

    if (!(SENTRY_DUTY_PTR->window_flags & 1))
    {
        if (SENTRY_DUTY_PTR->scores_menu_id == -2)
            closed = 1;
        else if (IsAdvancedMenuActive2(SENTRY_DUTY_PTR->scores_menu_id))
            closed = 0;
        else
        {
            CloseAdvancedMenu(SENTRY_DUTY_PTR->scores_menu_id);
            SENTRY_DUTY_PTR->scores_menu_id = -2;
            closed = 1;
        }

        if (closed == 0)
            return 0;
    }

    if (!(SENTRY_DUTY_PTR->window_flags & 4))
    {
        if (SENTRY_DUTY_PTR->diglett_portrait_id == -2)
            closed = 1;
        else if (PortraitBoxNeedsUpdate(SENTRY_DUTY_PTR->diglett_portrait_id))
            closed = 0;
        else
        {
            ClosePortraitBox(SENTRY_DUTY_PTR->diglett_portrait_id);
            SENTRY_DUTY_PTR->diglett_portrait_id = -2;
            closed = 1;
        }

        if (closed == 0)
            return 0;
    }

    if (!(SENTRY_DUTY_PTR->window_flags & 8))
    {
        if (SENTRY_DUTY_PTR->footprint_box_id == -2)
            closed = 1;
        else if (IsTextBoxActive(SENTRY_DUTY_PTR->footprint_box_id))
            closed = 0;
        else
        {
            CloseTextBox(SENTRY_DUTY_PTR->footprint_box_id);
            SENTRY_DUTY_PTR->footprint_box_id = -2;
            closed = 1;
        }

        if (closed == 0)
            return 0;
    }

    if (!(SENTRY_DUTY_PTR->window_flags & 0x10))
    {
        if (SENTRY_DUTY_PTR->top_names_box_id == -2)
            closed = 1;
        else if (IsTextBoxActive(SENTRY_DUTY_PTR->top_names_box_id))
            closed = 0;
        else
        {
            CloseTextBox(SENTRY_DUTY_PTR->top_names_box_id);
            SENTRY_DUTY_PTR->top_names_box_id = -2;
            closed = 1;
        }

        if (closed == 0)
            return 0;
    }

    if (!(SENTRY_DUTY_PTR->window_flags & 0x20))
    {
        if (SENTRY_DUTY_PTR->bottom_names_box_id == -2)
            closed = 1;
        else if (IsTextBoxActive(SENTRY_DUTY_PTR->bottom_names_box_id))
            closed = 0;
        else
        {
            CloseTextBox(SENTRY_DUTY_PTR->bottom_names_box_id);
            SENTRY_DUTY_PTR->bottom_names_box_id = -2;
            closed = 1;
        }

        if (closed == 0)
            return 0;
    }

    if (!(SENTRY_DUTY_PTR->window_flags & 0x40))
    {
        if (SENTRY_DUTY_PTR->choice_portrait_ids[0] == -2)
            closed = 1;
        else if (PortraitBoxNeedsUpdate(SENTRY_DUTY_PTR->choice_portrait_ids[0]))
            closed = 0;
        else
        {
            ClosePortraitBox(SENTRY_DUTY_PTR->choice_portrait_ids[0]);
            SENTRY_DUTY_PTR->choice_portrait_ids[0] = -2;
            closed = 1;
        }

        if (closed == 0)
            return 0;
    }

    if (!(SENTRY_DUTY_PTR->window_flags & 0x80))
    {
        if (SENTRY_DUTY_PTR->choice_portrait_ids[1] == -2)
            closed = 1;
        else if (PortraitBoxNeedsUpdate(SENTRY_DUTY_PTR->choice_portrait_ids[1]))
            closed = 0;
        else
        {
            ClosePortraitBox(SENTRY_DUTY_PTR->choice_portrait_ids[1]);
            SENTRY_DUTY_PTR->choice_portrait_ids[1] = -2;
            closed = 1;
        }

        if (closed == 0)
            return 0;
    }

    if (!(SENTRY_DUTY_PTR->window_flags & 0x100))
    {
        if (SENTRY_DUTY_PTR->choice_portrait_ids[2] == -2)
            closed = 1;
        else if (PortraitBoxNeedsUpdate(SENTRY_DUTY_PTR->choice_portrait_ids[2]))
            closed = 0;
        else
        {
            ClosePortraitBox(SENTRY_DUTY_PTR->choice_portrait_ids[2]);
            SENTRY_DUTY_PTR->choice_portrait_ids[2] = -2;
            closed = 1;
        }

        if (closed == 0)
            return 0;
    }

    if (!(SENTRY_DUTY_PTR->window_flags & 0x200))
    {
        if (SENTRY_DUTY_PTR->choice_portrait_ids[3] == -2)
            closed = 1;
        else if (PortraitBoxNeedsUpdate(SENTRY_DUTY_PTR->choice_portrait_ids[3]))
            closed = 0;
        else
        {
            ClosePortraitBox(SENTRY_DUTY_PTR->choice_portrait_ids[3]);
            SENTRY_DUTY_PTR->choice_portrait_ids[3] = -2;
            closed = 1;
        }

        if (closed == 0)
            return 0;
    }

    if (!(SENTRY_DUTY_PTR->window_flags & 0x40000000))
    {
        if (SENTRY_DUTY_PTR->debug_menu_id == -2)
            closed = 1;
        else if (IsSimpleMenuActive(SENTRY_DUTY_PTR->debug_menu_id))
            closed = 0;
        else
        {
            CloseSimpleMenu(SENTRY_DUTY_PTR->debug_menu_id);
            SENTRY_DUTY_PTR->debug_menu_id = -2;
            closed = 1;
        }

        if (closed == 0)
            return 0;
    }

    if (!(SENTRY_DUTY_PTR->window_flags & 0x80000000))
    {
        if (SENTRY_DUTY_PTR->debug_option_menu_id == -2)
            closed = 1;
        else if (IsSimpleMenuActive(SENTRY_DUTY_PTR->debug_option_menu_id))
            closed = 0;
        else
        {
            CloseSimpleMenu(SENTRY_DUTY_PTR->debug_option_menu_id);
            SENTRY_DUTY_PTR->debug_option_menu_id = -2;
            closed = 1;
        }

        if (closed == 0)
            return 0;
    }

    return 1;
}
