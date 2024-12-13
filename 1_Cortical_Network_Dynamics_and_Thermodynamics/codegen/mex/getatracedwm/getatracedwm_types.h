/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * getatracedwm_types.h
 *
 * Code generation for function 'getatracedwm_types'
 *
 */

#pragma once

/* Include files */
#include "rtwtypes.h"

/* Type Definitions */
#ifndef struct_emxArray_real_T
#define struct_emxArray_real_T

struct emxArray_real_T
{
  real_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};

#endif                                 /*struct_emxArray_real_T*/

#ifndef typedef_emxArray_real_T
#define typedef_emxArray_real_T

typedef struct emxArray_real_T emxArray_real_T;

#endif                                 /*typedef_emxArray_real_T*/

#ifndef typedef_struct0_T
#define typedef_struct0_T

typedef struct {
  real_T ut;
  real_T Jmin;
  real_T Jmax;
  real_T game;
  real_T gami;
  real_T Jc;
  real_T Jei;
  real_T Jii;
  real_T I0a;
  real_T I0b;
  real_T I0c;
  real_T G;
  real_T tn;
  real_T tg;
  real_T c1;
  real_T gi;
  real_T J0;
  real_T k1;
  real_T k2;
  real_T Iinput[90];
  real_T SLN[900];
  real_T FLN[900];
  real_T W[900];
  real_T Z;
  real_T h[30];
  real_T Js[30];
  real_T zetta;
  real_T Jie[30];
  real_T wa[30];
  real_T wb[30];
  real_T wc[30];
} struct0_T;

#endif                                 /*typedef_struct0_T*/

/* End of code generation (getatracedwm_types.h) */
