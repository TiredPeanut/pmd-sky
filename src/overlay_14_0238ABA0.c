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
        SENTRY_DUTY_PTR->dialogue_variant + (SENTRY_DUTY_PTR->right_answer_data_idx * 4 + 0x3D60);
#else
    SENTRY_DUTY_PTR->prev_dialogue_str_id =
        SENTRY_DUTY_PTR->dialogue_variant + (SENTRY_DUTY_PTR->right_answer_data_idx * 4 + 0x6F7);
#endif
    ShowDialogueBox(SENTRY_DUTY_PTR->dialogue_box_id);
    ShowStringIdInDialogueBox(SENTRY_DUTY_PTR->dialogue_box_id, 0x408,
                              (u16)SENTRY_DUTY_PTR->prev_dialogue_str_id,
                              &SENTRY_DUTY_PTR->dialogue_args);
    ShowDialogueBox(SENTRY_DUTY_PTR->dialogue_box_id);
    SENTRY_DUTY_PTR->dialogue_variant++;
    SENTRY_DUTY_PTR->dialogue_variant %= 4;
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
    if (window_id == SENTRY_DUTY_PTR->top_names_box_id)
    {
        GetNameRaw(buffer, SENTRY_DUTY_PTR->choices[0]);
#ifdef JAPAN
        DrawTextInWindow(window_id, 0, -1, buffer);
#else
        DrawTextInWindow(window_id, 2, -1, buffer);
#endif
        GetNameRaw(buffer, SENTRY_DUTY_PTR->choices[1]);
#ifdef JAPAN
        DrawTextInWindow(window_id, 0x78, -1, buffer);
#else
        DrawTextInWindow(window_id, 0x7A, -1, buffer);
#endif
    }

    if (window_id == SENTRY_DUTY_PTR->bottom_names_box_id)
    {
        GetNameRaw(buffer, SENTRY_DUTY_PTR->choices[2]);
#ifdef JAPAN
        DrawTextInWindow(window_id, 0, -1, buffer);
#else
        DrawTextInWindow(window_id, 2, -1, buffer);
#endif
        GetNameRaw(buffer, SENTRY_DUTY_PTR->choices[3]);
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
    if (SENTRY_DUTY_PTR == NULL || SENTRY_DUTY_PTR->mode == 2)
        return;

    if (SENTRY_DUTY_PTR->round_active != 0 && (s16)(SENTRY_DUTY_PTR->frame_counter / 0x3C) >= 9)
    {
        if (SENTRY_DUTY_PTR->choice_footprints_next_state == 2)
            SENTRY_DUTY_PTR->choice_footprints_next_state = 3;

        for (i = 0; i < 4; i++)
        {
            pos.x = ov14_0238DA40[i].x + 0x2200;
            pos.y = ov14_0238DA40[i].y + 0x1600;
            AnimRelatedFunction__022F6F14(&SENTRY_DUTY_PTR->choice_monster_anims[i], &pos, 0);
        }
    }

    if (SENTRY_DUTY_PTR->round_active != 0)
    {
        for (i = 0; i < 4; i++)
        {
            sentry = SENTRY_DUTY_PTR;
            if (sentry->slot_mark_states[i] != sentry->slot_mark_next_states[i])
            {
                sentry->slot_mark_states[i] = sentry->slot_mark_next_states[i];
                switch (SENTRY_DUTY_PTR->slot_mark_states[i])
                {
                    case 2:
                        SetAnimDataFields2(&SENTRY_DUTY_PTR->slot_mark_anims[i], 0x804, 0);
                        break;
                    case 3:
                        SetAnimDataFields2(&SENTRY_DUTY_PTR->slot_mark_anims[i], 0x1005, 0);
                        break;
                    case 4:
                        SetAnimDataFields2(&SENTRY_DUTY_PTR->slot_mark_anims[i], 0x806, 0);
                        break;
                }
            }

            if (SENTRY_DUTY_PTR->slot_mark_states[i] > 1)
                AnimRelatedFunction__022F6F14(&SENTRY_DUTY_PTR->slot_mark_anims[i], &ov14_0238DA40[i], 0);
        }
    }

    if (SENTRY_DUTY_PTR->round_active != 0)
    {
        pos.x = 0x8000;
        pos.y = SENTRY_DUTY_PTR->footprint_y << 8;
        AnimRelatedFunction__022F7064(&SENTRY_DUTY_PTR->footprint_anim, &pos, 0);
        AnimRelatedFunction__022F6F14(&SENTRY_DUTY_PTR->footprint_overlay_anim, &pos, 0);
    }

    if (SENTRY_DUTY_PTR->round_active != 0)
    {
        if (SENTRY_DUTY_PTR->cursor_next_state != 0)
        switch (SENTRY_DUTY_PTR->cursor_next_state)
        {
            case 3:
                if (SENTRY_DUTY_PTR->cursor_state == 4 && ov11_022F4990(&SENTRY_DUTY_PTR->cursor_anim))
                    break;

                if (SENTRY_DUTY_PTR->cursor_state != 3)
                    SetAnimDataFields2(&SENTRY_DUTY_PTR->cursor_anim, 0x801, 0);

                SENTRY_DUTY_PTR->cursor_state = SENTRY_DUTY_PTR->cursor_next_state;
                SENTRY_DUTY_PTR->cursor_next_state = 0;
                break;
            case 4:
                SetAnimDataFields2(&SENTRY_DUTY_PTR->cursor_anim, 0x1002, 0);
                SENTRY_DUTY_PTR->cursor_state = SENTRY_DUTY_PTR->cursor_next_state;
                SENTRY_DUTY_PTR->cursor_next_state = 0;
                break;
            case 5:
                SetAnimDataFields2(&SENTRY_DUTY_PTR->cursor_anim, 0x802, 0);
                SENTRY_DUTY_PTR->cursor_state = SENTRY_DUTY_PTR->cursor_next_state;
                SENTRY_DUTY_PTR->cursor_next_state = 0;
                break;
            default:
                if (SENTRY_DUTY_PTR->cursor_state != SENTRY_DUTY_PTR->cursor_next_state)
                    SetAnimDataFields2(&SENTRY_DUTY_PTR->cursor_anim, 0x800, 0);

                SENTRY_DUTY_PTR->cursor_state = SENTRY_DUTY_PTR->cursor_next_state;
                SENTRY_DUTY_PTR->cursor_next_state = 0;
                break;
        }

        if (SENTRY_DUTY_PTR->cursor_state != 1)
            AnimRelatedFunction__022F6F14(&SENTRY_DUTY_PTR->cursor_anim,
                                          &ov14_0238DA40[SENTRY_DUTY_PTR->selected_slot], 0);
    }

    for (i = 0; i < 0x10; i++)
    {
        SetAnimDataFields2(&SENTRY_DUTY_PTR->timer_icon_anims[i], (s16)(ov14_0238DB84[i] + 0x800), 0);
        pos.x = ov14_0238DA60[i] << 8;
        pos.y = 0xA000;
        AnimRelatedFunction__022F6F14(&SENTRY_DUTY_PTR->timer_icon_anims[i], &pos, 0);
    }

    if (SENTRY_DUTY_PTR->round != SENTRY_DUTY_PTR->round_display)
    {
        SENTRY_DUTY_PTR->round_display = SENTRY_DUTY_PTR->round;
        args.number_vals[0] = SENTRY_DUTY_PTR->round_display + 1;
        args.number_vals[1] = 6;
        if (args.number_vals[0] > 6)
            args.number_vals[0] = 6;

        PreprocessString(SENTRY_DUTY_PTR->round_str, 0x400, ov14_0238DB0C, 0xC402, &args);
        PreprocessString(SENTRY_DUTY_PTR->round_count_str, 0x400, ov14_0238DB18, 0xC402, &args);
    }

    if (SENTRY_DUTY_PTR->round_display >= 0)
    {
        cursor1 = &SENTRY_DUTY_PTR->round_digit_anims[0];
        x1 = 0x3A;
        ov14_0238D828(SENTRY_DUTY_PTR->round_str, &cursor1, &x1, 0x16, 1);
        ov14_0238D828(ov14_0238DB24, &cursor1, &x1, 0x16, 0);
        ov14_0238D828(SENTRY_DUTY_PTR->round_count_str, &cursor1, &x1, 0x16, 1);
    }

    if (SENTRY_DUTY_PTR->points != SENTRY_DUTY_PTR->points_display)
    {
        SENTRY_DUTY_PTR->points_display = SENTRY_DUTY_PTR->points;
        args.number_vals[0] = SENTRY_DUTY_PTR->points_display;
        PreprocessString(SENTRY_DUTY_PTR->points_str, 0x400, ov14_0238DB0C, 0xC402, &args);
    }

    if (SENTRY_DUTY_PTR->points_display >= 0)
    {
        cursor2 = &SENTRY_DUTY_PTR->points_digit_anims[0];
        x2 = 0xA8;
        ov14_0238D828(SENTRY_DUTY_PTR->points_str, &cursor2, &x2, 0x18, 8);
        ov14_0238D828(ov14_0238DB28, &cursor2, &x2, 0x18, 0);
    }

    if (SENTRY_DUTY_PTR->tries_left != SENTRY_DUTY_PTR->tries_display)
    {
        if (SENTRY_DUTY_PTR->tries_left > SENTRY_DUTY_PTR->tries_display)
        {
            for (i = SENTRY_DUTY_PTR->tries_display; i < SENTRY_DUTY_PTR->tries_left; i++)
            {
                SetAnimDataFields2(&SENTRY_DUTY_PTR->try_icon_anims[i], 0x304, 0);
            }
        }
        else
        {
            for (i = SENTRY_DUTY_PTR->tries_left; i < SENTRY_DUTY_PTR->tries_display; i++)
            {
                SetAnimDataFields2(&SENTRY_DUTY_PTR->try_icon_anims[i], 0x1004, 0);
            }
        }

        SENTRY_DUTY_PTR->tries_display = SENTRY_DUTY_PTR->tries_left;
    }

    pos.y = 0x2600;
    for (i = 0; i < 2; i++)
    {
        pos.x = ((i << 4) + 0xD6) << 8;
        AnimRelatedFunction__022F6F14(&SENTRY_DUTY_PTR->try_icon_anims[i], &pos, 0);
    }

    if (SENTRY_DUTY_PTR->round_active == 0)
        return;

    sentry = SENTRY_DUTY_PTR;
    if (sentry->choice_footprints_state != sentry->choice_footprints_next_state)
    {
        sentry->choice_footprints_state = sentry->choice_footprints_next_state;
        for (i = 0; i < 4; i++)
        {
            SetAnimDataFields2(&SENTRY_DUTY_PTR->choice_footprint_anims[i], 0x1003, 0);
        }

        if (SENTRY_DUTY_PTR->choice_footprints_state == 3)
            PlaySeByIdVolumeWrapper(0x2C05);
    }

    if (SENTRY_DUTY_PTR->choice_footprints_state > 1)
    {
        for (i = 0; i < 4; i++)
        {
            switch (SENTRY_DUTY_PTR->choice_footprints_state)
            {
                case 2:
                    pos.x = ov14_0238DA40[i].x - 0x1600;
                    pos.y = ov14_0238DA40[i].y - 0x600;
                    AnimRelatedFunction__022F6F14(&SENTRY_DUTY_PTR->choice_footprint_anims[i], &pos, 0);
                    break;
                case 3:
                    pos.x = ov14_0238DA40[i].x + 0x2200;
                    pos.y = ov14_0238DA40[i].y + 0xE00;
                    AnimRelatedFunction__022F6F14(&SENTRY_DUTY_PTR->choice_footprint_anims[i], &pos, 0);
                    break;
            }
        }
    }
}
