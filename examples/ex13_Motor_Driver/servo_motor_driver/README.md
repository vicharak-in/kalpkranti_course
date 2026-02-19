# Kalpkranti Example : Servo Motor Driver 

This directory contains an RTL implementation of a Servo Motor Driver with angle-based position control, written and simulated in Verilog.

## Features

- Angle-based position control (0° to 180°)
- Standard servo PWM timing (1ms to 2ms pulse width)
- 50 Hz servo control signal
- 8-bit angle input resolution

## How Servo Control Works

Servo motors use PWM signals to control position (angle), not speed:

- **1.0 ms pulse**: Servo moves to 0° (far left)
- **1.5 ms pulse**: Servo moves to 90° (center position)
- **2.0 ms pulse**: Servo moves to 180° (far right)

The PWM signal repeats every 20ms (50 Hz), and the pulse width determines the servo angle.

## Prerequisites

* Icarus Verilog (`iverilog`)
* GTKWave (optional, for waveform viewing)

## Simulation with Icarus Verilog

Run simulation from the `sim/` directory:

```bash
iverilog -g2012 ../rtl/pwm_generator.v ../rtl/servo_motor_driver.v ../tb/servo_motor_driver_tb.v -o servo_motor_driver.out
vvp servo_motor_driver.out
gtkwave servo_motor_driver_tb.vcd
```

The testbench generates a `servo_motor_driver_tb.vcd` waveform file that can be inspected using GTKWave.

## Module Description

### servo_motor_driver.v (Top Module)
- Converts angle (0-180) to PWM pulse width
- Instantiates PWM generator with 50 Hz frequency
- **Inputs**: clk, reset, angle[7:0]
- **Outputs**: pwm_out

### pwm_generator.v
- Generates PWM signal based on duty cycle
- Configurable frequency and resolution
- **Inputs**: clk, reset, duty[15:0]
- **Outputs**: pwm_out

## Parameters

| Parameter | Default | Description |
|-----------|---------|-------------|
| CLK_FREQ | 50_000_000 | Clock frequency (Hz) |
| DUTY_WIDTH | 16 | Duty cycle resolution (bits) |
| SERVO_FREQ | 50 | Servo PWM frequency (Hz) - Fixed |

## Angle to Pulse Width Mapping

| Angle | Pulse Width | Position |
|-------|-------------|----------|
| 0° | 1.0 ms | Far Left |
| 45° | 1.25 ms | Quarter |
| 90° | 1.5 ms | Center |
| 135° | 1.75 ms | Three-quarter |
| 180° | 2.0 ms | Far Right |

## Testbench Sequence

The testbench tests the following angles:
1. 0° (1ms pulse)
2. 90° (1.5ms pulse)
3. 180° (2ms pulse)
4. 45° (1.25ms pulse)
5. 135° (1.75ms pulse)

Each angle is held for 40ms (2 PWM cycles) to observe stable output.

## Notes

* Servo PWM frequency is fixed at 50 Hz (20ms period)
* Pulse width range: 1ms to 2ms
* Angle input: 0 to 180 (8-bit value)
* The design is synthesizable and FPGA-ready
* Compatible with standard hobby servos (SG90, MG995, etc.)
