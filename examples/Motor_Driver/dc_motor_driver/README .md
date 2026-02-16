# Kalpkranti Example : DC Motor Driver 

This directory contains an RTL implementation of a DC Motor Driver with PWM-based speed control, written and simulated in Verilog.

## Features

- PWM generation for speed control
- Bidirectional motor control (forward/reverse)
- 16-bit speed resolution
- H-bridge interface signals

## How PWM Works

PWM (Pulse Width Modulation) controls motor speed by rapidly switching power ON and OFF:

- **High Duty Cycle** (e.g., 80%): Power is ON 80% of the time → Motor runs fast
- **Low Duty Cycle** (e.g., 20%): Power is ON 20% of the time → Motor runs slow
- **50% Duty Cycle**: Power is ON 50% of the time → Motor runs at medium speed

The PWM frequency (10 kHz default) is fast enough that the motor responds to the average power, creating smooth speed control.

## Prerequisites

* Icarus Verilog (`iverilog`)
* GTKWave (optional, for waveform viewing)

## Simulation with Icarus Verilog

Run simulation from the `sim/` directory:

```bash
iverilog -g2012 ../rtl/pwm_generator.v ../rtl/dc_motor_driver.v ../tb/dc_motor_driver_tb.v -o dc_motor_driver.out
vvp dc_motor_driver.out
gtkwave dc_motor.vcd
```

The testbench generates a `dc_motor.vcd` waveform file that can be inspected using GTKWave.

## Module Description

### dc_motor_driver.v (Top Module)
- Instantiates PWM generator
- Controls motor direction via H-bridge signals
- **Inputs**: clk, reset, enable, direction, speed[15:0]
- **Outputs**: pwm_out, motor_in1, motor_in2

### pwm_generator.v
- Generates PWM signal based on duty cycle
- Configurable frequency and resolution
- **Inputs**: clk, reset, duty[15:0]
- **Outputs**: pwm_out

## Parameters

| Parameter | Default | Description |
|-----------|---------|-------------|
| CLK_FREQ | 50_000_000 | Clock frequency (Hz) |
| PWM_FREQ | 10_000 | PWM frequency (Hz) |
| DUTY_WIDTH | 16 | Duty cycle resolution (bits) |

## Motor Control

| Direction | motor_in1 | motor_in2 | Action |
|-----------|-----------|-----------|--------|
| 1 | 1 | 0 | Forward |
| 0 | 0 | 1 | Reverse |

## Notes

* PWM duty cycle range: 0 to 5000 (for default parameters)
* The design is synthesizable and FPGA-ready
* Clock frequency: 50 MHz, PWM frequency: 10 kHz
