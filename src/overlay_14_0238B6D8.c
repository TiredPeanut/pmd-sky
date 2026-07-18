#include "overlay_14_0238B6D8.h"
#include "overlay_14_0238ABA0.h"
#include "sentry_duty.h"
#include "util.h"

extern struct sentry_duty *SENTRY_DUTY_PTR;
extern void (*SENTRY_DUTY_STATE_HANDLER_TABLE[])(void);
extern u8 SENTRY_DEBUG_MENU_ITEMS[];
extern u8 ov14_0238D988[];
extern u8 ov14_0238D998[];
extern u8 ov14_0238D9A8[];
extern u8 ov14_0238D9B8[];
extern u8 ov14_0238D9C8[];
extern u8 ov14_0238D9D8[];
extern u8 ov14_0238D9E8[];
extern u8 ov14_0238D9F8[];
extern u8 ov14_0238DA08[];

extern void ov14_0238A514(void);
extern u32 ov14_0238A6B0(void);
extern void ov11_022F6EFC(struct animation *anim);
extern void sub_02017B70(void);
extern void MemFree(void *ptr);
extern s8 CreateAdvancedMenu(u8 *params, u32 flags, s32 *info, u8 *(*entry_fn)(u8 *, s32), s32 arg4, s32 arg5);
extern s8 CreateDialogueBox(u8 *params);
extern bool8 IsDialogueBoxActive(s8 window_id);
extern s8 CreateTextBox(u8 *params, void (*update_fn)(s8));
extern s8 CreatePortraitBox(s32 arg0, u32 arg1, u32 arg2);
extern s8 CreateSimpleMenuFromStringIds(u8 *params, s32 arg1, s32 arg2, u8 *string_ids, s32 arg4);
extern void InitPortraitParamsWithMonsterId(u8 *params, s32 monster_id);
extern void SetPortraitLayout(u8 *params, s32 layout);
extern void SetPortraitEmotion(u8 *params, s32 emotion);
extern void ShowPortraitInPortraitBox(s8 window_id, u8 *params);
extern void ShowDialogueBox(s8 window_id);
extern void ShowStringIdInDialogueBox(s8 window_id, s32 flags, u16 string_id, struct preprocess_args *args);
extern void ReturnScriptMenuResult(s32 result);

// String IDs used by SentryRunState are offset in the Japanese version.
#ifdef JAPAN
#define SENTRY_RUN_STATE_OFFSET 0x3669
#else
#define SENTRY_RUN_STATE_OFFSET 0
#endif

void SentrySetExitingState(void)
{
    SENTRY_DUTY_PTR->field_0x118 = 0;
    ov14_0238A514();
    SENTRY_DUTY_PTR->completion_state = SENTRY_COMPLETION_EXITING;
}

void ov14_0238B708(void)
{
    s32 i;

    if (SENTRY_DUTY_PTR == NULL)
        return;

    ov11_022F6EFC(&SENTRY_DUTY_PTR->field_0x2a8);
    for (i = 0; i < 16; i++)
    {
        ov11_022F6EFC(&SENTRY_DUTY_PTR->field_0x36c[i]);
        ov11_022F6EFC(&SENTRY_DUTY_PTR->field_0xfac[i]);
        ov11_022F6EFC(&SENTRY_DUTY_PTR->field_0x1bec[i]);
    }

    for (i = 0; i < 2; i++)
    {
        ov11_022F6EFC(&SENTRY_DUTY_PTR->field_0x282c[i]);
    }

    ov11_022F6EFC(&SENTRY_DUTY_PTR->field_0x120);
    ov11_022F6EFC(&SENTRY_DUTY_PTR->field_0x1e4);
    if (SENTRY_DUTY_PTR->field_0x11c != 2)
        sub_02017B70();

    MemFree(SENTRY_DUTY_PTR);
    SENTRY_DUTY_PTR = NULL;
}

