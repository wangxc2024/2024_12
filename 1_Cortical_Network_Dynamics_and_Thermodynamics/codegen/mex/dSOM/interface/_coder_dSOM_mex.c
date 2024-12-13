/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_dSOM_mex.c
 *
 * Code generation for function '_coder_dSOM_mex'
 *
 */

/* Include files */
#include "_coder_dSOM_mex.h"
#include "_coder_dSOM_api.h"
#include "dSOM_data.h"
#include "dSOM_initialize.h"
#include "dSOM_terminate.h"
#include "dSOM_types.h"
#include "rt_nonfinite.h"

/* Function Definitions */
void dSOM_mexFunction(dSOMStackData *SD, int32_T nlhs, mxArray *plhs[1],
                      int32_T nrhs, const mxArray *prhs[10])
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  const mxArray *outputs;
  st.tls = emlrtRootTLSGlobal;
  /* Check for proper number of arguments. */
  if (nrhs != 10) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:WrongNumberOfInputs", 5, 12, 10, 4,
                        4, "dSOM");
  }
  if (nlhs > 1) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:TooManyOutputArguments", 3, 4, 4,
                        "dSOM");
  }
  /* Call the function. */
  dSOM_api(SD, prhs, &outputs);
  /* Copy over outputs to the caller. */
  emlrtReturnArrays(1, &plhs[0], &outputs);
}

void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs,
                 const mxArray *prhs[])
{
  dSOMStackData *dSOMStackDataGlobal = NULL;
  dSOMStackDataGlobal = (dSOMStackData *)emlrtMxCalloc(
      (size_t)1, (size_t)1U * sizeof(dSOMStackData));
  mexAtExit(&dSOM_atexit);
  dSOM_initialize();
  dSOM_mexFunction(dSOMStackDataGlobal, nlhs, plhs, nrhs, prhs);
  dSOM_terminate();
  emlrtMxFree(dSOMStackDataGlobal);
}

emlrtCTX mexFunctionCreateRootTLS(void)
{
  emlrtCreateRootTLSR2022a(&emlrtRootTLSGlobal, &emlrtContextGlobal, NULL, 1,
                           NULL, "GBK", true);
  return emlrtRootTLSGlobal;
}

/* End of code generation (_coder_dSOM_mex.c) */
