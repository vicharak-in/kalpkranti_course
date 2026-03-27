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

reg [9:0] pos_x;
reg [21:0] counter;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        pos_x <= 0;
        counter <= 0;
    end else begin
        counter <= counter + 1;
        if (counter == 22'd200_000) begin
            counter <= 0;
            if (pos_x < 640)
                pos_x <= pos_x + 2;
            else
                pos_x <= 0;
        end
    end
end

always @(posedge clk or posedge reset) begin
    if (reset)
        rgb <= 3'b000;
    else if (!active_area)
        rgb <= 3'b000;
    else begin
        if (coord_x > pos_x && coord_x < pos_x + 40)
            rgb <= 3'b111; // white bar
        else
            rgb <= 3'b000;
    end
end

endmodule

