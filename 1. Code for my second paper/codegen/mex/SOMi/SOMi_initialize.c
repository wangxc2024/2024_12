/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * SOMi_initialize.c
 *
 * Code generation for function 'SOMi_initialize'
 *
 */

/* Include files */
#include "SOMi_initialize.h"
#include "SOMi_data.h"
#include "_coder_SOMi_mex.h"
#include "rt_nonfinite.h"

/* Function Declarations */
static void SOMi_once(void);

/* Function Definitions */
static void SOMi_once(void)
{
  mex_InitInfAndNan();
}

void SOMi_initialize(void)
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
    SOMi_once();
  }
}

/* End of code generation (SOMi_initialize.c) */
