`timescale 1ns / 1ps

`define	D		0	// definition of the delay

// Delayed OR gate

module timedOR4(out, in1, in2, in3, in4);

input in1, in2, in3, in4;
output out;

or		#`D		or1 (out, in1, in2, in3, in4);


endmodule