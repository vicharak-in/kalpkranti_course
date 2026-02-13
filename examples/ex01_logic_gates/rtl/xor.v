/* Verilog Implementation of xor Gate  */


module m_xor( input i_a,
	   input i_b,
	   output o_xor);

    assign o_xor = i_a ^ i_b;

endmodule
