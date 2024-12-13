/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_dSOM_mex_mex.c
 *
 * Code generation for function '_coder_dSOM_mex_mex'
 *
 */

/* Include files */
#include "_coder_dSOM_mex_mex.h"
#include "_coder_dSOM_mex_api.h"
#include "dSOM_mex_data.h"
#include "dSOM_mex_initialize.h"
#include "dSOM_mex_terminate.h"
#include "dSOM_mex_types.h"
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

void dSOM_mexFunction(dSOM_mexStackData *SD, int32_T nlhs, mxArray *plhs[1],
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
  dSOM_mexStackData *dSOM_mexStackDataGlobal = NULL;
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  const char_T *entryPointTemplateNames[2] = {"dSOM", "SOMi"};
  dSOM_mexStackDataGlobal = (dSOM_mexStackData *)emlrtMxCalloc(
      (size_t)1, (size_t)1U * sizeof(dSOM_mexStackData));
  mexAtExit(&dSOM_mex_atexit);
  dSOM_mex_initialize();
  st.tls = emlrtRootTLSGlobal;
  switch (emlrtGetEntryPointIndexR2016a(
      &st, nrhs, &prhs[0], (const char_T **)&entryPointTemplateNames[0], 2)) {
  case 0:
    dSOM_mexFunction(dSOM_mexStackDataGlobal, nlhs, plhs, nrhs - 1, &prhs[1]);
    break;
  case 1:
    SOMi_mexFunction(nlhs, plhs, nrhs - 1, &prhs[1]);
    break;
  }
  dSOM_mex_terminate();
  emlrtMxFree(dSOM_mexStackDataGlobal);
}

emlrtCTX mexFunctionCreateRootTLS(void)
{
  emlrtCreateRootTLSR2022a(&emlrtRootTLSGlobal, &emlrtContextGlobal, NULL, 1,
                           NULL, "GBK", true);
  return emlrtRootTLSGlobal;
}

/* End of code generation (_coder_dSOM_mex_mex.c) */
