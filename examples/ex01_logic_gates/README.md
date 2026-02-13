# Kalpkranti Example_01 : Basic logic Gates

This directory contains simple RTL implementations of basic logic gates
(`AND`, `OR`, `XOR`, `NOT`) written and simulated in Verilog.


## Prerequisites

- Icarus Verilog (`iverilog`)
- GTKWave (optional, for waveform viewing)

## Simulation with Icarus Verilog

Run simulations from the `sim/` directory.

### AND gate
```bash
iverilog -g2012 ../rtl/and.v tb_and.v -o tb_and.out
vvp tb_and.out
gtkwave and.vcd
```

### NOT gate

```
iverilog -g2012 ../rtl/not.v tb_not.v -o tb_not.out
vvp tb_not.out
gtkwave not.vcd
```
### OR gate
```
iverilog -g2012 ../rtl/or.v tb_or.v -o tb_or.out
vvp tb_or.out
gtkwave or.vcd

```

### XOR gate

```
iverilog -g2012 ../rtl/xor.v tb_xor.v -o tb_xor.out
vvp tb_xor.out
gtkwave xor.vcd

```

Each testbench generates a .vcd waveform file that can be inspected using GTKWave.

#### Notes

- Each gate has an independent testbench.

- Only combinational logic is used.

- The design is simulator-agnostic and uses standard Verilog constructs.