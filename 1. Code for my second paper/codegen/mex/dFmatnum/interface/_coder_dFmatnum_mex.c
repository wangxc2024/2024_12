/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_dFmatnum_mex.c
 *
 * Code generation for function '_coder_dFmatnum_mex'
 *
 */

/* Include files */
#include "_coder_dFmatnum_mex.h"
#include "_coder_dFmatnum_api.h"
#include "dFmatnum.h"
#include "dFmatnum_data.h"
#include "dFmatnum_initialize.h"
#include "dFmatnum_terminate.h"

/* Function Declarations */
MEXFUNCTION_LINKAGE void dFmatnum_mexFunction(int32_T nlhs, mxArray *plhs[1],
  int32_T nrhs, const mxArray *prhs[3]);

/* Function Definitions */
void dFmatnum_mexFunction(int32_T nlhs, mxArray *plhs[1], int32_T nrhs, const
  mxArray *prhs[3])
{
  const mxArray *outputs[1];
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  st.tls = emlrtRootTLSGlobal;

  /* Check for proper number of arguments. */
  if (nrhs != 3) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:WrongNumberOfInputs", 5, 12, 3, 4, 8,
                        "dFmatnum");
  }

  if (nlhs > 1) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:TooManyOutputArguments", 3, 4, 8,
                        "dFmatnum");
  }

  /* Call the function. */
  dFmatnum_api(prhs, nlhs, outputs);

  /* Copy over outputs to the caller. */
  emlrtReturnArrays(1, plhs, outputs);
}

void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs, const mxArray
                 *prhs[])
{
  mexAtExit(&dFmatnum_atexit);

  /* Module initialization. */
  dFmatnum_initialize();

  /* Dispatch the entry-point. */
  dFmatnum_mexFunction(nlhs, plhs, nrhs, prhs);

  /* Module termination. */
  dFmatnum_terminate();
}

emlrtCTX mexFunctionCreateRootTLS(void)
{
  emlrtCreateRootTLS(&emlrtRootTLSGlobal, &emlrtContextGlobal, NULL, 1);
  return emlrtRootTLSGlobal;
}

/* End of code generation (_coder_dFmatnum_mex.c) */
