`timescale 1ns / 1ps

module RCA4
(
    input[3:0] a, b,
    input c_in,

    output[3:0] sum,
    output c_out
);

wire[3:0] carry;

wire[3:0] carry;

FA FA0( .a(a[0]),   .b(b[0]), .c_in(c_in),     .c_out(carry[0]), .sum(sum[0]) );
FA FA1( .a(a[1]),   .b(b[1]), .c_in(carry[0]), .c_out(carry[1]), .sum(sum[1]) );
FA FA2( .a(a[2]),   .b(b[2]), .c_in(carry[1]), .c_out(carry[2]), .sum(sum[2]) );
FA FA3( .a(a[3]),   .b(b[3]), .c_in(carry[2]), .c_out(carry[3]), .sum(sum[3]) );

assign c_out = carry[3];

endmodule