// Project integration: Yash Siddhapura | siddhapurayash09@gmail.com
`timescale 1ns/1ps

module graphics (
    input  wire        clk,
    input  wire        reset,
    input  wire        up,
    input  wire        down,
    input  wire        left,
    input  wire        right,
    input  wire        active_area,
    input  wire [9:0]  coord_x,
    input  wire [9:0]  coord_y,
    output reg  [2:0]  rgb
);

// ball position
reg [9:0] ball_x;
reg [9:0] ball_y;

// direction
reg dir_x;
reg dir_y;

// speed control
reg [21:0] counter;

// ball radius
parameter RADIUS = 15;

// screen limits
parameter MAX_X = 640;
parameter MAX_Y = 480;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        ball_x <= 100;
        ball_y <= 100;
        dir_x <= 0;
        dir_y <= 0;
        counter <= 0;
    end else begin
        counter <= counter + 1;

        if (counter == 22'd200_000) begin
            counter <= 0;

            // horizontal movement
            if (dir_x == 0)
                ball_x <= ball_x + 2;
            else
                ball_x <= ball_x - 2;

            // vertical movement
            if (dir_y == 0)
                ball_y <= ball_y + 2;
            else
                ball_y <= ball_y - 2;

            // bounce logic X
            if (ball_x <= RADIUS)
                dir_x <= 0;
            else if (ball_x >= MAX_X - RADIUS)
                dir_x <= 1;

            // bounce logic Y
            if (ball_y <= RADIUS)
                dir_y <= 0;
            else if (ball_y >= MAX_Y - RADIUS)
                dir_y <= 1;
        end
    end
end

// circle drawing
wire signed [10:0] dx;
wire signed [10:0] dy;
wire [21:0] dist_sq;

assign dx = coord_x - ball_x;
assign dy = coord_y - ball_y;
assign dist_sq = dx*dx + dy*dy;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        rgb <= 3'b000;
    end
    else begin
        if (!active_area)
            rgb <= 3'b000;
        else begin
            if (dist_sq < RADIUS*RADIUS)
                rgb <= 3'b001; // blue ball
            else
                rgb <= 3'b000;
        end
    end
end

endmodule

