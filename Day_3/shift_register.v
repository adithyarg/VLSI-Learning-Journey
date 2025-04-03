module shift_register (
    input CLK,
    input D,
    input RESET,
    output reg [3:0] Q
);
    always @(posedge CLK or posedge RESET) begin
        if (RESET)
            Q <= 4'b0000;
        else
            Q <= {Q[2:0], D};
    end
endmodule
