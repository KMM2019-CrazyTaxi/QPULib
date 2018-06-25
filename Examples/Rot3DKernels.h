#ifndef _EXAMPLES_ROT3DKERNELS_H_
#define _EXAMPLES_ROT3DKERNELS_H_
#include <QPULib.h>

void rot3D(int n, float cosTheta, float sinTheta, float* x, float* y);
void rot3D_1(Int n, Float cosTheta, Float sinTheta, Ptr<Float> x, Ptr<Float> y);
void rot3D_2(Int n, Float cosTheta, Float sinTheta, Ptr<Float> x, Ptr<Float> y);
void rot3D_3(Int n, Float cosTheta, Float sinTheta, Ptr<Float> x, Ptr<Float> y);

#endif  // _EXAMPLES_ROT3DKERNELS_H_
