/* Verilog Implementation of and Gate  */


module m_and (input i_a,
	        input i_b,
	        output o_and);

    assign o_and = i_a & i_b;

endmodule
