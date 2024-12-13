/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * getatracedwmnoise.c
 *
 * Code generation for function 'getatracedwmnoise'
 *
 */

/* Include files */
#include "getatracedwmnoise.h"
#include "getatracedwmnoise_data.h"
#include "getatracedwmnoise_emxutil.h"
#include "mwmathutil.h"
#include "odeDWM.h"
#include "rt_nonfinite.h"

/* Variable Definitions */
static emlrtRSInfo emlrtRSI = { 23,    /* lineNo */
  "getatracedwmnoise",                 /* fcnName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m"/* pathName */
};

static emlrtRSInfo b_emlrtRSI = { 26,  /* lineNo */
  "getatracedwmnoise",                 /* fcnName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m"/* pathName */
};

static emlrtRSInfo c_emlrtRSI = { 31,  /* lineNo */
  "getatracedwmnoise",                 /* fcnName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m"/* pathName */
};

static emlrtRSInfo d_emlrtRSI = { 39,  /* lineNo */
  "getatracedwmnoise",                 /* fcnName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m"/* pathName */
};

static emlrtRSInfo e_emlrtRSI = { 44,  /* lineNo */
  "getatracedwmnoise",                 /* fcnName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m"/* pathName */
};

static emlrtRSInfo f_emlrtRSI = { 45,  /* lineNo */
  "mpower",                            /* fcnName */
  "P:\\Tools\\matlab\\toolbox\\eml\\lib\\matlab\\ops\\mpower.m"/* pathName */
};

static emlrtRSInfo g_emlrtRSI = { 70,  /* lineNo */
  "power",                             /* fcnName */
  "P:\\Tools\\matlab\\toolbox\\eml\\lib\\matlab\\ops\\power.m"/* pathName */
};

static emlrtRSInfo h_emlrtRSI = { 79,  /* lineNo */
  "fltpower",                          /* fcnName */
  "P:\\Tools\\matlab\\toolbox\\eml\\lib\\matlab\\ops\\power.m"/* pathName */
};

static emlrtRSInfo i_emlrtRSI = { 41,  /* lineNo */
  "applyBinaryScalarFunction",         /* fcnName */
  "P:\\Tools\\matlab\\toolbox\\eml\\eml\\+coder\\+internal\\applyBinaryScalarFunction.m"/* pathName */
};

static emlrtRSInfo j_emlrtRSI = { 139, /* lineNo */
  "scalar_float_power",                /* fcnName */
  "P:\\Tools\\matlab\\toolbox\\eml\\lib\\matlab\\ops\\power.m"/* pathName */
};

static emlrtRTEInfo emlrtRTEI = { 13,  /* lineNo */
  9,                                   /* colNo */
  "sqrt",                              /* fName */
  "P:\\Tools\\matlab\\toolbox\\eml\\lib\\matlab\\elfun\\sqrt.m"/* pName */
};

static emlrtBCInfo emlrtBCI = { -1,    /* iFirst */
  -1,                                  /* iLast */
  41,                                  /* lineNo */
  14,                                  /* colNo */
  "uy",                                /* aName */
  "getatracedwmnoise",                 /* fName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo b_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  44,                                  /* lineNo */
  27,                                  /* colNo */
  "yy",                                /* aName */
  "getatracedwmnoise",                 /* fName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo c_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  40,                                  /* lineNo */
  14,                                  /* colNo */
  "yy",                                /* aName */
  "getatracedwmnoise",                 /* fName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo d_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  40,                                  /* lineNo */
  24,                                  /* colNo */
  "yy",                                /* aName */
  "getatracedwmnoise",                 /* fName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo e_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  39,                                  /* lineNo */
  50,                                  /* colNo */
  "x",                                 /* aName */
  "getatracedwmnoise",                 /* fName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo f_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  39,                                  /* lineNo */
  30,                                  /* colNo */
  "yy",                                /* aName */
  "getatracedwmnoise",                 /* fName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo g_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  36,                                  /* lineNo */
  19,                                  /* colNo */
  "yy",                                /* aName */
  "getatracedwmnoise",                 /* fName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo h_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  22,                                  /* lineNo */
  10,                                  /* colNo */
  "yy",                                /* aName */
  "getatracedwmnoise",                 /* fName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo i_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  32,                                  /* lineNo */
  36,                                  /* colNo */
  "zz",                                /* aName */
  "getatracedwmnoise",                 /* fName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo j_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  31,                                  /* lineNo */
  16,                                  /* colNo */
  "zz",                                /* aName */
  "getatracedwmnoise",                 /* fName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo k_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  31,                                  /* lineNo */
  81,                                  /* colNo */
  "z",                                 /* aName */
  "getatracedwmnoise",                 /* fName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo l_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  31,                                  /* lineNo */
  40,                                  /* colNo */
  "zz",                                /* aName */
  "getatracedwmnoise",                 /* fName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m",/* pName */
  0                                    /* checkKind */
};

