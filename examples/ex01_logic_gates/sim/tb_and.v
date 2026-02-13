`timescale 1ns/1ps

module tb_and;

  reg  i_a;
  reg  i_b;
  wire o_and;

  // DUT
  m_and dut (
    .i_a(i_a),
    .i_b(i_b),
    .o_and(o_and)
  );

  initial begin
    $dumpfile("and.vcd");
    $dumpvars(0, tb_and);

    i_a = 0; i_b = 0; #10;
    i_a = 0; i_b = 1; #10;
    i_a = 1; i_b = 0; #10;
    i_a = 1; i_b = 1; #10;

    $finish;
  end

endmodule

