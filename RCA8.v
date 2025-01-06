`timescale 1ns / 1ps

module RCA8
(
    input[7:0] a, b,
    input c_in,

    output[7:0] sum,
    output c_out
);

wire[1:0] carry;


RCA4 RCA40( .a(a[3:0]),    .b(b[3:0]),    .c_in(c_in),       .c_out(carry[0]),  .sum(sum[3:0]) );
RCA4 RCA41( .a(a[7:4]),    .b(b[7:4]),    .c_in(carry[0]),   .c_out(carry[1]),  .sum(sum[7:4]) );


assign c_out = carry[1];

endmodule