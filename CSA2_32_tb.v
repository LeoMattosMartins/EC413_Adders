`timescale 1ns / 1ps

module CSA2_32_tb( );
    // Inputs
    reg [63:0] a, b;
    reg c_in;

    // Outputs
    wire [63:0] sum, verification_sum;
    wire c_out, verification_c_out, error_sum, error_c_out, error_flag;
    
    //unit under test 
    CSA2_32 uut ( .a(a), .b(b), .c_in(c_in), .sum(sum), .c_out(c_out) );

    // verification logic 
    verificationRCA64 verification_uut( .a(a), .b(b), .c_in(c_in), .sum(verification_sum), .c_out(verification_c_out) );
    
    // error flags 
    assign error_sum = (sum != verification_sum);
    assign error_c_out = (c_out != verification_c_out);
    assign error_flag = (error_sum || error_c_out);

    initial begin
    
        a = 64'h0000_0000_0000_0001; b = 64'h0000_0000_0000_0001; c_in = 1;
        // adequate delay for bits to ripple all the way through the adder
        #150;
        //sanity check by displaying the result in the logs in base 10
        $display("a = %d, b = %d, c_in = %b => sum = %d, c_out = %b", a, b, c_in, sum, c_out);

        a = 64'h0000_0000_0000_000F; b = 64'h0000_0000_0000_000F; c_in = 0;
        #150;
        $display("a = %d, b = %d, c_in = %b => sum = %d, c_out = %b", a, b, c_in, sum, c_out);

        a = 64'h0000_0000_FFFF_FFFF; b = 64'h0000_0000_0000_00BA; c_in = 1;
        #150;
        $display("a = %d, b = %d, c_in = %b => sum = %d, c_out = %b", a, b, c_in, sum, c_out);

        a = 64'hFFFF_FFFF_FFFF_FFFF; b = 64'h0000_0000_0000_0001; c_in = 1;
        #150;
        $display("a = %d, b = %d, c_in = %b => sum = %d, c_out = %b", a, b, c_in, sum, c_out);

        a = 64'h0123_4567_89AB_CDEF; b = 64'hFEDC_BA98_7654_3210; c_in = 0;
        #150;
        $display("a = %d, b = %d, c_in = %b => sum = %d, c_out = %b", a, b, c_in, sum, c_out);


        $finish;
    end
endmodule

