module servo_motor_driver #(
    parameter CLK_FREQ = 50_000_000,
    parameter DUTY_WIDTH = 16
)(
    input   clk,
    input   reset,
    input   [7:0] angle,     // 0 to 180 degree
    output  pwm_out
);

    localparam integer SERVO_FREQ = 50;
    localparam integer PERIOD_COUNT = CLK_FREQ / SERVO_FREQ; // generate frequency of 50Hz for servo control

    localparam integer MIN_PULSE = CLK_FREQ / 1000;        // 1ms this is for o degree
    localparam integer MAX_PULSE = (CLK_FREQ * 2) / 1000;  // 2ms this is for 180 degree

    reg [DUTY_WIDTH-1:0] duty_value;

    always @(*) begin
        duty_value = MIN_PULSE + 
                    ((MAX_PULSE - MIN_PULSE) * angle) / 180;
    end

    pwm_generator #(
        .CLK_FREQ(CLK_FREQ),
        .PWM_FREQ(SERVO_FREQ),
        .DUTY_WIDTH(DUTY_WIDTH)
    ) pwm_inst (
        .clk(clk),
        .reset(reset),
        .duty(duty_value),
        .pwm_out(pwm_out)
    );

endmodule
