/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_dSOM_mex_api.c
 *
 * Code generation for function '_coder_dSOM_mex_api'
 *
 */

/* Include files */
#include "_coder_dSOM_mex_api.h"
#include "SOMi.h"
#include "dSOM.h"
#include "dSOM_mex_data.h"
#include "dSOM_mex_mexutil.h"
#include "dSOM_mex_types.h"
#include "rt_nonfinite.h"

/* Function Declarations */
static const mxArray *b_emlrt_marshallOut(real_T u[90]);

static real_T (*c_emlrt_marshallIn(const emlrtStack *sp, const mxArray *nullptr,
                                   const char_T *identifier))[90];

static real_T (*d_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[90];

static real_T (*e_emlrt_marshallIn(const emlrtStack *sp, const mxArray *nullptr,
                                   const char_T *identifier))[8100];

static real_T (*f_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[8100];

static void g_emlrt_marshallIn(const emlrtStack *sp, const mxArray *nullptr,
                               const char_T *identifier, struct0_T *y);

static void h_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               struct0_T *y);

static real_T i_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                 const emlrtMsgIdentifier *parentId);

static void j_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               real_T y[90]);

static void k_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               real_T y[900]);

static void l_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               real_T y[30]);

static real_T m_emlrt_marshallIn(const emlrtStack *sp, const mxArray *nullptr,
                                 const char_T *identifier);

static real_T (*o_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[90];

static real_T (*p_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[8100];

static real_T q_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                 const emlrtMsgIdentifier *msgId);

static void r_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId, real_T ret[90]);

static void s_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId,
                               real_T ret[900]);

static void t_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId, real_T ret[30]);

/* Function Definitions */
static const mxArray *b_emlrt_marshallOut(real_T u[90])
{
  static const int32_T i = 0;
  static const int32_T i1 = 90;
  const mxArray *m;
  const mxArray *y;
  y = NULL;
  m = emlrtCreateNumericArray(1, (const void *)&i, mxDOUBLE_CLASS, mxREAL);
  emlrtMxSetData((mxArray *)m, &u[0]);
  emlrtSetDimensions((mxArray *)m, &i1, 1);
  emlrtAssign(&y, m);
  return y;
}

