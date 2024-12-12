/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * mpower.c
 *
 * Code generation for function 'mpower'
 *
 */

/* Include files */
#include "mpower.h"
#include "dSOM_mex_data.h"
#include "dSOM_mex_mexutil.h"
#include "rt_nonfinite.h"
#include "warning.h"
#include "blas.h"
#include "lapacke.h"
#include "mwmathutil.h"
#include <stddef.h>
#include <string.h>

/* Variable Definitions */
static emlrtRSInfo e_emlrtRSI = {
    46,       /* lineNo */
    "mpower", /* fcnName */
    "E:\\Program "
    "Files\\MATLAB\\R2024b\\toolbox\\eml\\lib\\matlab\\matfun\\mpower.m" /* pathName
                                                                          */
};

static emlrtRSInfo f_emlrtRSI = {
    101,                      /* lineNo */
    "matrix_to_scalar_power", /* fcnName */
    "E:\\Program "
    "Files\\MATLAB\\R2024b\\toolbox\\eml\\lib\\matlab\\matfun\\mpower.m" /* pathName
                                                                          */
};

static emlrtRSInfo g_emlrtRSI = {
    13,                        /* lineNo */
    "matrix_to_integer_power", /* fcnName */
    "E:\\Program "
    "Files\\MATLAB\\R2024b\\toolbox\\eml\\lib\\matlab\\matfun\\private\\matrix_"
    "to_integer_power.m" /* pathName */
};

static emlrtRSInfo h_emlrtRSI = {
    77,                              /* lineNo */
    "matrix_to_small_integer_power", /* fcnName */
    "E:\\Program "
    "Files\\MATLAB\\R2024b\\toolbox\\eml\\lib\\matlab\\matfun\\private\\matrix_"
    "to_integer_power.m" /* pathName */
};

static emlrtRSInfo i_emlrtRSI = {
    21,    /* lineNo */
    "inv", /* fcnName */
    "E:\\Program "
    "Files\\MATLAB\\R2024b\\toolbox\\eml\\lib\\matlab\\matfun\\inv.m" /* pathName
                                                                       */
};

static emlrtRSInfo j_emlrtRSI = {
    22,    /* lineNo */
    "inv", /* fcnName */
    "E:\\Program "
    "Files\\MATLAB\\R2024b\\toolbox\\eml\\lib\\matlab\\matfun\\inv.m" /* pathName
                                                                       */
};

static emlrtRSInfo k_emlrtRSI = {
    173,      /* lineNo */
    "invNxN", /* fcnName */
    "E:\\Program "
    "Files\\MATLAB\\R2024b\\toolbox\\eml\\lib\\matlab\\matfun\\inv.m" /* pathName
                                                                       */
};

static emlrtRSInfo l_emlrtRSI = {
    180,      /* lineNo */
    "invNxN", /* fcnName */
    "E:\\Program "
    "Files\\MATLAB\\R2024b\\toolbox\\eml\\lib\\matlab\\matfun\\inv.m" /* pathName
                                                                       */
};

static emlrtRSInfo m_emlrtRSI = {
    183,      /* lineNo */
    "invNxN", /* fcnName */
    "E:\\Program "
    "Files\\MATLAB\\R2024b\\toolbox\\eml\\lib\\matlab\\matfun\\inv.m" /* pathName
                                                                       */
};

static emlrtRSInfo n_emlrtRSI = {
    190,      /* lineNo */
    "invNxN", /* fcnName */
    "E:\\Program "
    "Files\\MATLAB\\R2024b\\toolbox\\eml\\lib\\matlab\\matfun\\inv.m" /* pathName
                                                                       */
};

static emlrtRSInfo s_emlrtRSI = {
    42,          /* lineNo */
    "checkcond", /* fcnName */
    "E:\\Program "
    "Files\\MATLAB\\R2024b\\toolbox\\eml\\lib\\matlab\\matfun\\inv.m" /* pathName
                                                                       */
};

static emlrtRSInfo t_emlrtRSI = {
    46,          /* lineNo */
    "checkcond", /* fcnName */
    "E:\\Program "
    "Files\\MATLAB\\R2024b\\toolbox\\eml\\lib\\matlab\\matfun\\inv.m" /* pathName
                                                                       */
};

