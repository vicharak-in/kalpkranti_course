`timescale 1ns/1ps

module tb_or;

  reg  i_a;
  reg  i_b;
  wire o_or;

  // DUT
  m_or dut (
    .i_a(i_a),
    .i_b(i_b),
    .o_or(o_or)
  );

  initial begin
    $dumpfile("or.vcd");
    $dumpvars(0, tb_or);

    i_a = 0; i_b = 0; #10;
    i_a = 0; i_b = 1; #10;
    i_a = 1; i_b = 0; #10;
    i_a = 1; i_b = 1; #10;

    $finish;
  end

endmodule