static real_T (*c_emlrt_marshallIn(const emlrtStack *sp, const mxArray *nullptr,
                                   const char_T *identifier))[90]
{
  emlrtMsgIdentifier thisId;
  real_T(*y)[90];
  thisId.fIdentifier = (const char_T *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = d_emlrt_marshallIn(sp, emlrtAlias(nullptr), &thisId);
  emlrtDestroyArray(&nullptr);
  return y;
}

static real_T (*d_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[90]
{
  real_T(*y)[90];
  y = o_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static real_T (*e_emlrt_marshallIn(const emlrtStack *sp, const mxArray *nullptr,
                                   const char_T *identifier))[8100]
{
  emlrtMsgIdentifier thisId;
  real_T(*y)[8100];
  thisId.fIdentifier = (const char_T *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = f_emlrt_marshallIn(sp, emlrtAlias(nullptr), &thisId);
  emlrtDestroyArray(&nullptr);
  return y;
}

static real_T (*f_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                   const emlrtMsgIdentifier *parentId))[8100]
{
  real_T(*y)[8100];
  y = p_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static void g_emlrt_marshallIn(const emlrtStack *sp, const mxArray *nullptr,
                               const char_T *identifier, struct0_T *y)
{
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = (const char_T *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  h_emlrt_marshallIn(sp, emlrtAlias(nullptr), &thisId, y);
  emlrtDestroyArray(&nullptr);
}

static void h_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId, struct0_T *y)
{
  static const int32_T dims = 0;
  static const char_T *fieldNames[31] = {
      "ut",  "Jmin", "Jmax",  "game",   "gami", "Jc",  "Jei", "Jii",
      "I0a", "I0b",  "I0c",   "G",      "tn",   "tg",  "c1",  "gi",
      "J0",  "k1",   "k2",    "Iinput", "SLN",  "FLN", "W",   "Z",
      "h",   "Js",   "zetta", "Jie",    "wa",   "wb",  "wc"};
  emlrtMsgIdentifier thisId;
  thisId.fParent = parentId;
  thisId.bParentIsCell = false;
  emlrtCheckStructR2012b((emlrtConstCTX)sp, parentId, u, 31,
                         (const char_T **)&fieldNames[0], 0U,
                         (const void *)&dims);
  thisId.fIdentifier = "ut";
  y->ut = i_emlrt_marshallIn(
      sp, emlrtAlias(emlrtGetFieldR2017b((emlrtConstCTX)sp, u, 0, 0, "ut")),
      &thisId);
  thisId.fIdentifier = "Jmin";
  y->Jmin = i_emlrt_marshallIn(
      sp, emlrtAlias(emlrtGetFieldR2017b((emlrtConstCTX)sp, u, 0, 1, "Jmin")),
      &thisId);
  thisId.fIdentifier = "Jmax";
  y->Jmax = i_emlrt_marshallIn(
      sp, emlrtAlias(emlrtGetFieldR2017b((emlrtConstCTX)sp, u, 0, 2, "Jmax")),
      &thisId);
  thisId.fIdentifier = "game";
  y->game = i_emlrt_marshallIn(
      sp, emlrtAlias(emlrtGetFieldR2017b((emlrtConstCTX)sp, u, 0, 3, "game")),
      &thisId);
  thisId.fIdentifier = "gami";
  y->gami = i_emlrt_marshallIn(
      sp, emlrtAlias(emlrtGetFieldR2017b((emlrtConstCTX)sp, u, 0, 4, "gami")),
      &thisId);
  thisId.fIdentifier = "Jc";
  y->Jc = i_emlrt_marshallIn(
      sp, emlrtAlias(emlrtGetFieldR2017b((emlrtConstCTX)sp, u, 0, 5, "Jc")),
      &thisId);
  thisId.fIdentifier = "Jei";
  y->Jei = i_emlrt_marshallIn(
      sp, emlrtAlias(emlrtGetFieldR2017b((emlrtConstCTX)sp, u, 0, 6, "Jei")),
      &thisId);
  thisId.fIdentifier = "Jii";
  y->Jii = i_emlrt_marshallIn(
      sp, emlrtAlias(emlrtGetFieldR2017b((emlrtConstCTX)sp, u, 0, 7, "Jii")),
      &thisId);
  thisId.fIdentifier = "I0a";
  y->I0a = i_emlrt_marshallIn(
      sp, emlrtAlias(emlrtGetFieldR2017b((emlrtConstCTX)sp, u, 0, 8, "I0a")),
      &thisId);
  thisId.fIdentifier = "I0b";
  y->I0b = i_emlrt_marshallIn(
      sp, emlrtAlias(emlrtGetFieldR2017b((emlrtConstCTX)sp, u, 0, 9, "I0b")),
      &thisId);
  thisId.fIdentifier = "I0c";
  y->I0c = i_emlrt_marshallIn(
      sp, emlrtAlias(emlrtGetFieldR2017b((emlrtConstCTX)sp, u, 0, 10, "I0c")),
      &thisId);
  thisId.fIdentifier = "G";
  y->G = i_emlrt_marshallIn(
      sp, emlrtAlias(emlrtGetFieldR2017b((emlrtConstCTX)sp, u, 0, 11, "G")),
      &thisId);
  thisId.fIdentifier = "tn";
  y->tn = i_emlrt_marshallIn(
      sp, emlrtAlias(emlrtGetFieldR2017b((emlrtConstCTX)sp, u, 0, 12, "tn")),
      &thisId);
  thisId.fIdentifier = "tg";
  y->tg = i_emlrt_marshallIn(
      sp, emlrtAlias(emlrtGetFieldR2017b((emlrtConstCTX)sp, u, 0, 13, "tg")),
      &thisId);
  thisId.fIdentifier = "c1";
  y->c1 = i_emlrt_marshallIn(
      sp, emlrtAlias(emlrtGetFieldR2017b((emlrtConstCTX)sp, u, 0, 14, "c1")),
      &thisId);
  thisId.fIdentifier = "gi";
  y->gi = i_emlrt_marshallIn(
      sp, emlrtAlias(emlrtGetFieldR2017b((emlrtConstCTX)sp, u, 0, 15, "gi")),
      &thisId);
  thisId.fIdentifier = "J0";
  y->J0 = i_emlrt_marshallIn(
      sp, emlrtAlias(emlrtGetFieldR2017b((emlrtConstCTX)sp, u, 0, 16, "J0")),
      &thisId);
  thisId.fIdentifier = "k1";
  y->k1 = i_emlrt_marshallIn(
      sp, emlrtAlias(emlrtGetFieldR2017b((emlrtConstCTX)sp, u, 0, 17, "k1")),
      &thisId);
  thisId.fIdentifier = "k2";
  y->k2 = i_emlrt_marshallIn(
      sp, emlrtAlias(emlrtGetFieldR2017b((emlrtConstCTX)sp, u, 0, 18, "k2")),
      &thisId);
  thisId.fIdentifier = "Iinput";
  j_emlrt_marshallIn(
      sp,
      emlrtAlias(emlrtGetFieldR2017b((emlrtConstCTX)sp, u, 0, 19, "Iinput")),
      &thisId, y->Iinput);
  thisId.fIdentifier = "SLN";
  k_emlrt_marshallIn(
      sp, emlrtAlias(emlrtGetFieldR2017b((emlrtConstCTX)sp, u, 0, 20, "SLN")),
      &thisId, y->SLN);
  thisId.fIdentifier = "FLN";
  k_emlrt_marshallIn(
      sp, emlrtAlias(emlrtGetFieldR2017b((emlrtConstCTX)sp, u, 0, 21, "FLN")),
      &thisId, y->FLN);
  thisId.fIdentifier = "W";
  k_emlrt_marshallIn(
      sp, emlrtAlias(emlrtGetFieldR2017b((emlrtConstCTX)sp, u, 0, 22, "W")),
      &thisId, y->W);
  thisId.fIdentifier = "Z";
  y->Z = i_emlrt_marshallIn(
      sp, emlrtAlias(emlrtGetFieldR2017b((emlrtConstCTX)sp, u, 0, 23, "Z")),
      &thisId);
  thisId.fIdentifier = "h";
  l_emlrt_marshallIn(
      sp, emlrtAlias(emlrtGetFieldR2017b((emlrtConstCTX)sp, u, 0, 24, "h")),
      &thisId, y->h);
  thisId.fIdentifier = "Js";
  l_emlrt_marshallIn(
      sp, emlrtAlias(emlrtGetFieldR2017b((emlrtConstCTX)sp, u, 0, 25, "Js")),
      &thisId, y->Js);
  thisId.fIdentifier = "zetta";
  y->zetta = i_emlrt_marshallIn(
      sp, emlrtAlias(emlrtGetFieldR2017b((emlrtConstCTX)sp, u, 0, 26, "zetta")),
      &thisId);
  thisId.fIdentifier = "Jie";
  l_emlrt_marshallIn(
      sp, emlrtAlias(emlrtGetFieldR2017b((emlrtConstCTX)sp, u, 0, 27, "Jie")),
      &thisId, y->Jie);
  thisId.fIdentifier = "wa";
  l_emlrt_marshallIn(
      sp, emlrtAlias(emlrtGetFieldR2017b((emlrtConstCTX)sp, u, 0, 28, "wa")),
      &thisId, y->wa);
  thisId.fIdentifier = "wb";
  l_emlrt_marshallIn(
      sp, emlrtAlias(emlrtGetFieldR2017b((emlrtConstCTX)sp, u, 0, 29, "wb")),
      &thisId, y->wb);
  thisId.fIdentifier = "wc";
  l_emlrt_marshallIn(
      sp, emlrtAlias(emlrtGetFieldR2017b((emlrtConstCTX)sp, u, 0, 30, "wc")),
      &thisId, y->wc);
  emlrtDestroyArray(&u);
}

static real_T i_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                                 const emlrtMsgIdentifier *parentId)
{
  real_T y;
  y = q_emlrt_marshallIn(sp, emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static void j_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId, real_T y[90])
{
  r_emlrt_marshallIn(sp, emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

static void k_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId,
                               real_T y[900])
{
  s_emlrt_marshallIn(sp, emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

static void l_emlrt_marshallIn(const emlrtStack *sp, const mxArray *u,
                               const emlrtMsgIdentifier *parentId, real_T y[30])
{
  t_emlrt_marshallIn(sp, emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

static real_T m_emlrt_marshallIn(const emlrtStack *sp, const mxArray *nullptr,
                                 const char_T *identifier)
{
  emlrtMsgIdentifier thisId;
  real_T y;
  thisId.fIdentifier = (const char_T *)identifier;
  thisId.fParent = NULL;
  thisId.bParentIsCell = false;
  y = i_emlrt_marshallIn(sp, emlrtAlias(nullptr), &thisId);
  emlrtDestroyArray(&nullptr);
  return y;
}

static real_T (*o_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[90]
{
  static const int32_T dims = 90;
  real_T(*ret)[90];
  int32_T i;
  boolean_T b = false;
  emlrtCheckVsBuiltInR2012b((emlrtConstCTX)sp, msgId, src, "double", false, 1U,
                            (const void *)&dims, &b, &i);
  ret = (real_T(*)[90])emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

static real_T (*p_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                   const emlrtMsgIdentifier *msgId))[8100]
{
  static const int32_T dims[2] = {90, 90};
  real_T(*ret)[8100];
  int32_T iv[2];
  boolean_T bv[2] = {false, false};
  emlrtCheckVsBuiltInR2012b((emlrtConstCTX)sp, msgId, src, "double", false, 2U,
                            (const void *)&dims[0], &bv[0], &iv[0]);
  ret = (real_T(*)[8100])emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

static real_T q_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                                 const emlrtMsgIdentifier *msgId)
{
  static const int32_T dims = 0;
  real_T ret;
  emlrtCheckBuiltInR2012b((emlrtConstCTX)sp, msgId, src, "double", false, 0U,
                          (const void *)&dims);
  ret = *(real_T *)emlrtMxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

static void r_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId, real_T ret[90])
{
  static const int32_T dims[2] = {30, 3};
  real_T(*r)[90];
  int32_T i;
  emlrtCheckBuiltInR2012b((emlrtConstCTX)sp, msgId, src, "double", false, 2U,
                          (const void *)&dims[0]);
  r = (real_T(*)[90])emlrtMxGetData(src);
  for (i = 0; i < 90; i++) {
    ret[i] = (*r)[i];
  }
  emlrtDestroyArray(&src);
}

static void s_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId, real_T ret[900])
{
  static const int32_T dims[2] = {30, 30};
  real_T(*r)[900];
  int32_T i;
  emlrtCheckBuiltInR2012b((emlrtConstCTX)sp, msgId, src, "double", false, 2U,
                          (const void *)&dims[0]);
  r = (real_T(*)[900])emlrtMxGetData(src);
  for (i = 0; i < 900; i++) {
    ret[i] = (*r)[i];
  }
  emlrtDestroyArray(&src);
}

static void t_emlrt_marshallIn(const emlrtStack *sp, const mxArray *src,
                               const emlrtMsgIdentifier *msgId, real_T ret[30])
{
  static const int32_T dims = 30;
  real_T(*r)[30];
  int32_T i;
  emlrtCheckBuiltInR2012b((emlrtConstCTX)sp, msgId, src, "double", false, 1U,
                          (const void *)&dims);
  r = (real_T(*)[30])emlrtMxGetData(src);
  for (i = 0; i < 30; i++) {
    ret[i] = (*r)[i];
  }
  emlrtDestroyArray(&src);
}

void SOMi_api(const mxArray *const prhs[8], const mxArray **plhs)
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  struct0_T param;
  real_T(*Gn)[8100];
  real_T(*Fx)[90];
  real_T(*Fx1)[90];
  real_T(*x)[90];
  real_T(*x1)[90];
  real_T D;
  real_T h;
  st.tls = emlrtRootTLSGlobal;
  /* Marshall function inputs */
  x = c_emlrt_marshallIn(&st, emlrtAlias(prhs[0]), "x");
  x1 = c_emlrt_marshallIn(&st, emlrtAlias(prhs[1]), "x1");
  Fx = c_emlrt_marshallIn(&st, emlrtAlias(prhs[2]), "Fx");
  Fx1 = c_emlrt_marshallIn(&st, emlrtAlias(prhs[3]), "Fx1");
  Gn = e_emlrt_marshallIn(&st, emlrtAlias(prhs[4]), "Gn");
  g_emlrt_marshallIn(&st, emlrtAliasP(prhs[5]), "param", &param);
  D = m_emlrt_marshallIn(&st, emlrtAliasP(prhs[6]), "D");
  h = m_emlrt_marshallIn(&st, emlrtAliasP(prhs[7]), "h");
  /* Invoke the target function */
  D = SOMi(&st, *x, *x1, *Fx, *Fx1, *Gn, &param, D, h);
  /* Marshall function outputs */
  *plhs = emlrt_marshallOut(D);
}

void dSOM_api(dSOM_mexStackData *SD, const mxArray *const prhs[10],
              const mxArray **plhs)
{
  emlrtStack st = {
      NULL, /* site */
      NULL, /* tls */
      NULL  /* prev */
  };
  struct0_T param;
  real_T(*Gn)[8100];
  real_T(*dFx)[8100];
  real_T(*Fx)[90];
  real_T(*Fx_1)[90];
  real_T(*dSom)[90];
  real_T(*x)[90];
  real_T(*x1)[90];
  real_T(*x_1)[90];
  real_T D;
  real_T h;
  st.tls = emlrtRootTLSGlobal;
  dSom = (real_T(*)[90])mxMalloc(sizeof(real_T[90]));
  /* Marshall function inputs */
  x_1 = c_emlrt_marshallIn(&st, emlrtAlias(prhs[0]), "x_1");
  x = c_emlrt_marshallIn(&st, emlrtAlias(prhs[1]), "x");
  x1 = c_emlrt_marshallIn(&st, emlrtAlias(prhs[2]), "x1");
  Fx = c_emlrt_marshallIn(&st, emlrtAlias(prhs[3]), "Fx");
  Fx_1 = c_emlrt_marshallIn(&st, emlrtAlias(prhs[4]), "Fx_1");
  dFx = e_emlrt_marshallIn(&st, emlrtAlias(prhs[5]), "dFx");
  Gn = e_emlrt_marshallIn(&st, emlrtAlias(prhs[6]), "Gn");
  g_emlrt_marshallIn(&st, emlrtAliasP(prhs[7]), "param", &param);
  D = m_emlrt_marshallIn(&st, emlrtAliasP(prhs[8]), "D");
  h = m_emlrt_marshallIn(&st, emlrtAliasP(prhs[9]), "h");
  /* Invoke the target function */
  dSOM(SD, &st, *x_1, *x, *x1, *Fx, *Fx_1, *dFx, *Gn, &param, D, h, *dSom);
  /* Marshall function outputs */
  *plhs = b_emlrt_marshallOut(*dSom);
}

/* End of code generation (_coder_dSOM_mex_api.c) */
