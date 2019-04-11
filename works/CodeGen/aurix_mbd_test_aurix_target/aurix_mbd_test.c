/*
 * File: aurix_mbd_test.c
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

#include "aurix_mbd_test.h"
#include "aurix_mbd_test_private.h"

/* Core 0 Calls stored in DSPR0 */
VAR_CPU0_UNINIT
  T_CoreFCall core0calls[BLOCK_COUNT_AURIX_CORE0_FUNCTION_CALL];
VAR_CPU_END
  /* End of Core 0 Call structure */
  ;
static void CoreCallFcn_Core0_Fcn0(void);

/* Block states (default storage) */
DW_aurix_mbd_test_T aurix_mbd_test_DW;

/* Real-time model */
RT_MODEL_aurix_mbd_test_T aurix_mbd_test_M_;
RT_MODEL_aurix_mbd_test_T *const aurix_mbd_test_M = &aurix_mbd_test_M_;

/* ASC buffers for USB port */
uint8 ascTxBuffer[HTX_ASCLIN_ASC_TX_BUF_SIZE + sizeof(Ifx_Fifo) + 8];
uint8 ascRxBuffer[HTX_ASCLIN_ASC_RX_BUF_SIZE + sizeof(Ifx_Fifo) + 8];

/****************************/
/* Core0 Scheduler Function */
/****************************/
void Core0_Scheduler(void)
{
  uint8 n;
  uint64 clkCnt = Htx_ScheduleTimer_getmsCounter();
  for (n = 0u; n < BLOCK_COUNT_AURIX_CORE0_FUNCTION_CALL; n++)/**/
  {
    if (core0calls[n].nextmsSchedule <= clkCnt)/**/
    {
      core0calls[n].nextmsSchedule += core0calls[n].msSchedule;
      ((void(*)())core0calls[n].ptrFCall)();
    }
  }
}

/* Scheduled Core Call Function: '<Root>/Core Run Fcn' */
static void CoreCallFcn_Core0_Fcn0(void)
{
  {
    /* S-Function (aurixcorefunctioncall_sfcn): '<Root>/Core Run Fcn' */
    aurix_mbd_test_Core0_run();

    /* End of Outputs for S-Function (aurixcorefunctioncall_sfcn): '<Root>/Core Run Fcn' */
  }
}

/* Output and update for function-call system: '<Root>/Core0_Init' */
void aurix_mbd_test_Core0_Init(void)
{
  /* S-Function (sb275basic_ioConfig): '<S1>/Config IO' */
  IfxPort_setPinModeOutput(&MODULE_P10, 2, IfxPort_OutputMode_pushPull,
    IfxPort_OutputIdx_general);

  /* S-Function (sb275basic_serialConfig): '<S1>/SerialConfig' */
  Htx_ASCLIN_Asc_USB_ConfigSettings cfg;
  cfg.baud = 115200;
  cfg.intHandler = 0u;
  cfg.txPriority = 4u;
  cfg.rxPriority = 5u;
  cfg.erPriority = 6u;
  cfg.txBuffer = &ascTxBuffer;
  cfg.rxBuffer = &ascRxBuffer;
  cfg.txBufSize = HTX_ASCLIN_ASC_TX_BUF_SIZE;
  cfg.rxBufSize = HTX_ASCLIN_ASC_RX_BUF_SIZE;
  Htx_ASCLIN_Asc_USB_Config(&cfg);
}

/* System initialize for function-call system: '<Root>/Core0_run' */
void aurix_mbd_test_Core0_run_Init(void)
{
  /* InitializeConditions for DiscretePulseGenerator: '<S2>/Pulse Generator' */
  aurix_mbd_test_DW.clockTickCounter = 0;
}

/* System reset for function-call system: '<Root>/Core0_run' */
void aurix_mbd_test_Core0_run_Reset(void)
{
  /* InitializeConditions for DiscretePulseGenerator: '<S2>/Pulse Generator' */
  aurix_mbd_test_DW.clockTickCounter = 0;
}

