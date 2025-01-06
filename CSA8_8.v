`timescale 1ns / 1ps

module CSA8_8
(
    input[63:0] a, b,
    input c_in,

    output[63:0] sum,
    output c_out
);

    wire carry;    
    wire[6:0] muxAND, muxOR, c_out_partial_0, c_out_partial_1;
    wire[7:0] sum_partial_0 [7:0];
    wire[7:0] sum_partial_1 [7:0];                  

    // first RCA
    RCA8 RCA80 (.a(a[7:0]), .b(b[7:0]), .c_in(c_in), .sum(sum[7:0]), .c_out(carry) );
    
    // first block of CSA
    RCA8 RCA81 (.a(a[15:8]), .b(b[15:8]), .c_in(1'b0), .sum(sum_partial_0[0]), .c_out(c_out_partial_0[0]));
    RCA8 RCA82 (.a(a[15:8]), .b(b[15:8]), .c_in(1'b1), .sum(sum_partial_1[0]), .c_out(c_out_partial_1[0]));
    
    // logic for selecting output from first block 
    timedAND2 AND1 (muxAND[0], c_out_partial_1[0], carry);
    timedOR2 OR1 (muxOR[0], c_out_partial_0[0], muxAND[0]);
    
    assign sum[15:8] = (muxOR[0]) ? sum_partial_1[0] : sum_partial_0[0];
    
    // repeats previous step 6 times
    RCA8 RCA83 (.a(a[23:16]), .b(b[23:16]), .c_in(1'b0), .sum(sum_partial_0[1]), .c_out(c_out_partial_0[1]));
    RCA8 RCA84 (.a(a[23:16]), .b(b[23:16]), .c_in(1'b1), .sum(sum_partial_1[1]), .c_out(c_out_partial_1[1]));
    
    timedAND2 AND2 (muxAND[1], c_out_partial_1[1], muxOR[0]);
    timedOR2 OR2 (muxOR[1], c_out_partial_0[1], muxAND[1]);
    
    assign sum[23:16] = (muxOR[1]) ? sum_partial_1[1] : sum_partial_0[1];
    
    RCA8 RCA85 (.a(a[31:24]), .b(b[31:24]), .c_in(1'b0), .sum(sum_partial_0[2]), .c_out(c_out_partial_0[2]));
	RCA8 RCA86 (.a(a[31:24]), .b(b[31:24]), .c_in(1'b1), .sum(sum_partial_1[2]), .c_out(c_out_partial_1[2]));
    
	timedAND2 AND3 (muxAND[2], c_out_partial_1[2], muxOR[1]);
	timedOR2 OR3 (muxOR[2], c_out_partial_0[2], muxAND[2]);
    
	assign sum[31:24] = (muxOR[2]) ? sum_partial_1[2] : sum_partial_0[2];

    RCA8 RCA87 (.a(a[39:32]), .b(b[39:32]), .c_in(1'b0), .sum(sum_partial_0[3]), .c_out(c_out_partial_0[3]));
	RCA8 RCA88 (.a(a[39:32]), .b(b[39:32]), .c_in(1'b1), .sum(sum_partial_1[3]), .c_out(c_out_partial_1[3]));
    
	timedAND2 AND4 (muxAND[3], c_out_partial_1[3], muxOR[2]);
	timedOR2 OR4 (muxOR[3], c_out_partial_0[3], muxAND[3]);
    
	assign sum[39:32] = (muxOR[3]) ? sum_partial_1[3] : sum_partial_0[3];

    RCA8 RCA89 (.a(a[47:40]), .b(b[47:40]), .c_in(1'b0), .sum(sum_partial_0[4]), .c_out(c_out_partial_0[4]));
	RCA8 RCA810 (.a(a[47:40]), .b(b[47:40]), .c_in(1'b1), .sum(sum_partial_1[4]), .c_out(c_out_partial_1[4]));
    
	timedAND2 AND5 (muxAND[4], c_out_partial_1[4], muxOR[3]);
	timedOR2 OR5 (muxOR[4], c_out_partial_0[4], muxAND[4]);
    
	assign sum[47:40] = (muxOR[4]) ? sum_partial_1[4] : sum_partial_0[4];

    RCA8 RCA811 (.a(a[55:48]), .b(b[55:48]), .c_in(1'b0), .sum(sum_partial_0[5]), .c_out(c_out_partial_0[5]));
	RCA8 RCA812 (.a(a[55:48]), .b(b[55:48]), .c_in(1'b1), .sum(sum_partial_1[5]), .c_out(c_out_partial_1[5]));
    
	timedAND2 AND6 (muxAND[5], c_out_partial_1[5], muxOR[4]);
	timedOR2 OR6 (muxOR[5], c_out_partial_0[5], muxAND[5]);
    
	assign sum[55:48] = (muxOR[5]) ? sum_partial_1[5] : sum_partial_0[5];
	
	RCA8 RCA813 (.a(a[63:56]), .b(b[63:56]), .c_in(1'b0), .sum(sum_partial_0[6]), .c_out(c_out_partial_0[6]));
	RCA8 RCA814 (.a(a[63:56]), .b(b[63:56]), .c_in(1'b1), .sum(sum_partial_1[6]), .c_out(c_out_partial_1[6]));
    
	timedAND2 AND7 (muxAND[6], c_out_partial_1[6], muxOR[5]);
	timedOR2 OR7 (muxOR[6], c_out_partial_0[6], muxAND[6]);
    
	assign sum[63:56] = (muxOR[6]) ? sum_partial_1[6] : sum_partial_0[6];

    assign c_out = (muxOR[6]);

endmodule