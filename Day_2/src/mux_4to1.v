module mux_4to1(
    input wire A, B, C, D,
    input wire [1:0] Sel,
    output wire Out
);

assign Out = (Sel == 2'b00) ? A :
             (Sel == 2'b01) ? B :
             (Sel == 2'b10) ? C : D;

endmodule
