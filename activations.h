#ifndef ACTIVATIONS_H
#define ACTIVATIONS_H

// GELU activation functions
void gelu_rvv(float *in, float *out, unsigned long n);
void gelu_ref(float *in, float *out, unsigned long n);

// Dish activation functions
void dish_rvv(float *in, float *out, unsigned long n);
void dish_ref(float *in, float *out, unsigned long n);

#endif
