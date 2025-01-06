`timescale 1ns / 1ps

`define	D		0	// definition of the delay

module timedAND3(out, in1, in2, in3);

input in1, in2, in3;
output out;

and		#`D		and1(out, in1, in2, in3);


endmodule