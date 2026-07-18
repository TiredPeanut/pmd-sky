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

// Values for sentry_duty::game_state and next_game_state. The state handlers are
// listed in SENTRY_DUTY_STATE_HANDLER_TABLE in this order; states 0-3 are only
// reachable through the debug menus. Most states come in pairs: the first shows
// dialogue/UI for the step and the second advances once it has been seen.
enum sentry_game_state {
    SENTRY_STATE_DEBUG_START = 0,           // Opens the two-option debug menu
    SENTRY_STATE_DEBUG_START_CHOICE = 1,
    SENTRY_STATE_DEBUG_RESULT = 2,          // Opens the debug menu for picking an exit result
    SENTRY_STATE_DEBUG_RESULT_CHOICE = 3,
    SENTRY_STATE_SCORES_MODE2 = 4,          // Mode-2 entry point: scores menu, no music
    SENTRY_STATE_EXIT = 5,
    SENTRY_STATE_INSTRUCTIONS = 6,          // Normal entry point: Loudred explains the rules
    SENTRY_STATE_INSTRUCTIONS_2 = 7,
    SENTRY_STATE_HERE_COMES_FIRST = 8,      // "Someone's coming" before the first round
    SENTRY_STATE_START_ROUND = 9,           // Closes the intro windows, starts the round
    SENTRY_STATE_HERE_COMES = 0xA,          // "Someone's coming" before later rounds
    SENTRY_STATE_HERE_COMES_2 = 0xB,
    SENTRY_STATE_GENERATE_CHOICES = 0xC,
    SENTRY_STATE_GET_USER_CHOICE = 0xD,
    SENTRY_STATE_FINALIZE_ROUND = 0xE,
    SENTRY_STATE_NEXT_ROUND = 0xF,
    SENTRY_STATE_WRONG_ANSWER = 0x10,       // Wrong answer with tries left
    SENTRY_STATE_WRONG_ANSWER_2 = 0x11,
    SENTRY_STATE_TIME_UP = 0x12,
    SENTRY_STATE_TIME_UP_2 = 0x13,
    SENTRY_STATE_OUT_OF_TRIES = 0x14,
    SENTRY_STATE_OUT_OF_TRIES_2 = 0x15,
    SENTRY_STATE_HIDE_FOOTPRINT = 0x16,     // Scrolls the footprint away after a failed round
    SENTRY_STATE_REVEAL_ANSWER = 0x17,      // Marks the right answer (and the wrong pick)
    SENTRY_STATE_REVEAL_ANSWER_2 = 0x18,
    SENTRY_STATE_CORRECT_ANSWER = 0x19,
    SENTRY_STATE_CORRECT_ANSWER_2 = 0x1A,
    SENTRY_STATE_FINALIZE_POINTS = 0x1B,    // Scrolls the footprint away, awards round points
    SENTRY_STATE_SHOW_POINTS = 0x1C,
    SENTRY_STATE_SHOW_POINTS_2 = 0x1D,
    SENTRY_STATE_ENDING_MODE1 = 0x1E,       // Ending dialogue when mode == 1
    SENTRY_STATE_ENDING_MODE1_2 = 0x1F,
    SENTRY_STATE_ENDING_MODE0 = 0x20,       // Ending dialogue when mode == 0
    SENTRY_STATE_ENDING_MODE0_2 = 0x21,
};

