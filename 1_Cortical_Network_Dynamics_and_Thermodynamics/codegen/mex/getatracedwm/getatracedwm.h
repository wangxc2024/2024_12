/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * getatracedwm.h
 *
 * Code generation for function 'getatracedwm'
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
#include "getatracedwm_types.h"

/* Function Declarations */
void getatracedwm(const emlrtStack *sp, real_T Tp, const real_T b_y0[90],
                  struct0_T *param, const real_T pulse[90], emxArray_real_T *yy,
                  emxArray_real_T *uy);

/* End of code generation (getatracedwm.h) */
