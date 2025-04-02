## **🚀 Day 2: Multiplexer (MUX) Design in Verilog**

### 📌 **Objective**
- Understand **Multiplexers (MUX)**
- Implement **2:1 MUX and 4:1 MUX** using Verilog
- Explore different design approaches (`assign` vs `case`)
- Simulate the design in **Vivado** and verify output

---

## **📖 What is a Multiplexer?**
A **Multiplexer (MUX)** is a combinational circuit that selects one of multiple input signals and forwards it to the output based on a select signal.

### **🔹 2:1 MUX**
- **Inputs:** `A`, `B` (data inputs), `Sel` (select signal)  
- **Logic Equation:**  
  [ {Out} = ({Sel} == 0) ? A : B ]

### **🔹 4:1 MUX**
- **Inputs:** `A`, `B`, `C`, `D` (data inputs), `Sel[1:0]` (2-bit select signal)
- **Logic Equation:**  
  [ Out = ( Sel == 00) ? A :  
                 ( Sel == 01) ? B :  
                 ( Sel == 10) ? C : D ]

---

## **🛠 Tools Used**
- **Vivado** (for design and simulation)
- **GitHub** (for documentation and version control)

---

## **📜 Verilog Code for 2:1 MUX**
```verilog
module mux_2to1(
    input wire A, B,   // Data inputs
    input wire Sel,    // Select signal
    output wire Out    // Output
);

assign Out = (Sel == 1'b0) ? A : B;

endmodule
```

### **🧪 Testbench for 2:1 MUX**
```verilog
`timescale 1ns / 1ps
module mux_2to1_tb;
    reg A, B, Sel;
    wire Out;
    
    // Instantiate the module
    mux_2to1 uut (.A(A), .B(B), .Sel(Sel), .Out(Out));

    initial begin
        $monitor("A=%b, B=%b, Sel=%b, Out=%b", A, B, Sel, Out);
        A = 0; B = 0; Sel = 0; #10;
        A = 0; B = 1; Sel = 0; #10;
        A = 1; B = 0; Sel = 1; #10;
        A = 1; B = 1; Sel = 1; #10;
        $stop;
    end
endmodule
```

---

## **📜 Verilog Code for 4:1 MUX**
### **Using `assign` Statement**
```verilog
module mux_4to1(
    input wire A, B, C, D,
    input wire [1:0] Sel,
    output wire Out
);

assign Out = (Sel == 2'b00) ? A :
             (Sel == 2'b01) ? B :
             (Sel == 2'b10) ? C : D;

endmodule
```

### **Using `case` Statement**
```verilog
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

endmodule
```

### **🧪 Testbench for 4:1 MUX**
```verilog
`timescale 1ns / 1ps
module mux_4to1_tb;
    reg A, B, C, D;
    reg [1:0] Sel;
    wire Out;
    
    mux_4to1 uut (.A(A), .B(B), .C(C), .D(D), .Sel(Sel), .Out(Out));

    initial begin
        $monitor("A=%b, B=%b, C=%b, D=%b, Sel=%b, Out=%b", A, B, C, D, Sel, Out);
        A = 0; B = 1; C = 0; D = 1;
        Sel = 2'b00; #10;
        Sel = 2'b01; #10;
        Sel = 2'b10; #10;
        Sel = 2'b11; #10;
        $stop;
    end
endmodule
```

---

## **📊 Simulation Results**
- ✅ Successfully simulated **2:1 MUX** in Vivado  
- ✅ Successfully simulated **4:1 MUX** in Vivado  
- ✅ Verified outputs through **waveform analysis**

📸 **Simulation Screenshots:**  
(Upload images of the Vivado waveform outputs)

---

## **🚀 Key Learnings from Day 2**
✔ Understood **MUX functionality and importance**  
✔ Designed **2:1 MUX and 4:1 MUX**  
✔ Explored **assign vs case** statements  
✔ Simulated and tested designs using **Vivado**  
✔ Uploaded project to **GitHub**  

---
