`timescale 1ns/1ps

module tb_xor;

  reg  i_a;
  reg  i_b;
  wire o_xor;

  // DUT
  m_xor dut (
    .i_a(i_a),
    .i_b(i_b),
    .o_xor(o_xor)
  );

  initial begin
    $dumpfile("xor.vcd");
    $dumpvars(0, tb_xor);

    i_a = 0; i_b = 0; #10;
    i_a = 0; i_b = 1; #10;
    i_a = 1; i_b = 0; #10;
    i_a = 1; i_b = 1; #10;

    $finish;
  end

endmodule

