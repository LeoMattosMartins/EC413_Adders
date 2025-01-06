`timescale 1ns / 1ps

module RCA64
(
    // Inputs
    input[63:0] a, b,
    input c_in,

    // Outputs
    output[63:0] sum,
    output c_out
);

wire[15:0] carry;

// 16 4 bit RCAs stacked on top of each other
RCA4 RCA40( .a(a[3:0]),    .b(b[3:0]),    .c_in(c_in),       .c_out(carry[0]),  .sum(sum[3:0]) );
RCA4 RCA41( .a(a[7:4]),    .b(b[7:4]),    .c_in(carry[0]),   .c_out(carry[1]),  .sum(sum[7:4]) );
RCA4 RCA42( .a(a[11:8]),   .b(b[11:8]),   .c_in(carry[1]),   .c_out(carry[2]),  .sum(sum[11:8]) );
RCA4 RCA43( .a(a[15:12]),  .b(b[15:12]),  .c_in(carry[2]),   .c_out(carry[3]),  .sum(sum[15:12]) );
RCA4 RCA44( .a(a[19:16]),  .b(b[19:16]),  .c_in(carry[3]),   .c_out(carry[4]),  .sum(sum[19:16]) );
RCA4 RCA45( .a(a[23:20]),  .b(b[23:20]),  .c_in(carry[4]),   .c_out(carry[5]),  .sum(sum[23:20]) );
RCA4 RCA46( .a(a[27:24]),  .b(b[27:24]),  .c_in(carry[5]),   .c_out(carry[6]),  .sum(sum[27:24]) );
RCA4 RCA47( .a(a[31:28]),  .b(b[31:28]),  .c_in(carry[6]),   .c_out(carry[7]),  .sum(sum[31:28]) );
RCA4 RCA48( .a(a[35:32]),  .b(b[35:32]),  .c_in(carry[7]),   .c_out(carry[8]),  .sum(sum[35:32]) );
RCA4 RCA49( .a(a[39:36]),  .b(b[39:36]),  .c_in(carry[8]),   .c_out(carry[9]),  .sum(sum[39:36]) );
RCA4 RCA410( .a(a[43:40]), .b(b[43:40]),  .c_in(carry[9]),   .c_out(carry[10]), .sum(sum[43:40]) );
RCA4 RCA411( .a(a[47:44]), .b(b[47:44]),  .c_in(carry[10]),  .c_out(carry[11]), .sum(sum[47:44]) );
RCA4 RCA412( .a(a[51:48]), .b(b[51:48]),  .c_in(carry[11]),  .c_out(carry[12]), .sum(sum[51:48]) );
RCA4 RCA413( .a(a[55:52]), .b(b[55:52]),  .c_in(carry[12]),  .c_out(carry[13]), .sum(sum[55:52]) );
RCA4 RCA414( .a(a[59:56]), .b(b[59:56]),  .c_in(carry[13]),  .c_out(carry[14]), .sum(sum[59:56]) );
RCA4 RCA415( .a(a[63:60]), .b(b[63:60]),  .c_in(carry[14]),  .c_out(carry[15]), .sum(sum[63:60]) );

assign c_out = carry[15];

endmodule