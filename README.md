# low-level-reading-milkv

This repo is a collection of activation functions using RISC-V Vector Extension (RVV) intrinsics and compiled for the Milk-V board.

## What's Inside

| File          | Description                                               |
| ------------- | --------------------------------------------------------- |
| main.c        | Main program that runs the activation functions.          |
| gelu.c        | Implementation of the GELU activation rvv and ref         |
| dish.c        | Implementation of the DiSH activation rvv and ref         |
| nostdstub.h   | Helpers for printing and timing without standard library. |
| activations.h | Header file for activation functions.                     |

## Notes

We explicitly avoid using the standard library for learning purposes; this helps keep the assembly output clean and understandable and forces us to avoid any hidden functionality. This may change in the future but for now, it's a deliberate choice.

Time is confusing and complicated so we avoid it all together by using the RISC-V `rdcycle` instruction to read the cycle counter directly. This should serve as a precise and consistent measure of performance across runs without worrying about wall-clock time variations. Again, this may change in the future but for now, it's a deliberate choice.

## Other reading group members implementations

I'd like to highlight other implementations from members of the low-level reading group (which are likely more complete and optimized than this one):

- [https://github.com/danieldk/low-level-rg](https://github.com/danieldk/low-level-rg)
- [https://github.com/ErikKaum/lactose](https://github.com/ErikKaum/lactose)

## Build and Run on Milk-V

```bash
make nix-all
```

## Example Output

```txt
nix develop --command /Applications/Xcode.app/Contents/Developer/usr/bin/make all
riscv64-unknown-linux-musl-gcc -nostdlib -static -O2 -march=rv64gc_xtheadvector -mabi=lp64d -fno-pic -mcmodel=medany -fno-stack-protector -o activations main.c gelu.c dish.c
activations: ELF 64-bit LSB executable, UCB RISC-V, RVC, double-float ABI, version 1 (SYSV), statically linked, not stripped
riscv64-unknown-linux-musl-objdump -d activations > activations.asm
scp activations root@192.168.42.1:/tmp/
activations              100%   10KB   1.9MB/s   00:00
ssh root@192.168.42.1 /tmp/activations
activations

gelu rvv vs ref:
  gelu(-2.0000) = -0.0353 / -0.0455
  gelu(-1.0000) = -0.1763 / -0.1586
  gelu(-0.5000) = -0.1625 / -0.1542
  gelu(0.0000) = 0.0000 / 0.0000
  gelu(0.5000) = 0.3374 / 0.3457
  gelu(1.0000) = 0.8236 / 0.8413
  gelu(2.0000) = 1.9646 / 1.9544
  gelu(3.0000) = 2.9986 / 2.9959

dish rvv vs ref:
  dish(-2.0000) = -0.1055 / -0.1055
  dish(-1.0000) = -0.1464 / -0.1464
  dish(-0.5000) = -0.1381 / -0.1381
  dish(0.0000) = 0.0000 / 0.0000
  dish(0.5000) = 0.3618 / 0.3618
  dish(1.0000) = 0.8535 / 0.8535
  dish(2.0000) = 1.8944 / 1.8944
  dish(3.0000) = 2.9230 / 2.9230

gelu_rvv: 1024 x 10000
  cycles: 250243195
  cycles/iter: 25024
  cycles/elem: 24
  throughput: 40 million elements/sec

gelu_ref: 1024 x 10000
  cycles: 1350506438
  cycles/iter: 135050
  cycles/elem: 131
  throughput: 7 million elements/sec

dish_rvv: 1024 x 10000
  cycles: 189546882
  cycles/iter: 18954
  cycles/elem: 18
  throughput: 54 million elements/sec

dish_ref: 1024 x 10000
  cycles: 1635780170
  cycles/iter: 163578
  cycles/elem: 159
  throughput: 6 million elements/sec
```