`timescale 1ps / 1ps

// testbench for the verification logic => testing all of the numbers explicitly

module verification_tb( );

    // addends 
    reg [63:0] a, b;
    reg c_in;

    // sum
    wire [63:0] sum;
    wire c_out;
    
    // function call to verification
    verificationRCA64 uut ( .a(a), .b(b), .c_in(c_in), .sum(sum), .c_out(c_out) );

    // initial conditions
    initial begin
    
        a = 64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;
        b = 64'b0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000;
        c_in = 1'b0;
        
    end
    
    // iterate through every number (checking verification explicitly )
    always begin
    
    #1 a = a + 1;
    #64 b = b + 1;
    #4096 c_in = ~c_in;
    
    end
    
endmodule