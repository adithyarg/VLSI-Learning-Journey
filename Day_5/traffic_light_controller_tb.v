`timescale 1ns / 1ps

module traffic_light_controller_tb;
    reg clk;
    reg rst;
    wire [2:0] lights;

    traffic_light_controller uut(
        .clk(clk),
        .rst(rst),
        .lights(lights)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("Starting FSM Traffic Light Controller Testbench");
        rst = 1; #10;
        rst = 0;
        #200;
        $stop;
    end

    initial begin
        $monitor("Time=%0t | RED=%b, YELLOW=%b, GREEN=%b", $time, lights[2], lights[1], lights[0]);
    end
endmodule
