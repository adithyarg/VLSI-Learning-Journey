`timescale 1ns / 1ps

module mux_4x1_tb;
    reg [1:0] sel;
    reg [3:0] in;
    wire out;

    mux_4x1 uut (
        .sel(sel),
        .in(in),
        .out(out)
    );

    initial begin
        // Test all combinations
        in = 4'b1010; // I0 = 0, I1 = 1, I2 = 0, I3 = 1

        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        $stop;
    end
endmodule
