`timescale 1ns/1ps

module servo_motor_driver_tb;

    // -----------------------------------
    // Parameters (match DUT)
    // -----------------------------------
    parameter CLK_FREQ = 50_000_000;
    parameter DUTY_WIDTH = 20;

    // -----------------------------------
    // Testbench signals
    // -----------------------------------
    reg clk;
    reg reset;
    reg [7:0] angle;
    wire pwm_out;

    // -----------------------------------
    // Instantiate DUT
    // -----------------------------------
    servo_motor_driver #(
        .CLK_FREQ(CLK_FREQ),
        .DUTY_WIDTH(DUTY_WIDTH)
    ) dut (
        .clk(clk),
        .reset(reset),
        .angle(angle),
        .pwm_out(pwm_out)
    );

    // -----------------------------------
    // Clock generation (50 MHz)
    // Period = 20 ns
    // -----------------------------------
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    // -----------------------------------
    // Dump waveform
    // -----------------------------------
    initial begin
        $dumpfile("servo_motor_driver_tb.vcd");
        $dumpvars(0, servo_motor_driver_tb);
    end

    // -----------------------------------
    // Test sequence
    // -----------------------------------
    initial begin
        $display("Starting Servo Driver Test...");
        
        reset = 1;
        angle = 0;
        #100;
        reset = 0;

        // 0 degree → 1ms pulse
        angle = 0;
        $display("Angle = 0");
        #40_000_000;   // wait 40 ms

        // 90 degree → 1.5ms pulse
        angle = 90;
        $display("Angle = 90");
        #40_000_000;

        // 180 degree → 2ms pulse
        angle = 180;
        $display("Angle = 180");
        #40_000_000;

        // random test
        angle = 45;
        $display("Angle = 45");
        #40_000_000;

        angle = 135;
        $display("Angle = 135");
        #40_000_000;

        $display("Test Complete");
        $finish;
    end

endmodule
