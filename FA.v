`timescale 1ns / 1ps

module FA
(
input	a, b, c_in,
output	c_out, sum
);

wire		not_a, not_b, not_c;
wire		and1_out, and2_out, and3_out, and4_out, and5_out, and6_out, and7_out;

not	   not1		(not_a, a); 
not	   not2		(not_b, b);
not	   not3		(not_c, c_in);

// get sum
timedAND3	   and1		(and1_out, a, not_b, not_c);
timedAND3	   and2		(and2_out, not_a, b, not_c);  
timedAND3	   and3		(and3_out, not_a, not_b, c_in); 
timedAND3	   and4		(and4_out, a, b, c_in);
timedOR4	   or1		(sum, and1_out, and2_out, and3_out, and4_out);

timedAND2	   and5		(and5_out, a, c_in);
timedAND2	   and6		(and6_out, b, c_in);
timedAND2	   and7		(and7_out, a, b);
timedOR3	   or2		(c_out, and5_out, and6_out, and7_out);

endmodule