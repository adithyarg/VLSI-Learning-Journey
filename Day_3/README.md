# Day 3 - 4-bit Shift Register & Flip-Flops in Verilog

## 🚀 Overview
In **Day 3**, we will explore **flip-flops and shift registers**, which are fundamental sequential logic circuits used in VLSI design.

- **Flip-Flops** store a single bit of data and change states based on clock pulses.
- **Shift Registers** store multiple bits and shift data left or right.

This project will focus on **D Flip-Flops and a 4-bit Shift Register** implementation in Verilog using **Vivado**.

---

## 📌 Topics Covered
1. **D Flip-Flop** (Fundamental building block of memory circuits)
2. **4-bit Shift Register** (Used in data transfer and serial communication)
3. **Testbenches & Simulation in Vivado**

---

## 🔑 Prerequisites
- Basic knowledge of **Verilog syntax**
- Understanding of **Clock & Edge Triggering**
- Familiarity with **Vivado IDE**

---

## 📂 Project Files
- [`d_flip_flop.v`](d_flip_flop.v) → **D Flip-Flop Design**
- [`d_flip_flop_tb.v`](d_flip_flop_tb.v) → **Testbench for D Flip-Flop**
- [`shift_register.v`](shift_register.v) → **4-bit Shift Register Design**
- [`shift_register_tb.v`](shift_register_tb.v) → **Testbench for Shift Register**
- [`waveform`](https://github.com/adithyarg/VLSI-Learning-Journey/tree/3c71c5ab0cdc8ab66dfed6e5ce7bf4d24030a30e/Day_3/waveforms) → **Screenshot of Simulation Results**

---

## 🖥️ Verilog Code

### **1️⃣ D Flip-Flop (`d_flip_flop.v`)**
```verilog
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
```

### **2️⃣ Testbench for D Flip-Flop (`d_flip_flop_tb.v`)**
```verilog
`timescale 1ns/1ps

module d_flip_flop_tb;
    reg CLK, D, RESET;
    wire Q;
    
    d_flip_flop uut (
        .CLK(CLK),
        .D(D),
        .RESET(RESET),
        .Q(Q)
    );
    
    always #5 CLK = ~CLK;  // Generate clock signal
    
    initial begin
        CLK = 0; D = 0; RESET = 1;
        #10 RESET = 0;
        #10 D = 1;
        #10 D = 0;
        #10 D = 1;
        #10 D = 1;
        #10 D = 0;
        #50;
        $stop;
    end
    
    initial begin
        $monitor("Time: %0dns, CLK: %b, D: %b, RESET: %b, Q: %b", $time, CLK, D, RESET, Q);
    end
endmodule
```
---

## 📊 Simulation Results
Below is the waveform generated after running the testbench in **Vivado**:

![Waveform Output](https://github.com/adithyarg/VLSI-Learning-Journey/blob/7d80819a57dd259c44671cbedf47a09fe77e6cd8/Day_3/waveforms/Screenshot%202025-04-03%20223357.png)

---

### **3️⃣ 4-bit Shift Register (`shift_register.v`)**
```verilog
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
```

### **4️⃣ Testbench for Shift Register (`shift_register_tb.v`)**
```verilog
`timescale 1ns/1ps

module shift_register_tb;
    reg CLK, D, RESET;
    wire [3:0] Q;

    shift_register uut (
        .CLK(CLK),
        .D(D),
        .RESET(RESET),
        .Q(Q)
    );

    always #5 CLK = ~CLK;

    initial begin
        CLK = 0; D = 0; RESET = 1;
        #10 RESET = 0;
        #10 D = 1;
        #10 D = 0;
        #10 D = 1;
        #10 D = 1;
        #10 D = 0;
        #50;
        $stop;
    end

    initial begin
        $monitor("Time: %0dns, CLK: %b, D: %b, RESET: %b, Q: %b", $time, CLK, D, RESET, Q);
    end
endmodule
```

---

## 📊 Simulation Results
Below is the waveform generated after running the testbench in **Vivado**:

![Waveform Output](https://github.com/adithyarg/VLSI-Learning-Journey/blob/484238ee4f8756a660bad1e1d14c9849b7b734c2/Day_3/waveforms/Screenshot%202025-04-03%20224018.png)

---

## 📌 Key Takeaways
✅ **D Flip-Flop stores a single bit** and changes state on clock pulses.  
✅ **4-bit Shift Register shifts data left** on each clock pulse.  
✅ Used in **memory circuits, communication systems, and data processing.**  

---
