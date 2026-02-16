module dc_motor_driver #(
    parameter CLK_FREQ = 50_000_000,
    parameter PWM_FREQ = 10_000, 
    parameter DUTY_WIDTH = 16
)(
    input  wire clk,
    input  wire reset,
    input  wire enable,                     // Motor enable
    input  wire direction,                  // 1 = forward, 0 = reverse
    input  wire [DUTY_WIDTH-1:0] speed,    // Speed control (duty value)
    output pwm_out,
    output wire motor_in1,                  // To H-bridge input 1
    output wire motor_in2                   // To H-bridge input 2
);

    wire pwm_signal;

    assign pwm_out = pwm_signal;


    pwm_generator #(
        .CLK_FREQ(CLK_FREQ),
        .PWM_FREQ(PWM_FREQ),
        .DUTY_WIDTH(DUTY_WIDTH)
    ) pwm_inst (
        .clk(clk),
        .reset(reset),
        .duty(speed),
        .pwm_out(pwm_signal)
    );

    // Motor control logic
    assign motor_in1 = (direction) ?  1'b1 : 1'b0; // forward 
    assign motor_in2 = (direction) ? 1'b0 : 1'b1; // reverse

endmodule
