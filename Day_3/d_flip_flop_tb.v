`timescale 1ns/1ps

module d_flip_flop_tb;
    reg CLK, D, RESET;
    wire Q;
    
    d_flip_flop uut (
        .CLK(CLK),
        .D(D),
        .RESET(RESET),
        .Q(Q)
    );
    
    always #5 CLK = ~CLK;  // Generate clock signal
    
    initial begin
        CLK = 0; D = 0; RESET = 1;
        #10 RESET = 0;
        #10 D = 1;
        #10 D = 0;
        #10 D = 1;
        #10 D = 1;
        #10 D = 0;
        #50;
        $stop;
    end
    
    initial begin
        $monitor("Time: %0dns, CLK: %b, D: %b, RESET: %b, Q: %b", $time, CLK, D, RESET, Q);
    end
endmodule
