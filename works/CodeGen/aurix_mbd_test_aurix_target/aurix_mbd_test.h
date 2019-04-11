/*
 * File: aurix_mbd_test.h
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

#ifndef RTW_HEADER_aurix_mbd_test_h_
#define RTW_HEADER_aurix_mbd_test_h_
#include <stddef.h>
#include <string.h>
#ifndef aurix_mbd_test_COMMON_INCLUDES_
# define aurix_mbd_test_COMMON_INCLUDES_
#include "rtwtypes.h"
#include "IfxPort_Io.h"
#include "Htx_ASCLIN.h"
#include "stdio.h"
#include "Htx_ModelIntPrio.h"
#include "Htx_ScheduleTimer.h"
#include "Htx_MemMap.h"
#endif                                 /* aurix_mbd_test_COMMON_INCLUDES_ */

#include "aurix_mbd_test_types.h"

/* ASC buffer sizes for USB port */
#define HTX_ASCLIN_ASC_TX_BUF_SIZE     (128u)
#define HTX_ASCLIN_ASC_RX_BUF_SIZE     (16u)
#define CALL_CORE_0_INITIALISATION_PRE_GLINTEN
#define BLOCK_COUNT_AURIX_CORE0_FUNCTION_CALL (1u)
#define BLOCK_COUNT_AURIX_CORE1_FUNCTION_CALL (0u)
#define BLOCK_COUNT_AURIX_CORE2_FUNCTION_CALL (0u)

/* Macros for accessing real-time model data structure */
#ifndef rtmGetErrorStatus
# define rtmGetErrorStatus(rtm)        ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
# define rtmSetErrorStatus(rtm, val)   ((rtm)->errorStatus = (val))
#endif

typedef struct {
  void * ptrFCall;
  uint32 msSchedule;
  uint64 nextmsSchedule;
} T_CoreFCall;

/* Block states (default storage) for system '<Root>' */
typedef struct {
  real_T Memory_PreviousInput;         /* '<S2>/Memory' */
  int32_T clockTickCounter;            /* '<S2>/Pulse Generator' */
} DW_aurix_mbd_test_T;

/* Real-time Model Data Structure */
struct tag_RTM_aurix_mbd_test_T {
  const char_T * volatile errorStatus;
};

extern void CoreInitialisation_0_Pre(void);

/* Block states (default storage) */
extern DW_aurix_mbd_test_T aurix_mbd_test_DW;

/* Model entry point functions */
extern void aurix_mbd_test_initialize(void);
extern void aurix_mbd_test_terminate(void);
extern void Core0_Scheduler(void);

/* Real-time Model object */
extern RT_MODEL_aurix_mbd_test_T *const aurix_mbd_test_M;

/*-
 * These blocks were eliminated from the model due to optimizations:
 *
 * Block '<S2>/Scope' : Unused code path elimination
 */

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'aurix_mbd_test'
 * '<S1>'   : 'aurix_mbd_test/Core0_Init'
 * '<S2>'   : 'aurix_mbd_test/Core0_run'
 */
#endif                                 /* RTW_HEADER_aurix_mbd_test_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
