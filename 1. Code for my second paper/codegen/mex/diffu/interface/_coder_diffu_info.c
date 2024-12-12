/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_diffu_info.c
 *
 * Code generation for function 'diffu'
 *
 */

/* Include files */
#include "_coder_diffu_info.h"
#include "emlrt.h"
#include "tmwtypes.h"

/* Function Declarations */
static const mxArray *c_emlrtMexFcnResolvedFunctionsI(void);

/* Function Definitions */
static const mxArray *c_emlrtMexFcnResolvedFunctionsI(void)
{
  const mxArray *nameCaptureInfo;
  const char_T *data[4] = {
      "789c6360f4f465646060e06380801f5c109a17ca1780d24c0ca8005d9e114d1d23aa7206"
      "560616147d30f97e289d9c9f57925a5102e1e425e6a6c275a6e4e766"
      "e625e695845416a43214a516e7e794a5a68065d2327352433273538391397e205eae1b92"
      "149c039202b19d335293b3834b73198a328a112ecc41e6c0c3a30287",
      "7f59880c0f091ce12180261fed1aeb6a15131ee11c13ee1b939b58129392999656aa970b"
      "73470285ee60c3e90e884c4146664a792ec2dfb4b62f25bf34292715"
      "615f0385f649e2b40f551e239c211ed7cb85ca13f23f3f91ee41a711ea39c0f44ef69b8c"
      "f4b48fe1ca1347bada070503651fa5f9560c877d0268f255017e5e25",
      "2686e55e96fe11858625619551214901ae08770410b087903b1870f0e965fe7029ff58d0"
      "f80877406480c54032881ea8f28fd27016c7691faa3cb6f22f1958fa"
      "d12b9fe68ad3b9dc135f614657fba060b8977bbe51e5fe85a9ce218986aefec1054541c5"
      "eef9d9c62e43bfdc0300252b77ec",
      ""};
  nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(&data[0], 2832U, &nameCaptureInfo);
  return nameCaptureInfo;
}

mxArray *emlrtMexFcnProperties(void)
{
  mxArray *xEntryPoints;
  mxArray *xInputs;
  mxArray *xResult;
  const char_T *propFieldName[9] = {"Version",
                                    "ResolvedFunctions",
                                    "Checksum",
                                    "EntryPoints",
                                    "CoverageInfo",
                                    "IsPolymorphic",
                                    "PropertyList",
                                    "UUID",
                                    "ClassEntryPointIsHandle"};
  const char_T *epFieldName[8] = {
      "QualifiedName",    "NumberOfInputs", "NumberOfOutputs", "ConstantInputs",
      "ResolvedFilePath", "TimeStamp",      "Constructor",     "Visible"};
  xEntryPoints =
      emlrtCreateStructMatrix(1, 1, 8, (const char_T **)&epFieldName[0]);
  xInputs = emlrtCreateLogicalMatrix(1, 4);
  emlrtSetField(xEntryPoints, 0, "QualifiedName", emlrtMxCreateString("diffu"));
  emlrtSetField(xEntryPoints, 0, "NumberOfInputs",
                emlrtMxCreateDoubleScalar(4.0));
  emlrtSetField(xEntryPoints, 0, "NumberOfOutputs",
                emlrtMxCreateDoubleScalar(1.0));
  emlrtSetField(xEntryPoints, 0, "ConstantInputs", xInputs);
  emlrtSetField(xEntryPoints, 0, "ResolvedFilePath",
                emlrtMxCreateString("E:\\WXC\\WM\\mat\\diffu.m"));
  emlrtSetField(xEntryPoints, 0, "TimeStamp",
                emlrtMxCreateDoubleScalar(739153.27949074074));
  emlrtSetField(xEntryPoints, 0, "Constructor",
                emlrtMxCreateLogicalScalar(false));
  emlrtSetField(xEntryPoints, 0, "Visible", emlrtMxCreateLogicalScalar(true));
  xResult =
      emlrtCreateStructMatrix(1, 1, 9, (const char_T **)&propFieldName[0]);
  emlrtSetField(xResult, 0, "Version",
                emlrtMxCreateString("24.2.0.2712019 (R2024b)"));
  emlrtSetField(xResult, 0, "ResolvedFunctions",
                (mxArray *)c_emlrtMexFcnResolvedFunctionsI());
  emlrtSetField(xResult, 0, "Checksum",
                emlrtMxCreateString("q1d1gK9ZF4sOKeUhqvn4JE"));
  emlrtSetField(xResult, 0, "EntryPoints", xEntryPoints);
  return xResult;
}

/* End of code generation (_coder_diffu_info.c) */
