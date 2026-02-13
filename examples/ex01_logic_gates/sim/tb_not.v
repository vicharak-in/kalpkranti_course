`timescale 1ns/1ps

module tb_not;

  reg  in;
  wire out;

  // DUT
  m_not dut (
    .in(in),
    .out(out)
  );

  initial begin
    $dumpfile("not.vcd");
    $dumpvars(0, tb_not);

    in = 0; #10;
    in = 1; #10;

    $finish;
  end

endmodule

