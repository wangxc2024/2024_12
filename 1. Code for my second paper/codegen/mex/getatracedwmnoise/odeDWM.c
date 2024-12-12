/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * odeDWM.c
 *
 * Code generation for function 'odeDWM'
 *
 */

/* Include files */
#include "odeDWM.h"
#include "getatracedwmnoise.h"
#include "mtimes.h"
#include "mwmathutil.h"
#include "rt_nonfinite.h"
#include <string.h>

/* Function Definitions */
void odeDWM(const real_T x[90], const struct0_T *param, real_T dx[90])
{
  int32_T i;
  real_T a_tmp[900];
  real_T y[30];
  real_T d;
  real_T a_tmp_tmp[900];
  real_T b_y[30];
  real_T b_x[30];
  real_T c_y[30];
  real_T d1;
  real_T d2;
  real_T d3;
  real_T d4;
  real_T d5;

  /* [30,30] */
  /* [30,30] */
  /* [30,3] */
  /* [30,1] */
  /* [30,1] */
  /* [30,1] */
  /* [30,1] */
  /* [30,1] */
  /* [30,1] */
  /* [30,1] */
  /* [30,1] */
  for (i = 0; i < 900; i++) {
    d = param->G * param->W[i];
    a_tmp_tmp[i] = d;
    a_tmp[i] = d * param->SLN[i];
  }

  mtimes(a_tmp, *(real_T (*)[30])&x[0], y);

  /* [30,1] */
  mtimes(a_tmp, *(real_T (*)[30])&x[30], b_y);

  /* [30,1] */
  for (i = 0; i < 900; i++) {
    a_tmp_tmp[i] *= 1.0 - param->SLN[i];
  }

  for (i = 0; i < 30; i++) {
    b_x[i] = x[i] + x[i + 30];
  }

  mtimes(a_tmp_tmp, b_x, c_y);

  /* [30,1] */
  for (i = 0; i < 30; i++) {
    b_x[i] = param->Jei * x[i + 60];
  }

  /* [30,1] */
  /* [30,1] */
  /* [30,1] */
  memset(&dx[0], 0, 90U * sizeof(real_T));

  /* [30,1] */
  /* [30,1] */
  /* [30,1] */
  for (i = 0; i < 30; i++) {
    d = x[i + 30];
    d1 = 135.0 * (((((param->Js[i] * x[i] + param->Jc * d) + b_x[i]) +
                    param->I0a) + y[i] * param->wa[i]) + param->Iinput[i]) -
      54.0;
    y[i] = d1;
    d2 = 135.0 * (((((param->Js[i] * d + param->Jc * x[i]) + b_x[i]) +
                    param->I0b) + b_y[i] * param->wb[i]) + param->Iinput[i + 30])
      - 54.0;
    b_x[i] = d2;
    d3 = muDoubleScalarExp(-0.308 * d2);
    b_y[i] = d3;
    d4 = x[i + 60];
    d5 = (615.0 * (((((param->Jie[i] * x[i] + param->Jie[i] * d) + param->Jii *
                      d4) + param->I0c) + c_y[i] / param->Z * param->wc[i]) +
                   param->Iinput[i + 60]) - 177.0) / 4.0 + 5.5;
    c_y[i] = d5;
    dx[i] = -x[i] / param->tn + param->game * (1.0 - x[i]) * (d1 / (1.0 -
      muDoubleScalarExp(-0.308 * d1)));
    dx[i + 30] = -d / param->tn + param->game * (1.0 - d) * (d2 / (1.0 - d3));
    dx[i + 60] = -d4 / param->tg + param->gami * (d5 / 2.0 + muDoubleScalarAbs
      (d5) / 2.0);
  }
}

/* End of code generation (odeDWM.c) */
