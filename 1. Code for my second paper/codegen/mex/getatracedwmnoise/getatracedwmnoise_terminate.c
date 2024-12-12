/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * getatracedwmnoise_terminate.c
 *
 * Code generation for function 'getatracedwmnoise_terminate'
 *
 */

/* Include files */
#include "getatracedwmnoise_terminate.h"
#include "_coder_getatracedwmnoise_mex.h"
#include "getatracedwmnoise.h"
#include "getatracedwmnoise_data.h"
#include "rt_nonfinite.h"

/* Function Definitions */
void getatracedwmnoise_atexit(void)
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

void getatracedwmnoise_terminate(void)
{
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  st.tls = emlrtRootTLSGlobal;
  emlrtLeaveRtStackR2012b(&st);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
}

/* End of code generation (getatracedwmnoise_terminate.c) */
