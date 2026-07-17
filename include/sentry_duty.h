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
    u8 field_0x1c[0xE8];
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
    u8 field_0x120[0x3770];
    s32 field_0x3890;
    u8 field_0x3894[0x40];
};

#endif //PMDSKY_SENTRY_DUTY_H
