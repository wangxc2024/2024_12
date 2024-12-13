/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * getatracedwm_initialize.c
 *
 * Code generation for function 'getatracedwm_initialize'
 *
 */

/* Include files */
#include "getatracedwm_initialize.h"
#include "_coder_getatracedwm_mex.h"
#include "getatracedwm.h"
#include "getatracedwm_data.h"
#include "rt_nonfinite.h"

/* Function Definitions */
void getatracedwm_initialize(void)
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

/* End of code generation (getatracedwm_initialize.c) */
