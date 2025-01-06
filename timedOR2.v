`timescale 1ns / 1ps

`define	D		1	// definition of the delay

// Delayed OR gate

module timedOR2(out, in1, in2);

input in1, in2;
output out;

or		#`D		or1(out, in1, in2);


endmodule
