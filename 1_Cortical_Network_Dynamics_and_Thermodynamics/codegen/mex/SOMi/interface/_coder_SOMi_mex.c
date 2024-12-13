/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_SOMi_mex.c
 *
 * Code generation for function '_coder_SOMi_mex'
 *
 */

/* Include files */
#include "_coder_SOMi_mex.h"
#include "SOMi_data.h"
#include "SOMi_initialize.h"
#include "SOMi_terminate.h"
#include "_coder_SOMi_api.h"
#include "rt_nonfinite.h"

/* Function Definitions */
void SOMi_mexFunction(int32_T nlhs, mxArray *plhs[1], int32_T nrhs,
                      const mxArray *prhs[8])
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  const mxArray *outputs;
  st.tls = emlrtRootTLSGlobal;
  /* Check for proper number of arguments. */
  if (nrhs != 8) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:WrongNumberOfInputs", 5, 12, 8, 4,
                        4, "SOMi");
  }
  if (nlhs > 1) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:TooManyOutputArguments", 3, 4, 4,
                        "SOMi");
  }
  /* Call the function. */
  SOMi_api(prhs, &outputs);
  /* Copy over outputs to the caller. */
  emlrtReturnArrays(1, &plhs[0], &outputs);
}

void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs,
                 const mxArray *prhs[])
{
  mexAtExit(&SOMi_atexit);
  SOMi_initialize();
  SOMi_mexFunction(nlhs, plhs, nrhs, prhs);
  SOMi_terminate();
}

emlrtCTX mexFunctionCreateRootTLS(void)
{
  emlrtCreateRootTLSR2022a(&emlrtRootTLSGlobal, &emlrtContextGlobal, NULL, 1,
                           NULL, "GBK", true);
  return emlrtRootTLSGlobal;
}

/* End of code generation (_coder_SOMi_mex.c) */
