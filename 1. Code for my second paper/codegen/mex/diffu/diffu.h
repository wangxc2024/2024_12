/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * diffu.h
 *
 * Code generation for function 'diffu'
 *
 */

#pragma once

/* Include files */
#include "diffu_types.h"
#include "rtwtypes.h"
#include "emlrt.h"
#include "mex.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Function Declarations */
void diffu(const emlrtStack *sp, const real_T x[90], const struct0_T *param,
           real_T Inoise, real_T Snoise, real_T D[8100]);

/* End of code generation (diffu.h) */
