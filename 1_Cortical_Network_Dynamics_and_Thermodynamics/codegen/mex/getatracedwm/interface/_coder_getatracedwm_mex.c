/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_getatracedwm_mex.c
 *
 * Code generation for function '_coder_getatracedwm_mex'
 *
 */

/* Include files */
#include "_coder_getatracedwm_mex.h"
#include "_coder_getatracedwm_api.h"
#include "getatracedwm.h"
#include "getatracedwm_data.h"
#include "getatracedwm_initialize.h"
#include "getatracedwm_terminate.h"

/* Function Declarations */
MEXFUNCTION_LINKAGE void getatracedwm_mexFunction(int32_T nlhs, mxArray *plhs[2],
  int32_T nrhs, const mxArray *prhs[4]);

/* Function Definitions */
void getatracedwm_mexFunction(int32_T nlhs, mxArray *plhs[2], int32_T nrhs,
  const mxArray *prhs[4])
{
  const mxArray *outputs[2];
  int32_T b_nlhs;
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  st.tls = emlrtRootTLSGlobal;

  /* Check for proper number of arguments. */
  if (nrhs != 4) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:WrongNumberOfInputs", 5, 12, 4, 4,
                        12, "getatracedwm");
  }

  if (nlhs > 2) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:TooManyOutputArguments", 3, 4, 12,
                        "getatracedwm");
  }

  /* Call the function. */
  getatracedwm_api(prhs, nlhs, outputs);

  /* Copy over outputs to the caller. */
  if (nlhs < 1) {
    b_nlhs = 1;
  } else {
    b_nlhs = nlhs;
  }

  emlrtReturnArrays(b_nlhs, plhs, outputs);
}

void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs, const mxArray
                 *prhs[])
{
  mexAtExit(&getatracedwm_atexit);

  /* Module initialization. */
  getatracedwm_initialize();

  /* Dispatch the entry-point. */
  getatracedwm_mexFunction(nlhs, plhs, nrhs, prhs);

  /* Module termination. */
  getatracedwm_terminate();
}

emlrtCTX mexFunctionCreateRootTLS(void)
{
  emlrtCreateRootTLS(&emlrtRootTLSGlobal, &emlrtContextGlobal, NULL, 1);
  return emlrtRootTLSGlobal;
}

/* End of code generation (_coder_getatracedwm_mex.c) */
