module mux_4to1_case(
    input wire A, B, C, D,
    input wire [1:0] Sel,
    output reg Out
);

always @(*) begin
    case (Sel)
        2'b00: Out = A;
        2'b01: Out = B;
        2'b10: Out = C;
        2'b11: Out = D;
        default: Out = 0;
    endcase
end

