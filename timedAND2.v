`timescale 1ns / 1ps

`define	D		0	// definition of the delay

// Delayed AND gate

module timedAND2(out, in1, in2);

input in1, in2;
output out;

and		#`D		and1(out, in1, in2);


endmodule
