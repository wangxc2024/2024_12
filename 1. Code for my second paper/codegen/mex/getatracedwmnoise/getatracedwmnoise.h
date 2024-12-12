/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * getatracedwmnoise.h
 *
 * Code generation for function 'getatracedwmnoise'
 *
 */

#pragma once

/* Include files */
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mex.h"
#include "emlrt.h"
#include "rtwtypes.h"
#include "getatracedwmnoise_types.h"

/* Function Declarations */
void getatracedwmnoise(const emlrtStack *sp, real_T Tp, const real_T b_y0[90],
  struct0_T *param, const real_T pulse[90], real_T noise, real_T noiseadd,
  emxArray_real_T *yy, emxArray_real_T *uy);

/* End of code generation (getatracedwmnoise.h) */