static emlrtMCInfo c_emlrtMCI = {
    53,        /* lineNo */
    19,        /* colNo */
    "flt2str", /* fName */
    "E:\\Program "
    "Files\\MATLAB\\R2024b\\toolbox\\shared\\coder\\coder\\lib\\+coder\\+"
    "internal\\flt2str.m" /* pName */
};

static emlrtRSInfo nb_emlrtRSI = {
    53,        /* lineNo */
    "flt2str", /* fcnName */
    "E:\\Program "
    "Files\\MATLAB\\R2024b\\toolbox\\shared\\coder\\coder\\lib\\+coder\\+"
    "internal\\flt2str.m" /* pathName */
};

/* Function Declarations */
static void b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               char_T y[14]);

static const mxArray *b_sprintf(const emlrtStack *sp, const mxArray *m1,
                                const mxArray *m2, emlrtMCInfo *location);

static void emlrt_marshallIn(const emlrtStack *sp,
                             const mxArray *a__output_of_sprintf_,
                             const char_T *identifier, char_T y[14]);

static void n_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId, char_T ret[14]);

/* Function Definitions */
static void b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId, char_T y[14])
{
  n_emlrt_marshallIn(sp, emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

static const mxArray *b_sprintf(const emlrtStack *sp, const mxArray *m1,
                                const mxArray *m2, emlrtMCInfo *location)
{
  const mxArray *pArrays[2];
  const mxArray *m;
  pArrays[0] = m1;
  pArrays[1] = m2;
  return emlrtCallMATLABR2012b((emlrtConstCTX)sp, 1, &m, 2, &pArrays[0],
                               "sprintf", true, location);
}

static void emlrt_marshallIn(const emlrtStack *sp,
                             const mxArray *a__output_of_sprintf_,
                             const char_T *identifier, char_T y[14])
{
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = (const char_T *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  b_emlrt_marshallIn(sp, emlrtAlias(a__output_of_sprintf_), &thisId, y);
  emlrtDestroyArray(&a__output_of_sprintf_);
}

static void n_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId, char_T ret[14])
{
  static const int32_T dims[2] = {1, 14};
  emlrtCheckBuiltInR2012b((emlrtConstCTX)sp, msgId, src, "char", false, 2U,
                          (const void *)&dims[0]);
  emlrtImportCharArrayR2015b((emlrtConstCTX)sp, src, &ret[0], 14);
  emlrtDestroyArray(&src);
}

void mpower(const emlrtStack *sp, const real_T a[8100], real_T c[8100])
{
  static const int32_T iv[2] = {1, 6};
  static const char_T rfmt[6] = {'%', '1', '4', '.', '6', 'e'};
  ptrdiff_t ipiv_t[90];
  ptrdiff_t info_t;
  ptrdiff_t lda_t;
  ptrdiff_t ldb_t;
  ptrdiff_t n_t;
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  emlrtStack e_st;
  emlrtStack f_st;
  emlrtStack g_st;
  emlrtStack h_st;
  emlrtStack st;
  const mxArray *m;
  const mxArray *y;
  real_T x[8100];
  real_T n1x;
  real_T n1xinv;
  real_T s;
  int32_T ipiv[90];
  int32_T b_i;
  int32_T i;
  int32_T j;
  int32_T k;
  int32_T pipk;
  char_T DIAGA1;
  char_T SIDE1;
  char_T TRANSA1;
  char_T UPLO1;
  int8_T p[90];
  boolean_T exitg1;
  st.prev = sp;
  st.tls = sp->tls;
  st.site = &e_emlrtRSI;
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
  g_st.prev = &f_st;
  g_st.tls = f_st.tls;
  h_st.prev = &g_st;
  h_st.tls = g_st.tls;
  b_st.site = &f_emlrtRSI;
  c_st.site = &g_emlrtRSI;
  d_st.site = &h_emlrtRSI;
  e_st.site = &i_emlrtRSI;
  memset(&c[0], 0, 8100U * sizeof(real_T));
  f_st.site = &k_emlrtRSI;
  memcpy(&x[0], &a[0], 8100U * sizeof(real_T));
  g_st.site = &o_emlrtRSI;
  info_t = LAPACKE_dgetrf_work(102, (ptrdiff_t)90, (ptrdiff_t)90, &x[0],
                               (ptrdiff_t)90, &ipiv_t[0]);
  h_st.site = &p_emlrtRSI;
  if ((int32_T)info_t < 0) {
    if ((int32_T)info_t == -1010) {
      emlrtErrorWithMessageIdR2018a(&h_st, &b_emlrtRTEI, "MATLAB:nomem",
                                    "MATLAB:nomem", 0);
    } else {
      emlrtErrorWithMessageIdR2018a(&h_st, &emlrtRTEI,
                                    "Coder:toolbox:LAPACKCallErrorInfo",
                                    "Coder:toolbox:LAPACKCallErrorInfo", 5, 4,
                                    19, &cv[0], 12, (int32_T)info_t);
    }
  }
  for (k = 0; k < 90; k++) {
    ipiv[k] = (int32_T)ipiv_t[k];
  }
  for (i = 0; i < 90; i++) {
    p[i] = (int8_T)(i + 1);
  }
  for (k = 0; k < 89; k++) {
    i = ipiv[k];
    if (i > k + 1) {
      pipk = p[i - 1];
      p[i - 1] = p[k];
      p[k] = (int8_T)pipk;
    }
  }
  for (k = 0; k < 90; k++) {
    pipk = 90 * (p[k] - 1);
    c[k + pipk] = 1.0;
    f_st.site = &l_emlrtRSI;
    for (j = k + 1; j < 91; j++) {
      i = (j + pipk) - 1;
      if (c[i] != 0.0) {
        int32_T i1;
        i1 = j + 1;
        f_st.site = &m_emlrtRSI;
        for (b_i = i1; b_i < 91; b_i++) {
          int32_T c_tmp;
          c_tmp = (b_i + pipk) - 1;
          c[c_tmp] -= c[i] * x[(b_i + 90 * (j - 1)) - 1];
        }
      }
    }
  }
  f_st.site = &n_emlrtRSI;
  g_st.site = &q_emlrtRSI;
  s = 1.0;
  DIAGA1 = 'N';
  TRANSA1 = 'N';
  UPLO1 = 'U';
  SIDE1 = 'L';
  info_t = (ptrdiff_t)90;
  n_t = (ptrdiff_t)90;
  lda_t = (ptrdiff_t)90;
  ldb_t = (ptrdiff_t)90;
  dtrsm(&SIDE1, &UPLO1, &TRANSA1, &DIAGA1, &info_t, &n_t, &s, &x[0], &lda_t,
        &c[0], &ldb_t);
  e_st.site = &j_emlrtRSI;
  n1x = 0.0;
  j = 0;
  exitg1 = false;
  while ((!exitg1) && (j < 90)) {
    s = 0.0;
    for (b_i = 0; b_i < 90; b_i++) {
      s += muDoubleScalarAbs(a[b_i + 90 * j]);
    }
    if (muDoubleScalarIsNaN(s)) {
      n1x = rtNaN;
      exitg1 = true;
    } else {
      if (s > n1x) {
        n1x = s;
      }
      j++;
    }
  }
  n1xinv = 0.0;
  j = 0;
  exitg1 = false;
  while ((!exitg1) && (j < 90)) {
    s = 0.0;
    for (b_i = 0; b_i < 90; b_i++) {
      s += muDoubleScalarAbs(c[b_i + 90 * j]);
    }
    if (muDoubleScalarIsNaN(s)) {
      n1xinv = rtNaN;
      exitg1 = true;
    } else {
      if (s > n1xinv) {
        n1xinv = s;
      }
      j++;
    }
  }
  s = 1.0 / (n1x * n1xinv);
  if ((n1x == 0.0) || (n1xinv == 0.0) || (s == 0.0)) {
    f_st.site = &s_emlrtRSI;
    warning(&f_st);
  } else if (muDoubleScalarIsNaN(s) || (s < 2.2204460492503131E-16)) {
    char_T str[14];
    f_st.site = &t_emlrtRSI;
    y = NULL;
    m = emlrtCreateCharArray(2, &iv[0]);
    emlrtInitCharArrayR2013a(&f_st, 6, m, &rfmt[0]);
    emlrtAssign(&y, m);
    g_st.site = &nb_emlrtRSI;
    emlrt_marshallIn(&g_st,
                     b_sprintf(&g_st, y, emlrt_marshallOut(s), &c_emlrtMCI),
                     "<output of sprintf>", str);
    f_st.site = &t_emlrtRSI;
    b_warning(&f_st, str);
  }
}

/* End of code generation (mpower.c) */
