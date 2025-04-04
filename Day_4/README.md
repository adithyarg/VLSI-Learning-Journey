# Day 4 - 4x1 Multiplexer in Verilog

## 🚀 Overview  
On **Day 4**, we dive into **combinational logic design**, starting with the **4x1 Multiplexer**. Multiplexers are essential building blocks in digital systems that allow selection between multiple inputs using control signals.

This project includes the **design**, **testbench**, and **simulation** of a 4x1 multiplexer using **Verilog** in **Vivado**.

---

## 📌 Topics Covered  
- **4x1 Multiplexer** Design  
- **Testbench Creation**  
- **Waveform Analysis** in Vivado (XSim)

---

## 🔑 Prerequisites  
- Basics of **Verilog HDL**  
- Understanding of **logic gates** and **combinational circuits**  
- Working with **Vivado IDE** and simulation tools

---

## 📂 Project Files  
- [`mux_4x1.v`](mux_4x1.v) → 4x1 Multiplexer Module  
- [`mux_4x1_tb.v`](mux_4x1_tb.v) → Testbench for the MUX  
- [`waveforms`](https://github.com/adithyarg/VLSI-Learning-Journey/tree/main/Day_4/waveforms) → Screenshot of Vivado Simulation Output

---

## 💻 Verilog Code  

### 1️⃣ 4x1 Multiplexer (`mux_4x1.v`)
```verilog
module mux_4x1 (
    input wire [1:0] sel,
    input wire [3:0] in,
    output reg out
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
```

---

### 2️⃣ Testbench for 4x1 MUX (`mux_4x1_tb.v`)
```verilog
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
        $display("Starting 4x1 Multiplexer Testbench");
        in = 4'b1010;

        sel = 2'b00; #10; $display("sel=00 -> out=%b", out);
        sel = 2'b01; #10; $display("sel=01 -> out=%b", out);
        sel = 2'b10; #10; $display("sel=10 -> out=%b", out);
        sel = 2'b11; #10; $display("sel=11 -> out=%b", out);

        $display("Test Completed");
        $stop;
    end
endmodule
```

---

## 📊 Simulation Results  
Waveform shows the correct output corresponding to each selection line:

📌 When `sel=00`, output = `in[0]` = 0  
📌 When `sel=01`, output = `in[1]` = 1  
📌 When `sel=10`, output = `in[2]` = 0  
📌 When `sel=11`, output = `in[3]` = 1  

![Waveform Screenshot](https://github.com/adithyarg/VLSI-Learning-Journey/blob/6fa36adabe1ca54c46d7fe22259c802c45556dfa/Day_4/waveforms/Screenshot%202025-04-04%20211914.png)

---

## ✅ Key Takeaways  
- A **4x1 Multiplexer** selects one of four inputs based on a **2-bit selector**.  
- Implemented using a **case statement** in Verilog for clarity and scalability.  
- Essential component in **data routing**, **ALU operations**, and **digital control systems**.  
- Simulated and verified using **Vivado XSim**.

---


