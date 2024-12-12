/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * dFmatnum_mex_initialize.c
 *
 * Code generation for function 'dFmatnum_mex_initialize'
 *
 */

/* Include files */
#include "dFmatnum_mex_initialize.h"
#include "_coder_dFmatnum_mex_mex.h"
#include "dFmatnum.h"
#include "dFmatnum_mex_data.h"
#include "odeDWM.h"
#include "rt_nonfinite.h"

/* Function Definitions */
void dFmatnum_mex_initialize(void)
{
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  mex_InitInfAndNan();
  mexFunctionCreateRootTLS();
  emlrtBreakCheckR2012bFlagVar = emlrtGetBreakCheckFlagAddressR2012b();
  st.tls = emlrtRootTLSGlobal;
  emlrtClearAllocCountR2012b(&st, false, 0U, 0);
  emlrtEnterRtStackR2012b(&st);
  emlrtFirstTimeR2012b(emlrtRootTLSGlobal);
}

/* End of code generation (dFmatnum_mex_initialize.c) */
