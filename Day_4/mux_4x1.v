// 4x1 Multiplexer using case statement
module mux_4x1 (
    input wire [1:0] sel,      // Select lines
    input wire [3:0] in,       // Inputs I0, I1, I2, I3 packed into a vector
    output reg out             // Output
);
    always @(*) begin
        case(sel)
            2'b00: out = in[0];
            2'b01: out = in[1];
            2'b10: out = in[2];
            2'b11: out = in[3];
            default: out = 1'b0;
        endcase
    end
endmodule
