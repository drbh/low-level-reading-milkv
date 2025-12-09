// nostdstub.h - bare metal helpers for RISC-V (no libc)
#ifndef NOSTDSTUB_H
#define NOSTDSTUB_H

#define SYS_write 64
#define SYS_exit 93

static void print(const char *s) {
    const char *p = s;
    while (*p) p++;
    register long a7 asm("a7") = SYS_write;
    register long a0 asm("a0") = 1;
    register long a1 asm("a1") = (long)s;
    register long a2 asm("a2") = p - s;
    asm volatile ("ecall" : "+r"(a0) : "r"(a1), "r"(a2), "r"(a7));
}

static void print_int(unsigned long n) {
    char buf[24];
    int i = 0;
    if (n == 0) { buf[i++] = '0'; }
    else {
        char t[24]; int j = 0;
        while (n) { t[j++] = '0' + n % 10; n /= 10; }
        while (j) buf[i++] = t[--j];
    }
    buf[i] = 0;
    print(buf);
}

static void print_float(float f) {
    char buf[16];
    int i = 0;
    if (f < 0) { buf[i++] = '-'; f = -f; }
    int integer = (int)f;
    int frac = (int)((f - integer) * 10000);
    if (integer == 0) buf[i++] = '0';
    else {
        char t[8]; int j = 0;
        while (integer) { t[j++] = '0' + integer % 10; integer /= 10; }
        while (j) buf[i++] = t[--j];
    }
    buf[i++] = '.';
    for (int k = 3; k >= 0; k--) { buf[i + k] = '0' + frac % 10; frac /= 10; }
    buf[i + 4] = 0;
    print(buf);
}

// Read cycle counter (RDCYCLE)
// The RDCYCLE pseudo-instruction reads the low XLEN bits of the cycle CSR which holds a count
// of the number of clock cycles executed by the processor on which the hardware thread is running
// from an arbitrary start time in the past.
// https://www2.eecs.berkeley.edu/Pubs/TechRpts/2016/EECS-2016-118.pdf
static inline unsigned long rdcycle(void) {
    unsigned long cycles;
    asm volatile ("rdcycle %0" : "=r"(cycles));
    return cycles;
}

// Exit program
static inline void exit_program(int code) {
    register long a7 asm("a7") = SYS_exit;
    register long a0 asm("a0") = code;
    asm volatile ("ecall" : : "r"(a0), "r"(a7));
}

// Benchmark helper
typedef void (*bench_fn)(float *in, float *out, unsigned long n);

static void benchmark(const char *name, bench_fn fn, float *in, float *out,
                      unsigned long size, int iters, int warmup) {
    print(name); print(": ");
    print_int(size); print(" x "); print_int(iters); print("\n");

    // warmup
    for (int i = 0; i < warmup; i++) {
        fn(in, out, size);
    }

    // timed
    unsigned long start = rdcycle();
    for (int i = 0; i < iters; i++) {
        fn(in, out, size);
    }
    unsigned long end = rdcycle();

    unsigned long total_cycles = end - start;
    unsigned long cycles_per_iter = total_cycles / iters;
    unsigned long cycles_per_elem = cycles_per_iter / size;
    unsigned long meps = (1000UL * size) / cycles_per_iter;

    print("  cycles: "); print_int(total_cycles); print("\n");
    print("  cycles/iter: "); print_int(cycles_per_iter); print("\n");
    print("  cycles/elem: "); print_int(cycles_per_elem); print("\n");
    print("  throughput: "); print_int(meps); print(" million elements/sec\n");
}

#endif
