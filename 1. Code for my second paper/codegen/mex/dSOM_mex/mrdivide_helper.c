/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * mrdivide_helper.c
 *
 * Code generation for function 'mrdivide_helper'
 *
 */

/* Include files */
#include "mrdivide_helper.h"
#include "dSOM_mex_data.h"
#include "rt_nonfinite.h"
#include "warning.h"
#include "blas.h"
#include "lapacke.h"
#include <stddef.h>
#include <string.h>

/* Variable Definitions */
static emlrtRSInfo db_emlrtRSI = {
    42,      /* lineNo */
    "mrdiv", /* fcnName */
    "E:\\Program "
    "Files\\MATLAB\\R2024b\\toolbox\\eml\\eml\\+coder\\+internal\\mrdivide_"
    "helper.m" /* pathName */
};

static emlrtRSInfo
    eb_emlrtRSI =
        {
            67,        /* lineNo */
            "lusolve", /* fcnName */
            "E:\\Program "
            "Files\\MATLAB\\R2024b\\toolbox\\eml\\eml\\+coder\\+"
            "internal\\lusolve.m" /* pathName */
};

static emlrtRSInfo
    fb_emlrtRSI =
        {
            107,          /* lineNo */
            "lusolveNxN", /* fcnName */
            "E:\\Program "
            "Files\\MATLAB\\R2024b\\toolbox\\eml\\eml\\+coder\\+"
            "internal\\lusolve.m" /* pathName */
};

static emlrtRSInfo
    gb_emlrtRSI =
        {
            112,          /* lineNo */
            "lusolveNxN", /* fcnName */
            "E:\\Program "
            "Files\\MATLAB\\R2024b\\toolbox\\eml\\eml\\+coder\\+"
            "internal\\lusolve.m" /* pathName */
};

static emlrtRSInfo
    hb_emlrtRSI =
        {
            135,          /* lineNo */
            "XtimesInvA", /* fcnName */
            "E:\\Program "
            "Files\\MATLAB\\R2024b\\toolbox\\eml\\eml\\+coder\\+"
            "internal\\lusolve.m" /* pathName */
};

static emlrtRSInfo
    ib_emlrtRSI =
        {
            140,          /* lineNo */
            "XtimesInvA", /* fcnName */
            "E:\\Program "
            "Files\\MATLAB\\R2024b\\toolbox\\eml\\eml\\+coder\\+"
            "internal\\lusolve.m" /* pathName */
};

static emlrtRSInfo
    jb_emlrtRSI =
        {
            142,          /* lineNo */
            "XtimesInvA", /* fcnName */
            "E:\\Program "
            "Files\\MATLAB\\R2024b\\toolbox\\eml\\eml\\+coder\\+"
            "internal\\lusolve.m" /* pathName */
};

static emlrtRSInfo
    kb_emlrtRSI =
        {
            90,              /* lineNo */
            "warn_singular", /* fcnName */
            "E:\\Program "
            "Files\\MATLAB\\R2024b\\toolbox\\eml\\eml\\+coder\\+"
            "internal\\lusolve.m" /* pathName */
};

/* Function Definitions */
void mrdiv(const emlrtStack *sp, real_T A[90], const real_T B[8100])
{
  ptrdiff_t ipiv_t[90];
  ptrdiff_t info_t;
  ptrdiff_t lda_t;
  ptrdiff_t ldb_t;
  ptrdiff_t m_t;
  ptrdiff_t n_t;
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  emlrtStack e_st;
  emlrtStack f_st;
  emlrtStack st;
  real_T b_A[8100];
  real_T temp;
  int32_T ipiv[90];
  int32_T j;
  int32_T k;
  char_T DIAGA1;
  char_T SIDE1;
  char_T TRANSA1;
  char_T UPLO1;
  st.prev = sp;
  st.tls = sp->tls;
  st.site = &db_emlrtRSI;
  b_st.prev = &st;
  b_st.tls = st.tls;
  c_st.prev = &b_st;
  c_st.tls = b_st.tls;
  d_st.prev = &c_st;
  d_st.tls = c_st.tls;
  e_st.prev = &d_st;
  e_st.tls = d_st.tls;
  f_st.prev = &e_st;
  f_st.tls = e_st.tls;
  b_st.site = &eb_emlrtRSI;
  c_st.site = &fb_emlrtRSI;
  d_st.site = &hb_emlrtRSI;
  memcpy(&b_A[0], &B[0], 8100U * sizeof(real_T));
  e_st.site = &o_emlrtRSI;
  info_t = LAPACKE_dgetrf_work(102, (ptrdiff_t)90, (ptrdiff_t)90, &b_A[0],
                               (ptrdiff_t)90, &ipiv_t[0]);
  f_st.site = &p_emlrtRSI;
  if ((int32_T)info_t < 0) {
    if ((int32_T)info_t == -1010) {
      emlrtErrorWithMessageIdR2018a(&f_st, &b_emlrtRTEI, "MATLAB:nomem",
                                    "MATLAB:nomem", 0);
    } else {
      emlrtErrorWithMessageIdR2018a(&f_st, &emlrtRTEI,
                                    "Coder:toolbox:LAPACKCallErrorInfo",
                                    "Coder:toolbox:LAPACKCallErrorInfo", 5, 4,
                                    19, &cv[0], 12, (int32_T)info_t);
    }
  }
  for (k = 0; k < 90; k++) {
    ipiv[k] = (int32_T)ipiv_t[k];
  }
  d_st.site = &ib_emlrtRSI;
  e_st.site = &q_emlrtRSI;
  temp = 1.0;
  DIAGA1 = 'N';
  TRANSA1 = 'N';
  UPLO1 = 'U';
  SIDE1 = 'R';
  m_t = (ptrdiff_t)1;
  n_t = (ptrdiff_t)90;
  lda_t = (ptrdiff_t)90;
  ldb_t = (ptrdiff_t)1;
  dtrsm(&SIDE1, &UPLO1, &TRANSA1, &DIAGA1, &m_t, &n_t, &temp, &b_A[0], &lda_t,
        &A[0], &ldb_t);
  d_st.site = &jb_emlrtRSI;
  e_st.site = &q_emlrtRSI;
  temp = 1.0;
  DIAGA1 = 'U';
  TRANSA1 = 'N';
  UPLO1 = 'L';
  SIDE1 = 'R';
  m_t = (ptrdiff_t)1;
  n_t = (ptrdiff_t)90;
  lda_t = (ptrdiff_t)90;
  ldb_t = (ptrdiff_t)1;
  dtrsm(&SIDE1, &UPLO1, &TRANSA1, &DIAGA1, &m_t, &n_t, &temp, &b_A[0], &lda_t,
        &A[0], &ldb_t);
  for (j = 88; j >= 0; j--) {
    k = ipiv[j];
    if (k != j + 1) {
      temp = A[j];
      A[j] = A[k - 1];
      A[k - 1] = temp;
    }
  }
  if ((int32_T)info_t > 0) {
    c_st.site = &gb_emlrtRSI;
    d_st.site = &kb_emlrtRSI;
    warning(&d_st);
  }
}

/* End of code generation (mrdivide_helper.c) */
