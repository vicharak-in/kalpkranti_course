# kalpkranti_course
Coursework for kalpkranti




## Repo Structure to-be

```
kalpkranti-course/
│
├── README.md
├── LICENSE.md
├── CONTRIBUTING.md
│
├── docs/                             # Course documentation
│   ├── intro/
│   ├── shrike-architecture/
│   ├── fpga-firmware-codesign/
│   ├── verification-philosophy/
│   ├── debugging/
│   └── glossary.md
│
├── fpga/                           # Board-specific info
│   ├── shrike_v1/
│   │   ├── project.ffpga
│   │   ├── clocks.md
│   │   └── power.md
│   └── shrike_v2/
│
├── common/                           # Reusable IP (NOT examples)
│   ├── fpga/
│   │   ├── rtl/
│   │   │   ├── reset_sync/
│   │   │   ├── fifo/
│   │   │   ├── uart/
│   │   │   └── spi/
│   │   │
│   │   └── verification/
│   │       ├── clock_gen.sv
│   │       ├── spi_master_bfm.sv
│   │       ├── uart_monitor.sv
│   │       └── reset_agent.sv
│   │
│   └── firmware/
│       ├── drivers/
│       └── utils/
│
├── examples/                         # main 10 examples
│
│   ├── ex01_gate_basics/
│   │   ├── README.md
│   │   ├── docs/
│   │   │   ├── concept.md
│   │   │   ├── block_diagram.md
│   │   │   └── exercises.md
│   │   │
│   │   ├── src/
│   │   │   ├── rtl/                 
│   │   │   │   ├── top.sv
│   │   │   │   └── gpio_regs.sv
│   │   │   │
│   │   │   ├── tb/                  
│   │   │   │   ├── tb_top.sv
│   │   │   │   └── sequences/
│   │   │   │       └── gpio_toggle_seq.sv
│   │   │   │
│   │   │   ├── sim/                  
│   │   │   │   ├── filelists/
│   │   │   │   │   ├── rtl.f
│   │   │   │   │   └── tb.f
│   │   │   │   │
│   │   │   │   ├── scripts/
│   │   │   │   │   ├── run_iverilog.sh
│   │   │   │   │   └── run_verilator.sh
│   │   │   │   │
│   │   │   │   ├── waves/
│   │   │   │   │   └── .gitkeep
│   │   │   │
│   │   │   │
│   │   │   └── README.md
│   │   │
│   │   ├── firmware/
│   │   │   ├── src/
│   │   │   │   └── main.c
│   │   │   │
│   │   │   ├── include/
│   │   │   │   └── hw_map.h
│   │   │   │
│   │   │   ├── scripts/
│   │   │   │   └── flash.sh
│   │   │   │
│   │   │   └── README.md
│   │   │
│   │   └── results/
│   │       ├── logs/
│   │       ├── scope_captures/
│   │       └── notes.md
│
│   ├── ex02_/
│   ├── ex03_/
│   ├── ex ---- 
│   ├── ex10_/
│
├── tools/                           
│   ├── build.sh
│   ├── flash.py
│
└──

```
