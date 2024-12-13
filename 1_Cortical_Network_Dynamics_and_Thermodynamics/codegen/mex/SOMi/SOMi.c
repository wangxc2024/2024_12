/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * SOMi.c
 *
 * Code generation for function 'SOMi'
 *
 */

/* Include files */
#include "SOMi.h"
#include "SOMi_types.h"
#include "mrdivide_helper.h"
#include "rt_nonfinite.h"
#include <emmintrin.h>
#include <string.h>

/* Variable Definitions */
static emlrtRSInfo emlrtRSI = {
    2,                         /* lineNo */
    "SOMi",                    /* fcnName */
    "E:\\WXC\\WM\\mat\\SOMi.m" /* pathName */
};

static emlrtRSInfo b_emlrtRSI = {
    3,                         /* lineNo */
    "SOMi",                    /* fcnName */
    "E:\\WXC\\WM\\mat\\SOMi.m" /* pathName */
};

static emlrtRSInfo c_emlrtRSI = {
    4,                         /* lineNo */
    "SOMi",                    /* fcnName */
    "E:\\WXC\\WM\\mat\\SOMi.m" /* pathName */
};

static emlrtRSInfo d_emlrtRSI = {
    5,                         /* lineNo */
    "SOMi",                    /* fcnName */
    "E:\\WXC\\WM\\mat\\SOMi.m" /* pathName */
};

static emlrtRSInfo e_emlrtRSI = {
    20,                /* lineNo */
    "mrdivide_helper", /* fcnName */
    "E:\\Program "
    "Files\\MATLAB\\R2024b\\toolbox\\eml\\eml\\+coder\\+internal\\mrdivide_"
    "helper.m" /* pathName */
};

/* Function Definitions */
real_T SOMi(const emlrtStack *sp, const real_T x[90], const real_T x1[90],
            const real_T Fx[90], const real_T Fx1[90], const real_T Gn[8100],
            const struct0_T *param, real_T D, real_T h)
{
  __m128d r;
  emlrtStack b_st;
  emlrtStack st;
  real_T Y[90];
  real_T b_Y[90];
  real_T c_Y[90];
  real_T d_Y[90];
  real_T dv[90];
  real_T e_Y[90];
  real_T Som_i;
  real_T f_Y;
  real_T g_Y;
  real_T h_Y;
  real_T i_Y;
  real_T y_tmp;
  int32_T i;
  (void)param;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  for (i = 0; i <= 88; i += 2) {
    _mm_storeu_pd(&dv[i],
                  _mm_sub_pd(_mm_loadu_pd(&x1[i]), _mm_loadu_pd(&x[i])));
  }
  Som_i = -(0.5 / D);
  st.site = &emlrtRSI;
  for (i = 0; i <= 88; i += 2) {
    _mm_storeu_pd(&Y[i], _mm_mul_pd(_mm_set1_pd(Som_i),
                                    _mm_add_pd(_mm_loadu_pd(&Fx[i]),
                                               _mm_loadu_pd(&Fx1[i]))));
  }
  b_st.site = &e_emlrtRSI;
  mrdiv(&b_st, Y, Gn);
  y_tmp = 0.25 * h / D;
  st.site = &b_emlrtRSI;
  for (i = 0; i <= 88; i += 2) {
    r = _mm_loadu_pd(&dv[i]);
    _mm_storeu_pd(&b_Y[i], _mm_mul_pd(_mm_set1_pd(y_tmp), r));
  }
  b_st.site = &e_emlrtRSI;
  mrdiv(&b_st, b_Y, Gn);
  st.site = &b_emlrtRSI;
  st.site = &c_emlrtRSI;
  memcpy(&c_Y[0], &Fx[0], 90U * sizeof(real_T));
  b_st.site = &e_emlrtRSI;
  mrdiv(&b_st, c_Y, Gn);
  st.site = &c_emlrtRSI;
  memcpy(&d_Y[0], &Fx1[0], 90U * sizeof(real_T));
  b_st.site = &e_emlrtRSI;
  mrdiv(&b_st, d_Y, Gn);
  Som_i = 0.25 / D;
  st.site = &d_emlrtRSI;
  for (i = 0; i <= 88; i += 2) {
    r = _mm_loadu_pd(&dv[i]);
    _mm_storeu_pd(&e_Y[i], _mm_mul_pd(_mm_set1_pd(Som_i), r));
  }
  b_st.site = &e_emlrtRSI;
  mrdiv(&b_st, e_Y, Gn);
  Som_i = 0.0;
  f_Y = 0.0;
  g_Y = 0.0;
  h_Y = 0.0;
  i_Y = 0.0;
  for (i = 0; i < 90; i++) {
    real_T d;
    real_T d1;
    d = dv[i];
    Som_i += Y[i] * d;
    f_Y += b_Y[i] * d;
    d = Fx[i];
    g_Y += c_Y[i] * d;
    d1 = Fx1[i];
    h_Y += d_Y[i] * d1;
    i_Y += e_Y[i] * (d1 - d);
  }
  return ((Som_i * 0.5 + f_Y / (h * h)) + y_tmp * 0.5 * (g_Y + h_Y)) + i_Y;
}

/* End of code generation (SOMi.c) */
