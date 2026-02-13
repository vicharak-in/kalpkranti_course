/* Verilog Implementation of or Gate  */


module m_or(input i_a,
	   input i_b,
	   output o_or);

    assign o_or = i_a | i_b;

endmodule
