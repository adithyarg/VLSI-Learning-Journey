# Day 5 - FSM-Based Traffic Light Controller in Verilog

## 🚦 Overview
On **Day 5**, we tackle sequential logic with a **Finite State Machine (FSM)** to control a basic traffic light system. FSMs are essential in digital systems where outputs depend on the sequence of events, not just current inputs.

This project includes the **design**, **testbench**, and **simulation** of a Moore FSM that controls RED, GREEN, and YELLOW lights based on a clock signal.

---

## 📌 Topics Covered
- FSM Design using **Moore Model**
- Traffic Light Logic Implementation
- Testbench Creation & Simulation
- Waveform Analysis using Vivado or ModelSim

---

## 🔑 Prerequisites
- Knowledge of **Verilog HDL**
- Basics of **Sequential Circuits** and **FSMs**
- Familiarity with simulation tools like **Vivado** or **ModelSim**

---

## 📂 Project Files
- [`traffic_light_controller.v`](traffic_light_controller.v) → FSM Module for Traffic Light
- [`traffic_light_controller_tb.v`](traffic_light_controller_tb.v) → Testbench Module
- [`waveform`](https://github.com/adithyarg/VLSI-Learning-Journey/blob/53de7038649ce9935c0baafa780f7c8cb1a7f966/Day_5/waveform/Screenshot%202025-04-06%20204119.png) → Screenshot of FSM Simulation Output

---

## 💻 Verilog Code

### 1️⃣ Traffic Light Controller (`traffic_light_controller.v`)
```verilog
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
```

---

### 2️⃣ Testbench (`traffic_light_controller_tb.v`)
```verilog
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
```

---

## 📊 Simulation Results
Waveform shows lights transitioning in this order:

📌 `RED → GREEN → YELLOW → RED` (Repeat)

Each light stays ON for the correct duration:
- RED: 10 clock cycles
- GREEN: 10 clock cycles
- YELLOW: 5 clock cycles

![Waveform Screenshot](https://github.com/adithyarg/VLSI-Learning-Journey/blob/53de7038649ce9935c0baafa780f7c8cb1a7f966/Day_5/waveform/Screenshot%202025-04-06%20204119.png)

---

## ✅ Key Takeaways
- Implemented a real-world **FSM application**
- Applied **Moore model FSM** principles
- Practiced Verilog for **sequential logic**
- Verified output using **simulation waveforms**

---
