/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_odeDWM_api.c
 *
 * Code generation for function '_coder_odeDWM_api'
 *
 */

/* Include files */
#include "_coder_odeDWM_api.h"
#include "odeDWM.h"
#include "odeDWM_data.h"
#include "rt_nonfinite.h"

/* Function Declarations */
static real_T b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId);
static real_T (*c_emlrt_marshallIn(const emlrtStack *sp, const mxArray *x, const
  char_T *identifier))[90];
static real_T (*d_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId))[90];
static void e_emlrt_marshallIn(const emlrtStack *sp, const mxArray *param, const
  char_T *identifier, struct0_T *y);
static real_T emlrt_marshallIn(const emlrtStack *sp, const mxArray *t, const
  char_T *identifier);
static const mxArray *emlrt_marshallOut(const real_T u[90]);
static void f_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId, struct0_T *y);
static void g_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId, real_T y[90]);
static void h_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId, real_T y[900]);
static void i_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId, real_T y[30]);
static real_T j_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src, const
  emlrtMsgIdentifier *msgId);
static real_T (*k_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
  const emlrtMsgIdentifier *msgId))[90];
static void l_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src, const
  emlrtMsgIdentifier *msgId, real_T ret[90]);
static void m_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src, const
  emlrtMsgIdentifier *msgId, real_T ret[900]);
static void n_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src, const
  emlrtMsgIdentifier *msgId, real_T ret[30]);

/* Function Definitions */
static real_T b_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId)
{
  real_T y;
  y = j_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static real_T (*c_emlrt_marshallIn(const emlrtStack *sp, const mxArray *x, const
  char_T *identifier))[90]
{
  real_T (*y)[90];
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = (const char *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = d_emlrt_marshallIn(sp, emlrtAlias(x), &thisId);
  emlrtDestroyArray(&x);
  return y;
}
  static real_T (*d_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
  const emlrtMsgIdentifier *parentId))[90]
{
  real_T (*y)[90];
  y = k_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static void e_emlrt_marshallIn(const emlrtStack *sp, const mxArray *param, const
  char_T *identifier, struct0_T *y)
{
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = (const char *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  f_emlrt_marshallIn(sp, emlrtAlias(param), &thisId, y);
  emlrtDestroyArray(&param);
}

static real_T emlrt_marshallIn(const emlrtStack *sp, const mxArray *t, const
  char_T *identifier)
{
  real_T y;
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = (const char *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = b_emlrt_marshallIn(sp, emlrtAlias(t), &thisId);
  emlrtDestroyArray(&t);
  return y;
}

static const mxArray *emlrt_marshallOut(const real_T u[90])
{
  const mxArray *y;
  const mxArray *m;
  static const int32_T iv[1] = { 0 };

  static const int32_T iv1[1] = { 90 };

  y = NULL;
  m = emlrtCreateNumericArray(1, &iv[0], mxDOUBLE_CLASS, mxREAL);
  emlrtMxSetData((mxArray *)m, (void *)&u[0]);
  emlrtSetDimensions((mxArray *)m, iv1, 1);
  emlrtAssign(&y, m);
  return y;
}

static void f_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId, struct0_T *y)
{
  emlrtMsgIdentifier thisId;
  static const char * fieldNames[31] = { "ut", "Jmin", "Jmax", "game", "gami",
    "Jc", "Jei", "Jii", "I0a", "I0b", "I0c", "G", "tn", "tg", "c1", "gi", "J0",
    "k1", "k2", "Iinput", "SLN", "FLN", "W", "Z", "h", "Js", "zetta", "Jie",
    "wa", "wb", "wc" };

  static const int32_T dims = 0;
  thisId.fParent = parentId;
  thisId.bParentIsCell = false;
  emlrtCheckStructR2012b(sp, parentId, u, 31, fieldNames, 0U, &dims);
  thisId.fIdentifier = "ut";
  y->ut = b_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 0,
    "ut")), &thisId);
  thisId.fIdentifier = "Jmin";
  y->Jmin = b_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 1,
    "Jmin")), &thisId);
  thisId.fIdentifier = "Jmax";
  y->Jmax = b_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 2,
    "Jmax")), &thisId);
  thisId.fIdentifier = "game";
  y->game = b_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 3,
    "game")), &thisId);
  thisId.fIdentifier = "gami";
  y->gami = b_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 4,
    "gami")), &thisId);
  thisId.fIdentifier = "Jc";
  y->Jc = b_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 5,
    "Jc")), &thisId);
  thisId.fIdentifier = "Jei";
  y->Jei = b_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 6,
    "Jei")), &thisId);
  thisId.fIdentifier = "Jii";
  y->Jii = b_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 7,
    "Jii")), &thisId);
  thisId.fIdentifier = "I0a";
  y->I0a = b_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 8,
    "I0a")), &thisId);
  thisId.fIdentifier = "I0b";
  y->I0b = b_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 9,
    "I0b")), &thisId);
  thisId.fIdentifier = "I0c";
  y->I0c = b_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 10,
    "I0c")), &thisId);
  thisId.fIdentifier = "G";
  y->G = b_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 11, "G")),
    &thisId);
  thisId.fIdentifier = "tn";
  y->tn = b_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 12,
    "tn")), &thisId);
  thisId.fIdentifier = "tg";
  y->tg = b_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 13,
    "tg")), &thisId);
  thisId.fIdentifier = "c1";
  y->c1 = b_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 14,
    "c1")), &thisId);
  thisId.fIdentifier = "gi";
  y->gi = b_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 15,
    "gi")), &thisId);
  thisId.fIdentifier = "J0";
  y->J0 = b_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 16,
    "J0")), &thisId);
  thisId.fIdentifier = "k1";
  y->k1 = b_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 17,
    "k1")), &thisId);
  thisId.fIdentifier = "k2";
  y->k2 = b_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 18,
    "k2")), &thisId);
  thisId.fIdentifier = "Iinput";
  g_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 19, "Iinput")),
                     &thisId, y->Iinput);
  thisId.fIdentifier = "SLN";
  h_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 20, "SLN")),
                     &thisId, y->SLN);
  thisId.fIdentifier = "FLN";
  h_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 21, "FLN")),
                     &thisId, y->FLN);
  thisId.fIdentifier = "W";
  h_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 22, "W")),
                     &thisId, y->W);
  thisId.fIdentifier = "Z";
  y->Z = b_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 23, "Z")),
    &thisId);
  thisId.fIdentifier = "h";
  i_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 24, "h")),
                     &thisId, y->h);
  thisId.fIdentifier = "Js";
  i_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 25, "Js")),
                     &thisId, y->Js);
  thisId.fIdentifier = "zetta";
  y->zetta = b_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 26,
    "zetta")), &thisId);
  thisId.fIdentifier = "Jie";
  i_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 27, "Jie")),
                     &thisId, y->Jie);
  thisId.fIdentifier = "wa";
  i_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 28, "wa")),
                     &thisId, y->wa);
  thisId.fIdentifier = "wb";
  i_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 29, "wb")),
                     &thisId, y->wb);
  thisId.fIdentifier = "wc";
  i_emlrt_marshallIn(sp, emlrtAlias(emlrtGetFieldR2017b(sp, u, 0, 30, "wc")),
                     &thisId, y->wc);
  emlrtDestroyArray(&u);
}

