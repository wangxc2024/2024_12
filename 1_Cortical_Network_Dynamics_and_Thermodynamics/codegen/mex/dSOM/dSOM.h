/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * dSOM.h
 *
 * Code generation for function 'dSOM'
 *
 */

#pragma once

/* Include files */
#include "dSOM_types.h"
#include "rtwtypes.h"
#include "emlrt.h"
#include "mex.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Function Declarations */
void dSOM(dSOMStackData *SD, const emlrtStack *sp, const real_T x_1[90],
          const real_T x[90], const real_T x1[90], const real_T Fx[90],
          const real_T Fx_1[90], const real_T dFx[8100], const real_T Gn[8100],
          const struct0_T *param, real_T D, real_T h, real_T dSom[90]);

/* End of code generation (dSOM.h) */
