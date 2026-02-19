`timescale 1ns/1ps

module tb_dc_motor_driver;

    parameter CLK_FREQ   = 50_000_000;
    parameter PWM_FREQ   = 10_000; 
    parameter DUTY_WIDTH = 16;


    reg clk;
    reg reset;
    reg enable;
    reg direction;
    reg [DUTY_WIDTH-1:0] speed;

    wire motor_in1;
    wire motor_in2;


    dc_motor_driver #(
        .CLK_FREQ(CLK_FREQ),
        .PWM_FREQ(PWM_FREQ),
        .DUTY_WIDTH(DUTY_WIDTH)
    ) dut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .direction(direction),
        .speed(speed),
        .motor_in1(motor_in1),
        .motor_in2(motor_in2)
    );

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end


    initial begin
        $dumpfile("dc_motor.vcd");
        $dumpvars(0, tb_dc_motor_driver);


        reset = 1;
        enable = 0;
        direction = 0;
        speed = 0;

        #100;
        reset = 0;

        // Enable motor, forward, 50% speed
        enable = 1;
        direction = 1;
        speed = 2500;   // Half of 5000 period 
        #2_000_000;

        // Increase speed
        speed = 4000;
        #2_000_000;

        // Reverse direction
        direction = 0;
        #2_000_000;

        // Stop motor
        enable = 0;
        #1_000_000;

        $finish;
    end

endmodule
