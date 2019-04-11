/*
 * File: ert_main.c
 *
 * Code generated for Simulink model 'aurix_mbd_test'.
 *
 * Model version                  : 1.14
 * Simulink Coder version         : 9.1 (R2019a) 23-Nov-2018
 * C/C++ source code generated on : Thu Apr 11 17:52:31 2019
 *
 * Target selection: aurix_sys_trgt.tlc
 * Embedded hardware selection: Infineon->TriCore
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

/* Generated using SINGLE CORE MODEL */
#include <aurix_mbd_test.h>
#include "Bsp.h"
#include "Htx_Target.h"

extern void Htx_Sb_Setup(void);

/* Install Tx/Rx/Er Interrupts for USB Serial Port */
IFX_INTERRUPT(asclin0TxISR, INT_CORE_HANDLER_ASCLIN0, INT_PRIO_ASCLIN0_TX)
{
  Htx_ASCLIN_Asc_USB_TxISR();
}

IFX_INTERRUPT(asclin0RxISR, INT_CORE_HANDLER_ASCLIN0, INT_PRIO_ASCLIN0_RX)
{
  Htx_ASCLIN_Asc_USB_RxISR();
}

IFX_INTERRUPT(asclin0ErISR, INT_CORE_HANDLER_ASCLIN0, INT_PRIO_ASCLIN0_ER)
{
  Htx_ASCLIN_Asc_USB_ErISR();
}

/* Install intrerrupt for Scheduler */
IFX_INTERRUPT(SCHEDULER_ISR_CALLER, INT_CORE_HANDLER_SCHEDULER,
              INT_PRIO_SCHEDULER)
{
  Htx_ScheduleTimer_ISR();
}

/************************/
/* Core 0 Main Function */
/************************/
void core0_main(void)
{
  IfxScuWdt_disableCpuWatchdog (IfxScuWdt_getCpuWatchdogPassword ());
  IfxScuWdt_disableSafetyWatchdog (IfxScuWdt_getSafetyWatchdogPassword ());

  /* Initialise scheduler */
  Htx_ScheduleTimer_Init();

  /* Initialize model */
  aurix_mbd_test_initialize();

  /* Initialisation for Core 0 */
  Htx_Sb_Setup();

#ifdef CALL_CORE_0_INITIALISATION_PRE_GLINTEN

  CoreInitialisation_0_Pre();

#endif

  /* Enable interrupts in order for scheduler to operate. */
  IfxCpu_enableInterrupts();

#ifdef CALL_CORE_0_INITIALISATION_POST_GLINTEN

  CoreInitialisation_0_Post();

#endif

  for (;;)                             /**/
  {
    Core0_Scheduler();
  }
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
