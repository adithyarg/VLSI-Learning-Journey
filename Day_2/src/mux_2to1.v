module mux_2to1(
    input wire A, B,   // Data inputs
    input wire Sel,    // Select signal
    output wire Out    // Output
);

assign Out = (Sel == 1'b0) ? A : B;

endmodule
