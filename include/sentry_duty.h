#ifndef PMDSKY_SENTRY_DUTY_H
#define PMDSKY_SENTRY_DUTY_H

// Types used primarily in the context of the Sentry Duty minigame (run by overlay 14).
// Field names are synced with pmdsky-debug's struct sentry_duty.

enum sentry_completion_state {
    SENTRY_COMPLETION_IN_PROGRESS = 0,
    // Causes the main game loop to stop. Does some stuff, then transitions to FINALIZING.
    SENTRY_COMPLETION_EXITING = 1,
    // Probably performing the last bit of cleanup? Then transitions to DONE
    SENTRY_COMPLETION_FINALIZING = 2,
    // The minigame has ended
    SENTRY_COMPLETION_DONE = 3,
};

enum sentry_control_state {
    // The default control state, which is to continue on in the current game state
    SENTRY_CTRL_CONTINUE = 0,
    // Triggers a game state transition with the necessary boilerplate, such as displaying
    // dialogue and setting up UI changes
    SENTRY_CTRL_STATE_TRANSITION = 1,
    // Always set directly after STATE_TRANSITION is handled. Seems to do some finalization
    // following a state change, before eventually transitioning back to CONTINUE
    SENTRY_CTRL_POST_TRANSITION = 2,
    // Set by a transition handler when another transition handler should be run immediately
    // after it, deferring the normal state transition boilerplate until after the second handler
    // has been run
    SENTRY_CTRL_INTERMEDIATE_TRANSITION = 3,
};

// 0xC4-byte animation state used by the ground engine (struct animation in pmdsky-debug)
struct animation {
    u8 data[0xC4];
};

// Arguments passed to PreprocessString (struct preprocess_args in pmdsky-debug)
struct preprocess_args {
    u32 flag_vals[4];   // 0x0: These are usually IDs with additional flags attached to them
    u32 id_vals[5];     // 0x10
    s32 number_vals[5]; // 0x24
    u8 *strings[5];     // 0x38
    // 0x4C: An optional argument that is used to insert the name of a Pokémon
    // when they're talking through a window. It requires its respective flag to be on
    u32 speaker_id;
};

struct sentry_duty {
    s8 field_0x0;  // ID of the footprint choices menu
    s8 field_0x1;  // ID of the dialogue box
    s8 field_0x2;  // ID of a portrait box
    s8 field_0x3;
    s8 field_0x4;
    s8 field_0x5;
    s8 field_0x6;
    s8 field_0x7;
    s8 field_0x8;
    s8 field_0x9;
    s8 field_0xa;  // ID of the debug menu
    s8 field_0xb;  // ID of a two-option menu
    s32 field_0xc;
    s32 field_0x10;
    s32 field_0x14;
    s32 field_0x18;
    u8 field_0x1c[0x88];
    struct preprocess_args preprocessor_args;  // 0xA4: Args for the dialogue window strings
    u8 field_0xf4[0x10];  // 0xF4: Portrait params
    // 0x104: Outermost game state, controls the "game completion" sequence.
    // Values from enum sentry_completion_state.
    s32 completion_state;
    // 0x108: The innermost game state that controls most state transition logic
    s32 game_state;
    // 0x10C: A middle "control" state that controls some events that span multiple game states.
    // Values from enum sentry_control_state.
    s32 control_state;
    // 0x110: The next game state to transition to. Transition handlers set this variable rather
    // than the actual game state, and the main game loop handles the transition internals properly
    s32 next_game_state;
    // 0x114: previous string ID displayed in the dialogue window
    s32 prev_dialogue_str_id;
    u32 field_0x118;  // Bitflags for which UI elements (windows, menus, portraits) are shown
    s32 field_0x11c;
    struct animation field_0x120;
    struct animation field_0x1e4;
    struct animation field_0x2a8;
    struct animation field_0x36c[16];
    struct animation field_0xfac[16];
    struct animation field_0x1bec[16];
    struct animation field_0x282c[2];
    struct animation field_0x29b4;
    struct animation field_0x2a78[4];
    struct animation field_0x2d88[4];
    struct animation field_0x3098[4];
    struct animation field_0x33a8;
    struct animation field_0x346c;
    u8 field_0x3530;
    u8 field_0x3531[3];
    s32 field_0x3534;
    s32 field_0x3538;
    s32 field_0x353c;
    s32 field_0x3540;
    s32 field_0x3544[4];
    s32 field_0x3554[4];  // Per-footprint-slot display state
    s32 field_0x3564;
    s32 field_0x3568;
    s32 field_0x356c;
    u8 field_0x3570[0x100];  // Buffer for the round number string
    u8 field_0x3670[0x100];  // Buffer for the round count string
    u8 field_0x3770[0x100];  // Buffer for the score string
    u8 field_0x3870;
    u8 field_0x3871;
    u8 field_0x3872[2];
    s32 field_0x3874;
    s32 field_0x3878;  // Index of a footprint slot
    s32 field_0x387c;  // Index of a footprint slot
    s32 field_0x3880;
    s32 field_0x3884;  // Number of rounds played
    s32 field_0x3888;  // Cycles 0-3, selects a dialogue string variant
    s32 field_0x388c;  // Total points
    s32 field_0x3890;
    s32 field_0x3894;  // Points delta for the current round
    s32 field_0x3898;
    u8 field_0x389c;
    u8 field_0x389d[5];
    s16 field_0x38a2[4];
    u8 field_0x38aa[2];
    s32 field_0x38ac;  // Dialogue progress counter
    s32 field_0x38b0;
    s32 field_0x38b4;  // Countdown timer
    s32 field_0x38b8[6];
    s16 field_0x38d0;  // Hero team member index
    s16 field_0x38d2;  // Partner team member index
};

#endif //PMDSKY_SENTRY_DUTY_H
