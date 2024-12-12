/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_dSOM_mex_api.h
 *
 * Code generation for function '_coder_dSOM_mex_api'
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
void SOMi_api(const mxArray *const prhs[8], const mxArray **plhs);

void dSOM_api(dSOM_mexStackData *SD, const mxArray *const prhs[10],
              const mxArray **plhs);

/* End of code generation (_coder_dSOM_mex_api.h) */