static emlrtBCInfo m_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  31,                                  /* lineNo */
  28,                                  /* colNo */
  "zz",                                /* aName */
  "getatracedwmnoise",                 /* fName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m",/* pName */
  0                                    /* checkKind */
};

static emlrtRTEInfo b_emlrtRTEI = { 29,/* lineNo */
  11,                                  /* colNo */
  "getatracedwmnoise",                 /* fName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m"/* pName */
};

static emlrtDCInfo emlrtDCI = { 7,     /* lineNo */
  13,                                  /* colNo */
  "getatracedwmnoise",                 /* fName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m",/* pName */
  1                                    /* checkKind */
};

static emlrtDCInfo b_emlrtDCI = { 7,   /* lineNo */
  13,                                  /* colNo */
  "getatracedwmnoise",                 /* fName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m",/* pName */
  4                                    /* checkKind */
};

static emlrtDCInfo c_emlrtDCI = { 8,   /* lineNo */
  13,                                  /* colNo */
  "getatracedwmnoise",                 /* fName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m",/* pName */
  1                                    /* checkKind */
};

static emlrtDCInfo d_emlrtDCI = { 24,  /* lineNo */
  19,                                  /* colNo */
  "getatracedwmnoise",                 /* fName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m",/* pName */
  1                                    /* checkKind */
};

static emlrtDCInfo e_emlrtDCI = { 7,   /* lineNo */
  1,                                   /* colNo */
  "getatracedwmnoise",                 /* fName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m",/* pName */
  1                                    /* checkKind */
};

static emlrtDCInfo f_emlrtDCI = { 8,   /* lineNo */
  1,                                   /* colNo */
  "getatracedwmnoise",                 /* fName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m",/* pName */
  1                                    /* checkKind */
};

static emlrtDCInfo g_emlrtDCI = { 24,  /* lineNo */
  5,                                   /* colNo */
  "getatracedwmnoise",                 /* fName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m",/* pName */
  1                                    /* checkKind */
};

static emlrtBCInfo n_emlrtBCI = { -1,  /* iFirst */
  -1,                                  /* iLast */
  44,                                  /* lineNo */
  5,                                   /* colNo */
  "uy",                                /* aName */
  "getatracedwmnoise",                 /* fName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m",/* pName */
  0                                    /* checkKind */
};

static emlrtRTEInfo c_emlrtRTEI = { 7, /* lineNo */
  1,                                   /* colNo */
  "getatracedwmnoise",                 /* fName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m"/* pName */
};

static emlrtRTEInfo d_emlrtRTEI = { 8, /* lineNo */
  1,                                   /* colNo */
  "getatracedwmnoise",                 /* fName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m"/* pName */
};

static emlrtRTEInfo e_emlrtRTEI = { 23,/* lineNo */
  14,                                  /* colNo */
  "getatracedwmnoise",                 /* fName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m"/* pName */
};

static emlrtRTEInfo f_emlrtRTEI = { 23,/* lineNo */
  5,                                   /* colNo */
  "getatracedwmnoise",                 /* fName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m"/* pName */
};

static emlrtRTEInfo g_emlrtRTEI = { 24,/* lineNo */
  5,                                   /* colNo */
  "getatracedwmnoise",                 /* fName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m"/* pName */
};

static emlrtRTEInfo h_emlrtRTEI = { 26,/* lineNo */
  30,                                  /* colNo */
  "getatracedwmnoise",                 /* fName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m"/* pName */
};

