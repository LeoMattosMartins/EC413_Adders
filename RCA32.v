`timescale 1ns / 1ps

module RCA32
(
    input[31:0] a, b,
    input c_in,

    output[31:0] sum,
    output c_out
);

wire[7:0] carry;


RCA4 RCA40( .a(a[3:0]),    .b(b[3:0]),    .c_in(c_in),       .c_out(carry[0]),  .sum(sum[3:0]) );
RCA4 RCA41( .a(a[7:4]),    .b(b[7:4]),    .c_in(carry[0]),   .c_out(carry[1]),  .sum(sum[7:4]) );
RCA4 RCA42( .a(a[11:8]),   .b(b[11:8]),   .c_in(carry[1]),   .c_out(carry[2]),  .sum(sum[11:8]) );
RCA4 RCA43( .a(a[15:12]),  .b(b[15:12]),  .c_in(carry[2]),   .c_out(carry[3]),  .sum(sum[15:12]) );
RCA4 RCA44( .a(a[19:16]),  .b(b[19:16]),  .c_in(carry[3]),   .c_out(carry[4]),  .sum(sum[19:16]) );
RCA4 RCA45( .a(a[23:20]),  .b(b[23:20]),  .c_in(carry[4]),   .c_out(carry[5]),  .sum(sum[23:20]) );
RCA4 RCA46( .a(a[27:24]),  .b(b[27:24]),  .c_in(carry[5]),   .c_out(carry[6]),  .sum(sum[27:24]) );
RCA4 RCA47( .a(a[31:28]),  .b(b[31:28]),  .c_in(carry[6]),   .c_out(carry[7]),  .sum(sum[31:28]) );

assign c_out = carry[7];

endmodule