/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * dSOM_initialize.c
 *
 * Code generation for function 'dSOM_initialize'
 *
 */

/* Include files */
#include "dSOM_initialize.h"
#include "_coder_dSOM_mex.h"
#include "dSOM_data.h"
#include "rt_nonfinite.h"

/* Function Declarations */
static void dSOM_once(void);

/* Function Definitions */
static void dSOM_once(void)
{
  mex_InitInfAndNan();
}

void dSOM_initialize(void)
{
  static const volatile char_T *emlrtBreakCheckR2012bFlagVar = NULL;
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  mexFunctionCreateRootTLS();
  st.tls = emlrtRootTLSGlobal;
  emlrtBreakCheckR2012bFlagVar = emlrtGetBreakCheckFlagAddressR2022b(&st);
  emlrtClearAllocCountR2012b(&st, false, 0U, NULL);
  emlrtEnterRtStackR2012b(&st);
  if (emlrtFirstTimeR2012b(emlrtRootTLSGlobal)) {
    dSOM_once();
  }
}

/* End of code generation (dSOM_initialize.c) */
