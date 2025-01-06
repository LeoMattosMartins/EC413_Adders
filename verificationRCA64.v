`timescale 1ns / 1ps

module verificationRCA64
(
    input[63:0] a, b,
    input c_in,

    output[63:0] sum,
    output c_out
);
    // check add with behavioural logic 
	assign {c_out, sum} = a + b + c_in;

endmodule
