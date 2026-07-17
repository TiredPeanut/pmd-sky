#include "overlay_14_0238B6D8.h"
#include "sentry_duty.h"
#include "util.h"

extern struct sentry_duty *SENTRY_DUTY_PTR;

extern void ov14_0238A514(void);
extern void ov11_022F6EFC(struct animation *anim);
extern void sub_02017B70(void);
extern void MemFree(void *ptr);

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
