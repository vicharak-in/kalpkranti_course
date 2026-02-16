module dc_motor_driver #(
    parameter CLK_FREQ = 50_000_000,
    parameter PWM_FREQ = 10_000, 
    parameter DUTY_WIDTH = 16
)(
    input   clk,
    input   reset,
    input   enable,
    input   direction,                 
    input   [DUTY_WIDTH-1:0] speed,  
    output  motor_in1,
    output  motor_in2
);

    wire pwm_signal;

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

    assign motor_in1 = enable ? (direction ? pwm_signal : 1'b0) : 1'b0;
    assign motor_in2 = enable ? (direction ? 1'b0 : pwm_signal) : 1'b0;

endmodule
