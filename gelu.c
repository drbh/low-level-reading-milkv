#include <riscv_vector.h>
#include "activations.h"

// gelu(x) = 0.5 * x * (1 + tanh(sqrt(2/pi) * (x + 0.044715 * x^3)))
// we approximate tanh with a tuned rational:
//   tanh(t) ≈ t * (A + B t^2) / (1 + D t^2)
// and clamp to [-1, 1].

#define SQRT_2_PI 0.7978845608f
#define GELU_COEF 0.044715f

// tuned tanh rational coefficients (fit over t in ~[-5.5, 5.5])
#define TANH_A 0.90030408f   // numerator constant term
#define TANH_B 0.02400349f   // numerator t^2 coeff
#define TANH_D 0.26035699f   // denominator t^2 coeff

__attribute__((noinline)) // avoid inlining so asm inspection is easier
void gelu_rvv(float *in, float *out, unsigned long n) {
    unsigned long i = 0;

    while (i < n) {
        unsigned long vl = __riscv_vsetvl_e32m1(n - i);

        // load
        vfloat32m1_t x = __riscv_vle32_v_f32m1(&in[i], vl);

        // x^2 and x^3
        vfloat32m1_t x2 = __riscv_vfmul_vv_f32m1(x, x, vl);
        vfloat32m1_t x3 = __riscv_vfmul_vv_f32m1(x2, x, vl);

        // poly = x + GELU_COEF * x^3
        vfloat32m1_t poly =
            __riscv_vfadd_vv_f32m1(
                x,
                __riscv_vfmul_vf_f32m1(x3, GELU_COEF, vl),
                vl
            );

        // inner = sqrt(2/pi) * poly
        vfloat32m1_t inner =
            __riscv_vfmul_vf_f32m1(poly, SQRT_2_PI, vl);

        // tanh approx: inner * (A + B * inner^2) / (1 + D * inner^2)
        vfloat32m1_t inner2 = __riscv_vfmul_vv_f32m1(inner, inner, vl);

        // num = inner * (A + B * inner^2)
        vfloat32m1_t num =
            __riscv_vfmul_vv_f32m1(
                inner,
                __riscv_vfadd_vf_f32m1(
                    __riscv_vfmul_vf_f32m1(inner2, TANH_B, vl),
                    TANH_A,
                    vl
                ),
                vl
            );

        // den = 1 + D * inner^2
        vfloat32m1_t den =
            __riscv_vfadd_vf_f32m1(
                __riscv_vfmul_vf_f32m1(inner2, TANH_D, vl),
                1.0f,
                vl
            );

        vfloat32m1_t tanh = __riscv_vfdiv_vv_f32m1(num, den, vl);

        // clamp tanh to [-1, 1]
        tanh = __riscv_vfmin_vf_f32m1(tanh,  1.0f, vl);
        tanh = __riscv_vfmax_vf_f32m1(tanh, -1.0f, vl);

        // gelu = 0.5 * x * (1 + tanh)
        vfloat32m1_t scale =
            __riscv_vfadd_vf_f32m1(tanh, 1.0f, vl);

        vfloat32m1_t result =
            __riscv_vfmul_vf_f32m1(
                __riscv_vfmul_vv_f32m1(x, scale, vl),
                0.5f,
                vl
            );

        // store
        __riscv_vse32_v_f32m1(&out[i], result, vl);

        i += vl;
    }
}

// exp(-u) approximation on [0, 12]
// Horner coefficients (degree 10), highest power first
static inline float exp_minus_u_approx(float u) {
    // For u > 12, e^{-u} < 6e-6, so just treat as zero.
    if (u > 12.0f) {
        return 0.0f;
    }

    const float c0  =  1.46142604e-09f;
    const float c1  = -1.03328834e-07f;
    const float c2  =  3.24018600e-06f;
    const float c3  = -5.96481771e-05f;
    const float c4  =  7.20241845e-04f;
    const float c5  = -6.04450876e-03f;
    const float c6  =  3.64137587e-02f;
    const float c7  = -1.59185221e-01f;
    const float c8  =  4.94145526e-01f;
    const float c9  = -9.97995214e-01f;
    const float c10 =  9.99830662e-01f;

    float y = c0;
    y = y * u + c1;
    y = y * u + c2;
    y = y * u + c3;
    y = y * u + c4;
    y = y * u + c5;
    y = y * u + c6;
    y = y * u + c7;
    y = y * u + c8;
    y = y * u + c9;
    y = y * u + c10;

    return y;
}

// Correct erf approximation
static inline float erf_approx(float x) {
    // Abramowitz & Stegun 7.1.26 coefficients
    // https://physicsgg.me/wp-content/uploads/2019/11/handbook-of-mathematical-functions-by-m.-abramowitz-i.-stegun.pdf
    const float a1 = 0.254829592f;
    const float a2 = -0.284496736f;
    const float a3 = 1.421413741f;
    const float a4 = -1.453152027f;
    const float a5 = 1.061405429f;
    const float p  = 0.3275911f;

    float sign = (x < 0.0f) ? -1.0f : 1.0f;
    if (x < 0.0f) {
        x = -x;
    }

    float t = 1.0f / (1.0f + p * x);
    float u = x * x;                    // u = x^2
    float exp_term = exp_minus_u_approx(u);

    float poly = (((((a5 * t + a4) * t + a3) * t + a2) * t + a1) * t);

    float y = 1.0f - poly * exp_term;

    // clamp to [-1,1] to avoid any fp overshoot (safety)
    if (y > 1.0f) y = 1.0f;
    if (y < -1.0f) y = -1.0f;

    return sign * y;
}

// Reference GELU using definition: 0.5 * x * (1 + erf(x / sqrt(2)))
static inline float gelu_ref_scalar(float x) {
    const float INV_SQRT2 = 0.70710678118654752440f; // 1 / sqrt(2)
    float t = x * INV_SQRT2;
    float e = erf_approx(t);
    return 0.5f * x * (1.0f + e);
}

__attribute__((noinline))
void gelu_ref(float *in, float *out, unsigned long n) {
    for (unsigned long i = 0; i < n; ++i) {
        out[i] = gelu_ref_scalar(in[i]);
    }
}
