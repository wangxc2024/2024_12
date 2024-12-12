/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_dFmatnum_mex_mex.c
 *
 * Code generation for function '_coder_dFmatnum_mex_mex'
 *
 */

/* Include files */
#include "_coder_dFmatnum_mex_mex.h"
#include "_coder_dFmatnum_mex_api.h"
#include "dFmatnum.h"
#include "dFmatnum_mex_data.h"
#include "dFmatnum_mex_initialize.h"
#include "dFmatnum_mex_terminate.h"
#include "odeDWM.h"

/* Variable Definitions */
static const char * emlrtEntryPoints[2] = { "dFmatnum", "odeDWM" };

/* Function Declarations */
MEXFUNCTION_LINKAGE void dFmatnum_mexFunction(int32_T nlhs, mxArray *plhs[1],
  int32_T nrhs, const mxArray *prhs[3]);
MEXFUNCTION_LINKAGE void odeDWM_mexFunction(int32_T nlhs, mxArray *plhs[1],
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

void odeDWM_mexFunction(int32_T nlhs, mxArray *plhs[1], int32_T nrhs, const
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
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:WrongNumberOfInputs", 5, 12, 3, 4, 6,
                        "odeDWM");
  }

  if (nlhs > 1) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:TooManyOutputArguments", 3, 4, 6,
                        "odeDWM");
  }

  /* Call the function. */
  odeDWM_api(prhs, nlhs, outputs);

  /* Copy over outputs to the caller. */
  emlrtReturnArrays(1, plhs, outputs);
}

void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs, const mxArray
                 *prhs[])
{
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  mexAtExit(&dFmatnum_mex_atexit);

  /* Module initialization. */
  dFmatnum_mex_initialize();
  st.tls = emlrtRootTLSGlobal;

  /* Dispatch the entry-point. */
  switch (emlrtGetEntryPointIndexR2016a(&st, nrhs, prhs, emlrtEntryPoints, 2)) {
   case 0:
    dFmatnum_mexFunction(nlhs, plhs, nrhs - 1, *(const mxArray *(*)[3])&prhs[1]);
    break;

   case 1:
    odeDWM_mexFunction(nlhs, plhs, nrhs - 1, *(const mxArray *(*)[3])&prhs[1]);
    break;
  }

  /* Module termination. */
  dFmatnum_mex_terminate();
}

emlrtCTX mexFunctionCreateRootTLS(void)
{
  emlrtCreateRootTLS(&emlrtRootTLSGlobal, &emlrtContextGlobal, NULL, 1);
  return emlrtRootTLSGlobal;
}

/* End of code generation (_coder_dFmatnum_mex_mex.c) */
