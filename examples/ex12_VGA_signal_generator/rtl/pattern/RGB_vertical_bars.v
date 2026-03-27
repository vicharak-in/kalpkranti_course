// Project integration: Yash Siddhapura | siddhapurayash09@gmail.com
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

always @(posedge clk or posedge reset) begin
    if (reset)
        rgb <= 3'b000;
    else if (!active_area)
        rgb <= 3'b000;
    else begin
        if (coord_x < 213)
            rgb <= 3'b100; // Red
        else if (coord_x < 426)
            rgb <= 3'b010; // Green
        else
            rgb <= 3'b001; // Blue
    end
end

endmodule

