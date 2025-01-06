`timescale 1ns / 1ps

`define	D		0	// definition of the delay

// Delayed OR gate

module timedOR3(out, in1, in2, in3);

input in1, in2, in3;
output out;

or		#`D		or1 (out, in1, in2, in3);


endmodule