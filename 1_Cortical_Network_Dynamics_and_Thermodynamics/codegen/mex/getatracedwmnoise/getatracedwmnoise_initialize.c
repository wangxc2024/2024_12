/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * getatracedwmnoise_initialize.c
 *
 * Code generation for function 'getatracedwmnoise_initialize'
 *
 */

/* Include files */
#include "getatracedwmnoise_initialize.h"
#include "_coder_getatracedwmnoise_mex.h"
#include "getatracedwmnoise.h"
#include "getatracedwmnoise_data.h"
#include "rt_nonfinite.h"

/* Function Definitions */
void getatracedwmnoise_initialize(void)
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

/* End of code generation (getatracedwmnoise_initialize.c) */