static emlrtRTEInfo i_emlrtRTEI = { 26,/* lineNo */
  5,                                   /* colNo */
  "getatracedwmnoise",                 /* fName */
  "P:\\Desktop\\WM\\mat\\getatracedwmnoise.m"/* pName */
};

/* Function Definitions */
void getatracedwmnoise(const emlrtStack *sp, real_T Tp, const real_T b_y0[90],
  struct0_T *param, const real_T pulse[90], real_T noise, real_T noiseadd,
  emxArray_real_T *yy, emxArray_real_T *uy)
{
  real_T ut;
  real_T T;
  int32_T i;
  int32_T i1;
  int32_T i2;
  int32_T b_i;
  int32_T loop_ub_tmp;
  emxArray_real_T *z;
  emxArray_real_T *zz;
  real_T a;
  emxArray_real_T *x;
  int32_T g;
  int32_T b_g;
  int32_T i3;
  real_T yadd[90];
  real_T dy[90];
  emlrtStack st;
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  emlrtStack e_st;
  emlrtStack f_st;
  st.prev = sp;
  st.tls = sp->tls;
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
  emlrtHeapReferenceStackEnterFcnR2012b(sp);

  /*  Tp=0.5; */
  ut = param->ut;
  T = Tp / param->ut;
  i = yy->size[0] * yy->size[1];
  yy->size[0] = 90;
  emxEnsureCapacity_real_T(sp, yy, i, &c_emlrtRTEI);
  if (!(T >= 0.0)) {
    emlrtNonNegativeCheckR2012b(T, &b_emlrtDCI, sp);
  }

  i = (int32_T)muDoubleScalarFloor(T);
  if (T != i) {
    emlrtIntegerCheckR2012b(T, &emlrtDCI, sp);
  }

  i1 = yy->size[0] * yy->size[1];
  i2 = (int32_T)T;
  yy->size[1] = i2;
  emxEnsureCapacity_real_T(sp, yy, i1, &c_emlrtRTEI);
  if (T != i) {
    emlrtIntegerCheckR2012b(T, &e_emlrtDCI, sp);
  }

  b_i = 90 * i2;
  for (i1 = 0; i1 < b_i; i1++) {
    yy->data[i1] = 0.0;
  }

  i1 = uy->size[0] * uy->size[1];
  uy->size[0] = 90;
  emxEnsureCapacity_real_T(sp, uy, i1, &d_emlrtRTEI);
  if (T != i) {
    emlrtIntegerCheckR2012b(T, &c_emlrtDCI, sp);
  }

  i1 = uy->size[0] * uy->size[1];
  uy->size[1] = (int32_T)T;
  emxEnsureCapacity_real_T(sp, uy, i1, &d_emlrtRTEI);
  if ((int32_T)T != i) {
    emlrtIntegerCheckR2012b(T, &f_emlrtDCI, sp);
  }

  loop_ub_tmp = 90 * (int32_T)T;
  for (i1 = 0; i1 < loop_ub_tmp; i1++) {
    uy->data[i1] = 0.0;
  }

  /* 随机撒点 */
  if (1 > (int32_T)T) {
    emlrtDynamicBoundsCheckR2012b(1, 1, 0, &h_emlrtBCI, sp);
  }

  for (i1 = 0; i1 < 90; i1++) {
    yy->data[i1] = b_y0[i1];
  }

  emxInit_real_T(sp, &z, 3, &f_emlrtRTEI, true);
  st.site = &emlrtRSI;
  i1 = z->size[0] * z->size[1] * z->size[2];
  z->size[0] = 30;
  z->size[1] = 3;
  z->size[2] = (int32_T)T;
  emxEnsureCapacity_real_T(&st, z, i1, &e_emlrtRTEI);
  emlrtRandn(&z->data[0], 90 * (int32_T)T);
  b_i = z->size[0] * z->size[1] * z->size[2];
  i1 = z->size[0] * z->size[1] * z->size[2];
  z->size[0] = 30;
  z->size[1] = 3;
  emxEnsureCapacity_real_T(sp, z, i1, &f_emlrtRTEI);
  for (i1 = 0; i1 < b_i; i1++) {
    z->data[i1] *= noise;
  }

  emxInit_real_T(sp, &zz, 3, &g_emlrtRTEI, true);
  i1 = zz->size[0] * zz->size[1] * zz->size[2];
  zz->size[0] = 30;
  zz->size[1] = 3;
  emxEnsureCapacity_real_T(sp, zz, i1, &g_emlrtRTEI);
  if ((int32_T)T != i) {
    emlrtIntegerCheckR2012b(T, &d_emlrtDCI, sp);
  }

  i1 = zz->size[0] * zz->size[1] * zz->size[2];
  zz->size[2] = (int32_T)T;
  emxEnsureCapacity_real_T(sp, zz, i1, &g_emlrtRTEI);
  if ((int32_T)T != i) {
    emlrtIntegerCheckR2012b(T, &g_emlrtDCI, sp);
  }

  for (i = 0; i < loop_ub_tmp; i++) {
    zz->data[i] = 0.0;
  }

  st.site = &b_emlrtRSI;
  a = 0.2 * param->ut;
  b_st.site = &f_emlrtRSI;
  c_st.site = &g_emlrtRSI;
  d_st.site = &h_emlrtRSI;
  e_st.site = &i_emlrtRSI;
  f_st.site = &j_emlrtRSI;
  if (a < 0.0) {
    emlrtErrorWithMessageIdR2018a(&f_st, &emlrtRTEI,
      "Coder:toolbox:ElFunDomainError", "Coder:toolbox:ElFunDomainError", 3, 4,
      4, "sqrt");
  }

  emxInit_real_T(&c_st, &x, 2, &i_emlrtRTEI, true);
  st.site = &b_emlrtRSI;
  i = x->size[0] * x->size[1];
  x->size[0] = 90;
  x->size[1] = (int32_T)T;
  emxEnsureCapacity_real_T(&st, x, i, &h_emlrtRTEI);
  emlrtRandn(&x->data[0], 90 * (int32_T)T);
  b_i = x->size[0] * x->size[1];
  i = x->size[0] * x->size[1];
  x->size[0] = 90;
  emxEnsureCapacity_real_T(sp, x, i, &i_emlrtRTEI);
  a = noiseadd * muDoubleScalarSqrt(a);
  for (i = 0; i < b_i; i++) {
    x->data[i] *= a;
  }

  i = (int32_T)T - 1;
  emlrtForLoopVectorCheckR2012b(1.0, 1.0, T - 1.0, mxDOUBLE_CLASS, (int32_T)T -
    1, &b_emlrtRTEI, sp);
  for (g = 0; g < i; g++) {
    /* 连续轨迹 跑到稳态 */
    st.site = &c_emlrtRSI;
    a = 0.002 * ut;
    b_st.site = &f_emlrtRSI;
    c_st.site = &g_emlrtRSI;
    d_st.site = &h_emlrtRSI;
    e_st.site = &i_emlrtRSI;
    f_st.site = &j_emlrtRSI;
    if (a < 0.0) {
      emlrtErrorWithMessageIdR2018a(&f_st, &emlrtRTEI,
        "Coder:toolbox:ElFunDomainError", "Coder:toolbox:ElFunDomainError", 3, 4,
        4, "sqrt");
    }

    a = 0.005 / muDoubleScalarSqrt(a);
    i1 = g + 1;
    if (i1 > z->size[2]) {
      emlrtDynamicBoundsCheckR2012b(i1, 1, z->size[2], &k_emlrtBCI, sp);
    }

    i1 = g + 1;
    if (i1 > zz->size[2]) {
      emlrtDynamicBoundsCheckR2012b(i1, 1, zz->size[2], &l_emlrtBCI, sp);
    }

    b_g = (int32_T)(g + 1U);
    if (b_g > zz->size[2]) {
      emlrtDynamicBoundsCheckR2012b(b_g, 1, zz->size[2], &m_emlrtBCI, sp);
    }

    i1 = (int32_T)(g + 2U);
    if (i1 > zz->size[2]) {
      emlrtDynamicBoundsCheckR2012b(i1, 1, zz->size[2], &j_emlrtBCI, sp);
    }

    for (i2 = 0; i2 < 3; i2++) {
      for (i3 = 0; i3 < 30; i3++) {
        b_i = i3 + 30 * i2;
        loop_ub_tmp = b_i + 90 * g;
        yadd[b_i] = zz->data[loop_ub_tmp] + (-zz->data[loop_ub_tmp] / 0.002 + a *
          z->data[loop_ub_tmp]) * ut;
      }
    }

    for (i2 = 0; i2 < 3; i2++) {
      for (i3 = 0; i3 < 30; i3++) {
        b_i = i3 + 30 * i2;
        zz->data[b_i + 90 * (g + 1)] = yadd[b_i];
      }
    }

    if (i1 > zz->size[2]) {
      emlrtDynamicBoundsCheckR2012b(i1, 1, zz->size[2], &i_emlrtBCI, sp);
    }

    for (i2 = 0; i2 < 3; i2++) {
      for (i3 = 0; i3 < 30; i3++) {
        b_i = i3 + 30 * i2;
        param->Iinput[b_i] = pulse[b_i] + zz->data[b_i + 90 * (g + 1)];
      }
    }

    /*  param.Iinput=Iinput+(signoise/(tnoise*ut)^0.5*z(:,:,g))*ut; */
    if (b_g > yy->size[1]) {
      emlrtDynamicBoundsCheckR2012b(b_g, 1, yy->size[1], &g_emlrtBCI, sp);
    }

    for (i2 = 0; i2 < 90; i2++) {
      yadd[i2] = yy->data[i2 + 90 * g];
    }

    for (b_i = 0; b_i < 30; b_i++) {
      yadd[b_i + 60] = 1.0;
    }

    if (b_g > yy->size[1]) {
      emlrtDynamicBoundsCheckR2012b(b_g, 1, yy->size[1], &f_emlrtBCI, sp);
    }

    st.site = &d_emlrtRSI;
    odeDWM(*(real_T (*)[90])&yy->data[90 * (b_g - 1)], param, dy);
    if (b_g > x->size[1]) {
      emlrtDynamicBoundsCheckR2012b(b_g, 1, x->size[1], &e_emlrtBCI, sp);
    }

    for (i2 = 0; i2 < 90; i2++) {
      dy[i2] = ut * dy[i2] + yadd[i2] * x->data[i2 + 90 * g];
    }

    if (b_g > yy->size[1]) {
      emlrtDynamicBoundsCheckR2012b(b_g, 1, yy->size[1], &d_emlrtBCI, sp);
    }

    if (i1 > yy->size[1]) {
      emlrtDynamicBoundsCheckR2012b(i1, 1, yy->size[1], &c_emlrtBCI, sp);
    }

    for (i1 = 0; i1 < 90; i1++) {
      yadd[i1] = yy->data[i1 + 90 * g] + dy[i1];
    }

    for (i1 = 0; i1 < 90; i1++) {
      yy->data[i1 + 90 * (g + 1)] = yadd[i1];
    }

    if (b_g > uy->size[1]) {
      emlrtDynamicBoundsCheckR2012b(b_g, 1, uy->size[1], &emlrtBCI, sp);
    }

    for (i1 = 0; i1 < 90; i1++) {
      uy->data[i1 + 90 * g] = dy[i1] / ut;
    }

    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b(sp);
    }
  }

  emxFree_real_T(&x);
  emxFree_real_T(&zz);
  emxFree_real_T(&z);
  if ((int32_T)T > yy->size[1]) {
    emlrtDynamicBoundsCheckR2012b((int32_T)T, 1, yy->size[1], &b_emlrtBCI, sp);
  }

  if ((int32_T)T > uy->size[1]) {
    emlrtDynamicBoundsCheckR2012b((int32_T)T, 1, uy->size[1], &n_emlrtBCI, sp);
  }

  st.site = &e_emlrtRSI;
  odeDWM(*(real_T (*)[90])&yy->data[90 * ((int32_T)T - 1)], param, *(real_T (*)
          [90])&uy->data[90 * ((int32_T)T - 1)]);
  emlrtHeapReferenceStackLeaveFcnR2012b(sp);
}

/* End of code generation (getatracedwmnoise.c) */