// Bits for sentry_duty::window_flags, matching the window ID fields
#define SENTRY_WINDOW_SCORES_MENU 0x1
#define SENTRY_WINDOW_DIALOGUE_BOX 0x2
#define SENTRY_WINDOW_DIGLETT_PORTRAIT 0x4
#define SENTRY_WINDOW_FOOTPRINT_BOX 0x8
#define SENTRY_WINDOW_TOP_NAMES_BOX 0x10
#define SENTRY_WINDOW_BOTTOM_NAMES_BOX 0x20
#define SENTRY_WINDOW_CHOICE_PORTRAIT_0 0x40
#define SENTRY_WINDOW_CHOICE_PORTRAIT_1 0x80
#define SENTRY_WINDOW_CHOICE_PORTRAIT_2 0x100
#define SENTRY_WINDOW_CHOICE_PORTRAIT_3 0x200
#define SENTRY_WINDOW_DEBUG_MENU 0x40000000
#define SENTRY_WINDOW_DEBUG_OPTION_MENU 0x80000000

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
    s8 scores_menu_id;  // ID of the menu listing the top sentry duty scores
    s8 dialogue_box_id;  // ID of the dialogue box
    s8 diglett_portrait_id;  // ID of the portrait box showing Diglett
    s8 footprint_box_id;
    s8 top_names_box_id;
    s8 bottom_names_box_id;
    s8 choice_portrait_ids[4];  // 0x6: portrait box IDs for the four choice slots
    s8 debug_menu_id;  // ID of the debug menu
    s8 debug_option_menu_id;  // ID of a two-option menu
    s32 field_0xc;
    s32 field_0x10;
    u16 field_0x14;
    s16 field_0x16;
    s32 field_0x18;
    u8 field_0x1c[0x88];
    struct preprocess_args dialogue_args;  // 0xA4: Args for the dialogue window strings
    u8 diglett_portrait_params[0x10];  // 0xF4: Portrait params
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
    u32 window_flags;  // Bitflags for which UI elements (windows, menus, portraits) are shown
    s32 mode;  // Set from SentrySetupState's argument; 2 skips the intro dialogue and music
    struct animation marker_anim_data;  // Anim data the cursor/mark/footprint sprites are initialized from
    struct animation hud_anim_data;  // Anim data the timer/digit/icon sprites are initialized from
    struct animation field_0x2a8;  // Initialized at setup but apparently never displayed
    struct animation timer_icon_anims[16];
    struct animation round_digit_anims[16];
    struct animation points_digit_anims[16];
    struct animation try_icon_anims[2];
    struct animation cursor_anim;
    struct animation choice_monster_anims[4];
    struct animation slot_mark_anims[4];
    struct animation choice_footprint_anims[4];
    struct animation footprint_anim;
    struct animation footprint_overlay_anim;
    u8 field_0x3530;
    u8 field_0x3531[3];
    s32 cursor_state;
    s32 cursor_next_state;
    s32 choice_footprints_state;
    s32 choice_footprints_next_state;
    s32 slot_mark_states[4];
    s32 slot_mark_next_states[4];  // Per-footprint-slot display state
    s32 round_display;
    s32 points_display;
    s32 tries_display;
    u8 round_str[0x100];  // Buffer for the round number string
    u8 round_count_str[0x100];  // Buffer for the round count string
    u8 points_str[0x100];  // Buffer for the score string
    u8 round_active;
    u8 timed_out;
    u8 field_0x3872[2];
    s32 frame_counter;  // Frames elapsed in the current round
    s32 selected_slot;  // Currently selected choice slot (0-3)
    s32 right_answer_slot;  // Choice slot (0-3) holding the right answer
    s32 right_answer_data_idx;  // Index into SENTRY_DUTY_MONSTER_IDS for the right answer
    s32 round;  // Current round (0-indexed)
    s32 dialogue_variant;  // Cycles 0-3, selects a dialogue string variant
    s32 points;  // Total points
    s32 exit_result;  // Performance result (0-7) passed to ReturnScriptMenuResult on exit
    s32 round_points;  // Points delta for the current round
    s32 tries_left;  // Remaining wrong answers allowed in the current round
    u8 perfect;  // Set until the player answers wrong or times out; worth a point bonus
    u8 hint_shown[5];  // One-shot flags for the timed hints (portraits at 2s, dialogue at 5s/11s)
    s16 choices[4];  // Species for each of the choice slots
    u8 field_0x38aa[2];
    s32 dialogue_progress;  // Dialogue progress counter
    s32 footprint_y;  // Y position of the footprint sprite
    s32 exit_timer;  // Countdown timer before the results screens exit
    s32 prev_right_answer_data_idxs[6];  // Right answer data indexes for previous rounds
    s16 hero_str_id;  // Hero team member index, used as a dialogue speaker ID
    s16 partner_str_id;  // Partner team member index, used as a dialogue speaker ID
};

#endif //PMDSKY_SENTRY_DUTY_H
