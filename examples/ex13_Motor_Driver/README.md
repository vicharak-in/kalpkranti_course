
Readme · MD
Copy

# Kalpkranti Example_13 : PWM-Based Motor Driver

This directory contains RTL implementations of PWM-based motor drivers for DC motors and Servo motors, written in Verilog. The design is built around a reusable `pwm_generator` core that both drivers share.

## What Has Been Done

Two motor drivers have been implemented, both built on top of a shared `pwm_generator` submodule:

**1. `pwm_generator`** — A parameterizable PWM core that accepts a duty value and generates a PWM output at the desired frequency. The period count and counter width are auto-calculated from clock and PWM frequency parameters, making it easily reusable.

**2. `dc_motor_driver`** — Drives a DC motor through an H-bridge. Accepts a `speed` (duty cycle value) and `direction` input. When `enable` is high and `direction` is `1`, `motor_in1` carries the PWM signal and `motor_in2` stays low (forward). When `direction` is `0`, the signals are swapped (reverse). Both outputs go low when `enable` is de-asserted, effectively braking the motor.

**3. `servo_motor_driver`** — Drives a standard RC servo motor. It takes an `angle` input (0–180 degrees) and maps it to a pulse width between 1ms (0°) and 2ms (180°) at a 50 Hz PWM frequency — the standard servo control protocol. The duty value is computed combinationally and fed into the shared `pwm_generator`.

ex13_Motor_Driver/
├── dc_motor_driver/
└── servo_motor_driver/