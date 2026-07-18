#ifndef PMDSKY_SENTRY_DUTY_DISPLAY_H
#define PMDSKY_SENTRY_DUTY_DISPLAY_H

u8* SentryScoresMenuEntryFn(u8* buffer, s32 idx);
void SentryUpdateTimerBar(s32 arg0);
void SentryShowFootprintHint(void);
void SentryClearWindow(s8 window_id);
void SentryDrawChoiceNames(s8 window_id);
void SentryUpdateDisplay(void);

#endif //PMDSKY_SENTRY_DUTY_DISPLAY_H
