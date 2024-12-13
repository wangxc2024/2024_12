/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * dFmatnum_mex_terminate.c
 *
 * Code generation for function 'dFmatnum_mex_terminate'
 *
 */

/* Include files */
#include "dFmatnum_mex_terminate.h"
#include "_coder_dFmatnum_mex_mex.h"
#include "dFmatnum.h"
#include "dFmatnum_mex_data.h"
#include "odeDWM.h"
#include "rt_nonfinite.h"

/* Function Definitions */
void dFmatnum_mex_atexit(void)
{
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  mexFunctionCreateRootTLS();
  st.tls = emlrtRootTLSGlobal;
  emlrtEnterRtStackR2012b(&st);
  emlrtLeaveRtStackR2012b(&st);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
  emlrtExitTimeCleanup(&emlrtContextGlobal);
}

void dFmatnum_mex_terminate(void)
{
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  st.tls = emlrtRootTLSGlobal;
  emlrtLeaveRtStackR2012b(&st);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
}

/* End of code generation (dFmatnum_mex_terminate.c) */