/* Output and update for function-call system: '<Root>/Core0_run' */
void aurix_mbd_test_Core0_run(void)
{
  /* local block i/o variables */
  real32_T rtb_Divide;
  boolean_T rtb_DataTypeConversion;
  int32_T rtb_PulseGenerator;

  {
    /* user code (Output function Header for TID2) */
    Ifx_SizeT size_0;
    char str_0[HTX_ASCLIN_ASC_TX_BUF_SIZE];

    /* Product: '<S2>/Divide' incorporates:
     *  Constant: '<S2>/Constant1'
     *  Memory: '<S2>/Memory'
     */
    rtb_Divide = (real32_T)(aurix_mbd_test_DW.Memory_PreviousInput / 10.0);

    /* S-Function (sb275basic_serialWrite): '<S2>/SerialSendString' */
    size_0 = snprintf(str_0, HTX_ASCLIN_ASC_TX_BUF_SIZE, "%2.2f\r\n" ,
                      rtb_Divide
                      );
    size_0 = size_0 > HTX_ASCLIN_ASC_TX_BUF_SIZE ? HTX_ASCLIN_ASC_TX_BUF_SIZE :
      size_0;
    Htx_ASCLIN_Asc_USB_Write(str_0, &size_0);

    /* DiscretePulseGenerator: '<S2>/Pulse Generator' */
    rtb_PulseGenerator = ((aurix_mbd_test_DW.clockTickCounter < 20) &&
                          (aurix_mbd_test_DW.clockTickCounter >= 0));
    if (aurix_mbd_test_DW.clockTickCounter >= 39) {
      aurix_mbd_test_DW.clockTickCounter = 0;
    } else {
      aurix_mbd_test_DW.clockTickCounter++;
    }

    /* End of DiscretePulseGenerator: '<S2>/Pulse Generator' */

    /* DataTypeConversion: '<S2>/Data Type Conversion' */
    rtb_DataTypeConversion = (rtb_PulseGenerator != 0);

    /* S-Function (sb275basic_digitalWrite): '<S2>/DigitalWrite' */
    IfxPort_setPinState(&MODULE_P10, 2, (IfxPort_State)( rtb_DataTypeConversion
      ? 1u : (1u << 16)));

    /* Sum: '<S2>/Add' incorporates:
     *  Constant: '<S2>/Constant'
     *  Memory: '<S2>/Memory'
     */
    aurix_mbd_test_DW.Memory_PreviousInput++;
  }
}

/* Model initialize function */
void aurix_mbd_test_initialize(void)
{
  /* Registration code */

  /* initialize error status */
  rtmSetErrorStatus(aurix_mbd_test_M, (NULL));

  /* states (dwork) */
  (void) memset((void *)&aurix_mbd_test_DW, 0,
                sizeof(DW_aurix_mbd_test_T));

  {
    /* user code (Initialize function Header) */

    /* Scheduled Core Call Function: '<Root>/Core Run Fcn' */
    core0calls[0].ptrFCall = &CoreCallFcn_Core0_Fcn0;
    core0calls[0].msSchedule = 10;
    core0calls[0].nextmsSchedule = 10;

    /* SystemInitialize for S-Function (aurixcorefunctioncall_sfcn): '<Root>/Core Run Fcn' incorporates:
     *  SubSystem: '<Root>/Core0_run'
     */
    aurix_mbd_test_Core0_run_Init();

    /* End of SystemInitialize for S-Function (aurixcorefunctioncall_sfcn): '<Root>/Core Run Fcn' */
  }

  {
  }
}

/* Model terminate function */
void aurix_mbd_test_terminate(void)
{
  /* (no terminate code required) */
}

/* Initialisation function for Core 0 called at startup before interrupts are enabled */
void CoreInitialisation_0_Pre(void)
{
  /* Downstream block */
  {
    /* S-Function (aurixcoreinitialise_sfcn): '<Root>/Core Initialise' */
    aurix_mbd_test_Core0_Init();

    /* End of Outputs for S-Function (aurixcoreinitialise_sfcn): '<Root>/Core Initialise' */
  }
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
