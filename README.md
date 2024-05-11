# SIMULATION AND IMPLEMENTATION OF MULTIPLIER
**AIM :**
 To simulate and synthesis multiplier using Vivado Software

**APPARATUS REQUIRED :** Vivado™ ML 2023.2
   
**PROCEDURE:**

1. Open Vivado: Launch Xilinx Vivado software on your computer.

2. Create a New Project: Click on "Create Project" from the welcome page or navigate through "File" > "Project" > "New".

3. Project Settings: Follow the prompts to set up your project. Specify the project name, location, and select RTL project type.

4. Add Design Files: Add your Verilog design files to the project. You can do this by right-clicking on "Design Sources" in the Sources window, then selecting "Add Sources". Choose your Verilog files from the file browser.

5. Specify Simulation Settings: Go to "Simulation" > "Simulation Settings". Choose your simulation language (Verilog in this case) and simulation tool (Vivado Simulator).

6. Run Simulation: Go to "Flow" > "Run Simulation" > "Run Behavioral Simulation". This will launch the Vivado Simulator and compile your design for simulation.

7. Set Simulation Time: In the Vivado Simulator window, set the simulation time if it's not set automatically. This determines how long the simulation will run.

8. Run Simulation: Start the simulation by clicking on the "Run" button in the simulation window.

9. View Results: After the simulation completes, you can view waveforms, debug signals, and analyze the behavior of your design.

**Logic Diagram**
2 bit Multiplier

![image](https://github.com/navaneethans/VLSI-LAB-EXP-3/assets/6987778/7713750f-65e6-41c0-8082-5005eac4031c)

**4 Bit Multiplier**

![image](https://github.com/navaneethans/VLSI-LAB-EXP-3/assets/6987778/d95215dd-8cf1-4e08-93cc-96adfdd7fbdc)


**EXPERIMENTS :**

#1
MULTIPLIER_2BIT :-

Code:

```
module multiplier2by2(C,A,B);
input [1:0]A,B;
output [3:0]C;
wire w1,w2,w3,w4;
and (C[0],A[0],B[0]);
and (w1,A[0],B[1]);
and (w2,A[1],B[0]);
and (w3,A[1],B[1]);
halfadder ha1(C[1],w4,w1,w2);
halfadder ha2(C[2],C[3],w3,w4);
endmodule
module halfadder(sum,carry,a,b);
input a,b;
output sum,carry;
xor(sum,a,b);
and(carry,a,b);
endmodule
```

OUTPUT:-

Simulation:

![image](https://github.com/lycanthrope004/VLSI-LAB-EXP-3/assets/121667830/8686b9a2-c6c8-49f0-94a8-6391c0beffbd)

Elaborated Design:

![image](https://github.com/lycanthrope004/VLSI-LAB-EXP-3/assets/121667830/6b3a4033-b893-45c1-804f-d5957bdc6a68)

#2
MULTIPLIER_4BIT :-

Code:

```
module multiplier4bit(m,a,b);
input[3:0]a,b;
output[7:0]m;
wire[15:0]p;
wire[12:1]s,c;
and(p[0],a[0],b[0]);
and(p[1],a[1],b[0]);
and(p[2],a[0],b[1]);
and(p[3],a[2],b[0]);
and(p[4],a[1],b[1]);
and(p[5],a[0],b[2]);
and(p[6],a[3],b[0]);
and(p[7],a[2],b[1]);
and(p[8],a[1],b[2]);
and(p[9],a[0],b[3]);
and(p[10],a[3],b[1]);
and(p[11],a[2],b[2]);
and(p[12],a[1],b[3]);
and(p[13],a[3],b[2]); 
and(p[14],a[2],b[3]); 
and(p[15],a[3],b[3]);
half_adder ha1(s[1],c[1],p[1],p[2]);
full_adder fa2(s[2],c[2],p[4],p[3],p[5]);
half_adder ha3(s[3],c[3],s[2],c[1]);
full_adder fa4(s[4],c[4],p[6],p[7],p[8]);
full_adder fa5(s[5],c[5],s[4],c[2],c[3]);
half_adder ha6(s[6],c[6],s[5],p[9]);
full_adder fa7(s[7],c[7],p[10],p[11],p[12]);
full_adder fa8(s[8],c[8],c[5],c[4],s[7]);
half_adder ha9(s[9],c[9],s[8],c[6]);
full_adder fa10(s[10],c[10],p[14],p[13],c[7]);
full_adder fa11(s[11],c[11],c[9],c[8],s[10]);
full_adder fa12(s[12],c[12],p[15],c[10],c[11]);
buf(m[0],p[0]);
buf(m[1],s[1]);
buf(m[2],s[3]);
buf(m[3],s[6]);
buf(m[4],s[9]);
buf(m[5],s[11]);
buf(m[6],s[12]);
buf(m[7],c[12]);
endmodule
module half_adder(sum,carry,a,b);
input a,b;
output sum,carry;
xor(sum,a,b);
and(carry,a,b);
endmodule
module full_adder(sum,cout,a,b,c);
input a,b,c;
output sum,cout; 
    assign sum = (a ^ b ^ c );
    assign cout = (a & b ) | (b & c) | (a & c);
endmodule
```

OUTPUT:-

Simulation:

![Screenshot 2024-04-20 135835](https://github.com/lycanthrope004/VLSI-LAB-EXP-3/assets/121667830/ef302897-9990-4f71-9ee9-34ed1a3bbf7e)

Elaborated Design :

![Screenshot 2024-04-20 135933](https://github.com/lycanthrope004/VLSI-LAB-EXP-3/assets/121667830/d3a49859-1a30-4ad4-b0a8-94bd689a4c23)


**Result :** The Simulation  and Synthesis Multiplier Successfully Verified using Vivado Software .