static void g_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId, real_T y[90])
{
  l_emlrt_marshallIn(sp, emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

static void h_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId, real_T y[900])
{
  m_emlrt_marshallIn(sp, emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

static void i_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u, const
  emlrtMsgIdentifier *parentId, real_T y[30])
{
  n_emlrt_marshallIn(sp, emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

static real_T j_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src, const
  emlrtMsgIdentifier *msgId)
{
  real_T ret;
  static const int32_T dims = 0;
  emlrtCheckBuiltInR2012b(sp, msgId, src, "double", false, 0U, &dims);
  ret = *(real_T *)emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

static real_T (*k_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
  const emlrtMsgIdentifier *msgId))[90]
{
  real_T (*ret)[90];
  static const int32_T dims[1] = { 90 };

  emlrtCheckBuiltInR2012b(sp, msgId, src, "double", false, 1U, dims);
  ret = (real_T (*)[90])emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}
  static void l_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src, const
  emlrtMsgIdentifier *msgId, real_T ret[90])
{
  static const int32_T dims[2] = { 30, 3 };

  real_T (*r)[90];
  int32_T i;
  emlrtCheckBuiltInR2012b(sp, msgId, src, "double", false, 2U, dims);
  r = (real_T (*)[90])emlrtMxGetData(src);
  for (i = 0; i < 90; i++) {
    ret[i] = (*r)[i];
  }

  emlrtDestroyArray(&src);
}

static void m_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src, const
  emlrtMsgIdentifier *msgId, real_T ret[900])
{
  static const int32_T dims[2] = { 30, 30 };

  real_T (*r)[900];
  int32_T i;
  emlrtCheckBuiltInR2012b(sp, msgId, src, "double", false, 2U, dims);
  r = (real_T (*)[900])emlrtMxGetData(src);
  for (i = 0; i < 900; i++) {
    ret[i] = (*r)[i];
  }

  emlrtDestroyArray(&src);
}

static void n_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src, const
  emlrtMsgIdentifier *msgId, real_T ret[30])
{
  static const int32_T dims[1] = { 30 };

  real_T (*r)[30];
  int32_T i;
  emlrtCheckBuiltInR2012b(sp, msgId, src, "double", false, 1U, dims);
  r = (real_T (*)[30])emlrtMxGetData(src);
  for (i = 0; i < 30; i++) {
    ret[i] = (*r)[i];
  }

  emlrtDestroyArray(&src);
}

void odeDWM_api(const mxArray * const prhs[3], int32_T nlhs, const mxArray *
                plhs[1])
{
  real_T (*dx)[90];
  real_T t;
  real_T (*x)[90];
  struct0_T param;
  emlrtStack st = { NULL,              /* site */
    NULL,                              /* tls */
    NULL                               /* prev */
  };

  (void)nlhs;
  st.tls = emlrtRootTLSGlobal;
  dx = (real_T (*)[90])mxMalloc(sizeof(real_T [90]));

  /* Marshall function inputs */
  t = emlrt_marshallIn(&st, emlrtAliasP(prhs[0]), "t");
  x = c_emlrt_marshallIn(&st, emlrtAlias(prhs[1]), "x");
  e_emlrt_marshallIn(&st, emlrtAliasP(prhs[2]), "param", &param);

  /* Invoke the target function */
  odeDWM(&st, t, *x, &param, *dx);

  /* Marshall function outputs */
  plhs[0] = emlrt_marshallOut(*dx);
}

/* End of code generation (_coder_odeDWM_api.c) */