s32 SentryRunState(void)
{
    s32 flags;
    s32 str_id;
    s32 done;
    struct sentry_duty *sentry;

    switch (SENTRY_DUTY_PTR->completion_state)
    {
        case SENTRY_COMPLETION_IN_PROGRESS:
            switch (SENTRY_DUTY_PTR->control_state)
            {
                case SENTRY_CTRL_CONTINUE:
                case SENTRY_CTRL_INTERMEDIATE_TRANSITION:
                    SENTRY_DUTY_PTR->control_state = SENTRY_CTRL_CONTINUE;
                    SENTRY_DUTY_STATE_HANDLER_TABLE[SENTRY_DUTY_PTR->game_state]();
                    sentry = SENTRY_DUTY_PTR;
                    if (sentry->game_state != sentry->next_game_state)
                    {
                        if (sentry->control_state == SENTRY_CTRL_INTERMEDIATE_TRANSITION)
                        {
                            sentry->game_state = sentry->next_game_state;
                            SENTRY_DUTY_STATE_HANDLER_TABLE[SENTRY_DUTY_PTR->game_state]();
                        }
                        ov14_0238A514();
                        SENTRY_DUTY_PTR->control_state = SENTRY_CTRL_STATE_TRANSITION;
                    }
                    break;
                case SENTRY_CTRL_STATE_TRANSITION:
                    if (ov14_0238A6B0() == 0)
                        break;

                    if ((SENTRY_DUTY_PTR->field_0x118 & 1) && SENTRY_DUTY_PTR->field_0x0 == -2)
                    {
                        SENTRY_DUTY_PTR->field_0xc = 0;
                        SENTRY_DUTY_PTR->field_0x14 = 0x6DE + SENTRY_RUN_STATE_OFFSET;
                        SENTRY_DUTY_PTR->field_0x18 = 0x10;
                        if (SENTRY_DUTY_PTR->field_0x11c != 2)
                            SENTRY_DUTY_PTR->field_0x0 = CreateAdvancedMenu(ov14_0238D9C8, 0x04080800, &SENTRY_DUTY_PTR->field_0xc, ov14_0238ABA0, 5, 5);
                        else
                            SENTRY_DUTY_PTR->field_0x0 = CreateAdvancedMenu(ov14_0238D9D8, 0x04080800, &SENTRY_DUTY_PTR->field_0xc, ov14_0238ABA0, 5, 5);
                    }

                    if (SENTRY_DUTY_PTR->field_0x118 & 2)
                    {
                        str_id = SENTRY_DUTY_PTR->prev_dialogue_str_id;
                        SENTRY_DUTY_PTR->preprocessor_args.speaker_id = 0x32;
                        flags = 0x3018;
                        if (SENTRY_DUTY_PTR->field_0x1 == -2)
                            SENTRY_DUTY_PTR->field_0x1 = CreateDialogueBox(ov14_0238D9B8);

                        ShowDialogueBox(SENTRY_DUTY_PTR->field_0x1);
                        switch (SENTRY_DUTY_PTR->game_state)
                        {
                            case 0:
                                break;
                            case 4:
                            case 5:
                                SENTRY_DUTY_PTR->preprocessor_args.speaker_id = 0x142;
                                str_id = 0x6D9 + SENTRY_RUN_STATE_OFFSET;
                                flags = 0x3018;
                                break;
                            case 6:
                            case 7:
                                SENTRY_DUTY_PTR->preprocessor_args.speaker_id = 0x142;
                                str_id = 0x6D8 + SENTRY_RUN_STATE_OFFSET;
                                flags = 0x3018;
                                break;
                            case 8:
                            case 10:
                                SENTRY_DUTY_PTR->preprocessor_args.speaker_id = 0x142;
                                str_id = 0x6DA + SENTRY_RUN_STATE_OFFSET;
                                flags = 0x3018;
                                break;
                            case 12:
                            case 13:
                                SENTRY_DUTY_PTR->preprocessor_args.speaker_id = SENTRY_DUTY_PTR->field_0x38d2 | 0x20000;
                                str_id = 0x6DB + SENTRY_RUN_STATE_OFFSET;
                                flags = 0x3028;
                                break;
                            case 16:
                            case 17:
                                SENTRY_DUTY_PTR->preprocessor_args.speaker_id = SENTRY_DUTY_PTR->field_0x38d2 | 0x20000;
                                str_id = 0x6EB + SENTRY_RUN_STATE_OFFSET;
                                flags = 0x3028;
                                break;
                            case 18:
                            case 19:
                                SENTRY_DUTY_PTR->preprocessor_args.speaker_id = 0x142;
                                str_id = 0x6DC + SENTRY_RUN_STATE_OFFSET;
                                flags = 0x3028;
                                break;
                            case 20:
                                switch (SENTRY_DUTY_PTR->field_0x38ac)
                                {
                                    case 0:
                                        SENTRY_DUTY_PTR->preprocessor_args.speaker_id = SENTRY_DUTY_PTR->field_0x38d0 | 0x20000;
                                        str_id = 0x6EE + SENTRY_RUN_STATE_OFFSET;
                                        SENTRY_DUTY_PTR->field_0x38ac++;
                                        break;
                                    case 1:
                                        SENTRY_DUTY_PTR->preprocessor_args.speaker_id = 0x142;
                                        str_id = 0x6EF + SENTRY_RUN_STATE_OFFSET;
                                        SENTRY_DUTY_PTR->field_0x38ac++;
                                        break;
                                }
                                flags = 0x3028;
                                break;
                            case 23:
                                switch (SENTRY_DUTY_PTR->field_0x38ac)
                                {
                                    case 0:
                                        SENTRY_DUTY_PTR->preprocessor_args.speaker_id = 0x142;
                                        SENTRY_DUTY_PTR->preprocessor_args.number_vals[0] = 0x2311;
                                        str_id = 0x6F1 + SENTRY_RUN_STATE_OFFSET;
                                        SENTRY_DUTY_PTR->field_0x38ac++;
                                        break;
                                    case 1:
                                        str_id = 0x6F2 + SENTRY_RUN_STATE_OFFSET;
                                        SENTRY_DUTY_PTR->preprocessor_args.speaker_id = 0x142;
                                        SENTRY_DUTY_PTR->preprocessor_args.number_vals[0] = 0x2C07;
                                        SENTRY_DUTY_PTR->field_0x38ac++;
                                        break;
                                }
                                flags = 0x3028;
                                break;
                            case 25:
                                switch (SENTRY_DUTY_PTR->field_0x38ac)
                                {
                                    case 0:
                                        SENTRY_DUTY_PTR->preprocessor_args.speaker_id = SENTRY_DUTY_PTR->field_0x38d0 | 0x20000;
                                        str_id = 0x6EC + SENTRY_RUN_STATE_OFFSET;
                                        SENTRY_DUTY_PTR->field_0x38ac++;
                                        break;
                                    case 1:
                                        SENTRY_DUTY_PTR->preprocessor_args.speaker_id = 0x142;
                                        str_id = 0x6ED + SENTRY_RUN_STATE_OFFSET;
                                        SENTRY_DUTY_PTR->field_0x38ac++;
                                        break;
                                }
                                flags = 0x3028;
                                break;
                            case 28:
                                if (SENTRY_DUTY_PTR->field_0x38ac == 0)
                                {
                                    SENTRY_DUTY_PTR->preprocessor_args.speaker_id = 0x142;
                                    str_id = 0x6F0 + SENTRY_RUN_STATE_OFFSET;
                                    SENTRY_DUTY_PTR->field_0x38ac++;
                                }
                                flags = 0x3028;
                                break;
                            case 30:
                                switch (SENTRY_DUTY_PTR->field_0x38ac)
                                {
                                    case 0:
                                        SENTRY_DUTY_PTR->preprocessor_args.speaker_id = 0x32;
                                        SENTRY_DUTY_PTR->preprocessor_args.number_vals[0] = 0x2C09;
                                        str_id = 0x6F3 + SENTRY_RUN_STATE_OFFSET;
                                        SENTRY_DUTY_PTR->field_0x38ac++;
                                        break;
                                    case 1:
                                        SENTRY_DUTY_PTR->preprocessor_args.speaker_id = 0x142;
                                        str_id = 0x6F4 + SENTRY_RUN_STATE_OFFSET;
                                        SENTRY_DUTY_PTR->field_0x38ac++;
                                        break;
                                }
                                flags = 0x3018;
                                break;
                            case 32:
                                switch (SENTRY_DUTY_PTR->field_0x38ac)
                                {
                                    case 0:
                                        SENTRY_DUTY_PTR->preprocessor_args.speaker_id = 0x1E3;
                                        SENTRY_DUTY_PTR->preprocessor_args.number_vals[0] = 0x2C09;
                                        str_id = 0x6F5 + SENTRY_RUN_STATE_OFFSET;
                                        SENTRY_DUTY_PTR->field_0x38ac++;
                                        break;
                                    case 1:
                                        SENTRY_DUTY_PTR->preprocessor_args.speaker_id = 0x142;
                                        str_id = 0x6F6 + SENTRY_RUN_STATE_OFFSET;
                                        SENTRY_DUTY_PTR->field_0x38ac++;
                                        break;
                                }
                                flags = 0x3018;
                                break;
                            case 33:
                                break;
                        }

                        if (SENTRY_DUTY_PTR->prev_dialogue_str_id != str_id)
                        {
                            SENTRY_DUTY_PTR->prev_dialogue_str_id = str_id;
                            ShowStringIdInDialogueBox(SENTRY_DUTY_PTR->field_0x1, flags,
                                                      (u16)SENTRY_DUTY_PTR->prev_dialogue_str_id,
                                                      &SENTRY_DUTY_PTR->preprocessor_args);
                        }
                    }

                    if ((SENTRY_DUTY_PTR->field_0x118 & 4) && SENTRY_DUTY_PTR->field_0x2 == -2)
                    {
                        SENTRY_DUTY_PTR->field_0x2 = CreatePortraitBox(0, 3, 1);
                        InitPortraitParamsWithMonsterId(SENTRY_DUTY_PTR->field_0xf4, 0x32);
                        SetPortraitLayout(SENTRY_DUTY_PTR->field_0xf4, 0);
                        SetPortraitEmotion(SENTRY_DUTY_PTR->field_0xf4, 0);
                        ShowPortraitInPortraitBox(SENTRY_DUTY_PTR->field_0x2, SENTRY_DUTY_PTR->field_0xf4);
                    }

                    if ((SENTRY_DUTY_PTR->field_0x118 & 8) && SENTRY_DUTY_PTR->field_0x3 == -2)
                        SENTRY_DUTY_PTR->field_0x3 = CreateTextBox(ov14_0238D9F8, ov14_0238ACEC);

                    if ((SENTRY_DUTY_PTR->field_0x118 & 0x10) && SENTRY_DUTY_PTR->field_0x4 == -2)
                        SENTRY_DUTY_PTR->field_0x4 = CreateTextBox(ov14_0238D988, ov14_0238AD04);

                    if ((SENTRY_DUTY_PTR->field_0x118 & 0x20) && SENTRY_DUTY_PTR->field_0x5 == -2)
                        SENTRY_DUTY_PTR->field_0x5 = CreateTextBox(ov14_0238D998, ov14_0238AD04);

                    if ((SENTRY_DUTY_PTR->field_0x118 & 0x40) && SENTRY_DUTY_PTR->field_0x6 == -2)
                        SENTRY_DUTY_PTR->field_0x6 = CreatePortraitBox(0, 3, 0);

                    if ((SENTRY_DUTY_PTR->field_0x118 & 0x80) && SENTRY_DUTY_PTR->field_0x7 == -2)
                        SENTRY_DUTY_PTR->field_0x7 = CreatePortraitBox(0, 4, 0);

                    if ((SENTRY_DUTY_PTR->field_0x118 & 0x100) && SENTRY_DUTY_PTR->field_0x8 == -2)
                        SENTRY_DUTY_PTR->field_0x8 = CreatePortraitBox(0, 5, 0);

                    if ((SENTRY_DUTY_PTR->field_0x118 & 0x200) && SENTRY_DUTY_PTR->field_0x9 == -2)
                        SENTRY_DUTY_PTR->field_0x9 = CreatePortraitBox(0, 6, 0);

                    if ((SENTRY_DUTY_PTR->field_0x118 & 0x40000000) && SENTRY_DUTY_PTR->field_0xa == -2)
                        SENTRY_DUTY_PTR->field_0xa = CreateSimpleMenuFromStringIds(ov14_0238D9A8, 0x13, 0, SENTRY_DEBUG_MENU_ITEMS, 8);

                    if ((SENTRY_DUTY_PTR->field_0x118 & 0x80000000) && SENTRY_DUTY_PTR->field_0xb == -2)
                        SENTRY_DUTY_PTR->field_0xb = CreateSimpleMenuFromStringIds(ov14_0238D9E8, 0x13, 0, ov14_0238DA08, 2);

                    SENTRY_DUTY_PTR->control_state = SENTRY_CTRL_POST_TRANSITION;
                    break;
                case SENTRY_CTRL_POST_TRANSITION:
                    if ((SENTRY_DUTY_PTR->field_0x118 & 2) && IsDialogueBoxActive(SENTRY_DUTY_PTR->field_0x1))
                        done = FALSE;
                    else
                        done = TRUE;

                    if (done)
                    {
                        SENTRY_DUTY_PTR->control_state = SENTRY_CTRL_CONTINUE;
                        SENTRY_DUTY_PTR->game_state = SENTRY_DUTY_PTR->next_game_state;
                    }
                    break;
            }
            return 1;
        case SENTRY_COMPLETION_EXITING:
            if (ov14_0238A6B0() != 0)
                SENTRY_DUTY_PTR->completion_state = SENTRY_COMPLETION_FINALIZING;
            break;
        case SENTRY_COMPLETION_FINALIZING:
            SENTRY_DUTY_PTR->completion_state = SENTRY_COMPLETION_DONE;
            ReturnScriptMenuResult(SENTRY_DUTY_PTR->field_0x3890);
            ov14_0238B708();
            return 4;
        case SENTRY_COMPLETION_DONE:
            break;
    }

    return 1;
}
