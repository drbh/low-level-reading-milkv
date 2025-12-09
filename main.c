#include "nostdstub.h"
#include "activations.h"

// Benchmark configuration
#define BENCH_SIZE 1024
#define BENCH_ITERS 10000
#define WARMUP_ITERS 100

void _start() {
    print("activations\n\n");

    float __attribute__((aligned(16))) in[8] = {-2.0f, -1.0f, -0.5f, 0.0f, 0.5f, 1.0f, 2.0f, 3.0f};
    float __attribute__((aligned(16))) out[8];
    float __attribute__((aligned(16))) out2[8];

    // gelu correctness check
    gelu_rvv(in, out, 8);
    gelu_ref(in, out2, 8);

    // print the results of both implementations
    print("gelu rvv vs ref:\n");
    for (int i = 0; i < 8; i++) {
        print("  gelu("); print_float(in[i]); print(") = ");
        print_float(out[i]); print(" / "); print_float(out2[i]); print("\n");
    }

    // dish correctness check
    dish_rvv(in, out, 8);
    dish_ref(in, out2, 8);

    // print the results of both implementations
    print("\ndish rvv vs ref:\n");
    for (int i = 0; i < 8; i++) {
        print("  dish("); print_float(in[i]); print(") = ");
        print_float(out[i]); print(" / "); print_float(out2[i]); print("\n");
    }

    // benchmark arrays
    float __attribute__((aligned(16))) bench_in[BENCH_SIZE];
    float __attribute__((aligned(16))) bench_out[BENCH_SIZE];

    // hydrate benchmark input
    for (int i = 0; i < BENCH_SIZE; i++) {
        bench_in[i] = (float)(i % 100) / 25.0f - 2.0f;
    }

    print("\n");
    benchmark("gelu_rvv", gelu_rvv, bench_in, bench_out, BENCH_SIZE, BENCH_ITERS, WARMUP_ITERS);
    print("\n");
    benchmark("gelu_ref", gelu_ref, bench_in, bench_out, BENCH_SIZE, BENCH_ITERS, WARMUP_ITERS);
    print("\n");
    benchmark("dish_rvv", dish_rvv, bench_in, bench_out, BENCH_SIZE, BENCH_ITERS, WARMUP_ITERS);
    print("\n");
    benchmark("dish_ref", dish_ref, bench_in, bench_out, BENCH_SIZE, BENCH_ITERS, WARMUP_ITERS);

    exit_program(0);
}
