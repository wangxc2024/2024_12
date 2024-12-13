/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * SOMi.h
 *
 * Code generation for function 'SOMi'
 *
 */

#pragma once

/* Include files */
#include "dSOM_mex_types.h"
#include "rtwtypes.h"
#include "emlrt.h"
#include "mex.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Function Declarations */
real_T SOMi(const emlrtStack *sp, const real_T x[90], const real_T x1[90],
            const real_T Fx[90], const real_T Fx1[90], const real_T Gn[8100],
            const struct0_T *param, real_T D, real_T h);

/* End of code generation (SOMi.h) */
