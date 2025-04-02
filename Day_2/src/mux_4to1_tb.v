`timescale 1ns / 1ps
module mux_4to1_tb;
    reg A, B, C, D;
    reg [1:0] Sel;
    wire Out;
    
    mux_4to1 uut (.A(A), .B(B), .C(C), .D(D), .Sel(Sel), .Out(Out));

    initial begin
        $monitor("A=%b, B=%b, C=%b, D=%b, Sel=%b, Out=%b", A, B, C, D, Sel, Out);
        A = 0; B = 1; C = 0; D = 1;
        Sel = 2'b00; #10;
        Sel = 2'b01; #10;
        Sel = 2'b10; #10;
        Sel = 2'b11; #10;
        $stop;
    end
endmodule
