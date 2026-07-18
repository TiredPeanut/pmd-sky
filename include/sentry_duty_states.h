#ifndef PMDSKY_SENTRY_DUTY_STATES_H
#define PMDSKY_SENTRY_DUTY_STATES_H

#include "sentry_duty.h"

void SentrySetStateIntermediate(s32 next_state);
void SentryState0(void);
void SentryState1(void);
void SentryState2(void);
void SentryState3(void);
void SentryState4(void);
void SentryStateExit(void);
void SentryState6(void);
void SentryState7(void);
void SentryState8(void);
void SentryState9(void);
void SentryStateA(void);
void SentryStateB(void);
void SentryStateGenerateChoices(void);
void SentryStateGetUserChoice(void);

#endif //PMDSKY_SENTRY_DUTY_STATES_H
