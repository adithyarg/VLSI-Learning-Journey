module d_flip_flop (
    input CLK,
    input D,
    input RESET,
    output reg Q
);
    always @(posedge CLK or posedge RESET) begin
        if (RESET)
            Q <= 0;
        else
            Q <= D;
    end
endmodule
