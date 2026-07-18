#ifndef PMDSKY_OVERLAY_14_0238ABA0_H
#define PMDSKY_OVERLAY_14_0238ABA0_H

u8* SentryScoresMenuEntryFn(u8* buffer, s32 idx);
void SentryUpdateTimerBar(s32 arg0);
void SentryShowFootprintHint(void);
void SentryClearWindow(s8 window_id);
void SentryDrawChoiceNames(s8 window_id);
void SentryUpdateDisplay(void);

#endif //PMDSKY_OVERLAY_14_0238ABA0_H
