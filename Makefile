CC = riscv64-unknown-linux-musl-gcc
OBJDUMP = riscv64-unknown-linux-musl-objdump
CFLAGS = -nostdlib -static -O2 -march=rv64gc_xtheadvector -mabi=lp64d -fno-pic -mcmodel=medany -fno-stack-protector

BOARD = 192.168.42.1
SRC = main.c gelu.c dish.c
OUT = activations

all: build deploy run

build: $(SRC)
	$(CC) $(CFLAGS) -o $(OUT) $(SRC)
	@file $(OUT)
	$(OBJDUMP) -d $(OUT) > $(OUT).asm

deploy: $(OUT)
	scp $(OUT) root@$(BOARD):/tmp/

run:
	ssh root@$(BOARD) /tmp/$(OUT)

clean:
	rm -f $(OUT) $(OUT).asm

# Run make targets inside the Nix sandbox without entering the shell
nix-%:
	nix develop --command $(MAKE) $*

.PHONY: all build deploy run clean
