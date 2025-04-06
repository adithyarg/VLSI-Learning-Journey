module traffic_light_controller(
    input wire clk,
    input wire rst,
    output reg [2:0] lights
);
    reg [3:0] counter;
    reg [1:0] state;

    parameter RED = 2'b00, GREEN = 2'b01, YELLOW = 2'b10;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= RED;
            counter <= 0;
        end else begin
            case(state)
                RED: begin
                    lights <= 3'b100;
                    if (counter == 9) begin
                        state <= GREEN;
                        counter <= 0;
                    end else counter <= counter + 1;
                end
                GREEN: begin
                    lights <= 3'b001;
                    if (counter == 9) begin
                        state <= YELLOW;
                        counter <= 0;
                    end else counter <= counter + 1;
                end
                YELLOW: begin
                    lights <= 3'b010;
                    if (counter == 4) begin
                        state <= RED;
                        counter <= 0;
                    end else counter <= counter + 1;
                end
            endcase
        end
    end
endmodule
