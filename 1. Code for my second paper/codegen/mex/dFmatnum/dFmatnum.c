/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * dFmatnum.c
 *
 * Code generation for function 'dFmatnum'
 *
 */

/* Include files */
#include "dFmatnum.h"
#include "dFmatnum_data.h"
#include "odeDWM.h"
#include "rt_nonfinite.h"
#include <string.h>

/* Function Definitions */
void dFmatnum(const emlrtStack *sp, real_T t, const real_T x[90], const
              struct0_T *param, real_T A[8100])
{
  real_T F[90];
  int32_T i;
  real_T x1[90];
  real_T F1[90];
  int32_T j;
  (void)t;
  odeDWM(x, param, F);
  for (i = 0; i < 90; i++) {
    memcpy(&x1[0], &x[0], 90U * sizeof(real_T));
    x1[i] = x[i] + 1.0E-5;
    odeDWM(x1, param, F1);
    for (j = 0; j < 90; j++) {
      A[i + 90 * j] = (F1[j] - F[j]) / 1.0E-5;
      if (*emlrtBreakCheckR2012bFlagVar != 0) {
        emlrtBreakCheckR2012b(sp);
      }
    }

    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b(sp);
    }
  }
}

/* End of code generation (dFmatnum.c) */
