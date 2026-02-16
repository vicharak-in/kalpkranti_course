module pwm_generator #(
    parameter CLK_FREQ = 50_000_000,   // Input clock frequency (Hz)
    parameter PWM_FREQ = 10_000,        // Desired PWM frequency (Hz)
    parameter DUTY_WIDTH = 16          // Resolution of duty input
)(
    input  wire clk,
    input  wire reset,
    input  wire [DUTY_WIDTH-1:0] duty, // Duty value (0 → PERIOD_COUNT)
    output reg  pwm_out
);

    // Calculate period count from clock and PWM frequency
    localparam integer PERIOD_COUNT = CLK_FREQ / PWM_FREQ;

    // Counter width auto-calculated
    localparam COUNTER_WIDTH = $clog2(PERIOD_COUNT);

    reg [COUNTER_WIDTH-1:0] counter = 0;

    always @(posedge clk or posedge reset) begin
        if (reset)
            counter <= 0;
        else if (counter == PERIOD_COUNT - 1)
            counter <= 0;
        else
            counter <= counter + 1;
    end

    // PWM generation
    always @(posedge clk or posedge reset) begin
        if (reset)
            pwm_out <= 0;
        else if (counter < duty)
            pwm_out <= 1;
        else
            pwm_out <= 0;
    end

endmodule
