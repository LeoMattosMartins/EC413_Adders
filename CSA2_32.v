`timescale 1ns / 1ps

module CSA2_32
(
    //inputs
    input[63:0] a, b,
    input c_in,

    //outputs
    output[63:0] sum,
    output c_out
);

wire [31:0] sum_0, sum_1;
wire c_out_0, c_out_1;

// first half - 32 RCA
RCA32 RCA320 (.a(a[31:0]), .b(b[31:0]), .c_in(c_in), .sum(sum[31:0]), .c_out(partial_c_out) );


// second half - 32 bit RCA if c_out is 0 or 1
RCA32 RCA321 (.a(a[63:32]), .b(b[63:32]), .c_in(0), .sum(sum_0), .c_out(c_out_0) );
RCA32 RCA322 (.a(a[63:32]), .b(b[63:32]), .c_in(1), .sum(sum_1), .c_out(c_out_1) );

// MUX to decide which one of the partial sums ot take
assign sum[63:32] = (partial_c_out) ? (sum_1) : (sum_0);
assign c_out = (partial_c_out) ? (c_out_1) : (c_out_0);

endmodule
