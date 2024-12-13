/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * dSOM.c
 *
 * Code generation for function 'dSOM'
 *
 */

/* Include files */
#include "dSOM.h"
#include "dSOM_mex_types.h"
#include "mpower.h"
#include "mtimes.h"
#include "rt_nonfinite.h"
#include <emmintrin.h>

/* Variable Definitions */
static emlrtRSInfo emlrtRSI = {
    3,                         /* lineNo */
    "dSOM",                    /* fcnName */
    "E:\\WXC\\WM\\mat\\dSOM.m" /* pathName */
};

static emlrtRSInfo b_emlrtRSI = {
    4,                         /* lineNo */
    "dSOM",                    /* fcnName */
    "E:\\WXC\\WM\\mat\\dSOM.m" /* pathName */
};

static emlrtRSInfo c_emlrtRSI = {
    5,                         /* lineNo */
    "dSOM",                    /* fcnName */
    "E:\\WXC\\WM\\mat\\dSOM.m" /* pathName */
};

static emlrtRSInfo d_emlrtRSI = {
    6,                         /* lineNo */
    "dSOM",                    /* fcnName */
    "E:\\WXC\\WM\\mat\\dSOM.m" /* pathName */
};

/* Function Definitions */
void dSOM(dSOM_mexStackData *SD, const emlrtStack *sp, const real_T x_1[90],
          const real_T x[90], const real_T x1[90], const real_T Fx[90],
          const real_T Fx_1[90], const real_T dFx[8100], const real_T Gn[8100],
          const struct0_T *param, real_T D, real_T h, real_T dSom[90])
{
  __m128d r;
  emlrtStack b_st;
  emlrtStack st;
  real_T b_a[8100];
  real_T b_Fx[90];
  real_T b_x[90];
  real_T b_y[90];
  real_T y[90];
  real_T a;
  int32_T i;
  (void)param;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  st.site = &emlrtRSI;
  b_st.site = &emlrtRSI;
  mpower(&b_st, Gn, SD->f0.a);
  for (i = 0; i <= 88; i += 2) {
    _mm_storeu_pd(
        &b_x[i],
        _mm_sub_pd(_mm_sub_pd(_mm_mul_pd(_mm_set1_pd(2.0), _mm_loadu_pd(&x[i])),
                              _mm_loadu_pd(&x1[i])),
                   _mm_loadu_pd(&x_1[i])));
  }
  mtimes(SD->f0.a, b_x, dSom);
  a = h / 2.0 / D;
  st.site = &b_emlrtRSI;
  mpower(&st, Gn, SD->f0.a);
  st.site = &b_emlrtRSI;
  for (i = 0; i <= 8098; i += 2) {
    r = _mm_loadu_pd(&SD->f0.a[i]);
    _mm_storeu_pd(&b_a[i], _mm_mul_pd(_mm_set1_pd(a), r));
  }
  b_mtimes(b_a, dFx, SD->f0.a);
  st.site = &b_emlrtRSI;
  mtimes(SD->f0.a, Fx, y);
  a = 0.5 / D;
  st.site = &c_emlrtRSI;
  mpower(&st, Gn, SD->f0.a);
  st.site = &c_emlrtRSI;
  for (i = 0; i <= 8098; i += 2) {
    r = _mm_loadu_pd(&SD->f0.a[i]);
    _mm_storeu_pd(&b_a[i], _mm_mul_pd(_mm_set1_pd(a), r));
  }
  b_mtimes(b_a, dFx, SD->f0.a);
  st.site = &c_emlrtRSI;
  for (i = 0; i <= 88; i += 2) {
    _mm_storeu_pd(&b_x[i],
                  _mm_sub_pd(_mm_loadu_pd(&x[i]), _mm_loadu_pd(&x1[i])));
  }
  mtimes(SD->f0.a, b_x, b_y);
  st.site = &d_emlrtRSI;
  mpower(&st, Gn, SD->f0.a);
  st.site = &d_emlrtRSI;
  for (i = 0; i <= 8098; i += 2) {
    r = _mm_loadu_pd(&SD->f0.a[i]);
    _mm_storeu_pd(&SD->f0.a[i], _mm_mul_pd(_mm_set1_pd(a), r));
  }
  for (i = 0; i <= 88; i += 2) {
    _mm_storeu_pd(&b_Fx[i],
                  _mm_sub_pd(_mm_loadu_pd(&Fx[i]), _mm_loadu_pd(&Fx_1[i])));
  }
  mtimes(SD->f0.a, b_Fx, b_x);
  for (i = 0; i <= 88; i += 2) {
    __m128d r1;
    __m128d r2;
    __m128d r3;
    r = _mm_loadu_pd(&dSom[i]);
    r1 = _mm_loadu_pd(&y[i]);
    r2 = _mm_loadu_pd(&b_y[i]);
    r3 = _mm_loadu_pd(&b_x[i]);
    _mm_storeu_pd(
        &dSom[i],
        _mm_add_pd(
            _mm_add_pd(
                _mm_add_pd(
                    _mm_div_pd(_mm_div_pd(_mm_div_pd(r, _mm_set1_pd(2.0)),
                                          _mm_set1_pd(D)),
                               _mm_set1_pd(h)),
                    r1),
                r2),
            r3));
  }
}

/* End of code generation (dSOM.c) */
