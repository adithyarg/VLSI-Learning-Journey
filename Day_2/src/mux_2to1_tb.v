`timescale 1ns / 1ps
module mux_2to1_tb;
    reg A, B, Sel;
    wire Out;
    
    // Instantiate the module
    mux_2to1 uut (.A(A), .B(B), .Sel(Sel), .Out(Out));

    initial begin
        $monitor("A=%b, B=%b, Sel=%b, Out=%b", A, B, Sel, Out);
        A = 0; B = 0; Sel = 0; #10;
        A = 0; B = 1; Sel = 0; #10;
        A = 1; B = 0; Sel = 1; #10;
        A = 1; B = 1; Sel = 1; #10;
        $stop;
    end
endmodule
