#include <riscv_vector.h>
#include "activations.h"

// Dish activation: https://danieldk.eu/Dish-Activation
// dish(x) = x * 0.5 * (1 + x / sqrt(1 + x^2))

// Newton-Raphson iteration for inverse square root: y' = y * (1.5 - 0.5 * a * y * y)
static inline vfloat32m1_t rsqrt_newton_raphson(vfloat32m1_t y, vfloat32m1_t a, unsigned long vl) {
    vfloat32m1_t tmp = __riscv_vfmul_vv_f32m1(y, y, vl);
    tmp = __riscv_vfmul_vv_f32m1(a, tmp, vl);
    tmp = __riscv_vfmul_vf_f32m1(tmp, 0.5f, vl);
    tmp = __riscv_vfrsub_vf_f32m1(tmp, 1.5f, vl);
    return __riscv_vfmul_vv_f32m1(y, tmp, vl);
}

__attribute__((noinline)) // avoid inlining so asm inspection is easier
void dish_rvv(float *in, float *out, unsigned long n) {
    unsigned long i = 0;

    while (i < n) {
        unsigned long vl = __riscv_vsetvl_e32m1(n - i);

        // load x
        vfloat32m1_t x = __riscv_vle32_v_f32m1(&in[i], vl);

        // sigmoidal = 1 + x^2
        vfloat32m1_t sigmoidal = __riscv_vfmul_vv_f32m1(x, x, vl);
        sigmoidal = __riscv_vfadd_vf_f32m1(sigmoidal, 1.0f, vl);

        // T-Head C906 doesn't have vfrsqrt7, use fast inverse square root
        // https://en.wikipedia.org/wiki/Fast_inverse_square_root
        // Shout out Carmack for the original idea! and Daniel for adding it to his dish implementation.
        vuint32m1_t iv = __riscv_vreinterpret_v_f32m1_u32m1(sigmoidal);
        iv = __riscv_vsrl_vx_u32m1(iv, 1, vl);
        iv = __riscv_vrsub_vx_u32m1(iv, 0x5f3759df, vl);
        vfloat32m1_t rsqrt = __riscv_vreinterpret_v_u32m1_f32m1(iv);

        // two Newton-Raphson iterations for accuracy
        rsqrt = rsqrt_newton_raphson(rsqrt, sigmoidal, vl);
        rsqrt = rsqrt_newton_raphson(rsqrt, sigmoidal, vl);

        // sigmoidal = x * rsqrt(1 + x^2) = x / sqrt(1 + x^2)
        sigmoidal = __riscv_vfmul_vv_f32m1(x, rsqrt, vl);

        // sigmoidal = 0.5 * (1 + x / sqrt(1 + x^2))
        sigmoidal = __riscv_vfadd_vf_f32m1(sigmoidal, 1.0f, vl);
        sigmoidal = __riscv_vfmul_vf_f32m1(sigmoidal, 0.5f, vl);

        // dish = x * sigmoidal(x)
        vfloat32m1_t result = __riscv_vfmul_vv_f32m1(x, sigmoidal, vl);

        // store
        __riscv_vse32_v_f32m1(&out[i], result, vl);

        i += vl;
    }
}

// scalar reference for dish
static inline float dish_ref_scalar(float x) {
    float x2 = x * x;
    float denom = 1.0f + x2;
    // manual sqrt via Newton-Raphson
    float y = denom;
    y = 0.5f * (y + denom / y);
    y = 0.5f * (y + denom / y);
    y = 0.5f * (y + denom / y);
    y = 0.5f * (y + denom / y);
    y = 0.5f * (y + denom / y);
    float sigmoidal = 0.5f * (1.0f + x / y);
    return x * sigmoidal;
}

__attribute__((noinline))
void dish_ref(float *in, float *out, unsigned long n) {
    for (unsigned long i = 0; i < n; ++i) {
        out[i] = dish_ref_scalar(in[i]);
    }
}
